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

import l1j.server.Config;
import l1j.server.server.ActionCodes;
import l1j.server.server.RandomGenerator.RandomGenerator;
import l1j.server.server.RandomGenerator.RandomGeneratorFactory;
import l1j.server.server.controllers.WarTimeController;
import l1j.server.server.datatables.SkillsTable;
import l1j.server.server.model.Instance.L1ItemInstance;
import l1j.server.server.model.Instance.L1NpcInstance;
import l1j.server.server.model.Instance.L1PcInstance;
import l1j.server.server.model.Instance.L1PetInstance;
import l1j.server.server.model.Instance.L1SummonInstance;
import l1j.server.server.serverpackets.S_DoActionGFX;
import l1j.server.server.serverpackets.S_ServerMessage;
import l1j.server.server.serverpackets.S_SkillSound;
import l1j.server.server.templates.L1Skills;
import l1j.server.server.templates.L1MagicDoll;
import l1j.server.server.templates.L1Armor;
import static l1j.server.server.model.skill.L1SkillId.*;

public class L1Magic {
	private static Logger _log = Logger.getLogger(L1Magic.class.getName());
	private static RandomGenerator _random = RandomGeneratorFactory.newRandom();
	private int _calcType;
	private final int PC_PC = 1;
	private final int PC_NPC = 2;
	private final int NPC_PC = 3;
	private final int NPC_NPC = 4;
	private L1PcInstance _pc = null;
	private L1PcInstance _targetPc = null;
	private L1NpcInstance _npc = null;
	private L1NpcInstance _targetNpc = null;
	private int _leverage = 10;

	public void setLeverage(int i) {
		_leverage = i;
	}

	private int getLeverage() {
		return _leverage;
	}

	public L1Magic(L1Character attacker, L1Character target) {
		if (attacker instanceof L1PcInstance) {
			if (target instanceof L1PcInstance) {
				_calcType = PC_PC;
				_pc = (L1PcInstance) attacker;
				_targetPc = (L1PcInstance) target;
			} else {
				_calcType = PC_NPC;
				_pc = (L1PcInstance) attacker;
				_targetNpc = (L1NpcInstance) target;
			}
		} else {
			if (target instanceof L1PcInstance) {
				_calcType = NPC_PC;
				_npc = (L1NpcInstance) attacker;
				_targetPc = (L1PcInstance) target;
			} else {
				_calcType = NPC_NPC;
				_npc = (L1NpcInstance) attacker;
				_targetNpc = (L1NpcInstance) target;
			}
		}
	}

	private int getSpellPower() {
		int spellPower = 0;
		if (_calcType == PC_PC || _calcType == PC_NPC) {
			spellPower = _pc.getSp();
		} else if (_calcType == NPC_PC || _calcType == NPC_NPC) {
			spellPower = _npc.getSp();
		}
		return spellPower;
	}

	private int getMagicLevel() {
		int magicLevel = 0;
		if (_calcType == PC_PC || _calcType == PC_NPC) {
			magicLevel = _pc.getMagicLevel();
		} else if (_calcType == NPC_PC || _calcType == NPC_NPC) {
			magicLevel = _npc.getMagicLevel();
		}
		return magicLevel;
	}

	private int getMagicBonus() {
		int magicBonus = 0;
		if (_calcType == PC_PC || _calcType == PC_NPC) {
			magicBonus = _pc.getMagicBonus();
		} else if (_calcType == NPC_PC || _calcType == NPC_NPC) {
			magicBonus = _npc.getMagicBonus();
		}
		return magicBonus;
	}

	private int getLawful() {
		int lawful = 0;
		if (_calcType == PC_PC || _calcType == PC_NPC) {
			lawful = _pc.getLawful();
		} else if (_calcType == NPC_PC || _calcType == NPC_NPC) {
			lawful = _npc.getLawful();
		}
		return lawful;
	}

	private int getTargetMr() {
		int mr = 0;
		if (_calcType == PC_PC || _calcType == NPC_PC) {
			mr = _targetPc.getMr();
		} else {
			mr = _targetNpc.getMr();
		}
		return mr;
	}

