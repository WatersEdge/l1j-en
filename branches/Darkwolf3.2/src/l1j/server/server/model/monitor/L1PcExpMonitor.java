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
package l1j.server.server.model.monitor;

import l1j.server.server.model.Instance.L1PcInstance;
import l1j.server.server.serverpackets.S_Lawful;
import l1j.server.server.serverpackets.S_Karma;

public class L1PcExpMonitor extends L1PcMonitor {

	private int _old_lawful;

	private int _old_exp;

	private int _old_karma;
	
	public L1PcExpMonitor(int oId) {
		super(oId);
	}

	@Override
	public void execTask(L1PcInstance pc) {
		if (_old_lawful != pc.getLawful()) {
			_old_lawful = pc.getLawful();
			S_Lawful s_lawful = new S_Lawful(pc.getId(), _old_lawful);
			pc.sendPackets(s_lawful);
			pc.broadcastPacket(s_lawful);
		}

		if (_old_exp != pc.getExp()) {
			_old_exp = pc.getExp();
			pc.onChangeExp();
		}
		
		if (_old_karma != pc.getKarma()) {
            _old_karma = pc.getKarma();
            pc.sendPackets(new S_Karma(pc));
        }
    }
}