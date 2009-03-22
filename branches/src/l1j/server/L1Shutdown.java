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
import l1j.server.server.ThreadPoolManager;
import l1j.server.L1DatabaseFactory;

/**
 * @author -Darkwolf-
 */
public class L1Shutdown extends Thread
{
	private static Logger _log = Logger.getLogger(L1Shutdown.class.getName());
	private static L1Shutdown instance = new L1Shutdown();

	public static L1Shutdown getInstance()
	{
		return instance;
	}
	
	/**
	 * this function is called, when a new thread starts if this thread is the thread of getInstance, then this is the
	 * shutdown hook and we save all data and disconnect all clients. after this thread ends, the server will completely
	 * exit if this is not the thread of getInstance, then this is a countdown thread. we start the countdown, and when
	 * we finished it, and it was not aborted, we tell the shutdown-hook why we call exit, and then call exit.
	 */
	@Override
	public void run()
	{
		/* Database connections ShutDown*/
		try
		{
			L1DatabaseFactory.shutdown();
		}
		catch (Throwable t)
		{
			_log.warning("Cant Shutdown DatabaseFactory"+ t);
		}

		/* Client connection Disconnecting*/
		try
		{
			GameServer.getInstance().shutdown();
		}
		catch (Throwable t)
		{
			_log.warning("Cant Shutdown DatabaseFactory"+ t);
		}
		
		/* Threadpools ShutDown*/
		try
		{
			ThreadPoolManager.getInstance().shutdown();
		}
		catch (Throwable t)
		{
			_log.warning("Cant Shutdown ThreadPoolManager"+ t);
		}
	}
}