	public boolean calcProbabilityMagic(int skillId) {
		int probability = 0;
		boolean isSuccess = false;

		if (_pc != null && _pc.isGm()) {
			return true;
		}

		if (_calcType == PC_NPC && _targetNpc != null) {
			int npcId = _targetNpc.getNpcTemplate().get_npcId();
			if (npcId >= 45912 && npcId <= 45915
					&& !_pc.hasSkillEffect(STATUS_HOLY_WATER)) {
				return false;
			}
			if (npcId == 45916 && !_pc.hasSkillEffect(STATUS_HOLY_MITHRIL_POWDER)) {
				return false;
			}
			if (npcId == 45941 && !_pc.hasSkillEffect(STATUS_HOLY_WATER_OF_EVA)) {
				return false;
			}
			if (npcId == 45752 && !_pc.hasSkillEffect(STATUS_CURSE_BARLOG)) {
				return false;
			}
			if (npcId == 45753 && !_pc.hasSkillEffect(STATUS_CURSE_BARLOG)) {
				return false;
			}
			if (npcId == 45675 && !_pc.hasSkillEffect(STATUS_CURSE_YAHEE)) {
				return false;
			}
			if (npcId == 81082 && !_pc.hasSkillEffect(STATUS_CURSE_YAHEE)) {
				return false;
			}
			if (npcId == 45625 && !_pc.hasSkillEffect(STATUS_CURSE_YAHEE)) {
				return false;
			}
			if (npcId == 45674 && !_pc.hasSkillEffect(STATUS_CURSE_YAHEE)) {
				return false;
			}
			if (npcId == 45685 && !_pc.hasSkillEffect(STATUS_CURSE_YAHEE)) {
				return false;
			}
			if (npcId >= 46068 && npcId <= 46091 && _pc.getTempCharGfx() == 6035) {
				return false;
			}
			if (npcId >= 46092 && npcId <= 46106 && _pc.getTempCharGfx() == 6034) {
				return false;
			}
		}
 		if (!checkZone(skillId)) {
			return false;
		}
		if (skillId == CANCELLATION) {
			if (_calcType == PC_PC && _pc != null && _targetPc != null) {
	
				if (_pc.getId() == _targetPc.getId()) {
					return true;
				}
				if (_pc.getClanid() > 0
						&& (_pc.getClanid() == _targetPc.getClanid())) {
					return true;
				}
				if (_pc.isInParty()) {
					if (_pc.getParty().isMember(_targetPc)) {
						return true;
					}
				}
				if (_pc.getZoneType() == 1 || _targetPc.getZoneType() == 1) {
					return false;
				}
			}
			if (_calcType == PC_NPC || _calcType == NPC_PC || _calcType == NPC_NPC) {
				return true;
			}
		}
		if (_calcType == PC_PC || _calcType == NPC_PC) {
			if (_targetPc.hasSkillEffect(EARTH_BIND)) {
				if (skillId != WEAPON_BREAK && skillId != CANCELLATION) {
					return false;
				}
			}
		} else {
			if (_targetNpc.hasSkillEffect(EARTH_BIND)) {
				if (skillId != WEAPON_BREAK && skillId != CANCELLATION) {
					return false;
				}
			}
		}
		probability = calcProbability(skillId);

		int rnd = _random.nextInt(100) + 1;

		if (probability >= rnd) {
			isSuccess = true;
		} else {
			isSuccess = false;
		}

		if (!Config.ALT_ATKMSG) {
			return isSuccess;
		}
		if (Config.ALT_ATKMSG) {
			if ((_calcType == PC_PC || _calcType == PC_NPC) && !_pc.isGm()) {
				return isSuccess;
			}
			if ((_calcType == PC_PC || _calcType == NPC_PC) && !_targetPc.isGm()) {
				return isSuccess;
			}
		}

		String msg0 = "";
		String msg1 = "to";
		String msg2 = "";
		String msg3 = "";
		String msg4 = "";

		if (_calcType == PC_PC || _calcType == PC_NPC) { 
			msg0 = _pc.getName();
		} else if (_calcType == NPC_PC) {
			msg0 = _npc.getName();
		}
		msg2 = "probability:" + probability + "%";
		if (_calcType == NPC_PC || _calcType == PC_PC) { 
			msg4 = _targetPc.getName();
		} else if (_calcType == PC_NPC) { 
			msg4 = _targetNpc.getName();
		}
		if (isSuccess == true) {
			msg3 = "success";
		} else {
			msg3 = "failed";
		}
		if (_calcType == PC_PC || _calcType == PC_NPC) {
			_pc.sendPackets(new S_ServerMessage(166, msg0, msg1, msg2, msg3, msg4)); 
		}
		if (_calcType == NPC_PC || _calcType == PC_PC) { 
			_targetPc.sendPackets(new S_ServerMessage(166, msg0, msg1, msg2, msg3, msg4)); 
		}
		return isSuccess;
	}

	private boolean checkZone(int skillId) {
		if (_pc != null && _targetPc != null) {
			if (_pc.getZoneType() == 1 || _targetPc.getZoneType() == 1) {
				if (skillId == WEAPON_BREAK || skillId == SLOW
						|| skillId == CURSE_PARALYZE || skillId == MANA_DRAIN
						|| skillId == DARKNESS || skillId == WEAKNESS
						|| skillId == DISEASE || skillId == DECAY_POTION
						|| skillId == MASS_SLOW || skillId == ENTANGLE
						|| skillId == ERASE_MAGIC || skillId == EARTH_BIND
						|| skillId == AREA_OF_SILENCE || skillId == WIND_SHACKLE
						|| skillId == STRIKER_GALE || skillId == JOY_OF_PAIN
						|| skillId == SHOCK_STUN || skillId == MASS_SHOCK_STUN
						|| skillId == FOG_OF_SLEEPING || skillId == ICE_LANCE
						|| skillId == FREEZING_BREATH || skillId == BONE_BREAK
						|| skillId == CONFUSION || skillId == MIND_BREAK
						|| skillId == FREEZING_BLIZZARD || skillId == CANCELLATION
						|| skillId == POLLUTE_WATER || skillId == CURSE_POISON
						|| skillId == BEHOLDER_STONE || skillId == COCKATRICE_STONE 
						|| skillId == BASLISK_STONE || skillId == MEDUSA_STONE 
						|| skillId == FLOATINGEYE_STONE || skillId == ELEMENTAL_FALL_DOWN 
						|| skillId == CURSE_BLIND || skillId == RETURN_TO_NATURE 
						|| skillId == DARK_BLIND || skillId == SILENCE 
						|| skillId == FREEZING_BREATH || skillId == GUARD_BRAKE
						|| skillId == RESIST_FEAR || skillId == HORROR_OF_DEATH
						|| skillId == PHANTASM || skillId == PANIC) {
					return false;
				}
			}
		}
		return true;
	}

