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
package l1j.server;

import java.util.logging.Logger;

import l1j.server.server.GameServer;

/**
 * @author -Darkwolf-
 */
public class L1Loader extends Thread
{
	private static Logger _log = Logger.getLogger(L1Loader.class.getName());
	private static L1Loader instance = new L1Loader();

	public static L1Loader getInstance()
	{
		return instance;
	}
	
	/**
	 * this function is called, when a new thread starts if this thread is the thread of getInstance, then this is the
	 * the startup hook and we start all the data. after this is done , the server will be completely loaded
	 */
	@Override
	public void run()
	{
		/* Config File Reader Startup*/
		try
		{
			Config.load();
			_log.info("Config File Loaded");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Read Config File"+ t);
		}
			
		/* Database Connection Startup*/
		try
		{
			L1DatabaseFactory.setDatabaseSettings(Config.DB_DRIVER, Config.DB_URL,
			Config.DB_LOGIN, Config.DB_PASSWORD);
			L1DatabaseFactory.getInstance();
			_log.info("Database Connection Ready");
		}
		catch (Throwable t)
		{
			_log.warning("Database Connection Failed"+ t);
		}
			
		/* Initialize The GameServer*/
		try
		{
			GameServer.getInstance().initialize();
			_log.info("Gameserver Is Ready");
		}
		catch (Throwable t)
		{
			_log.warning("Cant Startup GameServer"+ t);
		}
	}
}
