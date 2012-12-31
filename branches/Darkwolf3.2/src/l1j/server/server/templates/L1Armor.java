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

public class L1Armor extends L1Item {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public L1Armor() {
	}

	private int _ac = 0;

	@Override
	public int getAc() {
		return _ac;
	}

	public void setAc(int i) {
		this._ac = i;
	}

	private int _grade;

	@Override
	public int getGrade() {
		return _grade;
	}

	public void setGrade(int i) {
		_grade = i;
	}
	
	private int _damageReduction = 0; // damage

	@Override
	public int getDamageReduction() {
		return _damageReduction;
	}

	public void setDamageReduction(int i) {
		_damageReduction = i;
	}

	private int _weightReduction = 0; 

	@Override
	public int getWeightReduction() {
		return _weightReduction;
	}

	public void setWeightReduction(int i) {
		_weightReduction = i;
	}

	private int _hitModifierByArmor = 0; 

	@Override
	public int getHitModifierByArmor() {
		return _hitModifierByArmor;
	}

	public void setHitModifierByArmor(int i) {
		_hitModifierByArmor = i;
	}

	private int _dmgModifierByArmor = 0; 

	@Override
	public int getDmgModifierByArmor() {
		return _dmgModifierByArmor;
	}

	public void setDmgModifierByArmor(int i) {
		_dmgModifierByArmor = i;
	}

	private int _bowHitModifierByArmor = 0;

	@Override
	public int getBowHitModifierByArmor() {
		return _bowHitModifierByArmor;
	}

	public void setBowHitModifierByArmor(int i) {
		_bowHitModifierByArmor = i;
	}

	private int _bowDmgModifierByArmor = 0;

	@Override
	public int getBowDmgModifierByArmor() {
		return _bowDmgModifierByArmor;
	}

	public void setBowDmgModifierByArmor(int i) {
		_bowDmgModifierByArmor = i;
	}

	private int _defenseWater = 0;

	public void setDefenseWater(int i) {
		_defenseWater = i;
	}

	@Override
	public int getDefenseWater() {
		return this._defenseWater;
	}

	private int _defenseWind = 0;

	public void setDefenseWind(int i) {
		_defenseWind = i;
	}

	@Override
	public int getDefenseWind() {
		return this._defenseWind;
	}

	private int _defenseFire = 0;

	public void setDefenseFire(int i) {
		_defenseFire = i;
	}

	@Override
	public int getDefenseFire() {
		return this._defenseFire;
	}

	private int _defenseEarth = 0;

	public void setDefenseEarth(int i) {
		_defenseEarth = i;
	}

	@Override
	public int getDefenseEarth() {
		return this._defenseEarth;
	}

	private int _resistStun = 0;

	public void setResistStun(int i) {
		_resistStun = i;
	}

	@Override
	public int getResistStun() {
		return this._resistStun;
	}

	private int _resistStone = 0;

	public void setResistStone(int i) {
		_resistStone = i;
	}

	@Override
	public int getResistStone() {
		return this._resistStone;
	}

	private int _resistSleep = 0;

	public void setResistSleep(int i) {
		_resistSleep = i;
	}

	@Override
	public int getResistSleep() {
		return this._resistSleep;
	}

	private int _resistFreeze = 0;

	public void setResistFreeze(int i) {
		_resistFreeze = i;
	}

	@Override
	public int getResistFreeze() {
		return this._resistFreeze;
	}

	private int _resistHold = 0;

	public void setResistHold(int i) {
		_resistHold = i;
	}

	@Override
	public int getResistHold() {
		return this._resistHold;
	}

	private int _resistBlind = 0;

	public void setResistBlind(int i) {
		_resistBlind = i;
	}

	@Override
	public int getResistBlind() {
		return this._resistBlind;
	}
	
	private int _expBonus = 0;

	public void setExpBonus(int i) {
		_expBonus = i;
	}

	@Override
	public int getExpBonus() {
		return this._expBonus;
	}

	private int _potionRecoveryRate = 0;

	public void setPotionRecoveryRate(int i) {
		_potionRecoveryRate = i;
	}

	@Override
	public int getPotionRecoveryRate() {
		return this._potionRecoveryRate;
	}
}