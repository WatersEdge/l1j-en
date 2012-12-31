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

import l1j.server.server.datatables.ItemTable;
import l1j.server.server.datatables.MagicDollTable;
import l1j.server.server.model.Instance.L1DollInstance;
import l1j.server.server.model.Instance.L1PcInstance;
import l1j.server.server.model.L1Character;
import l1j.server.server.serverpackets.S_SkillSound;
import l1j.server.server.RandomGenerator.RandomGenerator;
import l1j.server.server.RandomGenerator.RandomGeneratorFactory;

public class L1MagicDoll {
	private static RandomGenerator _random = RandomGeneratorFactory.newRandom();
	private int _itemId;
	private int _dollId;
	private int _ac;
	private int _str;
	private int _con;
	private int _dex;
	private int _int;
	private int _wis;
	private int _cha;
	private int _hp;
	private int _mp;
	private int _hpr;
	private int _mpr;
	private boolean _hprTime;
	private boolean _mprTime;
	private int _mr;
	private int _dmg;
	private int _bowDmg;
	private int _dmgChance;
	private int _hit;
	private int _bowHit;
	private int _dmgReduction;
	private int _dmgReductionChance;
	private int _dmgEvasionChance;
	private int _weightReduction;
	private int _resistStun;
	private int _resistStone;
	private int _resistSleep;
	private int _resistFreeze;
	private int _resistHold;
	private int _resistBlind;
	private int _expBonus;
	private int _makeItemId;
	private int _skillId;
	private int _skillChance;

	public int getItemId() {
		return _itemId;
	}

	public void setItemId(int i) {
		_itemId = i;
	}

	public int getDollId() {
		return _dollId;
	}

	public void setDollId(int i) {
		_dollId = i;
	}

	public int getAc() {
		return _ac;
	}

	public void setAc(int i) {
		_ac = i;
	}

	public int getStr() {
		return _str;
	}

	public void setStr(int i) {
		_str = i;
	}

	public int getCon() {
		return _con;
	}

	public void setCon(int i) {
		_con = i;
	}

	public int getDex() {
		return _dex;
	}

	public void setDex(int i) {
		_dex = i;
	}

	public int getInt() {
		return _int;
	}

	public void setInt(int i) {
		_int = i;
	}

	public int getWis() {
		return _wis;
	}

	public void setWis(int i) {
		_wis = i;
	}

	public int getCha() {
		return _cha;
	}

	public void setCha(int i) {
		_cha = i;
	}

	public int getHp() {
		return _hp;
	}

	public void setHp(int i) {
		_hp = i;
	}

	public int getMp() {
		return _mp;
	}

	public void setMp(int i) {
		_mp = i;
	}

	public int getHpr() {
		return _hpr;
	}

	public void setHpr(int i) {
		_hpr = i;
	}

	public int getMpr() {
		return _mpr;
	}

	public void setMpr(int i) {
		_mpr = i;
	}

	public boolean getHprTime() {
		return _hprTime;
	}

	public void setHprTime(boolean i) {
		_hprTime = i;
	}

	public boolean getMprTime() {
		return _mprTime;
	}

	public void setMprTime(boolean i) {
		_mprTime = i;
	}

	public int getMr() {
		return _mr;
	}

	public void setMr(int i) {
		_mr = i;
	}

	public int getDmg() {
		return _dmg;
	}

	public void setDmg(int i) {
		_dmg = i;
	}

	public int getBowDmg() {
		return _bowDmg;
	}

	public void setBowDmg(int i) {
		_bowDmg = i;
	}

	public int getDmgChance() {
		return _dmgChance;
	}

	public void setDmgChance(int i) {
		_dmgChance = i;
	}

	public int getHit() {
		return _hit;
	}

	public void setHit(int i) {
		_hit = i;
	}

	public int getBowHit() {
		return _bowHit;
	}

	public void setBowHit(int i) {
		_bowHit = i;
	}

	public int getDmgReduction() {
		return _dmgReduction;
	}

	public void setDmgReduction(int i) {
		_dmgReduction = i;
	}

	public int getDmgReductionChance() {
		return _dmgReductionChance;
	}

	public void setDmgReductionChance(int i) {
		_dmgReductionChance = i;
	}

	public int getDmgEvasionChance() {
		return _dmgEvasionChance;
	}

	public void setDmgEvasionChance(int i) {
		_dmgEvasionChance = i;
	}

