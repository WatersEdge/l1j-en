/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
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

import java.util.ArrayList;
import java.util.logging.Logger;

import l1j.server.server.datatables.SkillsTable;
import l1j.server.server.model.Instance.L1ItemInstance;
import l1j.server.server.model.Instance.L1PcInstance;
import l1j.server.server.model.skill.L1SkillId;
import l1j.server.server.serverpackets.S_Ability;
import l1j.server.server.serverpackets.S_AddSkill;
import l1j.server.server.serverpackets.S_DelSkill;
import l1j.server.server.serverpackets.S_RemoveObject;
import l1j.server.server.serverpackets.S_Invis;
import l1j.server.server.serverpackets.S_SPMR;
import l1j.server.server.serverpackets.S_SkillBrave;
import l1j.server.server.serverpackets.S_SkillHaste;
import l1j.server.server.templates.L1Item;
import static l1j.server.server.model.skill.L1SkillId.*;

public class L1EquipmentSlot {
	private static Logger _log = Logger.getLogger(L1EquipmentSlot.class.getName());

	private L1PcInstance _owner;

	/**
	 * In effect set in
	 */
	private ArrayList<L1ArmorSet> _currentArmorSet;

	private L1ItemInstance _weapon;
	private ArrayList<L1ItemInstance> _armors;

	public L1EquipmentSlot(L1PcInstance owner) {
		_owner = owner;
		_armors = new ArrayList<L1ItemInstance>();
		_currentArmorSet = new ArrayList<L1ArmorSet>();
	}

	private void setWeapon(L1ItemInstance weapon) {
		_owner.setWeapon(weapon);
		_owner.setCurrentWeapon(weapon.getItem().getType1());
		weapon.startChargeTimer(_owner);
		_weapon = weapon;
	}

	private void removeWeapon(L1ItemInstance weapon) {
		int itemId = weapon.getItem().getItemId();
		_owner.setWeapon(null);
		_owner.setCurrentWeapon(0);
		weapon.stopChargeTimer();
		_weapon = null;
		if (_owner.hasSkillEffect(COUNTER_BARRIER)) {
			_owner.removeSkillEffect(COUNTER_BARRIER);
		}
	}
	
	public L1ItemInstance getWeapon() {
		return _weapon;
	}

	private void setArmor(L1ItemInstance armor) {
		L1Item item = armor.getItem();
		int itemId = item.getItemId();

		if (armor.getItem().getType() < 10) {
			_owner.addAc(item.getAc() + armor.getAc() - armor.getEnchantLevel() - armor.getAcByMagic());
		} else if (armor.getItem().getType() >= 10
				&& armor.getItem().getType() <= 18) {
			_owner.addAc(item.getAc() + armor.getAc() - armor.getAcByMagic());
		}
		_owner.addDamageReductionByArmor(item.getDamageReduction());
		_owner.addWeightReduction(item.getWeightReduction());
		_owner.addHitModifierByArmor(item.getHitModifierByArmor() + armor.getHitModifier());
		_owner.addDmgModifierByArmor(item.getDmgModifierByArmor() + armor.getDmgModifier());
		_owner.addBowHitModifierByArmor(item.getBowHitModifierByArmor() + armor.getBowHitModifier());
		_owner.addBowDmgModifierByArmor(item.getBowDmgModifierByArmor() + armor.getBowDmgModifier());
		armor.startChargeTimer(_owner);
		_armors.add(armor);

		for (L1ArmorSet armorSet : L1ArmorSet.getAllSet()) {
			if (armorSet.isPartOfSet(itemId) && armorSet.isValid(_owner)) {
				if (armor.getItem().getType2() == 2
						&& armor.getItem().getType() == 11) { // ring
					if (!armorSet.isEquippedRingOfArmorSet(_owner)) {
						armorSet.giveEffect(_owner);
						_currentArmorSet.add(armorSet);
					}
				} else {
					armorSet.giveEffect(_owner);
					_currentArmorSet.add(armorSet);
				}
			}
		}

		if (itemId == 20077 || itemId == 20062 || itemId == 120077) {
			if (!_owner.hasSkillEffect(INVISIBILITY)) {
				_owner.killSkillEffectTimer(BLIND_HIDING);
				_owner.setSkillEffect(INVISIBILITY, 0);
				_owner.sendPackets(new S_Invis(_owner.getId(), 1));
				_owner.broadcastPacketForFindInvis(new S_RemoveObject(_owner), false);
			}
		}
		if (itemId == 20288) { // ROTC
			_owner.sendPackets(new S_Ability(1, true));
		}
		if (itemId == 20383) {
			if (armor.getChargeCount() != 0) {
				armor.setChargeCount(armor.getChargeCount() - 1);
				_owner.getInventory().updateItem(armor, L1PcInventory.COL_CHARGE_COUNT);
			}
		}
	}

