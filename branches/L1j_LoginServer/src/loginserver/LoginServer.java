/**
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
package loginserver;

import java.security.GeneralSecurityException;

import org.apache.log4j.Logger;

import l1j-emu.commons.database.DatabaseFactory;
import l1j-emu.commons.services.LoggingService;

/**
 * @author -DarkWolf-
 */
public class LoginServer
{
	private static final Logger	log	= Logger.getLogger(LoginServer.class);

	public static void main(String[] args)
	{
		LoggingService.init(); // initializing Logging Service
		DatabaseFactory.init(); // initializing Database Connection
		Config.load(); // Load Config
		
		try
		{
			LoginController.load();
		}
		catch (GeneralSecurityException e)
		{
			log.fatal("initializing LoginController Failed. Reason: " + e.getMessage(), e);
			System.exit(1);
		}

		GameServerTable.load();
		BanIpList.load();

		NetworkServer.getInstance();
		Runtime.getRuntime().addShutdownHook(Shutdown.getInstance());

		long freeMem = (Runtime.getRuntime().maxMemory() - Runtime.getRuntime().totalMemory() + Runtime.getRuntime()
			.freeMemory()) / 1048576; // 1024 * 1024 = 1048576;
		long totalMem = Runtime.getRuntime().maxMemory() / 1048576;
		log.info("LoginServer Started, used memory " + (totalMem - freeMem) + " MB");
	}
}