	public int getWeightReduction() {
		return _weightReduction;
	}

	public void setWeightReduction(int i) {
		_weightReduction = i;
	}

	public int getResistStun() {
		return _resistStun;
	}

	public void setResistStun(int i) {
		_resistStun = i;
	}

	public int getResistStone() {
		return _resistStone;
	}

	public void setResistStone(int i) {
		_resistStone = i;
	}

	public int getResistSleep() {
		return _resistSleep;
	}

	public void setResistSleep(int i) {
		_resistSleep = i;
	}

	public int getResistFreeze() {
		return _resistFreeze;
	}

	public void setResistFreeze(int i) {
		_resistFreeze = i;
	}

	public int getResistHold() {
		return _resistHold;
	}

	public void setResistHold(int i) {
		_resistHold = i;
	}

	public int getResistBlind() {
		return _resistBlind;
	}

	public void setResistBlind(int i) {
		_resistBlind = i;
	}

	public int getMakeItemId() {
		return _makeItemId;
	}

	public int getExpBonus() {
		return _expBonus;
	}

	public void setExpBonus(int i) {
		_expBonus = i;
	}

	public void setMakeItemId(int i) {
		_makeItemId = i;
	}

	public int getSkillId() {
		return _skillId;
	}

	public void setSkillId(int i) {
		_skillId = i;
	}

	public int getSkillChance() {
		return _skillChance;
	}

	public void setSkillChance(int i) {
		_skillChance = i;
	}
	