	private int calcProbability(int skillId) {
		L1Skills l1skills = SkillsTable.getInstance().findBySkillId(skillId);
		int attackLevel = 0;
		int defenseLevel = 0;
		int mr = 0;
		int probability = 0;

		if (_calcType == PC_PC || _calcType == PC_NPC) {
			attackLevel = _pc.getLevel();
		} else {
			attackLevel = _npc.getLevel();
		}

		if (_calcType == PC_PC || _calcType == NPC_PC) {
			defenseLevel = _targetPc.getLevel();
		} else {
			defenseLevel = _targetNpc.getLevel();
			if (skillId == RETURN_TO_NATURE) {
				if (_targetNpc instanceof L1SummonInstance) {
					L1SummonInstance summon = (L1SummonInstance) _targetNpc;
					defenseLevel = summon.getMaster().getLevel();
				}
			}
		}

		if (skillId == SHOCK_STUN || skillId == MASS_SHOCK_STUN ||
				skillId == COUNTER_BARRIER ||
				skillId == ELEMENTAL_FALL_DOWN || skillId == RETURN_TO_NATURE ||
				skillId == ENTANGLE || skillId == ERASE_MAGIC || skillId == EARTH_BIND ||
				skillId == AREA_OF_SILENCE || skillId == WIND_SHACKLE ||
				skillId == STRIKER_GALE || skillId == POLLUTE_WATER) {
			
			probability = (int) (((l1skills.getProbabilityDice()) / 10D) * (attackLevel - defenseLevel))
					+ l1skills.getProbabilityValue();

			if (_calcType == PC_PC || _calcType == PC_NPC) {
				probability += 2 * _pc.getOriginalMagicHit();
			}
		} else if (skillId == GUARD_BRAKE || skillId == RESIST_FEAR
				|| skillId == HORROR_OF_DEATH) {
			probability = 100;
		} else if (skillId == THUNDER_GRAB) {
			probability = l1skills.getProbabilityValue()
					* (attackLevel / Math.max(1, defenseLevel)) - _random.nextInt(21);
			if (_calcType == PC_PC || _calcType == PC_NPC) {
				probability += 2 * _pc.getOriginalMagicHit();
			}
		} else if (skillId == PHANTASM) {
			if (_calcType == PC_NPC) {
				probability = l1skills.getProbabilityValue();
			} else {
				probability = l1skills.getProbabilityValue() + 20;
			}
		} else {
			int dice = l1skills.getProbabilityDice();
			int diceCount = 0;
			if (_calcType == PC_PC || _calcType == PC_NPC) {
				if (_pc.isWizard()) {
					diceCount = getMagicBonus() + getMagicLevel() + 1;
				} else if (_pc.isElf()) {
					diceCount = getMagicBonus() + getMagicLevel() - 1;
				} else {
					diceCount = getMagicBonus() + getMagicLevel() - 1;
				}
			} else {
				diceCount = getMagicBonus() + getMagicLevel();
			}
			if (diceCount < 1) {
				diceCount = 1;
			}

			for (int i = 0; i < diceCount; i++) {
				probability += (_random.nextInt(dice) + 1);
			}
			probability = probability * getLeverage() / 10;

			if (_calcType == PC_PC || _calcType == PC_NPC) {
				probability += 2 * _pc.getOriginalMagicHit();
			}

			probability -= getTargetMr();

			if (skillId == TAMING_MONSTER) {
				double probabilityRevision = 1;
				if ((_targetNpc.getMaxHp() * 1 / 4) > _targetNpc.getCurrentHp()) {
					probabilityRevision = 1.3;
				} else if ((_targetNpc.getMaxHp() * 2 / 4) > _targetNpc.getCurrentHp()) {
					probabilityRevision = 1.2;
				} else if ((_targetNpc.getMaxHp() * 3 / 4) > _targetNpc.getCurrentHp()) {
					probabilityRevision = 1.1;
				}
				probability *= probabilityRevision;
			}
		}

		if (skillId == EARTH_BIND) {
			if (_calcType == PC_PC || _calcType == NPC_PC) {
				probability -= _targetPc.getResistHold();
			}
		} else if (skillId == SHOCK_STUN || skillId == MASS_SHOCK_STUN) {
			if (_calcType == PC_PC || _calcType == NPC_PC) {
				probability -= 2 * _targetPc.getResistStun();
			}
		} else if (skillId == CURSE_PARALYZE) {
			if (_calcType == PC_PC || _calcType == NPC_PC) {
				probability -= _targetPc.getResistStone();
			}
		} else if (skillId == FOG_OF_SLEEPING) {
			if (_calcType == PC_PC || _calcType == NPC_PC) {
				probability -= _targetPc.getResistSleep();
			}
		} else if (skillId == ICE_LANCE || skillId == FREEZING_BLIZZARD
				|| skillId == FREEZING_BREATH) {
			if (_calcType == PC_PC || _calcType == NPC_PC) {
				probability -= _targetPc.getResistFreeze();
			}
		} else if (skillId == CURSE_BLIND || skillId == DARKNESS
				|| skillId == DARK_BLIND) {
			if (_calcType == PC_PC || _calcType == NPC_PC) {
				probability -= _targetPc.getResistBlind();
			}
		}

		if (l1skills.getProbabilityMax() != -1) {
			if (probability > l1skills.getProbabilityMax()) {
				probability = l1skills.getProbabilityMax();
			}
		}
		return probability;
	}

