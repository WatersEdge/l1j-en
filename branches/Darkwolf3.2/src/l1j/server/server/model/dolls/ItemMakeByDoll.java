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
package l1j.server.server.model.dolls;

import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;

import l1j.server.server.datatables.ItemTable;
import l1j.server.server.model.Instance.L1ItemInstance;
import l1j.server.server.model.Instance.L1PcInstance;
import l1j.server.server.model.L1Inventory;
import l1j.server.server.serverpackets.S_ServerMessage;
import l1j.server.server.templates.L1MagicDoll;

public class ItemMakeByDoll extends TimerTask {
	private static Logger _log = Logger.getLogger(ItemMakeByDoll.class
			.getName());

	private final L1PcInstance _pc;

	public ItemMakeByDoll(L1PcInstance pc) {
		_pc = pc;
	}

	@Override
	public void run() {
		try {
			if (_pc.isDead()) {
				return;
			}
			itemMake();			
		} catch (Throwable e) {
			_log.log(Level.WARNING, e.getLocalizedMessage(), e);
		}
	}

	public void itemMake() {
		L1ItemInstance temp = ItemTable.getInstance().createItem(L1MagicDoll.getMakeItemId(_pc));
		if (temp!= null) {
			if (_pc.getInventory().checkAddItem(temp, 1) == L1Inventory.OK) {
				L1ItemInstance item = _pc.getInventory().storeItem(temp.getItemId(), 1);
				_pc.sendPackets(new S_ServerMessage(403, item.getItem().getName()));
			}
		}
	}
}