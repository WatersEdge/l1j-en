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
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

import l1j.server.L1DatabaseFactory;
import l1j.server.server.templates.L1MagicDoll;
import l1j.server.server.utils.SQLUtil;

public class MagicDollTable {

	private static Logger _log = Logger.getLogger(MagicDollTable.class.getName());

	private static MagicDollTable _instance;

	private final HashMap<Integer, L1MagicDoll> _dolls = new HashMap<Integer, L1MagicDoll>();

	public static MagicDollTable getInstance() {
		if (_instance == null) {
			_instance = new MagicDollTable();
		}
		return _instance;
	}

	private MagicDollTable() {
		load();
	}

	private void load() {
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			con = L1DatabaseFactory.getInstance().getConnection();
			pstm = con.prepareStatement("SELECT * FROM MagicDoll");
			rs = pstm.executeQuery();
			while (rs.next()) {
				L1MagicDoll doll = new L1MagicDoll();
				int itemId = rs.getInt("item_id");
				doll.setItemId(itemId);
				doll.setDollId(rs.getInt("doll_id"));
				doll.setAc(rs.getInt("ac"));
				doll.setHpr(rs.getInt("hpr"));
				doll.setHprTime(rs.getBoolean("hpr_time"));
				doll.setMpr(rs.getInt("mpr"));
				doll.setMprTime(rs.getBoolean("mpr_time"));
				doll.setHit(rs.getInt("hit"));
				doll.setDmg(rs.getInt("dmg"));
				doll.setDmgChance(rs.getInt("dmg_chance"));
				doll.setBowHit(rs.getInt("bow_hit"));
				doll.setBowDmg(rs.getInt("bow_dmg"));
				doll.setDmgReduction(rs.getInt("dmg_reduction"));
				doll.setDmgReductionChance(rs.getInt("dmg_reduction_chance"));
				doll.setDmgEvasionChance(rs.getInt("dmg_evasion_chance"));
				doll.setWeightReduction(rs.getInt("weight_reduction"));
				doll.setRegistStun(rs.getInt("regist_stun"));
				doll.setRegistStone(rs.getInt("regist_stone"));
				doll.setRegistSleep(rs.getInt("regist_sleep"));
				doll.setRegistFreeze(rs.getInt("regist_freeze"));
				doll.setRegistSustain(rs.getInt("regist_sustain"));
				doll.setRegistBlind(rs.getInt("regist_blind"));
				doll.setMakeItemId(rs.getInt("make_itemid"));
				doll.setEffect(rs.getByte("effect"));
			   _dolls.put(new Integer(itemId), doll);
			}
		} catch (SQLException e) {
			_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
		} finally {
			SQLUtil.close(rs);
			SQLUtil.close(pstm);
			SQLUtil.close(con);

		}
	}

	public L1MagicDoll getTemplate(int itemId) {
		if (_dolls.containsKey(itemId)) {
			return _dolls.get(itemId);
		}
		return null;
	}
}