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
package l1j.server.server.templates;

public class L1CharacterBuff {
	private final int _characterId;
	private final int _skillId;
	private final int _remainingTime;
	private final int _polyId;
	private final int _attrKind;

	public L1CharacterBuff(int charcterId, int skillId, int remainingTime,
			int polyId, int attrKind) {
		_characterId = charcterId;
		_skillId = skillId;
		_remainingTime = remainingTime;
		_polyId = polyId;
		_attrKind = attrKind;
	}

	public int getCharcterId() {
		return _characterId;
	}

	public int getSkillId() {
		return _skillId;
	}

	public int getRemainingTime() {
		return _remainingTime;
	}

	public int getPolyId() {
		return _polyId;
	}

	public int getAttrKind() {
		return _attrKind;
	}
}
