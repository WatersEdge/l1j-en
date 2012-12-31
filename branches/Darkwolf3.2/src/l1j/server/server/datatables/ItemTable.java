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
package l1j.server.server.datatables;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import l1j.server.L1DatabaseFactory;
import l1j.server.server.encryptions.IdFactory;
import l1j.server.server.model.L1World;
import l1j.server.server.model.Instance.L1ItemInstance;
import l1j.server.server.templates.L1Armor;
import l1j.server.server.templates.L1EtcItem;
import l1j.server.server.templates.L1Item;
import l1j.server.server.templates.L1Weapon;
import l1j.server.server.utils.SQLUtil;

public class ItemTable {
	private static final long serialVersionUID = 1L;
	private static Logger _log = Logger.getLogger(ItemTable.class.getName());
	private static final Map<String, Integer> _armorTypes = new HashMap<String, Integer>();
	private static final Map<String, Integer> _weaponTypes = new HashMap<String, Integer>();
	private static final Map<String, Integer> _weaponId = new HashMap<String, Integer>();
	private static final Map<String, Integer> _materialTypes = new HashMap<String, Integer>();
	private static final Map<String, Integer> _etcItemTypes = new HashMap<String, Integer>();
	private static final Map<String, Integer> _useTypes = new HashMap<String, Integer>();
	private static ItemTable _instance;
	private L1Item _allTemplates[];
	private final Map<Integer, L1EtcItem> _etcitems;
	private final Map<Integer, L1Armor> _armors;
	private final Map<Integer, L1Weapon> _weapons;