	public int calcMagicDamage(int skillId) {
		int damage = 0;
		
		if (_calcType == PC_PC || _calcType == NPC_PC) {
			damage = calcPcMagicDamage(skillId);
		} else if (_calcType == PC_NPC || _calcType == NPC_NPC) {
			damage = calcNpcMagicDamage(skillId);
		}

		damage = calcMrDefense(damage);

		damage = calcExceptionMagicDamage(skillId, damage);

		return damage;
	}

	public int calcWeaponSkillDamage(int dmg, int attr) {

		int charaIntelligence = 0;

		if (_calcType == PC_PC || _calcType == PC_NPC) {
			int spByItem = _pc.getSp() - _pc.getTrueSp();
			charaIntelligence = _pc.getInt() + spByItem - 12;
		} else if (_calcType == NPC_PC || _calcType == NPC_NPC) {
			int spByItem = _npc.getSp() - _npc.getTrueSp();
			charaIntelligence = _npc.getInt() + spByItem - 12;
		}

		double attrDeffence = calcAttrResistance(attr);

		double coefficient = Math.max(0D, 1.0 + attrDeffence) + 3.0 / 32.0 * charaIntelligence;
		if (coefficient < 0) {
			coefficient = 0;
		}

		dmg *= coefficient;

		return calcMrDefense(dmg);
	}
	
	public int calcPcFireWallDamage() {
		int dmg = 0;
		double attrDeffence = calcAttrResistance(L1Skills.ATTR_FIRE);
		L1Skills l1skills = SkillsTable.getInstance().getTemplate(FIRE_WALL);
		dmg = (int) ((1.0 - attrDeffence) * l1skills.getDamageValue());

		if (_targetPc.hasSkillEffect(ABSOLUTE_BARRIER)) {
			dmg = 0;
		}
		if (_targetPc.hasSkillEffect(ICE_LANCE)) {
			dmg = 0;
		}
		if (_targetPc.hasSkillEffect(FREEZING_BLIZZARD)) {
			dmg = 0;
		}
		if (_targetPc.hasSkillEffect(FREEZING_BREATH)) {
			dmg = 0;
		}
		if (_targetPc.hasSkillEffect(EARTH_BIND)) {
			dmg = 0;
		}
		if (dmg < 0) {
			dmg = 0;
		}
		return dmg;
	}

	public int calcNpcFireWallDamage() {
		int dmg = 0;
		double attrDeffence = calcAttrResistance(L1Skills.ATTR_FIRE);
		L1Skills l1skills = SkillsTable.getInstance().getTemplate(FIRE_WALL);
		dmg = (int) ((1.0 - attrDeffence) * l1skills.getDamageValue());

		if (_targetNpc.hasSkillEffect(ICE_LANCE)) {
			dmg = 0;
		}
		if (_targetNpc.hasSkillEffect(FREEZING_BLIZZARD)) {
			dmg = 0;
		}
		if (_targetNpc.hasSkillEffect(FREEZING_BREATH)) {
			dmg = 0;
		}
		if (_targetNpc.hasSkillEffect(EARTH_BIND)) {
			dmg = 0;
		}
		if (dmg < 0) {
			dmg = 0;
		}
		return dmg;
	}

