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

import java.util.logging.Logger;
import java.util.logging.Level;

import l1j.server.server.ClientThread;
import l1j.server.server.model.Instance.L1PcInstance;
import l1j.server.server.serverpackets.S_Message_YN;
import l1j.server.server.serverpackets.S_ServerMessage;
import l1j.server.server.utils.FaceToFace;

// Referenced classes of package l1j.server.server.clientpackets:
// ClientBasePacket
public class C_Trade extends ClientBasePacket {

	private static final String C_TRADE = "[C] C_Trade";
	private static Logger _log = Logger.getLogger(C_Trade.class.getName());

    @Override
    public void execute(byte[] decrypt, ClientThread client) {
        try {
            read(decrypt);

            L1PcInstance pc = client.getActiveChar();
            if (pc == null) {
                return;
            }
            if (pc.isDead()) {
                return;
            }
            if (pc.isGhost()) {
                return;
            }

		L1PcInstance target = FaceToFace.faceToFace(pc);
		if (target != null && target.getTradeID() == 0) { // fix for trade bug
			if (pc.getInventory().getWeight240() >= 197) { 
				pc.sendPackets(new S_ServerMessage(110)); 
				return;
			}
			if (!target.isParalyzed()) {
				pc.setTradeID(target.getId()); 
				target.setTradeID(pc.getId());
				target.sendPackets(new S_Message_YN(252, pc.getName())); 
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
       return C_TRADE;
    }
}