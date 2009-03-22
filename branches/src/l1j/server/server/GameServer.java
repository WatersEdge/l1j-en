/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
 * 02111-1307, USA.
 *
 * http://www.gnu.org/copyleft/gpl.html
 */
package l1j.server.server;

import java.io.IOException;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Collection;
import java.util.logging.Logger;

import l1j.server.Config;
import l1j.server.L1Shutdown;
import l1j.server.server.datatables.CastleTable;
import l1j.server.server.datatables.CharacterTable;
import l1j.server.server.datatables.ChatLogTable;
import l1j.server.server.datatables.ClanTable;
import l1j.server.server.datatables.DoorSpawnTable;
import l1j.server.server.datatables.DropTable;
import l1j.server.server.datatables.DropItemTable;
import l1j.server.server.datatables.FurnitureSpawnTable;
import l1j.server.server.datatables.GetBackRestartTable;
import l1j.server.server.datatables.IpTable;
import l1j.server.server.datatables.ItemTable;
import l1j.server.server.datatables.LightSpawnTable;
import l1j.server.server.datatables.MapsTable;
import l1j.server.server.datatables.MobGroupTable;
import l1j.server.server.datatables.NpcActionTable;
import l1j.server.server.datatables.NpcChatTable;
import l1j.server.server.datatables.NpcSpawnTable;
import l1j.server.server.datatables.NpcTable;
import l1j.server.server.datatables.NPCTalkDataTable;
import l1j.server.server.datatables.PetTable;
import l1j.server.server.datatables.PetTypeTable;
import l1j.server.server.datatables.PolyTable;
import l1j.server.server.datatables.ResolventTable;
import l1j.server.server.datatables.ShopTable;
import l1j.server.server.datatables.SkillsTable;
import l1j.server.server.datatables.SpawnTable;
import l1j.server.server.datatables.SprTable;
import l1j.server.server.datatables.UBSpawnTable;
import l1j.server.server.datatables.WeaponSkillTable;
import l1j.server.server.model.Dungeon;
import l1j.server.server.model.ElementalStoneGenerator;
import l1j.server.server.model.Getback;
import l1j.server.server.model.L1BossCycle;
import l1j.server.server.model.L1CastleLocation;
import l1j.server.server.model.L1DeleteItemOnGround;
import l1j.server.server.model.L1NpcRegenerationTimer;
import l1j.server.server.model.L1World;
import l1j.server.server.model.Instance.L1PcInstance;
import l1j.server.server.model.gametime.L1GameTimeClock;
import l1j.server.server.model.item.L1TreasureBox;
import l1j.server.server.model.map.L1WorldMap;
import l1j.server.server.model.trap.L1WorldTraps;

// Referenced classes of package l1j.server.server:
// ClientThread, Logins, RateTable, IdFactory,
// LoginController, GameTimeController, Announcements,
// MobTable, SpawnTable, SkillsTable, PolyTable,
// TeleportLocations, ShopTable, NPCTalkDataTable, NpcSpawnTable,
// IpTable, Shutdown, NpcTable, MobGroupTable, NpcShoutTable

public class GameServer extends Thread {
	private ServerSocket _serverSocket;
	private static Logger _log = Logger.getLogger(GameServer.class.getName());
	private int _port;
	private LoginController _loginController;
	private int chatlvl;

	@Override
	public void run() {
		System.out.println("Waiting for Connections!");
		while (true) {
			try {
				Socket socket = _serverSocket.accept();
				System.out.println("Connection accepted from IP: "+ socket.getInetAddress());
				String host = socket.getInetAddress().getHostAddress();
				if (IpTable.getInstance().isBannedIp(host)) {
					_log.info("Banned IP(" + host + ")");
				} else {
					ClientThread client = new ClientThread(socket);
					GeneralThreadPool.getInstance().execute(client);
				}
			} catch (IOException ioexception) {
			}
		}
	}

