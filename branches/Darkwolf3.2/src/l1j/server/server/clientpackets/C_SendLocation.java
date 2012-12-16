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
package l1j.server.server.clientpackets;

import java.util.Calendar;
import java.util.logging.Logger;
import java.util.logging.Level;

import l1j.server.server.ClientThread;
import l1j.server.server.model.L1DragonSlayer;
import l1j.server.server.model.L1Object;
import l1j.server.server.model.L1World;
import l1j.server.server.model.Instance.L1MonsterInstance;
import l1j.server.server.model.Instance.L1NpcInstance;
import l1j.server.server.model.Instance.L1PcInstance;
import l1j.server.server.serverpackets.S_SendLocation;
import l1j.server.server.serverpackets.S_ServerMessage;
import l1j.server.server.utils.L1SpawnUtil;

public class C_SendLocation extends ClientBasePacket {

	private static final String C_SEND_LOCATION = "[C] C_SendLocation";
    private static Logger _log = Logger.getLogger(C_SendLocation.class
        .getName());

	private static final int SEND_LOCATION = 11; 
	private static final int CLIENT_STATUS = 13; 

    @Override
    public void execute(byte[] decrypt, ClientThread client) {
        try {
            read(decrypt);
            int type = readC();
            if (type == CLIENT_STATUS) {
                return;
            }

            if (type == SEND_LOCATION) {
                String targetName = readS();
                if (targetName.isEmpty()) {
                    return;
                }

                L1PcInstance target = L1World.getInstance().getPlayer(
                        targetName);
                if (target != null) {
                    L1PcInstance pc = client.getActiveChar();
                    if (pc == null) {
                        return;
                    }
                    String sender = pc.getName();
                    int mapId = readH();
                    int x = readH();
                    int y = readH();
                    int msgId = readC();
                    target.sendPackets(new S_SendLocation(sender, mapId, x, y,
                            msgId));
                    pc.sendPackets(new S_ServerMessage(1783, targetName));
                } else {
                    L1PcInstance pc = client.getActiveChar();
                    if (pc == null) {
                        return;
                    }
                    pc.sendPackets(new S_ServerMessage(1782));
                }
            }
        } catch (final Exception e) {
            _log.log(Level.SEVERE, e.getLocalizedMessage(), e);
        } finally {
            finish();
        }
    }

    @Override
    public String getType() {
        return C_SEND_LOCATION;
    }
}