	static {
		_etcItemTypes.put("arrow", new Integer(0));
		_etcItemTypes.put("wand", new Integer(1));
		_etcItemTypes.put("light", new Integer(2));
		_etcItemTypes.put("gem", new Integer(3));
		_etcItemTypes.put("totem", new Integer(4));
		_etcItemTypes.put("firecracker", new Integer(5));
		_etcItemTypes.put("potion", new Integer(6));
		_etcItemTypes.put("food", new Integer(7));
		_etcItemTypes.put("scroll", new Integer(8));
		_etcItemTypes.put("questitem", new Integer(9));
		_etcItemTypes.put("spellbook", new Integer(10));
		_etcItemTypes.put("petitem", new Integer(11));
		_etcItemTypes.put("other", new Integer(12));
		_etcItemTypes.put("material", new Integer(13));
		_etcItemTypes.put("event", new Integer(14));
		_etcItemTypes.put("sting", new Integer(15));
		_etcItemTypes.put("treasure_box", new Integer(16));
		_etcItemTypes.put("magic_doll", new Integer(17));
		
		_useTypes.put("none", new Integer(-1)); // Unavailable
		_useTypes.put("normal", new Integer(0));
		_useTypes.put("weapon", new Integer(1));
		_useTypes.put("armor", new Integer(2));
		//_useTypes.put("wand1", new Integer(3));
		//_useTypes.put("wand", new Integer(4));
		// Wand to wave to take action(C_RequestExtraCommand Is sent)
		_useTypes.put("spell_long", new Integer(5)); // The ground / object selection (long-distance)
		_useTypes.put("ntele", new Integer(6));
		_useTypes.put("identify", new Integer(7));
		_useTypes.put("res", new Integer(8));
		_useTypes.put("letter", new Integer(12));
		_useTypes.put("letter_w", new Integer(13));
		_useTypes.put("choice", new Integer(14));
		_useTypes.put("instrument", new Integer(15));
		_useTypes.put("sosc", new Integer(16));
		_useTypes.put("spell_short", new Integer(17)); // The ground / object selection (short-range)
		_useTypes.put("T", new Integer(18));
		_useTypes.put("cloak", new Integer(19));
		_useTypes.put("glove", new Integer(20));
		_useTypes.put("boots", new Integer(21));
		_useTypes.put("helm", new Integer(22));
		_useTypes.put("ring", new Integer(23));
		_useTypes.put("amulet", new Integer(24));
		_useTypes.put("shield", new Integer(25));
		_useTypes.put("guarder", new Integer(25));
		_useTypes.put("dai", new Integer(26));
		_useTypes.put("zel", new Integer(27));
		_useTypes.put("blank", new Integer(28));
		_useTypes.put("btele", new Integer(29));
		_useTypes.put("spell_buff", new Integer(30)); // Selected object (long-distance) Ctrl and not push packet is dead?
		_useTypes.put("ccard", new Integer(31));
		_useTypes.put("ccard_w", new Integer(32));
		_useTypes.put("vcard", new Integer(33));
		_useTypes.put("vcard_w", new Integer(34));
		_useTypes.put("wcard", new Integer(35));
		_useTypes.put("wcard_w", new Integer(36));
		_useTypes.put("belt", new Integer(37));
		//_useTypes.put("spell_long2", new Integer(39)); // The ground / object selection (long-distance) and the same?
		_useTypes.put("earring", new Integer(40));
		_useTypes.put("fishing_rod", new Integer(42));
		_useTypes.put("del", new Integer(46));

		_armorTypes.put("none", new Integer(0));
		_armorTypes.put("helm", new Integer(1));
		_armorTypes.put("armor", new Integer(2));
		_armorTypes.put("T", new Integer(3));
		_armorTypes.put("cloak", new Integer(4));
		_armorTypes.put("glove", new Integer(5));
		_armorTypes.put("boots", new Integer(6));
		_armorTypes.put("shield", new Integer(7));
		_armorTypes.put("amulet", new Integer(8));
		_armorTypes.put("ring", new Integer(9));
		_armorTypes.put("belt", new Integer(10));
		_armorTypes.put("ring2", new Integer(11));
		_armorTypes.put("earring", new Integer(12));
		_armorTypes.put("guarder", new Integer(13));

		_weaponTypes.put("sword", new Integer(1));
		_weaponTypes.put("dagger", new Integer(2));
		_weaponTypes.put("tohandsword", new Integer(3));
		_weaponTypes.put("bow", new Integer(4));
		_weaponTypes.put("spear", new Integer(5));
		_weaponTypes.put("blunt", new Integer(6));
		_weaponTypes.put("staff", new Integer(7));
		_weaponTypes.put("throwingknife", new Integer(8));
		_weaponTypes.put("arrow", new Integer(9));
		_weaponTypes.put("gauntlet", new Integer(10));
		_weaponTypes.put("claw", new Integer(11));
		_weaponTypes.put("edoryu", new Integer(12));
		_weaponTypes.put("singlebow", new Integer(13));
		_weaponTypes.put("singlespear", new Integer(14));
		_weaponTypes.put("tohandblunt", new Integer(15));
		_weaponTypes.put("tohandstaff", new Integer(16));
		_weaponTypes.put("kiringku", new Integer(17));
		_weaponTypes.put("chainsword", new Integer(18));

		_weaponId.put("sword", new Integer(4));
		_weaponId.put("dagger", new Integer(46));
		_weaponId.put("tohandsword", new Integer(50));
		_weaponId.put("bow", new Integer(20));
		_weaponId.put("blunt", new Integer(11));
		_weaponId.put("spear", new Integer(24));
		_weaponId.put("staff", new Integer(40));
		_weaponId.put("throwingknife", new Integer(2922));
		_weaponId.put("arrow", new Integer(66));
		_weaponId.put("gauntlet", new Integer(62));
		_weaponId.put("claw", new Integer(58));
		_weaponId.put("edoryu", new Integer(54));
		_weaponId.put("singlebow", new Integer(20));
		_weaponId.put("singlespear", new Integer(24));
		_weaponId.put("tohandblunt", new Integer(11));
		_weaponId.put("tohandstaff", new Integer(40));
		_weaponId.put("kiringku", new Integer(58));
		_weaponId.put("chainsword", new Integer(24));

		_materialTypes.put("none", new Integer(0));
		_materialTypes.put("liquid", new Integer(1));
		_materialTypes.put("web", new Integer(2));
		_materialTypes.put("vegetation", new Integer(3));
		_materialTypes.put("animalmatter", new Integer(4));
		_materialTypes.put("paper", new Integer(5));
		_materialTypes.put("cloth", new Integer(6));
		_materialTypes.put("leather", new Integer(7));
		_materialTypes.put("wood", new Integer(8));
		_materialTypes.put("bone", new Integer(9));
		_materialTypes.put("dragonscale", new Integer(10));
		_materialTypes.put("iron", new Integer(11));
		_materialTypes.put("steel", new Integer(12));
		_materialTypes.put("copper", new Integer(13));
		_materialTypes.put("silver", new Integer(14));
		_materialTypes.put("gold", new Integer(15));
		_materialTypes.put("platinum", new Integer(16));
		_materialTypes.put("mithril", new Integer(17));
		_materialTypes.put("blackmithril", new Integer(18));
		_materialTypes.put("glass", new Integer(19));
		_materialTypes.put("gemstone", new Integer(20));
		_materialTypes.put("mineral", new Integer(21));
		_materialTypes.put("oriharukon", new Integer(22));
	}

