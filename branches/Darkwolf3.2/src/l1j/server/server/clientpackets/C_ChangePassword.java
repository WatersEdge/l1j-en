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
package l1j.server.server.clientpackets;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import l1j.server.L1DatabaseFactory;
import l1j.server.server.Account;
import l1j.server.server.ClientThread;
import l1j.server.server.encryptions.Base64;
import l1j.server.server.serverpackets.S_LoginResult;
import l1j.server.server.utils.SQLUtil;

// Referenced classes of package net.l1j.server.clientpackets:
// ClientBasePacket
public class C_ChangePassword extends ClientBasePacket {
	private static final String C_Change_Password = "[C] C_Change_Password";
	private static Logger _log = Logger.getLogger(C_ChangePassword.class.getName());

    @Override
    public void execute(byte[] decrypt, ClientThread client) {
            read(decrypt);

		String accountName = readS().toLowerCase();
		String oldpassword = readS();
		String newpassword = readS();
		
		Account account = Account.load(accountName);
		if (account == null || !account.validatePassword(oldpassword)) {
			client.sendPacket(new S_LoginResult(S_LoginResult.REASON_USER_OR_PASS_WRONG));
			return;
		}
		
		String newPassword = "";
		
		 try {
			    newPassword = encodePassword(newpassword);
			   } catch (NoSuchAlgorithmException e) {
			    e.printStackTrace();
			   } catch (UnsupportedEncodingException e) {
			    e.printStackTrace();
			}
		ChancePassword(accountName, newPassword);
		client.sendPacket(new S_LoginResult(S_LoginResult.REASON_SERVER));
	}
	
	private static void ChancePassword(final String login, final String newPassword) {
		  Connection con = null;
		  PreparedStatement pstm = null;
		  try {
		   con = L1DatabaseFactory.getInstance().getConnection();
		   String sqlstr = "UPDATE accounts SET password=? WHERE login=?";
		   pstm = con.prepareStatement(sqlstr);
		   pstm.setString(1, newPassword);
		   pstm.setString(2, login);
		   pstm.execute();
		  } catch (SQLException e) {
		   _log.log(Level.SEVERE, e.getLocalizedMessage(), e);
		  } finally {
		   SQLUtil.close(pstm);
		   SQLUtil.close(con);
		  }
	}
	
	private static String encodePassword(final String rawPassword)
	throws NoSuchAlgorithmException, UnsupportedEncodingException {
	  byte[] buf = rawPassword.getBytes("UTF-8");
	  buf = MessageDigest.getInstance("SHA").digest(buf);
	  return Base64.encodeBytes(buf);
	}
	
	@Override
	public String getType() {
		return C_Change_Password;
	}
}