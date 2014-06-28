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

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import l1j.server.L1DatabaseFactory;
import l1j.server.server.model.L1World;
import l1j.server.server.model.Instance.L1PcInstance;
import l1j.server.server.model.classes.L1ClassId;
import l1j.server.server.serverpackets.S_SystemMessage;
import l1j.server.server.utils.SQLUtil;

public class L1Who implements L1CommandExecutor {

	private L1Who() {
	}

	public static L1CommandExecutor getInstance() {
		return new L1Who();
	}

	@Override
	public void execute(L1PcInstance pc, String cmdName, String arg) {
		try {
			if (arg.equals("")) {
				who(pc);
			} else {
				who(pc, arg);
			}
		} catch (Exception e) {
			pc.sendPackets(new S_SystemMessage(".who [all]"));
		}
	}

	private void who(L1PcInstance gm, String name) {
		try {
			L1PcInstance target = getPcInstance(name.trim());
			if (target == null) {
				gm.sendPackets(new S_SystemMessage("-" + name.trim() + "-"));
				whoOffline(gm, name);
			} else {
				gm.sendPackets(new S_SystemMessage((new StringBuilder())
						.append(target.getName())
						.append("(")
						.append(target.getAccountName())
						.append("): L")
						.append(target.getLevel())
						.append(" ")
						.append(L1ClassId.getSex(target.getClassId()))
						.append(" ")
						.append(L1ClassId.getClass(target.getClassId()))
						.append(" ")
						.append(target.getMaxHp())
						.append("/")
						.append(target.getMaxMp() + " | ")
						.append("Dmg: +" + target.getDmgup() + " | ")
						.append("Hit: +" + target.getHitup() + " | ")
						.append("MR: " + target.getMr() + " | ")
						.append("HPR: "
								+ (target.getHpr() + target.getInventory()
										.hpRegenPerTick()) + " | ")
						.append("MPR: "
								+ (target.getMpr() + target.getInventory()
										.mpRegenPerTick()) + " | ")
						.append("Karma: " + target.getKarma() + " | ")
						.append("AC: " + target.getAc() + " | ")
						.append("MR: ")
						.append(target.getMr())
						.append(" | ")
						.append("Items: " + target.getInventory().getSize()
								+ " | ")
						.append("Gold: "
								+ target.getInventory().countItems(40308))
						.toString()));
			}
		} catch (Exception exception) {
			whoOffline(gm, name);
		}
	}

	private void who(L1PcInstance gm) {
		try {
			String charC = "";
			String charS = "";
			int i = 1;
			for (L1PcInstance player : L1World.getInstance().getAllPlayers()) {
				charC = L1ClassId.getClass(player.getClassId());
				charS = L1ClassId.getSex(player.getClassId());
				gm.sendPackets(new S_SystemMessage((new StringBuilder())
						.append(i).append(". ").append(player.getName())
						.append("(").append(player.getAccountName())
						.append("): L").append(player.getLevel()).append(" ")
						.append(charS).append(" ").append(charC).append(" ")
						.append(player.getMaxHp()).append("/")
						.append(player.getMaxMp()).append(" ")
						.append(player.getMr()).append("MR").toString()));
				i++;
			}
		} catch (Exception exception) {
		}
	}

	private void whoOffline(L1PcInstance gm, String name) {
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			con = L1DatabaseFactory.getInstance().getConnection();
			pstm = con
					.prepareStatement("SELECT account_name,char_name,level,MaxHp,MaxMp,Class FROM characters WHERE char_name=?");
			pstm.setString(1, name);
			rs = pstm.executeQuery();
			rs.next();
			gm.sendPackets(new S_SystemMessage((new StringBuilder())
					.append(rs.getString("char_name")).append("(")
					.append(rs.getString("account_name")).append("): L")
					.append(rs.getInt("level")).append(" ")
					.append(L1ClassId.getSex(rs.getInt("Class"))).append(" ")
					.append(L1ClassId.getClass(rs.getInt("Class"))).append(" ")
					.append(rs.getInt("MaxHp")).append("/")
					.append(rs.getInt("MaxMp")).append(" (Offline)").toString()));
		} catch (Exception exception) {
			gm.sendPackets(new S_SystemMessage("'" + name
					+ "' is not an existing character."));
		} finally {
			SQLUtil.close(rs);
			SQLUtil.close(pstm);
			SQLUtil.close(con);
		}
	}

	private L1PcInstance getPcInstance(String name) {
		L1PcInstance pc = L1World.getInstance().getPlayer(name);
		if (pc == null) {
			for (L1PcInstance player : L1World.getInstance().getAllPlayers()) {
				if (player.getName().toLowerCase().equals(name.toLowerCase())) {
					pc = player;
					break;
				}
			}
		}
		return pc;
	}

}
