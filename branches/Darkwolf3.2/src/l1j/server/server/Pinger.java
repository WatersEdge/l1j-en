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

import java.util.logging.Logger;

import javolution.util.FastMap;
import l1j.server.Config;
import l1j.server.server.model.L1World;
import l1j.server.server.model.Instance.L1PcInstance;
import l1j.server.server.serverpackets.S_Disconnect;
import l1j.server.server.serverpackets.S_PingPacket;

public class Pinger extends Thread
{
    private static Pinger instance;
    private FastMap<Integer, Integer> pingTimes = new FastMap<Integer, Integer>();
    private static Logger _log = Logger.getLogger(Pinger.class.getName());
    
    public static Pinger getInstance()
    {
        if (instance == null) instance = new Pinger();
        	return instance;
    }
    
    private Pinger()
    {
    }
        
    public int getPingTimes(int objId)
    {
        Integer times = pingTimes.get(objId);
        if (times == null)
        	return 0;
        else
        	return times;
    }

    public void answerPing(int objId)
    {
        if (!Config.PING_ENABLED)
        	return;
        
        synchronized (pingTimes)
        {
            pingTimes.remove(objId);
        }
    }
    
    @Override
    public void run()
    {
        for (; ;)
        {
            try
            {
                Thread.sleep(Config.PING_INTERVAL);
            }
            catch (final InterruptedException e){}
            
            try
            {
                FastMap<Integer, Integer> newPingTimes = new FastMap<Integer, Integer>();
                synchronized (pingTimes)
                {
                    for (L1PcInstance player : L1World.getInstance().getAllPlayers())
                    {
                    	if (player == null || player != null && !player.isPrivateShop())
                        continue;
                        
                        int oid = player.getId();
                        int times = getPingTimes(oid);
                        if (times > Config.PING_IGNORED_REQEST_LIMIT - 1)
                        	 player.sendPackets(new S_Disconnect());
                        else
                        {
                            newPingTimes.put(oid, times + 1);
                            System.out.println("::::::::::::"+times);
                        }
                        player.sendPackets(new S_PingPacket(player.getId()));
                    }
                }
                pingTimes = newPingTimes;
            } 
            catch (Exception ignored) {};
        }
    }
}