	private int calcPcMagicDamage(int skillId) {
		int dmg = 0;
		if (skillId == FINAL_BURN) {
			if (_calcType == PC_PC || _calcType == PC_NPC) {
				dmg = _pc.getCurrentMp();
			} else {
				dmg = _npc.getCurrentMp();
			}
		} else {
			dmg = calcMagicDiceDamage(skillId);
			dmg = (dmg * getLeverage()) / 10;
		}

		dmg -= _targetPc.getDamageReductionByArmor(); 

		dmg -= L1MagicDoll.getDamageReductionByDoll(_targetPc);
		
		if (_targetPc.isCookingReduction()) {
			dmg -= 5;
		}
		if (_targetPc.hasSkillEffect(COOKING_1_7_S)
				|| _targetPc.hasSkillEffect(COOKING_2_7_S)
				|| _targetPc.hasSkillEffect(COOKING_3_7_S)) {
			dmg -= 5;
		}
		if (_targetPc.hasSkillEffect(REDUCTION_ARMOR)) {
			int targetPcLvl = _targetPc.getLevel();
			if (targetPcLvl < 50) {
				targetPcLvl = 50;
			}
			dmg -= (targetPcLvl - 50) / 5 + 1;
		}
		if (_targetPc.hasSkillEffect(DRAGON_SKIN)) {
			dmg -= 2;
		}
		
		if (_targetPc.hasSkillEffect(PATIENCE)) {
			dmg -= 2;
		}
		if (_calcType == NPC_PC) { 
			boolean isNowWar = false;
			int castleId = L1CastleLocation.getCastleIdByArea(_targetPc);
			if (castleId > 0) {
				isNowWar = WarTimeController.getInstance().isNowWar(castleId);
			}
			// NOTE: changed these dmgs since pets will get insta-pwned by magic mobs
			if (!isNowWar) {
				if (_npc instanceof L1PetInstance) {
					dmg /= 16; // was 8
				}
				if (_npc instanceof L1SummonInstance) {
					L1SummonInstance summon = (L1SummonInstance) _npc;
					if (summon.isExsistMaster()) {
						dmg /= 16; // was 8
					}
				}
			}
		}
		if (_targetPc.hasSkillEffect(IMMUNE_TO_HARM)) {
			dmg /= 2;
		}
		if (_targetPc.isFreeze()) {
			dmg = 0;
		}
		if (_targetPc.hasSkillEffect(COUNTER_MIRROR)) {
			if (_calcType == PC_PC) {
				if (_targetPc.getWis() >= _random.nextInt(100)) {
					_pc.sendPackets(new S_DoActionGFX(_pc.getId(), ActionCodes.ACTION_Damage));
					_pc.broadcastPacket(new S_DoActionGFX(_pc.getId(), ActionCodes.ACTION_Damage));
					_targetPc.sendPackets(new S_SkillSound(_targetPc.getId(), 4395));
					_targetPc.broadcastPacket(new S_SkillSound(_targetPc.getId(), 4395));
					_pc.receiveDamage(_targetPc, dmg, false);
					dmg = 0;
					_targetPc.killSkillEffectTimer(COUNTER_MIRROR);
				}
			} else if (_calcType == NPC_PC) {
				int npcId = _npc.getNpcTemplate().get_npcId();
				if (npcId == 45681 || npcId == 45682 || npcId == 45683
						|| npcId == 45684) {
				} else if (!_npc.getNpcTemplate().get_IsErase()) {
				} else {
					if (_targetPc.getWis() >= _random.nextInt(100)) {
						_npc.broadcastPacket(new S_DoActionGFX(_npc.getId(), ActionCodes.ACTION_Damage));
						_targetPc.sendPackets(new S_SkillSound(_targetPc.getId(), 4395));
						_targetPc.broadcastPacket(new S_SkillSound(_targetPc.getId(), 4395));
						_npc.receiveDamage(_targetPc, dmg);
						dmg = 0;
						_targetPc.killSkillEffectTimer(COUNTER_MIRROR);
					}
				}
			}
		}
		if (dmg < 0) {
			dmg = 0;
		}
		return dmg;
	}

	private int calcNpcMagicDamage(int skillId) {
		int dmg = 0;
		if (skillId == FINAL_BURN) {
			if (_calcType == PC_PC || _calcType == PC_NPC) {
				dmg = _pc.getCurrentMp();
			} else {
				dmg = _npc.getCurrentMp();
			}
		} else {
			dmg = calcMagicDiceDamage(skillId);
			dmg = (dmg * getLeverage()) / 10;
		}
		if (_calcType == PC_NPC) {
			boolean isNowWar = false;
			int castleId = L1CastleLocation.getCastleIdByArea(_targetNpc);
			if (castleId > 0) {
				isNowWar = WarTimeController.getInstance().isNowWar(castleId);
			}
			if (!isNowWar) {
				if (_targetNpc instanceof L1PetInstance) {
					dmg /= 16;
				}
				if (_targetNpc instanceof L1SummonInstance) {
					L1SummonInstance summon = (L1SummonInstance) _targetNpc;
					if (summon.isExsistMaster()) {
						dmg /= 16;
					}
				}
			}
		}
		if (_targetNpc.isFreeze()) {
			dmg = 0;
		}
		if (_calcType == PC_NPC && _targetNpc != null) {
			int npcId = _targetNpc.getNpcTemplate().get_npcId();
			if (npcId == 45878 && _pc.getWeapon().getItem().getItemId() != 246 ) {
				dmg = 0;
			}
			if (npcId >= 45912 && npcId <= 45915
					&& !_pc.hasSkillEffect(STATUS_HOLY_WATER)) {
				dmg = 0;
			}
			if (npcId == 45916
					&& !_pc.hasSkillEffect(STATUS_HOLY_MITHRIL_POWDER)) {
				dmg = 0;
			}
			if (npcId == 45941
					&& !_pc.hasSkillEffect(STATUS_HOLY_WATER_OF_EVA)) {
				dmg = 0;
			}
			if (npcId == 45752
					&& !_pc.hasSkillEffect(STATUS_CURSE_BARLOG)) {
				dmg = 0;
			}
			if (npcId == 45753
					&& !_pc.hasSkillEffect(STATUS_CURSE_BARLOG)) {
				dmg = 0;
			}
			if (npcId == 45675
					&& !_pc.hasSkillEffect(STATUS_CURSE_YAHEE)) {
				dmg = 0;
			}
			if (npcId == 81082
					&& !_pc.hasSkillEffect(STATUS_CURSE_YAHEE)) {
				dmg = 0;
			}
			if (npcId == 45625
					&& !_pc.hasSkillEffect(STATUS_CURSE_YAHEE)) {
				dmg = 0;
			}
			if (npcId == 45674
					&& !_pc.hasSkillEffect(STATUS_CURSE_YAHEE)) {
				dmg = 0;
			}
			if (npcId == 45685
					&& !_pc.hasSkillEffect(STATUS_CURSE_YAHEE)) {
				dmg = 0;
			}
			if (npcId >= 46068 && npcId <= 46091
					&& _pc.getTempCharGfx() == 6035) {
				dmg = 0;
			}
			if (npcId >= 46092 && npcId <= 46106
					&& _pc.getTempCharGfx() == 6034) {
				dmg = 0;
			}
		}
		return dmg;
	}