	public static ItemTable getInstance() {
		if (_instance == null) {
			_instance = new ItemTable();
		}
		return _instance;
	}

	private ItemTable() {
		_etcitems = allEtcItem();
		_weapons = allWeapon();
		_armors = allArmor();
		buildFastLookupTable();
	}

	private Map<Integer, L1EtcItem> allEtcItem() {
		Map<Integer, L1EtcItem> result = new HashMap<Integer, L1EtcItem>();

		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		L1EtcItem item = null;
		try {
			con = L1DatabaseFactory.getInstance().getConnection();
			pstm = con.prepareStatement("select * from etcitem");

			rs = pstm.executeQuery();
			while (rs.next()) {
				item = new L1EtcItem();
				item.setItemId(rs.getInt("item_id"));
				item.setName(rs.getString("name"));
				item.setUnidentifiedNameId(rs.getString("unidentified_name_id"));
				item.setIdentifiedNameId(rs.getString("identified_name_id"));
				item.setType((_etcItemTypes.get(rs.getString("item_type"))).intValue());
				item.setUseType(_useTypes.get(rs.getString("use_type")).intValue());
				item.setType2(0);
				item.setMaterial((_materialTypes.get(rs.getString("material"))).intValue());
				item.setWeight(rs.getInt("weight"));
				item.setGfxId(rs.getInt("invgfx"));
				item.setGroundGfxId(rs.getInt("grdgfx"));
				item.setItemDescId(rs.getInt("itemdesc_id"));
				item.setMinLevel(rs.getInt("min_level"));
				item.setMaxLevel(rs.getInt("max_level"));
				item.setBless(rs.getInt("bless"));
				item.setTradable(rs.getInt("tradable") == 1 ? true : false);
				item.setDeletable(rs.getInt("deletable") == 1 ? true : false);
				item.setSealable(rs.getInt("sealable") == 1 ? true : false);
				item.setDmgSmall(rs.getInt("dmg_small"));
				item.setDmgLarge(rs.getInt("dmg_large"));
				item.setStackable(rs.getInt("stackable") == 1 ? true : false);
				item.setMaxChargeCount(rs.getInt("max_charge_count"));
				item.setLocX(rs.getInt("locx"));
				item.setLocY(rs.getInt("locy"));
				item.setMapId(rs.getShort("map_id"));
				item.setDelayId(rs.getInt("delay_id"));
				item.setDelayTime(rs.getInt("delay_time"));
				item.setDelayEffect(rs.getInt("delay_effect"));
				item.setFoodVolume(rs.getInt("food_volume"));
				item.setToBeSavedAtOnce((rs.getInt("save_at_once") == 1) ? true : false);
				item.setChargeTime(rs.getInt("charge_time"));
				item.setExpirationTime(rs.getString("expiration_time"));
				result.put(new Integer(item.getItemId()), item);
			}
		} catch (NullPointerException e) {
			_log.log(Level.SEVERE, new StringBuilder()
					.append(item.getName())
					.append("(" + item.getItemId() + ")")
					.append(" Failed to load.").toString());
		} catch (SQLException e) {
			_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
		} finally {
			SQLUtil.close(rs);
			SQLUtil.close(pstm);
			SQLUtil.close(con);
		}
		return result;
	}

