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
package l1j.server.server.model.classes;

import l1j.server.Config;

class L1WizardClassFeature extends L1ClassFeature {
	@Override
	public int getAcDefenseMax(int ac) {
		if (Config.SOFT_AC)
		{
			return ac / 5;
		}
		else
		{
			return ac / 2; 
		}
	}

	@Override
	public int getMagicLevel(int playerLevel) {
		return Math.min(10, playerLevel / 4);
	}

	@Override 
	public int getMaxSpellLevel() { 
		return 10; 
	} 
	
	@Override 
	public int getSpellLearningInterval() { 
		return 4; 
	}
}