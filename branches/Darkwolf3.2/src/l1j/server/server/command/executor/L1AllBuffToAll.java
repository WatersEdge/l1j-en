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
package l1j.server.server.command.executor;

import static l1j.server.server.model.skill.L1SkillId.*;

import l1j.server.server.datatables.SkillsTable;
import l1j.server.server.model.L1PolyMorph;
import l1j.server.server.model.L1World;
import l1j.server.server.model.Instance.L1PcInstance;
import l1j.server.server.model.skill.L1BuffUtil;
import l1j.server.server.model.skill.L1SkillUse;
import l1j.server.server.serverpackets.S_ServerMessage;
import l1j.server.server.serverpackets.S_SystemMessage;
import l1j.server.server.templates.L1Skills;

public class L1AllBuffToAll implements L1CommandExecutor {

	private L1AllBuffToAll() {
	}

	public static L1CommandExecutor getInstance() {
		return new L1AllBuffToAll();
	}

	@Override
	public void execute(L1PcInstance pc, String cmdName, String arg) {
		int[] allBuffSkill = { LIGHT, DECREASE_WEIGHT, PHYSICAL_ENCHANT_DEX,
				MEDITATION, PHYSICAL_ENCHANT_STR, BLESS_WEAPON, BERSERKERS,
				IMMUNE_TO_HARM, ADVANCE_SPIRIT, REDUCTION_ARMOR, BOUNCE_ATTACK,
				SOLID_CARRIAGE, ENCHANT_VENOM, BURNING_SPIRIT, VENOM_RESIST,
				DOUBLE_BRAKE, UNCANNY_DODGE, DRESS_EVASION, GLOWING_AURA,
				BRAVE_AURA, RESIST_MAGIC, CLEAR_MIND, ELEMENTAL_PROTECTION,
				AQUA_PROTECTER, BURNING_WEAPON, IRON_SKIN, EXOTIC_VITALIZE,
				WATER_LIFE, ELEMENTAL_FIRE, SOUL_OF_FLAME, ADDITIONAL_FIRE };
		try {
			L1BuffUtil.haste(pc, 3600 * 1000);
			L1BuffUtil.brave(pc, 3600 * 1000);
			L1PolyMorph.doPoly(pc, 5641, 7200, L1PolyMorph.MORPH_BY_GM);
			for (L1PcInstance targetpc : L1World.getInstance().getAllPlayers()) {
				L1BuffUtil.haste(targetpc, 3600 * 1000);
				L1BuffUtil.brave(targetpc, 3600 * 1000);
				switch (targetpc.getType()) {
				case 0:
				case 1:
					L1PolyMorph.doPoly(targetpc, 6276, 7200,
							L1PolyMorph.MORPH_BY_GM);
					break;
				case 2:
					L1PolyMorph.doPoly(targetpc, 6278, 7200,
							L1PolyMorph.MORPH_BY_GM);
					break;
				case 3:
					L1PolyMorph.doPoly(targetpc, 6277, 7200,
							L1PolyMorph.MORPH_BY_GM);
					break;
				case 4:
					L1PolyMorph.doPoly(targetpc, 6282, 7200,
							L1PolyMorph.MORPH_BY_GM);
					break;
				case 5:
					L1PolyMorph.doPoly(targetpc, 6156, 7200,
							L1PolyMorph.MORPH_BY_GM);
					break;
				case 6:
					L1PolyMorph.doPoly(targetpc, 6282, 7200,
							L1PolyMorph.MORPH_BY_GM);
					break;
				}
					
				for (int i = 0; i < allBuffSkill.length; i++) {
					L1Skills skill = SkillsTable.getInstance().getTemplate(
					allBuffSkill[i]);
					new L1SkillUse().handleCommands(targetpc, allBuffSkill[i],
					targetpc.getId(), targetpc.getX(), targetpc.getY(),
					null, skill.getBuffDuration() * 1000,
					L1SkillUse.TYPE_GMBUFF);
				}
			}
		} catch (Exception e) {
			pc.sendPackets(new S_SystemMessage(".allbuff"));
		}
	}
}