/* This program is free software; you can redistribute it and/or modify
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
package l1j.server.server.serverpackets;

import java.util.logging.Logger;

import l1j.server.server.encryptions.Opcodes;

// Referenced classes of package l1j.server.server.serverpackets:
// ClientBasePacket
public class S_PingPacket extends ServerBasePacket {
	private static Logger _log = Logger.getLogger(S_PingPacket.class.getName());
        private static final String S_ServerPing = "[S] S_ServerPing";
    	private byte[] _byte = null;
    	private int _ping;
 
    	public S_PingPacket(int pING)
    	{
    	   _ping = pING;
    	}
    	
    	public S_PingPacket() {
    		buildPacket();
    	}
    	private void buildPacket() {
    		
                // XXX:ServerPingTime Send)
                writeC(Opcodes.S_PING);
                writeD(_ping);
                System.out.println("ServerPING:");
        }

    	@Override
    	public byte[] getContent() {
    		if (_byte == null) {
    			_byte = getBytes();
    		}
    		return _byte;
    	}
    	
    	@Override
    	public String getType() {
    		return S_ServerPing;
    	}
    }