	public ArrayList<L1ItemInstance> getArmors() {
		return _armors;
	}

	private void removeArmor(L1ItemInstance armor) {
		L1Item item = armor.getItem();
		int itemId = armor.getItem().getItemId();

		if (armor.getItem().getType() < 10) {
			_owner.addAc(-(item.getAc() + armor.getAc() - armor.getEnchantLevel() - armor.getAcByMagic()));
		} else if (armor.getItem().getType() >= 10
				&& armor.getItem().getType() <= 18) {
			_owner.addAc(-(item.getAc() + armor.getAc() - armor.getAcByMagic()));
		}
		_owner.addDamageReductionByArmor(-item.getDamageReduction());
		_owner.addWeightReduction(-item.getWeightReduction());
		_owner.addHitModifierByArmor(-(item.getHitModifierByArmor() + armor.getHitModifier()));
		_owner.addDmgModifierByArmor(-(item.getDmgModifierByArmor() + armor.getDmgModifier()));
		_owner.addBowHitModifierByArmor(-(item.getBowHitModifierByArmor() + armor.getBowHitModifier()));
		_owner.addBowDmgModifierByArmor(-(item.getBowDmgModifierByArmor() + armor.getBowDmgModifier()));
		armor.stopChargeTimer();

		for (L1ArmorSet armorSet : L1ArmorSet.getAllSet()) {
			if (armorSet.isPartOfSet(itemId) && _currentArmorSet.contains(armorSet) && !armorSet.isValid(_owner)) {
				armorSet.cancelEffect(_owner);
				_currentArmorSet.remove(armorSet);
			}
		}

		if (itemId == 20077 || itemId == 20062 || itemId == 120077) {
			_owner.delInvis();
		}
		if (itemId == 20288) { // ROTC
			_owner.sendPackets(new S_Ability(1, false));
		}
		_armors.remove(armor);
	}

	public void set(L1ItemInstance equipment) {
			L1Item item = equipment.getItem();
			if (item.getType2() == 0) {
				return;
			}

			_owner.addStr(item.getStr() + equipment.getStr());
			_owner.addCon(item.getCon() + equipment.getCon());
			_owner.addDex(item.getDex() + equipment.getDex());
			_owner.addInt(item.getInt() + equipment.getInt());
			_owner.addWis(item.getWis() + equipment.getWis());
			
			if (item.getWis() != 0) {
				_owner.resetBaseMr();
			}
			_owner.addCha(item.getCha() + equipment.getCha());

			_owner.addMaxHp(item.getHp() + equipment.getHp());
			_owner.addMaxMp(item.getMp() + equipment.getMp());
			_owner.addHpr(item.getHpr() + equipment.getHpr());
			_owner.addMpr(item.getMpr() + equipment.getMpr());

			int addMr = 0;
			addMr += item.getMr() + equipment.getMr();
			if (item.getItemId() == 20236 && _owner.isElf()) {
				addMr += 5;
			}

			_owner.addMr(addMr);
			_owner.sendPackets(new S_SPMR(_owner));
			_owner.addSp(item.getSp() + equipment.getSp());
			_owner.sendPackets(new S_SPMR(_owner));

			_owner.addEarth(item.getDefenseEarth() + equipment.getDefenseEarth());
			_owner.addWind(item.getDefenseWind() + equipment.getDefenseWind());
			_owner.addWater(item.getDefenseWater() + equipment.getDefenseWater());
			_owner.addFire(item.getDefenseFire() + equipment.getDefenseFire());

			_owner.addResistStun(item.getResistStun() + equipment.getResistStun());
			_owner.addResistStone(item.getResistStone() + equipment.getResistStone());
			_owner.addResistSleep(item.getResistSleep() + equipment.getResistSleep());
			_owner.addResistFreeze(item.getResistFreeze() + equipment.getResistFreeze());
			_owner.addResistHold(item.getResistHold() + equipment.getResistHold());
			_owner.addResistBlind(item.getResistBlind() + equipment.getResistBlind());

			_owner.addExpBonusPct(item.getExpBonus() + equipment.getExpBonus());
			_owner.addPotionRecoveryRatePct(item.getPotionRecoveryRate() + equipment.getPotionRecoveryRate());

			if (item.isHaste()) {
				_owner.addHasteItemEquipped(1);
				_owner.removeHasteSkillEffect();
				if (_owner.getMoveSpeed() != 1) {
					_owner.setMoveSpeed(1);
					_owner.sendPackets(new S_SkillHaste(_owner.getId(), 1, -1));
					_owner.broadcastPacket(new S_SkillHaste(_owner.getId(), 1, 0));
				}
			}
			if (item.getItemId() == 20383) {
				if (_owner.hasSkillEffect(STATUS_BRAVE)) {
					_owner.killSkillEffectTimer(STATUS_BRAVE);
					_owner.sendPackets(new S_SkillBrave(_owner.getId(), 0, 0));
					_owner.broadcastPacket(new S_SkillBrave(_owner.getId(), 0, 0));
					_owner.setBraveSpeed(0);
				}
			}
			_owner.getEquipSlot().setMagicHelm(equipment);

			if (item.getType2() == 1) {
				setWeapon(equipment);
			} else if (item.getType2() == 2) {
				setArmor(equipment);
				_owner.sendPackets(new S_SPMR(_owner));
			}
		}

