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
import l1j.server.server.model.L1Trade;
import l1j.server.server.model.L1World;
import l1j.server.server.model.Instance.L1PcInstance;
import l1j.server.server.serverpackets.S_ServerMessage;

// Referenced classes of package l1j.server.server.clientpackets:
// ClientBasePacket
public class C_TradeOK extends ClientBasePacket {

	private static final String C_TRADE_CANCEL = "[C] C_TradeOK";
	private static Logger _log = Logger.getLogger(C_TradeOK.class.getName());

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
            L1PcInstance trading_partner = (L1PcInstance) L1World.getInstance()
                    .findObject(pc.getTradeID());
            if (trading_partner != null) {
                pc.setTradeOk(true);

                if (pc.getTradeOk() && trading_partner.getTradeOk())
                {
                    if (pc.getInventory().getSize() < (180 - 16)
                            && trading_partner.getInventory().getSize() < (180 - 16))
                    {
                        L1Trade trade = new L1Trade();
                        trade.TradeOK(pc);
                    } else
                    {
                        pc.sendPackets(new S_ServerMessage(263));
                        trading_partner.sendPackets(new S_ServerMessage(263));
                        L1Trade trade = new L1Trade();
                        trade.TradeCancel(pc);
                    }
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
        return C_TRADE_CANCEL;
    }
}