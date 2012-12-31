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
package l1j.server.server.model;

import java.util.logging.Logger;
import java.util.TimerTask;

import l1j.server.server.model.Instance.L1DollInstance;
import l1j.server.server.model.Instance.L1ItemInstance;
import l1j.server.server.model.Instance.L1PcInstance;
import l1j.server.server.model.L1Inventory;
import l1j.server.server.templates.L1Item;
import l1j.server.server.serverpackets.S_OwnCharStatus;
import l1j.server.server.serverpackets.S_SkillIconGFX;
import l1j.server.server.serverpackets.S_SkillSound;

public class L1ChargeTimer extends TimerTask {
	private static Logger _log = Logger.getLogger(L1ChargeTimer.class.getName());
	private final L1PcInstance _pc;
	private final L1ItemInstance _item;
	
	public L1ChargeTimer(L1PcInstance pc, L1ItemInstance item) {
		_pc = pc;
		_item = item;
	}

	@Override
	public void run() {
		if ((_item.getChargeTime() - 1) > 0) {
			_item.setChargeTime(_item.getChargeTime() - 1);
			_pc.getInventory().updateItem(_item, L1PcInventory.COL_CHARGE_TIME);
		} else {
			if (_item.getItem().getType2() == 1
					|| _item.getItem().getType2() == 2) {
				_pc.getEquipSlot().remove(_item);
				_pc.getInventory().removeItem(_item, 1);
			} else if (_item.getItem().getType2() == 0
					&& _item.getItem().getType() == 2) {
				_item.setNowLighting(false);
				_pc.updateLight();
			} else if (_item.getItem().getType2() == 0
					&& _item.getItem().getType() == 17) {
				L1DollInstance doll = null;
				Object[] dollList = _pc.getDollList().values().toArray();
				for (Object dollObject : dollList) {
					doll = (L1DollInstance) dollObject;
					if (doll.getItemObjId() == _item.getId()) {
						_pc.sendPackets(new S_SkillSound(doll.getId(), 5936));
						_pc.broadcastPacket(new S_SkillSound(doll.getId(), 5936));
						doll.deleteDoll();
						_pc.sendPackets(new S_SkillIconGFX(56, 0));
						_pc.sendPackets(new S_OwnCharStatus(_pc));
						break;
					}
				}
			}
			_item.setChargeTime(0);
			_pc.getInventory().updateItem(_item, L1PcInventory.COL_CHARGE_TIME);
			this.cancel();
		}
	}
}