		public void remove(L1ItemInstance equipment) {
			L1Item item = equipment.getItem();
			if (item.getType2() == 0) {
				return;
			}

			_owner.addStr(-(item.getStr() + equipment.getStr()));
			_owner.addCon(-(item.getCon() + equipment.getCon()));
			_owner.addDex(-(item.getDex() + equipment.getDex()));
			_owner.addInt(-(item.getInt() + equipment.getInt()));
			_owner.addWis(-(item.getWis() + equipment.getWis()));
			if (item.getWis() != 0) {
				_owner.resetBaseMr();
			}
			_owner.addCha(-(item.getCha() + equipment.getCha()));

			_owner.addMaxHp(-(item.getHp() + equipment.getHp()));
			_owner.addMaxMp(-(item.getMp() + equipment.getMp()));
			_owner.addHpr(-(item.getHpr() + equipment.getHpr()));
			_owner.addMpr(-(item.getMpr() + equipment.getMpr()));

			int addMr = 0;
			addMr -= item.getMr() + equipment.getMr();
			if (item.getItemId() == 20236 && _owner.isElf()) {
				addMr -= 5;
			}

			_owner.addMr(addMr);
			_owner.sendPackets(new S_SPMR(_owner));
			_owner.addSp(-(item.getSp() + equipment.getSp()));
			_owner.sendPackets(new S_SPMR(_owner));

			_owner.addEarth(-(item.getDefenseEarth() + equipment.getDefenseEarth()));
			_owner.addWind(-(item.getDefenseWind() + equipment.getDefenseWind()));
			_owner.addWater(-(item.getDefenseWater() + equipment.getDefenseWater()));
			_owner.addFire(-(item.getDefenseFire() + equipment.getDefenseFire()));

			_owner.addResistStun(-(item.getResistStun() + equipment.getResistStun()));
			_owner.addResistStone(-(item.getResistStone() + equipment.getResistStone()));
			_owner.addResistSleep(-(item.getResistSleep() + equipment.getResistSleep()));
			_owner.addResistFreeze(-(item.getResistFreeze() + equipment.getResistFreeze()));
			_owner.addResistHold(-(item.getResistHold() + equipment.getResistHold()));
			_owner.addResistBlind(-(item.getResistBlind() + equipment.getResistBlind()));

			_owner.addExpBonusPct(-(item.getExpBonus() + equipment.getExpBonus()));
			_owner.addPotionRecoveryRatePct(-(item.getPotionRecoveryRate() + equipment.getPotionRecoveryRate()));

			if (item.isHaste()) {
				_owner.addHasteItemEquipped(-1);
				if (_owner.getHasteItemEquipped() == 0) {
					_owner.setMoveSpeed(0);
					_owner.sendPackets(new S_SkillHaste(_owner.getId(), 0, 0));
					_owner.broadcastPacket(new S_SkillHaste(_owner.getId(), 0, 0));
				}
			}
			_owner.getEquipSlot().removeMagicHelm(_owner.getId(), equipment);

			if (item.getType2() == 1) {
				removeWeapon(equipment);
			} else if (item.getType2() == 2) {
				removeArmor(equipment);
			}
		}

