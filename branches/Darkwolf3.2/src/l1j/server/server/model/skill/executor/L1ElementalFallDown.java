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
package l1j.server.server.model.skill.executor;

import l1j.server.server.model.Instance.L1PcInstance;
import l1j.server.server.model.L1Character;
import l1j.server.server.model.L1MessageId;
import l1j.server.server.serverpackets.S_OwnCharAttrDef;
import l1j.server.server.serverpackets.S_ServerMessage;
import l1j.server.server.templates.L1CharacterBuff;

public class L1ElementalFallDown extends L1BuffSkillExecutorImpl {
	private static final int ELEMENTAL = -50;

	private boolean addElemental(L1Character target, int attr, int value) {
		switch (attr) {
		case 1:
			target.addEarth(value);
			break;
		case 2:
			target.addFire(value);
			break;
		case 4:
			target.addWater(value);
			break;
		case 8:
			target.addWind(value);
			break;
		default:
			return false;
		}
		return true;
	}

	@Override
	public void addEffect(L1Character user, L1Character target, int durationSeconds) {
		if (!(user instanceof L1PcInstance)) {
			return;
		}

		L1PcInstance player = (L1PcInstance) user;
		int attr = player.getElfAttr();
		if (!addElemental(target, attr, ELEMENTAL)) {
			player.sendPackets(new S_ServerMessage(L1MessageId.NOTHING_HAPPENED));
			return;
		}
		target.setAddAttrKind(attr);
	}

	@Override
	public void removeEffect(L1Character target) {
		addElemental(target, target.getAddAttrKind(), -ELEMENTAL);
		target.setAddAttrKind(0);

		if (target instanceof L1PcInstance) {
			L1PcInstance pc = (L1PcInstance) target;
			pc.sendPackets(new S_OwnCharAttrDef(pc));
		}
	}

	@Override
	public void restoreEffect(L1PcInstance target, L1CharacterBuff buff) {
		if (addElemental(target, buff.getAttrKind(), ELEMENTAL)) {
			target.setAddAttrKind(buff.getAttrKind());
		}
	}

	@Override
	public L1CharacterBuff getCharacterBuff(L1PcInstance pc) {
		int skillId = _skill.getSkillId();
		int remainingTime = pc.getSkillEffectTimeSec(skillId);
		return new L1CharacterBuff(pc.getId(), skillId, remainingTime, 0, pc
				.getAddAttrKind());
	}
}