	private int calcMagicDiceDamage(int skillId) {
		L1Skills l1skills = SkillsTable.getInstance().findBySkillId(skillId);
		int dice = l1skills.getDamageDice();
		int diceCount = l1skills.getDamageDiceCount();
		double value = l1skills.getDamageValue();
		int magicDamage = 0;
		int charaIntelligence = 0;

		for (int i = 0; i < diceCount; i++) {
			magicDamage += (_random.nextInt(dice) + 1);
		}
		magicDamage += value;

		if (_calcType == PC_PC || _calcType == PC_NPC) {
			int weaponAddDmg = 0;
			L1ItemInstance weapon = _pc.getWeapon();
			if (weapon != null) {
				weaponAddDmg = weapon.getItem().getMagicDmgModifier();
			}
			magicDamage += weaponAddDmg;
		}

		if (_calcType == PC_PC || _calcType == PC_NPC) {
			int spByItem = _pc.getSp() - _pc.getTrueSp();
			charaIntelligence = _pc.getInt() + spByItem - 12;
		} else if (_calcType == NPC_PC || _calcType == NPC_NPC) {
			int spByItem = _npc.getSp() - _npc.getTrueSp();
			charaIntelligence = _npc.getInt() + spByItem - 12;
		}
		if (charaIntelligence < 1) {
			charaIntelligence = 1;
		}

		double attrDeffence = calcAttrResistance(l1skills.getAttr());
		double coefficient = (1.0 - attrDeffence + charaIntelligence * 3.0 / 32.0);
		
		if (coefficient < 0) {
			coefficient = 0;
		}

		magicDamage *= coefficient;

		if (_calcType == PC_PC || _calcType == NPC_PC) {
			long nowTime = System.currentTimeMillis();
			long oldTime = _targetPc.getOldTime();

			if (oldTime != 0) {
				long interval = nowTime - oldTime;
				int index = _targetPc.getNumberOfDamaged() - 1;

				if (2000 > interval) {
					double coefficient_r = 2.0 / 3.0;
					if (index == 0) {
						_targetPc.setOldTime(nowTime);
					}
					if (index > 8) {
						index = 8;
					}
					double coefficient_R = Math.pow(coefficient_r, index);

					magicDamage *= coefficient_R;
					if (index < 8) {
						_targetPc.addNumberOfDamaged(1);
					}
				} else {
					if (4000 > interval && index > 0) {
						_targetPc.setNumberOfDamaged(2);
						_targetPc.setOldTime(oldTime + 2000);
					} else {
						_targetPc.setNumberOfDamaged(1);
						_targetPc.setOldTime(nowTime);
					}
				}
			} else {
				_targetPc.addNumberOfDamaged(1);
				_targetPc.setOldTime(nowTime);
			}
		}

		double criticalCoefficient = 1.5;
		int rnd = _random.nextInt(100) + 1;
		
		if (_calcType == PC_PC || _calcType == PC_NPC) {
			if (l1skills.getSkillLevel() <= 6) {
				if (rnd <= (10 + _pc.getOriginalMagicCritical())) {
					magicDamage *= criticalCoefficient;
				}
			}
		}

		if (_calcType == PC_PC || _calcType == PC_NPC) {
			magicDamage += _pc.getOriginalMagicDamage();
		}
		if (_calcType == PC_PC || _calcType == PC_NPC) {
			if (_pc.hasSkillEffect(ILLUSION_AVATAR)) {
				magicDamage += 10;
			}
		}
		return magicDamage;
	}

	public int calcHealing(int skillId) {
		L1Skills l1skills = SkillsTable.getInstance().findBySkillId(skillId);
		int dice = l1skills.getDamageDice();
		double value = l1skills.getDamageValue();
		int magicDamage = 0;

		int magicBonus = getMagicBonus();
		if (magicBonus > 10) {
			magicBonus = 10;
		}

		int diceCount = (int) (value + magicBonus);
		for (int i = 0; i < diceCount; i++) {
			magicDamage += (_random.nextInt(dice) + 1);
		}

		double alignmentRevision = 1.0;
		if (getLawful() > 0) {
			alignmentRevision += (getLawful() / 32768.0);
		}

		magicDamage *= alignmentRevision;
		magicDamage = (magicDamage * getLeverage()) / 10;
		return magicDamage;
	}