	public void setMagicHelm(L1ItemInstance item) {
		switch (item.getItemId()) {
		case 20013:
			_owner.setSkillMastery(PHYSICAL_ENCHANT_DEX);
			_owner.setSkillMastery(HASTE);
			_owner.sendPackets(new S_AddSkill(0, 0, 0, 2, 0, 4, 0, 0, 0, 0, 0,
					0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));
			break;
		case 20014:
			_owner.setSkillMastery(HEAL);
			_owner.setSkillMastery(EXTRA_HEAL);
			_owner.sendPackets(new S_AddSkill(1, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0,
					0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));
			break;
		case 20015:
			_owner.setSkillMastery(ENCHANT_WEAPON);
			_owner.setSkillMastery(DETECTION);
			_owner.setSkillMastery(PHYSICAL_ENCHANT_STR);
			_owner.sendPackets(new S_AddSkill(0, 24, 0, 0, 0, 2, 0, 0, 0, 0, 0,
					0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));
			break;
		case 20008:
			_owner.setSkillMastery(HASTE);
			_owner.sendPackets(new S_AddSkill(0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0,
					0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));
			break;
		case 20023:
			_owner.setSkillMastery(GREATER_HASTE);
			_owner.sendPackets(new S_AddSkill(0, 0, 0, 0, 0, 0, 32, 0, 0, 0, 0,
					0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));
			break;
		}
	}

	public void removeMagicHelm(int objectId, L1ItemInstance item) {
		switch (item.getItemId()) {
		case 20013: 
			if (!SkillsTable.getInstance().spellCheck(objectId,
					PHYSICAL_ENCHANT_DEX)) {
				_owner.removeSkillMastery(PHYSICAL_ENCHANT_DEX);
				_owner.sendPackets(new S_DelSkill(0, 0, 0, 2, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));
			}
			if (!SkillsTable.getInstance().spellCheck(objectId, HASTE)) {
				_owner.removeSkillMastery(HASTE);
				_owner.sendPackets(new S_DelSkill(0, 0, 0, 0, 0, 4, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));
			}
			break;
		case 20014: 
			if (!SkillsTable.getInstance().spellCheck(objectId, HEAL)) {
				_owner.removeSkillMastery(HEAL);
				_owner.sendPackets(new S_DelSkill(1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));
			}
			if (!SkillsTable.getInstance().spellCheck(objectId, EXTRA_HEAL)) {
				_owner.removeSkillMastery(EXTRA_HEAL);
				_owner.sendPackets(new S_DelSkill(0, 0, 4, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));
			}
			break;
		case 20015: 
			if (!SkillsTable.getInstance().spellCheck(objectId,
					ENCHANT_WEAPON)) {
				_owner.removeSkillMastery(ENCHANT_WEAPON);
				_owner.sendPackets(new S_DelSkill(0, 8, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));
			}
			if (!SkillsTable.getInstance().spellCheck(objectId, DETECTION)) {
				_owner.removeSkillMastery(DETECTION);
				_owner.sendPackets(new S_DelSkill(0, 16, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));
			}
			if (!SkillsTable.getInstance().spellCheck(objectId,
					PHYSICAL_ENCHANT_STR)) {
				_owner.removeSkillMastery(PHYSICAL_ENCHANT_STR);
				_owner.sendPackets(new S_DelSkill(0, 0, 0, 0, 0, 2, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));
			}
			break;
		case 20008: 
			if (!SkillsTable.getInstance().spellCheck(objectId, HASTE)) {
				_owner.removeSkillMastery(HASTE);
				_owner.sendPackets(new S_DelSkill(0, 0, 0, 0, 0, 4, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));
			}
			break;
		case 20023: 
			if (!SkillsTable.getInstance().spellCheck(objectId,
					GREATER_HASTE)) {
				_owner.removeSkillMastery(GREATER_HASTE);
				_owner.sendPackets(new S_DelSkill(0, 0, 0, 0, 0, 0, 32, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));
			}
			break;
		}
	}
}