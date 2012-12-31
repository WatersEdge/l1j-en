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
import l1j.server.server.serverpackets.S_SkillIconWindShackle;
import l1j.server.server.templates.L1CharacterBuff;

public class L1WindShackle extends L1BuffSkillExecutorImpl {

	@Override
	public void addEffect(L1Character user, L1Character target,
			int durationSeconds) {
		if (!(target instanceof L1PcInstance)) {
			return;
		}

		L1PcInstance pc = (L1PcInstance) target;
		pc.sendPackets(new S_SkillIconWindShackle(pc.getId(), durationSeconds));
		pc.broadcastPacket(new S_SkillIconWindShackle(pc.getId(),
				durationSeconds));
	}

	@Override
	public void removeEffect(L1Character target) {
		addEffect(null, target, 0);
	}

	@Override
	public void restoreEffect(L1PcInstance target, L1CharacterBuff buff) {
		addEffect(null, target, buff.getRemainingTime());
	}
}