	private Map<Integer, L1Weapon> allWeapon() {
		Map<Integer, L1Weapon> result = new HashMap<Integer, L1Weapon>();

		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		L1Weapon weapon = null;
		try {
			con = L1DatabaseFactory.getInstance().getConnection();
			pstm = con.prepareStatement("select * from weapon");

			rs = pstm.executeQuery();
			while (rs.next()) {
				weapon = new L1Weapon();
				weapon.setItemId(rs.getInt("item_id"));
				weapon.setName(rs.getString("name"));
				weapon.setUnidentifiedNameId(rs.getString("unidentified_name_id"));
				weapon.setIdentifiedNameId(rs.getString("identified_name_id"));
				weapon.setType((_weaponTypes.get(rs.getString("type"))).intValue());
				weapon.setType1((_weaponId.get(rs.getString("type"))).intValue());
				weapon.setType2(1);
				weapon.setUseType(1);
				weapon.setIsTwohanded(rs.getBoolean("is_twohanded"));
				weapon.setMaterial((_materialTypes.get(rs.getString("material"))).intValue());
				weapon.setWeight(rs.getInt("weight"));
				weapon.setGfxId(rs.getInt("invgfx"));
				weapon.setGroundGfxId(rs.getInt("grdgfx"));
				weapon.setItemDescId(rs.getInt("itemdesc_id"));
				weapon.setDmgSmall(rs.getInt("dmg_small"));
				weapon.setDmgLarge(rs.getInt("dmg_large"));
				weapon.setRange(rs.getInt("range"));
				weapon.setSafeEnchant(rs.getInt("safe_enchant"));
				weapon.setUseRoyal(rs.getInt("use_royal") == 0 ? false : true);
				weapon.setUseKnight(rs.getInt("use_knight") == 0 ? false : true);
				weapon.setUseElf(rs.getInt("use_elf") == 0 ? false : true);
				weapon.setUseMage(rs.getInt("use_mage") == 0 ? false : true);
				weapon.setUseDarkelf(rs.getInt("use_darkelf") == 0 ? false : true);
				weapon.setUseDragonknight(rs.getInt("use_dragonknight") == 0 ? false : true);
				weapon.setUseIllusionist(rs.getInt("use_illusionist") == 0 ? false : true);
				weapon.setHitModifier(rs.getInt("hit_modifier"));
				weapon.setDmgModifier(rs.getInt("dmg_modifier"));
				weapon.setStr(rs.getByte("str"));
				weapon.setDex(rs.getByte("dex"));
				weapon.setCon(rs.getByte("con"));
				weapon.setInt(rs.getByte("int"));
				weapon.setWis(rs.getByte("wis"));
				weapon.setCha(rs.getByte("cha"));
				weapon.setHp(rs.getInt("hp"));
				weapon.setMp(rs.getInt("mp"));
				weapon.setHpr(rs.getInt("hpr"));
				weapon.setMpr(rs.getInt("mpr"));
				weapon.setSp(rs.getInt("sp"));
				weapon.setMr(rs.getInt("mr"));
				weapon.setDoubleDmgChance(rs.getInt("double_dmg_chance"));
				weapon.setWeaknessExposure(rs.getInt("weakness_exposure"));
				weapon.setMagicDmgModifier(rs.getInt("magic_dmg_modifier"));
				weapon.setCanbeDmg(rs.getBoolean("can_be_dmg"));
				weapon.setMinLevel(rs.getInt("min_level"));
				weapon.setMaxLevel(rs.getInt("max_level"));
				weapon.setBless(rs.getInt("bless"));
				weapon.setTradable(rs.getInt("tradable") == 1 ? true : false);
				weapon.setDeletable(rs.getInt("deletable") == 1 ? true : false);
				weapon.setIsHaste(rs.getBoolean("is_haste"));
				weapon.setChargeTime(rs.getInt("charge_time"));
				weapon.setExpirationTime(rs.getString("expiration_time"));
				result.put(new Integer(weapon.getItemId()), weapon);
			}
		} catch (NullPointerException e) {
			_log.log(Level.SEVERE, new StringBuilder()
					.append(weapon.getName())
					.append("(" + weapon.getItemId() + ")")
					.append(" Failed to load.").toString());
		} catch (SQLException e) {
			_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
		} finally {
			SQLUtil.close(rs);
			SQLUtil.close(pstm);
			SQLUtil.close(con);

		}
		return result;
	}