	private static GameServer _instance;

	private GameServer() {
		super("GameServer");
	}

	public static GameServer getInstance() {
		if (_instance == null) {
			_instance = new GameServer();
		}
		return _instance;
	}

	public void initialize() throws Exception {
		String s = Config.GAME_SERVER_HOST_NAME;
		double rateXp = Config.RATE_XP;
		double Lawful = Config.RATE_LA;
		double rateKarma = Config.RATE_KARMA;
		double rateDropItems = Config.RATE_DROP_ITEMS;
		double rateDropAdena = Config.RATE_DROP_ADENA;

		System.out.println("=================================================");
		System.out.println("               L1J-En Server Starting");
		System.out.println("=================================================");
		chatlvl = Config.GLOBAL_CHAT_LEVEL;
		_port = Config.GAME_SERVER_PORT;
		if (!"*".equals(s)) {
			InetAddress inetaddress = InetAddress.getByName(s);
			inetaddress.getHostAddress();
			_serverSocket = new ServerSocket(_port, 50, inetaddress);
			System.out.println("Login Server ready on "+(inetaddress == null ? "Port" : inetaddress.getHostAddress())+":"+_port); 
		} else {
			_serverSocket = new ServerSocket(_port);
			System.out.println("Port " + _port + " opened");
		}

		System.out.println("XP              = " + rateXp);
		System.out.println("Lawful          = " + Lawful); 
		System.out.println("Karma           = "+ rateKarma); 
		System.out.println("Drop            = " + rateDropItems);
		System.out.println("Adena           = "+ rateDropAdena);
		System.out.println("Global Chat Lvl = " + (chatlvl));

		if (Config.ALT_NONPVP) { // Non-PvP Setting
			System.out.println("PvP             = On");
		} else {
			System.out.println("PvP             = Off");
		}

		// Reset status online
		CharacterTable.clearOnlineStatus();

		// Game Time Clock
		L1GameTimeClock.init();
		
		if (Config.ALT_NONPVP) { // Non-PvP Setting
			System.out.println("PvP             = On");
		} else {
			System.out.println("PvP             = Off");
		}

		/* Initialize The Announcecycle*/
		try
		{
			Announcecycle.getInstance();
			_log.info("Announcecycle Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load Announcecycle"+ t);
		}
		
		if (Config.Use_Show_INGAMENEWS_Time) {  
			System.out.println("IngameNews = On");  
			} else {  
				System.out.println("InGameNews = Off"); 
			} 
		 System.gc(); 	
		
		/* Initialize The IdFactory*/
		try
		{
			IdFactory.getInstance();
			_log.info("IdFactory Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load IdFactory"+ t);
		}
		
		/* Initialize The L1WorldMap*/
		try
		{
			L1WorldMap.getInstance();
			_log.info("L1WorldMap Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load L1WorldMap"+ t);
		}


		/* Initialize The CharacterTable*/
		try
		{
			CharacterTable.getInstance().loadAllCharName();
			_log.info("CharacterTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load CharacterTable"+ t);
		}
		
		/* Initialize The UbTimeController*/
		try
		{
			// UB Time Controllers
			UbTimeController ubTimeContoroller = UbTimeController.getInstance();
			GeneralThreadPool.getInstance().execute(ubTimeContoroller);
			_log.info("UbTimeController Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load UbTimeController"+ t);
		}
		
		/* Initialize The WarTimeController*/
		try
		{
			// Controllers time of war
			WarTimeController warTimeController = WarTimeController.getInstance();
			GeneralThreadPool.getInstance().execute(warTimeController);
			_log.info("WarTimeController Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load WarTimeController"+ t);
		}
		
		/* Initialize The ShipTimeController*/
		try
		{
			// Controllers ship time
			ShipTimeController shipTimeController = ShipTimeController.getInstance();
			GeneralThreadPool.getInstance().execute(shipTimeController);
			_log.info("ShipTimeController Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load ShipTimeController"+ t);
		}
		
		// Elemental stone spawn
		if (Config.ELEMENTAL_STONE_AMOUNT > 0) {
			ElementalStoneGenerator elementalStoneGenerator
					= ElementalStoneGenerator.getInstance();
			GeneralThreadPool.getInstance().execute(elementalStoneGenerator);
		}

		/* Initialize The HomeTownTimeController*/
		try
		{
			// Hometown
			HomeTownTimeController.getInstance();
			_log.info("HomeTownTimeController Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load HomeTownTimeController"+ t);
		}
		

		/* Initialize The AuctionTimeController*/
		try
		{
			// Controllers auction time Hideout
			AuctionTimeController auctionTimeController = AuctionTimeController.getInstance();
			GeneralThreadPool.getInstance().execute(auctionTimeController);
			_log.info("AuctionTimeController Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load AuctionTimeController"+ t);
		}
		

		/* Initialize The HouseTaxTimeController*/
		try
		{
			HouseTaxTimeController houseTaxTimeController = HouseTaxTimeController.getInstance();
	        GeneralThreadPool.getInstance().execute(houseTaxTimeController);
			_log.info("HouseTaxTimeController Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load HouseTaxTimeController"+ t);
		}
		
		/* Initialize The FishingTimeController*/
		try
		{
			FishingTimeController fishingTimeController = FishingTimeController.getInstance();
	        GeneralThreadPool.getInstance().execute(fishingTimeController);
			_log.info("FishingTimeController Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load FishingTimeController"+ t);
		}
		

		/* Initialize The Announcements*/
		try
		{
			Announcements.getInstance();
			_log.info("Announcements Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load Announcements"+ t);
		}
		
		/* Initialize The NpcTable*/
		try
		{
			NpcTable.getInstance();
			_log.info("NpcTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load NpcTable"+ t);
		}
		
		L1DeleteItemOnGround deleteitem = new L1DeleteItemOnGround();
		deleteitem.onAction();

		if (!NpcTable.getInstance().isInitialized()) {
			try {
				throw new Exception("Could not initialize the npc table");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/* Initialize The NpcTable*/
		try
		{
			NpcTable.getInstance();
			_log.info("NpcTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load NpcTable"+ t);
		}
		
		/* Initialize The SpawnTable*/
		try
		{
			SpawnTable.getInstance();
			_log.info("SpawnTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load SpawnTable"+ t);
		}
		
		/* Initialize The MobGroupTable*/
		try
		{
			MobGroupTable.getInstance();
			_log.info("MobGroupTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load MobGroupTable"+ t);
		}
		
		/* Initialize The SkillsTable*/
		try
		{
			SkillsTable.getInstance();
			_log.info("SkillsTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load SkillsTable"+ t);
		}
		
		/* Initialize The PolyTable*/
		try
		{
			PolyTable.getInstance();
			_log.info("PolyTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load PolyTable"+ t);
		}
		
		/* Initialize The ItemTable*/
		try
		{
			ItemTable.getInstance();
			_log.info("ItemTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load ItemTable"+ t);
		}
		
		/* Initialize The DropTable*/
		try
		{
			DropTable.getInstance();
			_log.info("DropTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load DropTable"+ t);
		}
		
		/* Initialize The DropItemTable*/
		try
		{
			DropItemTable.getInstance();
			_log.info("DropItemTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load DropItemTable"+ t);
		}
		
		/* Initialize The ShopTable*/
		try
		{
			ShopTable.getInstance();
			_log.info("ShopTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load ShopTable"+ t);
		}
		
		/* Initialize The NPCTalkDataTable*/
		try
		{
			NPCTalkDataTable.getInstance();
			_log.info("NPCTalkDataTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load NPCTalkDataTable"+ t);
		}
		
		/* Initialize The L1World*/
		try
		{
			L1World.getInstance();
			_log.info("L1World Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load L1World"+ t);
		}
		
		/* Initialize The L1WorldTraps*/
		try
		{
			L1WorldTraps.getInstance();
			_log.info("L1WorldTraps Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load L1WorldTraps"+ t);
		}
		
		/* Initialize The Dungeon*/
		try
		{
			Dungeon.getInstance();
			_log.info("Dungeon Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load Dungeon"+ t);
		}
				
		/* Initialize The NpcSpawnTable*/
		try
		{
			NpcSpawnTable.getInstance();
			_log.info("NpcSpawnTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load NpcSpawnTable"+ t);
		}
		
		/* Initialize The IpTable*/
		try
		{
			IpTable.getInstance();
			_log.info("IpTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load IpTable"+ t);
		}
		
		/* Initialize The MapsTable*/
		try
		{
			MapsTable.getInstance();
			_log.info("MapsTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load MapsTable"+ t);
		}
		
		/* Initialize The NpcTable*/
		try
		{
			UBSpawnTable.getInstance();
			_log.info("UBSpawnTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load UBSpawnTable"+ t);
		}
		
		/* Initialize The NpcTable*/
		try
		{
			PetTable.getInstance();
			_log.info("PetTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load PetTable"+ t);
		}
		
		/* Initialize The ClanTable*/
		try
		{
			ClanTable.getInstance();
			_log.info("ClanTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load ClanTable"+ t);
		}
		
		/* Initialize The CastleTable*/
		try
		{
			CastleTable.getInstance();
			_log.info("CastleTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load CastleTable"+ t);
		}
		
		/* Initialize The L1CastleLocation*/
		try
		{
			L1CastleLocation.setCastleTaxRate(); // This must be after the initial CastleTable 
			_log.info("L1CastleLocation Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load L1CastleLocation"+ t);
		}
		
		/* Initialize The GetBackRestartTable*/
		try
		{
			GetBackRestartTable.getInstance();
			_log.info("GetBackRestartTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load GetBackRestartTable"+ t);
		}
		
		/* Initialize The DoorSpawnTable*/
		try
		{
			DoorSpawnTable.getInstance();
			_log.info("DoorSpawnTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load DoorSpawnTable"+ t);
		}
		
		/* Initialize The GeneralThreadPool*/
		try
		{
			GeneralThreadPool.getInstance();
			_log.info("GeneralThreadPool Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load GeneralThreadPool"+ t);
		}
		
		/* Initialize The L1NpcRegenerationTimer*/
		try
		{
			L1NpcRegenerationTimer.getInstance();
			_log.info("L1NpcRegenerationTimer Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load L1NpcRegenerationTimer"+ t);
		}
		
		/* Initialize The ChatLogTable*/
		try
		{
			ChatLogTable.getInstance();
			_log.info("ChatLogTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load ChatLogTable"+ t);
		}
		
		/* Initialize The WeaponSkillTable*/
		try
		{
			WeaponSkillTable.getInstance();
			_log.info("WeaponSkillTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load WeaponSkillTable"+ t);
		}
		
		/* Initialize The NpcActionTable*/
		try
		{
			NpcActionTable.load();
			_log.info("NpcActionTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load NpcActionTable"+ t);
		}
		
		/* Initialize The GMCommandsConfig*/
		try
		{
			GMCommandsConfig.load();
			_log.info("GMCommandsConfig Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load GMCommandsConfig"+ t);
		}
		
		/* Initialize The Getback*/
		try
		{
			Getback.loadGetBack();
			_log.info("Getback Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load Getback"+ t);
		}
		
		/* Initialize The PetTypeTable*/
		try
		{
			PetTypeTable.load();
			_log.info("PetTypeTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load PetTypeTable"+ t);
		}
		
		/* Initialize The L1BossCycle*/
		try
		{
			L1BossCycle.load();
			_log.info("L1BossCycle Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load NpcTable"+ t);
		}
		
		/* Initialize The L1TreasureBox*/
		try
		{
			L1TreasureBox.load();
			_log.info("L1TreasureBox Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load L1TreasureBox"+ t);
		}
		
		/* Initialize The SprTable*/
		try
		{
			SprTable.getInstance();
			_log.info("SprTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load SprTable"+ t);
		}
		
		/* Initialize The ResolventTable*/
		try
		{
			ResolventTable.getInstance();
			_log.info("ResolventTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load ResolventTable"+ t);
		}
		
		/* Initialize The FurnitureSpawnTable*/
		try
		{
			FurnitureSpawnTable.getInstance();
			_log.info("FurnitureSpawnTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load FurnitureSpawnTable"+ t);
		}
		
		/* Initialize The NpcTable*/
		try
		{
			NpcChatTable.getInstance();
			_log.info("NpcChatTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load NpcChatTable"+ t);
		}
		
		/* Initialize The LightSpawnTable*/
		try
		{
			LightSpawnTable.getInstance();
			_log.info("LightSpawnTable Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Load LightSpawnTable"+ t);
		}
		System.out.println("Database Tables Loaded Successfully!");
		Runtime.getRuntime().addShutdownHook(L1Shutdown.getInstance());
		this.start();
		long freeMem = (Runtime.getRuntime().maxMemory() - Runtime.getRuntime().totalMemory() + Runtime.getRuntime()
			.freeMemory()) / 1048576; // 1024 * 1024 = 1048576;
		long totalMem = Runtime.getRuntime().maxMemory() / 1048576;
		_log.info("GameServer Started, used memory " + (totalMem - freeMem) + " MB");
	}
	
	/**
	 * All players online to kick, character and preservation of information.
	 */
	public void disconnectAllCharacters() {
		Collection<L1PcInstance> players = L1World.getInstance()
				.getAllPlayers();
		for (L1PcInstance pc : players) {
			pc.getNetConnection().setActiveChar(null);
			pc.getNetConnection().kick();
		}
		// Kick save after all, make
		for (L1PcInstance pc : players) {
			ClientThread.quitGame(pc);
			L1World.getInstance().removeObject(pc);
		}
	}

	private class ServerShutdownThread extends Thread {
		private final int _secondsCount;

		public ServerShutdownThread(int secondsCount) {
			_secondsCount = secondsCount;
		}

		@Override
		public void run() {
			L1World world = L1World.getInstance();
			try {
				int secondsCount = _secondsCount;
				world.broadcastServerMessage("Get to a safe spot. The server will restart shortly!");
				world.broadcastServerMessage("Repeat, the server is going down for maintanence shortly!");
				while (0 < secondsCount) {
					if (secondsCount <= 10) {
						world.broadcastServerMessage("Server will shut down in " + secondsCount
								+ " seconds.  Please get to a safe area and log out");
					} else {
						if (secondsCount % 60 == 0) {
							world.broadcastServerMessage("Server will shutdown in " + secondsCount
									/ 60 + " minutes.");
						}
					}
					Thread.sleep(1000);
					secondsCount--;
				}
				shutdown();
			} catch (InterruptedException e) {
				world.broadcastServerMessage("Server shutdown aborted! You may continue playing!");
				return;
			}
		}
	}

	private ServerShutdownThread _shutdownThread = null;

	public synchronized void shutdownWithCountdown(int secondsCount) {
		if (_shutdownThread != null) {
			// Shutting down the request is already being done
			// TODO error may need to be notified
			return;
		}
		_shutdownThread = new ServerShutdownThread(secondsCount);
		GeneralThreadPool.getInstance().execute(_shutdownThread);
	}

	public void shutdown() {
		disconnectAllCharacters();
		System.exit(0);
	}

	public synchronized void abortShutdown() {
		if (_shutdownThread == null) {
			// Shutting down the request has not been
			// TODO error may need to be notified
			return;
		}

		_shutdownThread.interrupt();
		_shutdownThread = null;
	}
}
