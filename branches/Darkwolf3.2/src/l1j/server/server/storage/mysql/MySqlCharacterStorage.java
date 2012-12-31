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
package l1j.server.server.storage.mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import l1j.server.L1DatabaseFactory;
import l1j.server.server.Account;
import l1j.server.server.model.Instance.L1PcInstance;
import l1j.server.server.storage.CharacterStorage;
import l1j.server.server.utils.SQLUtil;

public class MySqlCharacterStorage implements CharacterStorage {
	private static Logger _log = Logger.getLogger(MySqlCharacterStorage.class.getName());

	@Override
	public L1PcInstance loadCharacter(String charName) {
		L1PcInstance pc = null;
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			con = L1DatabaseFactory.getInstance().getConnection();
			pstm = con.prepareStatement("SELECT * FROM characters WHERE name=?");
			pstm.setString(1, charName);

			rs = pstm.executeQuery();
			if (!rs.next()) {
				return null;
			}
			pc = new L1PcInstance(Account.findById(rs.getInt("account_id")));
			pc.setAccountName(rs.getString("account_id"));
			pc.setId(rs.getInt("id"));
			pc.setName(rs.getString("name"));
			pc.setBirthday(rs.getTimestamp("birthday"));
			pc.setHighLevel(rs.getInt("high_level"));
			pc.setExp(rs.getInt("exp"));
			pc.addBaseMaxHp(rs.getShort("max_hp"));
			short currentHp = rs.getShort("cur_hp");
			if (currentHp < 1) {
				currentHp = 1;
			}
			pc.setCurrentHpDirect(currentHp);
			pc.setDead(false);
			pc.setStatus(0);
			pc.addBaseMaxMp(rs.getShort("max_mp"));
			pc.setCurrentMpDirect(rs.getShort("cur_mp"));
			pc.addBaseStr(rs.getByte("str"));
			pc.addBaseCon(rs.getByte("con"));
			pc.addBaseDex(rs.getByte("dex"));
			pc.addBaseCha(rs.getByte("cha"));
			pc.addBaseInt(rs.getByte("int"));
			pc.addBaseWis(rs.getByte("wis"));
			int status = rs.getInt("status");
			pc.setCurrentWeapon(status);
			int classId = rs.getInt("class");
			pc.setClassId(classId);
			pc.setTempCharGfx(classId);
			pc.setGfxId(classId);
			pc.set_sex(rs.getInt("sex"));
			pc.setType(rs.getInt("type"));
			int head = rs.getInt("heading");
			if (head > 7) {
				head = 0;
			}
			pc.setHeading(head);
			pc.setX(rs.getInt("locx"));
			pc.setY(rs.getInt("locy"));
			pc.setMap(rs.getShort("map_id"));
			pc.set_food(rs.getInt("food"));
			pc.setLawful(rs.getInt("lawful"));
			pc.setTitle(rs.getString("title"));
			pc.setClanid(rs.getInt("clan_id"));
			pc.setClanname(rs.getString("clan_name"));
			pc.setClanRank(rs.getInt("clan_rank"));
			pc.setBonusStats(rs.getInt("bonus_status"));
			pc.setElixirStats(rs.getInt("elixir_status"));
			pc.setElfAttr(rs.getInt("elf_attr"));
			pc.set_PKcount(rs.getInt("pk_count"));
			pc.setPkCountForElf(rs.getInt("pk_count_for_elf"));
			pc.setExpRes(rs.getInt("exp_res"));
			pc.setPartnerId(rs.getInt("partner_id"));
			pc.setAccessLevel(rs.getShort("access_level"));
			if (pc.getAccessLevel() == 200) {
				pc.setGm(true);
				pc.setMonitor(false);
			} else if (pc.getAccessLevel() == 100) {
				pc.setGm(false);
				pc.setMonitor(true);
			} else {
				pc.setGm(false);
				pc.setMonitor(false);
			}
			pc.setOnlineStatus(rs.getInt("online_status"));
			pc.setHomeTownId(rs.getInt("hometown_id"));
			pc.setContribution(rs.getInt("contribution"));
			pc.setPay(rs.getInt("pay"));
			pc.setHellTime(rs.getInt("hell_time"));
			pc.setBanned(rs.getBoolean("banned"));
			pc.setKarma(rs.getInt("karma"));
			pc.setLastPk(rs.getTimestamp("last_pk"));
			pc.setLastPkForElf(rs.getTimestamp("last_pk_for_elf"));
			pc.setDeleteTime(rs.getTimestamp("delete_time"));
			pc.setOriginalStr(rs.getInt("original_str"));
			pc.setOriginalCon(rs.getInt("original_con"));
			pc.setOriginalDex(rs.getInt("original_dex"));
			pc.setOriginalCha(rs.getInt("original_cha"));
			pc.setOriginalInt(rs.getInt("original_int"));
			pc.setOriginalWis(rs.getInt("original_wis"));
			pc.setUseAdditionalWarehouse(rs.getBoolean("use_additional_warehouse"));
			pc.setLogoutTime(rs.getTimestamp("logout_time"));
			
			pc.refresh();
			pc.setMoveSpeed(0);
			pc.setBraveSpeed(0);
			pc.setGmInvis(false);
			_log.finest("Loaded Character Info : ");
		} catch (SQLException e) {
			_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
			return null;
		} finally {
			SQLUtil.close(rs);
			SQLUtil.close(pstm);
			SQLUtil.close(con);
		}
		return pc;
	}

	@Override
	public void createCharacter(L1PcInstance pc) {
		Connection con = null;
		PreparedStatement pstm = null;
		try {
			int i = 0;
			con = L1DatabaseFactory.getInstance().getConnection();
			pstm = con.prepareStatement("INSERT INTO characters SET id=?,account_id=?,name=?,birthday=?,level=?,high_level=?,exp=?,max_hp=?,cur_hp=?,max_mp=?,cur_mp=?,ac=?,str=?,con=?,dex=?,cha=?,`int`=?,wis=?,status=?,class=?,sex=?,type=?,heading=?,locx=?,locy=?,map_id=?,food=?,lawful=?,title=?,clan_id=?,clan_name=?,clan_rank=?,bonus_status=?,elixir_status=?,elf_attr=?,pk_count=?,pk_count_for_elf=?,exp_res=?,partner_id=?,access_level=?,online_status=?,hometown_id=?,contribution=?,pay=?,hell_time=?,banned=?,karma=?,last_pk=?,last_pk_for_elf=?,delete_time=?,rejoin_clan_time=?,use_additional_warehouse=?,logout_time=?");
			pstm.setInt(++i, pc.getId());
			pstm.setInt(++i, pc.getAccountId());
			pstm.setString(++i, pc.getName());
			pstm.setInt(++i, pc.getSimpleBirthday());
			pstm.setInt(++i, pc.getLevel());
			pstm.setInt(++i, pc.getHighLevel());
			pstm.setInt(++i, pc.getExp());
			pstm.setInt(++i, pc.getBaseMaxHp());
			int hp = pc.getCurrentHp();
			if (hp < 1) {
				hp = 1;
			}
			pstm.setInt(++i, hp);
			pstm.setInt(++i, pc.getBaseMaxMp());
			pstm.setInt(++i, pc.getCurrentMp());
			pstm.setInt(++i, pc.getAc());
			pstm.setInt(++i, pc.getBaseStr());
			pstm.setInt(++i, pc.getBaseCon());
			pstm.setInt(++i, pc.getBaseDex());
			pstm.setInt(++i, pc.getBaseCha());
			pstm.setInt(++i, pc.getBaseInt());
			pstm.setInt(++i, pc.getBaseWis());
			pstm.setInt(++i, pc.getCurrentWeapon());
			pstm.setInt(++i, pc.getClassId());
			pstm.setInt(++i, pc.get_sex());
			pstm.setInt(++i, pc.getType());
			pstm.setInt(++i, pc.getHeading());
			pstm.setInt(++i, pc.getX());
			pstm.setInt(++i, pc.getY());
			pstm.setInt(++i, pc.getMapId());
			pstm.setInt(++i, pc.get_food());
			pstm.setInt(++i, pc.getLawful());
			pstm.setString(++i, pc.getTitle());
			pstm.setInt(++i, pc.getClanid());
			pstm.setString(++i, pc.getClanname());
			pstm.setInt(++i, pc.getClanRank());
			pstm.setInt(++i, pc.getBonusStats());
			pstm.setInt(++i, pc.getElixirStats());
			pstm.setInt(++i, pc.getElfAttr());
			pstm.setInt(++i, pc.get_PKcount());
			pstm.setInt(++i, pc.getPkCountForElf());
			pstm.setInt(++i, pc.getExpRes());
			pstm.setInt(++i, pc.getPartnerId());
			pstm.setShort(++i, pc.getAccessLevel());
			pstm.setInt(++i, pc.getOnlineStatus());
			pstm.setInt(++i, pc.getHomeTownId());
			pstm.setInt(++i, pc.getContribution());
			pstm.setInt(++i, 0);
			pstm.setInt(++i, pc.getHellTime());
			pstm.setBoolean(++i, pc.isBanned());
			pstm.setInt(++i, pc.getKarma());
			pstm.setTimestamp(++i, pc.getLastPk());
			pstm.setTimestamp(++i, pc.getLastPkForElf());
			pstm.setTimestamp(++i, pc.getDeleteTime());
			pstm.setTimestamp(++i, pc.getRejoinClanTime());
			pstm.setBoolean(++i, pc.getUseAdditionalWarehouse());
			pstm.setTimestamp(++i, pc.getLogoutTime());
			pstm.execute();
			_log.finest("Stored Character Info : " + pc.getName());
		} catch (SQLException e) {
			_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
		} finally {
			SQLUtil.close(pstm);
			SQLUtil.close(con);
		}
	}

	@Override
	public void deleteCharacter(String accountName, String charName)
			throws Exception {
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			con = L1DatabaseFactory.getInstance().getConnection();
			pstm = con.prepareStatement("SELECT * FROM characters WHERE account_name=? AND name=?");
			pstm.setString(1, accountName);
			pstm.setString(2, charName);
			rs = pstm.executeQuery();
			if (!rs.next()) {
				_log.warning("invalid delete char request: account =" + accountName + " char=" + charName);
				throw new RuntimeException("could not delete character");
			}
			pstm = con.prepareStatement("DELETE FROM character_buddys WHERE char_id IN (SELECT id FROM characters WHERE name = ?)");
			pstm.setString(1, charName);
			pstm.execute();
			pstm = con.prepareStatement("DELETE FROM character_buffs WHERE char_obj_id IN (SELECT id FROM characters WHERE name = ?)");
			pstm.setString(1, charName);
			pstm.execute();
			pstm = con.prepareStatement("DELETE FROM character_config WHERE object_id IN (SELECT id FROM characters WHERE name = ?)");
			pstm.setString(1, charName);
			pstm.execute();
			pstm = con.prepareStatement("DELETE FROM character_items WHERE char_id IN (SELECT id FROM characters WHERE name = ?)");
			pstm.setString(1, charName);
			pstm.execute();
			pstm = con.prepareStatement("DELETE FROM character_quests WHERE char_id IN (SELECT id FROM characters WHERE name = ?)");
			pstm.setString(1, charName);
			pstm.execute();
			pstm = con.prepareStatement("DELETE FROM character_skills WHERE char_obj_id IN (SELECT id FROM characters WHERE name = ?)");
			pstm.setString(1, charName);
			pstm.execute();
			pstm = con.prepareStatement("DELETE FROM character_teleport WHERE char_id IN (SELECT id FROM characters WHERE name = ?)");
			pstm.setString(1, charName);
			pstm.execute();
			pstm = con.prepareStatement("DELETE FROM characters WHERE name=?");
			pstm.setString(1, charName);
			pstm.execute();
		} catch (SQLException e) {
			throw e;
		} finally {
			SQLUtil.close(rs);
			SQLUtil.close(pstm);
			SQLUtil.close(con);
		}
	}

	@Override
	public void storeCharacter(L1PcInstance pc) {
		Connection con = null;
		PreparedStatement pstm = null;
		try {
			int i = 0;
			con = L1DatabaseFactory.getInstance().getConnection();
			pstm = con.prepareStatement("UPDATE characters SET level=?,high_level=?,exp=?,max_hp=?,cur_hp=?,max_mp=?,cur_mp=?,ac=?,str=?,con=?,dex=?,cha=?,`int`=?,wis=?,status=?,class=?,sex=?,type=?,heading=?,locx=?,locy=?,map_id=?,food=?,lawful=?,title=?,clan_id=?,clan_name=?,clan_rank=?,bonus_status=?,elixir_status=?,elf_attr=?,pk_count=?,pk_count_for_elf=?,exp_res=?,partner_id=?,access_level=?,online_status=?,hometown_id=?,contribution=?,hell_time=?,banned=?,karma=?,last_pk=?,last_pk_for_elf=?,delete_time=?,rejoin_clan_time=?,use_additional_warehouse=?,logout_time=? WHERE id=?");
			pstm.setInt(++i, pc.getLevel());
			pstm.setInt(++i, pc.getHighLevel());
			pstm.setInt(++i, pc.getExp());
			pstm.setInt(++i, pc.getBaseMaxHp());
			int hp = pc.getCurrentHp();
			if (hp < 1) {
				hp = 1;
			}
			pstm.setInt(++i, hp);
			pstm.setInt(++i, pc.getBaseMaxMp());
			pstm.setInt(++i, pc.getCurrentMp());
			pstm.setInt(++i, pc.getAc());
			pstm.setInt(++i, pc.getBaseStr());
			pstm.setInt(++i, pc.getBaseCon());
			pstm.setInt(++i, pc.getBaseDex());
			pstm.setInt(++i, pc.getBaseCha());
			pstm.setInt(++i, pc.getBaseInt());
			pstm.setInt(++i, pc.getBaseWis());
			pstm.setInt(++i, pc.getCurrentWeapon());
			pstm.setInt(++i, pc.getClassId());
			pstm.setInt(++i, pc.get_sex());
			pstm.setInt(++i, pc.getType());
			pstm.setInt(++i, pc.getHeading());
			pstm.setInt(++i, pc.getX());
			pstm.setInt(++i, pc.getY());
			pstm.setInt(++i, pc.getMapId());
			pstm.setInt(++i, pc.get_food());
			pstm.setInt(++i, pc.getLawful());
			pstm.setString(++i, pc.getTitle());
			pstm.setInt(++i, pc.getClanid());
			pstm.setString(++i, pc.getClanname());
			pstm.setInt(++i, pc.getClanRank());
			pstm.setInt(++i, pc.getBonusStats());
			pstm.setInt(++i, pc.getElixirStats());
			pstm.setInt(++i, pc.getElfAttr());
			pstm.setInt(++i, pc.get_PKcount());
			pstm.setInt(++i, pc.getPkCountForElf());
			pstm.setInt(++i, pc.getExpRes());
			pstm.setInt(++i, pc.getPartnerId());
			pstm.setShort(++i, pc.getAccessLevel());
			pstm.setInt(++i, pc.getOnlineStatus());
			pstm.setInt(++i, pc.getHomeTownId());
			pstm.setInt(++i, pc.getContribution());
			pstm.setInt(++i, pc.getHellTime());
			pstm.setBoolean(++i, pc.isBanned());
			pstm.setInt(++i, pc.getKarma());
			pstm.setTimestamp(++i, pc.getLastPk());
			pstm.setTimestamp(++i, pc.getLastPkForElf());
			pstm.setTimestamp(++i, pc.getDeleteTime());
			pstm.setTimestamp(++i, pc.getRejoinClanTime());
			pstm.setBoolean(++i, pc.getUseAdditionalWarehouse());
			pstm.setTimestamp(++i, pc.getLogoutTime());
			pstm.setInt(++i, pc.getId());
			pstm.execute();
			_log.finest("Stored Character Info :" + pc.getName());
		} catch (SQLException e) {
			_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
		} finally {
			SQLUtil.close(pstm);
			SQLUtil.close(con);
		}
	}
}