	private Map<Integer, L1Armor> allArmor() {
		Map<Integer, L1Armor> result = new HashMap<Integer, L1Armor>();
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		L1Armor armor = null;
		try {
			con = L1DatabaseFactory.getInstance().getConnection();
			pstm = con.prepareStatement("select * from armor");

			rs = pstm.executeQuery();
			while (rs.next()) {
				armor = new L1Armor();
				armor.setItemId(rs.getInt("item_id"));
				armor.setName(rs.getString("name"));
				armor.setUnidentifiedNameId(rs.getString("unidentified_name_id"));
				armor.setIdentifiedNameId(rs.getString("identified_name_id"));
				armor.setType((_armorTypes.get(rs.getString("type"))).intValue());
				armor.setType2(2);
				armor.setUseType((_useTypes.get(rs.getString("type"))).intValue());
				armor.setMaterial((_materialTypes.get(rs.getString("material"))).intValue());
				armor.setGrade(rs.getInt("grade"));
				armor.setWeight(rs.getInt("weight"));
				armor.setGfxId(rs.getInt("invgfx"));
				armor.setGroundGfxId(rs.getInt("grdgfx"));
				armor.setItemDescId(rs.getInt("itemdesc_id"));
				armor.setSafeEnchant(rs.getInt("safe_enchant"));
				armor.setUseRoyal(rs.getInt("use_royal") == 0 ? false : true);
				armor.setUseKnight(rs.getInt("use_knight") == 0 ? false : true);
				armor.setUseElf(rs.getInt("use_elf") == 0 ? false : true);
				armor.setUseMage(rs.getInt("use_mage") == 0 ? false : true);
				armor.setUseDarkelf(rs.getInt("use_darkelf") == 0 ? false : true);
				armor.setUseDragonknight(rs.getInt("use_dragonknight") == 0 ? false : true);
				armor.setUseIllusionist(rs.getInt("use_illusionist") == 0 ? false : true);
				armor.setMinLevel(rs.getInt("min_level"));
				armor.setMaxLevel(rs.getInt("max_level"));
				armor.setAc(rs.getInt("ac"));
				armor.setStr(rs.getByte("str"));
				armor.setCon(rs.getByte("con"));
				armor.setDex(rs.getByte("dex"));
				armor.setWis(rs.getByte("wis"));
				armor.setCha(rs.getByte("cha"));
				armor.setInt(rs.getByte("int"));
				armor.setHp(rs.getInt("hp"));
				armor.setHpr(rs.getInt("hpr"));
				armor.setMp(rs.getInt("mp"));
				armor.setMpr(rs.getInt("mpr"));
				armor.setSp(rs.getInt("sp"));
				armor.setMr(rs.getInt("mr"));
				armor.setDamageReduction(rs.getInt("damage_reduction"));
				armor.setWeightReduction(rs.getInt("weight_reduction"));
				armor.setHitModifierByArmor(rs.getInt("hit_modifier"));
				armor.setDmgModifierByArmor(rs.getInt("dmg_modifier"));
				armor.setBowHitModifierByArmor(rs.getInt("bow_hit_modifier"));
				armor.setBowDmgModifierByArmor(rs.getInt("bow_dmg_modifier"));
				armor.setDefenseEarth(rs.getInt("defense_earth"));
				armor.setDefenseWater(rs.getInt("defense_water"));
				armor.setDefenseWind(rs.getInt("defense_wind"));
				armor.setDefenseFire(rs.getInt("defense_fire"));
				armor.setResistStun(rs.getInt("resist_stun"));
				armor.setResistStone(rs.getInt("resist_stone"));
				armor.setResistSleep(rs.getInt("resist_sleep"));
				armor.setResistFreeze(rs.getInt("resist_freeze"));
				armor.setResistHold(rs.getInt("resist_hold"));
				armor.setResistBlind(rs.getInt("resist_blind"));
				armor.setBless(rs.getInt("bless"));
				armor.setTradable(rs.getInt("tradable") == 1 ? true : false);
				armor.setDeletable(rs.getInt("deletable") == 1 ? true : false);
				armor.setChargeTime(rs.getInt("charge_time"));
				armor.setExpirationTime(rs.getString("expiration_time"));
				armor.setIsHaste(rs.getInt("is_haste") == 0 ? false : true);
				armor.setExpBonus(rs.getInt("exp_bonus"));
				armor.setPotionRecoveryRate(rs.getInt("potion_recovery_rate"));
				result.put(new Integer(armor.getItemId()), armor);
			}
		} catch (NullPointerException e) {
			_log.log(Level.SEVERE, new StringBuilder()
					.append(armor.getName())
					.append("(" + armor.getItemId() + ")")
					.append(" Failed to load.").toString());
		} catch (SQLException e) {
			_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
		} finally {
			SQLUtil.close(rs);
			SQLUtil.close(pstm);
			SQLUtil.close(con);

		}
		return result;
	}