	private int calcMrDefense(int dmg) {
		int mr = getTargetMr();

		double mrFloor = 0;
		if (_calcType == PC_PC || _calcType == PC_NPC) {
			if (mr <= 100) {
				mrFloor = Math.floor((mr - _pc.getOriginalMagicHit()) / 2);
			} else if (mr >= 100) {
				mrFloor = Math.floor((mr - _pc.getOriginalMagicHit()) / 10);
			}
			double mrCoefficient = 0;
			if (mr <= 100) {
				mrCoefficient = 1 - 0.01 * mrFloor;
			} else if (mr >= 100) {
				mrCoefficient = 0.6 - 0.01 * mrFloor;
			}
			dmg *= mrCoefficient;
		} else if (_calcType == NPC_PC || _calcType == NPC_NPC) {
			int rnd = _random.nextInt(100) + 1;
			if (mr >= rnd) {
				dmg /= 2;
			}
		}
		if (_calcType == PC_PC || _calcType == NPC_PC) {
			if (_targetPc.hasSkillEffect(MAGIC_EYE_OF_FAFURION)
						|| _targetPc.hasSkillEffect(MAGIC_EYE_OF_BIRTH)
						|| _targetPc.hasSkillEffect(MAGIC_EYE_OF_SHAPE)
						|| _targetPc.hasSkillEffect(MAGIC_EYE_OF_LIFE)) {
				int _resistChance = _random.nextInt(100) + 1;
				if (_resistChance <= 10) {
					dmg /= 2;
				}
			}
		}
		return dmg;
	}

	private double calcAttrResistance(int attr) {
		int resist = 0;
		int sign = 1;
		double attrDefCoeff = 0.0D;
		if (_calcType == PC_PC || _calcType == NPC_PC) {
			attrDefCoeff = calcPcArmorCoefficient(attr) + calcPcMagicCoefficient(attr);
		} else if (_calcType == PC_NPC || _calcType == NPC_NPC) {
			if (attr == L1Skills.ATTR_EARTH) {
				resist = _targetNpc.getEarth();
			} else if (attr == L1Skills.ATTR_FIRE) {
				resist = _targetNpc.getFire();
			} else if (attr == L1Skills.ATTR_WATER) {
				resist = _targetNpc.getWater();
			} else if (attr == L1Skills.ATTR_WIND) {
				resist = _targetNpc.getWind();
			}
			if (resist >= 0) {
				sign = 1;
			} else {
				sign = -1;
			}
			attrDefCoeff =  -1 / 32.0 * sign * Math.floor(0.32 * Math.abs(resist));
		}
		return attrDefCoeff;
	}

	private double calcPcMagicCoefficient(int attr) {
		double sumCoeff = 0D;
		int attrDeff = 0;

		if (_targetPc.hasSkillEffect(ELEMENTAL_PROTECTION)) {
			if (attr == _targetPc.getElfAttr()) {
				attrDeff = 50;
				sumCoeff += -1 / 32.0 * Math.floor(0.32 * Math.abs(attrDeff));
			}
		}
		if (_targetPc.hasSkillEffect(RESIST_ELEMENTAL)) {
			attrDeff = 10;
			sumCoeff += -1 / 32.0 * Math.floor(0.32 * Math.abs(attrDeff));
		}
		if (_targetPc.hasSkillEffect(COOKING_1_0_N) || _targetPc.hasSkillEffect(COOKING_1_0_S)) {
			attrDeff = 10;
			sumCoeff += -1 / 32.0 * Math.floor(0.32 * Math.abs(attrDeff));
		}
		if (_targetPc.hasSkillEffect(COOKING_3_4_N) || _targetPc.hasSkillEffect(COOKING_3_4_S)) {
			attrDeff = 10;
			sumCoeff += -1 / 32.0 * Math.floor(0.32 * Math.abs(attrDeff));
		}
		if (_targetPc.hasSkillEffect(STATUS_CUBE_IGNITION_TO_ALLY) && attr == L1Skills.ATTR_FIRE) {
			attrDeff = 30;
			sumCoeff += -1 / 32.0 * Math.floor(0.32 * Math.abs(attrDeff));
		}
		if (_targetPc.hasSkillEffect(STATUS_CUBE_QUAKE_TO_ALLY) && attr == L1Skills.ATTR_EARTH) {
			attrDeff = 30;
			sumCoeff += -1 / 32.0 * Math.floor(0.32 * Math.abs(attrDeff));
		}
		if (_targetPc.hasSkillEffect(STATUS_CUBE_SHOCK_TO_ALLY) && attr == L1Skills.ATTR_WIND) {
			attrDeff = 30;
			sumCoeff += -1 / 32.0 * Math.floor(0.32 * Math.abs(attrDeff));
		}
		if (_targetPc.hasSkillEffect(ELEMENTAL_FALL_DOWN) && attr == _targetPc.getAddAttrKind()) {
			attrDeff -= 50;
			sumCoeff += -1 / 32.0 * -1 * Math.floor(0.32 * Math.abs(attrDeff));
		}
		return sumCoeff;
	}