	public static int getHitAddByDoll(L1Character _master) {
		int s = 0;
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				s += doll.getHit();
			}
		}
		return s;
	}

	public static int getDamageAddByDoll(L1Character _master) {
		int s = 0;
		int chance = _random.nextInt(100) + 1;
		boolean isAdd = false;
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				if (doll.getDmgChance() > 0 && !isAdd) {
					if (doll.getDmgChance() >= chance) {
						s += doll.getDmg();
						isAdd = true;
					}
				} else if (doll.getDmg() != 0) {
					s += doll.getDmg();
				}
			}
		}
		if (isAdd) {
			if (_master instanceof L1PcInstance) {
				L1PcInstance pc = (L1PcInstance) _master;
				pc.sendPackets(new S_SkillSound(_master.getId(), 6319));
			}
			_master.broadcastPacket(new S_SkillSound(_master.getId(), 6319));
		}
		return s;
	}

	public static int getDamageReductionByDoll(L1Character _master) {
		int s = 0;
		int chance = _random.nextInt(100) + 1;
		boolean isReduction = false;
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				if (doll.getDmgReductionChance() > 0 && !isReduction) {
					if (doll.getDmgReductionChance() >= chance) {
						s += doll.getDmgReduction();
						isReduction = true;
					}
				} else if (doll.getDmgReduction() != 0) {
					s += doll.getDmgReduction();
				}
			}
		}
		if (isReduction) {
			if (_master instanceof L1PcInstance) {
				L1PcInstance pc = (L1PcInstance) _master;
				pc.sendPackets(new S_SkillSound(_master.getId(), 6320));
			}
			_master.broadcastPacket(new S_SkillSound(_master.getId(), 6320));
		}
		return s;
	}

	public static int getDamageEvasionByDoll(L1Character _master) {
		int chance = _random.nextInt(100) + 1;
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				if (doll.getDmgEvasionChance() >= chance) {
					if (_master instanceof L1PcInstance) {
						L1PcInstance pc = (L1PcInstance) _master;
						pc.sendPackets(new S_SkillSound(_master.getId(), 6320));
					}
					_master.broadcastPacket(new S_SkillSound(_master.getId(),
							6320));
					return 1;
				}
			}
		}
		return 0;
	}

	public static int getBowHitAddByDoll(L1Character _master) {
		int s = 0;
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				s += doll.getBowHit();
			}
		}
		return s;
	}

	public static int getBowDamageByDoll(L1Character _master) {
		int s = 0;
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				s += doll.getBowDmg();
			}
		}
		return s;
	}

	public static int getAcByDoll(L1Character _master) {
		int s = 0;
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				s += doll.getAc();
			}
		}
		return s;
	}

	public static int getStrByDoll(L1Character _master) {
		int s = 0;
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				s += doll.getStr();
			}
		}
		return s;
	}

	public static int getConByDoll(L1Character _master) {
		int s = 0;
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				s += doll.getCon();
			}
		}
		return s;
	}

	public static int getDexByDoll(L1Character _master) {
		int s = 0;
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				s += doll.getDex();
			}
		}
		return s;
	}

	public static int getIntByDoll(L1Character _master) {
		int s = 0;
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				s += doll.getInt();
			}
		}
		return s;
	}

	public static int getWisByDoll(L1Character _master) {
		int s = 0;
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				s += doll.getWis();
			}
		}
		return s;
	}

	public static int getChaByDoll(L1Character _master) {
		int s = 0;
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				s += doll.getCha();
			}
		}
		return s;
	}

	public static int getResistStoneByDoll(L1Character _master) {
		int s = 0;
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				s += doll.getResistStone();
			}
		}
		return s;
	}

	public static int getResistStunByDoll(L1Character _master) {
		int s = 0;
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				s += doll.getResistStun();
			}
		}
		return s;
	}

	public static int getResistHoldByDoll(L1Character _master) {
		int s = 0;
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				s += doll.getResistHold();
			}
		}
		return s;
	}

	public static int getResistBlindByDoll(L1Character _master) {
		int s = 0;
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				s += doll.getResistBlind();
			}
		}
		return s;
	}

	public static int getResistFreezeByDoll(L1Character _master) {
		int s = 0;
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				s += doll.getResistFreeze();
			}
		}
		return s;
	}

	public static int getResistSleepByDoll(L1Character _master) {
		int s = 0;
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				s += doll.getResistSleep();
			}
		}
		return s;
	}

	public static int getWeightReductionByDoll(L1Character _master) {
		int s = 0;
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				s += doll.getWeightReduction();
			}
		}
		return s;
	}

	public static int getHpByDoll(L1Character _master) {
		int s = 0;
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				s += doll.getHp();
			}
		}
		return s;
	}

	public static int getMpByDoll(L1Character _master) {
		int s = 0;
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				s += doll.getMp();
			}
		}
		return s;
	}

	public static int getMrByDoll(L1Character _master) {
		int s = 0;
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				s += doll.getMr();
			}
		}
		return s;
	}

	public static boolean isItemMake(L1Character _master) {
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				L1Item item = ItemTable.getInstance().getTemplate(
						(doll.getMakeItemId()));
				if (item != null) {
					return true;
				}
			}
		}
		return false;
	}

	public static int getExpBonusByDoll(L1Character _master) {
		int s = 0;
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				s += doll.getExpBonus();
			}
		}
		return s;
	}

	public static int getMakeItemId(L1Character _master) {
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				L1Item item = ItemTable.getInstance().getTemplate(
						(doll.getMakeItemId()));
				if (item != null) {
					return item.getItemId();
				}
			}
		}
		return 0;
	}

	public static boolean isHpRegeneration(L1Character _master) {
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				if (doll.getHprTime() && doll.getHpr() != 0) {
					return true;
				}
			}
		}
		return false;
	}

	public static int getHprByDoll(L1Character _master) {
		int s = 0;
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				if (doll.getHprTime() && doll.getHpr() != 0) {
					s += doll.getHpr();
				}
			}
		}
		return s;
	}

	public static boolean isMpRegeneration(L1Character _master) {
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				if (doll.getMprTime() && doll.getMpr() != 0) {
					return true;
				}
			}
		}
		return false;
	}

	public static int getMprByDoll(L1Character _master) {
		int s = 0;
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				if (doll.getMprTime() && doll.getMpr() != 0) {
					s += doll.getMpr();
				}
			}
		}
		return s;
	}

	public static int getEffectByDoll(L1Character _master, int type) {
		int chance = _random.nextInt(100) + 1;
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				if (doll.getSkillId() == type) {
					if (doll.getSkillChance() >= chance) {
						return type;
					}
				}
			}
		}
		return 0;
	}

	public static boolean isBlessOfEva(L1Character _master) {
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				if (doll.getDollId() >= 80226 && doll.getDollId() <= 80231) {
					return true;
				}
			}
		}
		return false;
	}

	public static boolean isHaste(L1Character _master) {
		for (Object obj : _master.getDollList().values().toArray()) {
			L1MagicDoll doll = MagicDollTable.getInstance().getTemplate(
					((L1DollInstance) obj).getItemId());
			if (doll != null) {
				if (doll.getDollId() >= 80232 && doll.getDollId() <= 80237) {
					return true;
				}
			}
		}
		return false;
	}
}