	private void buildFastLookupTable() {
		int highestId = 0;

		Collection<L1EtcItem> items = _etcitems.values();
		for (L1EtcItem item : items) {
			if (item.getItemId() > highestId) {
				highestId = item.getItemId();
			}
		}

		Collection<L1Weapon> weapons = _weapons.values();
		for (L1Weapon weapon : weapons) {
			if (weapon.getItemId() > highestId) {
				highestId = weapon.getItemId();
			}
		}

		Collection<L1Armor> armors = _armors.values();
		for (L1Armor armor : armors) {
			if (armor.getItemId() > highestId) {
				highestId = armor.getItemId();
			}
		}

		_allTemplates = new L1Item[highestId + 1];

		for (Iterator<Integer> iter = _etcitems.keySet().iterator(); iter.hasNext();) {
			Integer id = iter.next();
			L1EtcItem item = _etcitems.get(id);
			_allTemplates[id.intValue()] = item;
		}

		for (Iterator<Integer> iter = _weapons.keySet().iterator(); iter.hasNext();) {
			Integer id = iter.next();
			L1Weapon item = _weapons.get(id);
			_allTemplates[id.intValue()] = item;
		}

		for (Iterator<Integer> iter = _armors.keySet().iterator(); iter.hasNext();) {
			Integer id = iter.next();
			L1Armor item = _armors.get(id);
			_allTemplates[id.intValue()] = item;
		}
	}

	public L1Item getTemplate(int id) {
		return _allTemplates[id];
	}

	public L1ItemInstance createItem(int itemId) {
		L1Item temp = getTemplate(itemId);
		if (temp == null) {
			return null;
		}
		L1ItemInstance item = new L1ItemInstance();
		item.setId(IdFactory.getInstance().nextId());
		item.setItem(temp);
		L1World.getInstance().storeObject(item);
		return item;
	}

	public int findItemIdByName(String name) {
		int itemid = 0;
		for (L1Item item : _allTemplates) {
			if (item != null && item.getName().equals(name)) {
				itemid = item.getItemId();
				break;
			}
		}
		return itemid;
	}

	public int findItemIdByNameWithoutSpace(String name) {
		int itemid = 0;
		for (L1Item item : _allTemplates) {
			if (item != null && item.getName().replace(" ", "").equals(name)) {
				itemid = item.getItemId();
				break;
			}
		}
		return itemid;
	}
}