	private double calcPcArmorCoefficient(int attr) {
		double sumCoeff = 0D;
		int attrDeff = 0;
		int sign = 1;
		for (L1ItemInstance armor : _targetPc.getEquipSlot().getArmors()) {
			if ((attr & L1Skills.ATTR_EARTH) == L1Skills.ATTR_EARTH) {
				attrDeff = armor.getItem().getDefenseEarth();
			} else if ((attr & L1Skills.ATTR_FIRE) == L1Skills.ATTR_FIRE) {
				attrDeff = armor.getItem().getDefenseFire();
			} else if ((attr & L1Skills.ATTR_WATER) == L1Skills.ATTR_WATER) {
				attrDeff = armor.getItem().getDefenseWater();
			} else if ((attr & L1Skills.ATTR_WIND) == L1Skills.ATTR_WIND) {
				attrDeff = armor.getItem().getDefenseWind();
			}

			if (attrDeff != 0) {
				if (attrDeff < 0) {
					sign = -1;
				} else {
					sign = 1;
				}
				sumCoeff += -1 / 32.0 * sign * Math.floor(0.32 * Math.abs(attrDeff));
				attrDeff = 0;
			}
		}
		return sumCoeff;
	}
	
	public void commit(int damage, int drainMana) {
		if (_calcType == PC_PC || _calcType == NPC_PC) {
			commitPc(damage, drainMana);
		} else if (_calcType == PC_NPC || _calcType == NPC_NPC) {
			commitNpc(damage, drainMana);
		}

		if (!Config.ALT_ATKMSG) {
			return;
		}
		if (Config.ALT_ATKMSG) {
			if ((_calcType == PC_PC || _calcType == PC_NPC)
					&& !_pc.isGm()) {
				return;
			}
			if ((_calcType == PC_PC || _calcType == NPC_PC)
					&& !_targetPc.isGm()) {
				return;
			}
		}

		String msg0 = "";
		String msg1 = "to";
		String msg2 = "";
		String msg3 = "";
		String msg4 = "";

		if (_calcType == PC_PC || _calcType == PC_NPC) {
			msg0 = _pc.getName();
		} else if (_calcType == NPC_PC) { 
			msg0 = _npc.getName();
		}
		if (_calcType == NPC_PC || _calcType == PC_PC) { 
			msg4 = _targetPc.getName();
			msg2 = "THP" + _targetPc.getCurrentHp();
		} else if (_calcType == PC_NPC) {
			msg4 = _targetNpc.getName();
			msg2 = "THp" + _targetNpc.getCurrentHp();
		}

		msg3 = damage + "currentHp";

		if (_calcType == PC_PC || _calcType == PC_NPC) { 
			_pc.sendPackets(new S_ServerMessage(166, msg0, msg1, msg2, msg3,
					msg4)); 
		}
		if (_calcType == NPC_PC || _calcType == PC_PC) {
			_targetPc.sendPackets(new S_ServerMessage(166, msg0, msg1, msg2,
					msg3, msg4)); 
		}
	}

	private void commitPc(int damage, int drainMana) {
		if (_calcType == PC_PC) {
			if (drainMana > 0 && _targetPc.getCurrentMp() > 0) {
				if (drainMana > _targetPc.getCurrentMp()) {
					drainMana = _targetPc.getCurrentMp();
				}
				int newMp = _pc.getCurrentMp() + drainMana;
				_pc.setCurrentMp(newMp);
			}
			_targetPc.receiveManaDamage(_pc, drainMana);
			_targetPc.receiveDamage(_pc, damage, true);
		} else if (_calcType == NPC_PC) {
			_targetPc.receiveDamage(_npc, damage, true);
		}
	}

	private void commitNpc(int damage, int drainMana) {
		if (_calcType == PC_NPC) {
			if (drainMana > 0) {
				int drainValue = _targetNpc.drainMana(drainMana);
				int newMp = _pc.getCurrentMp() + drainValue;
				_pc.setCurrentMp(newMp);
			}
			_targetNpc.ReceiveManaDamage(_pc, drainMana);
			_targetNpc.receiveDamage(_pc, damage);
		} else if (_calcType == NPC_NPC) {
			_targetNpc.receiveDamage(_npc, damage);
		}
	}

	private int calcExceptionMagicDamage(int skillId, int dmg) {
		L1Skills l1skills = SkillsTable.getInstance().findBySkillId(skillId);
		if (skillId == MIND_BREAK) {
			// sp * value
			int sp = getSpellPower();
			
			dmg = (int) (l1skills.getDamageValue() * sp);
			// MP
			if (_calcType == PC_PC || _calcType == NPC_PC) {
				if (_targetPc.getCurrentMp() >= 5) {
					_targetPc.setCurrentMp(_targetPc.getCurrentMp() - 5);
				} else {
					_targetPc.setCurrentMp(0);
				}
			} else if (_calcType == NPC_NPC || _calcType == PC_NPC) {
				if (_targetNpc.getCurrentMp() >= 5) {
					_targetNpc.setCurrentMp(_targetNpc.getCurrentMp() - 5);
				} else {
					_targetNpc.setCurrentMp(0);
				}
			}
		} else if (skillId == CONFUSION) {
			//  sp * value
			int sp = getSpellPower();
			dmg = (int) (l1skills.getDamageValue() * sp);
		} else if (skillId == JOY_OF_PAIN) {
			// (MaxHp-currentHp) / 5
			dmg = ((_pc.getMaxHp() - _pc.getCurrentHp()) / 5);
		}
		return dmg;
	}
}