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
package l1j.server.server;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;
import l1j.server.Base64;
import l1j.server.L1DatabaseFactory;
import l1j.server.server.utils.SQLUtil;

/**
 * ���O�C���ׂ̗̈l�X�ȃC���^�[�t�F�[�X��񋟂���.
 */
public class Account {
	/** �A�J�E���g��. */
	private String _name;

	/** �ڑ����IP�A�h���X. */
	private String _ip;

	/** �p�X���[�h(�Í�������Ă���). */
	private String _password;

	/** �ŏI�A�N�e�B�u��. */
	private Timestamp _lastActive;

	/** �A�N�Z�X���x��(GM���H). */
	private int _accessLevel;

	/** �ڑ���̃z�X�g��. */
	private String _host;

	/** �A�N�Z�X�֎~�̗L��(True�ŋ֎~). */
	private boolean _banned;

	/** �L�����N�^�[�̒ǉ��X���b�g�� */
	private int _characterSlot;

	/** �A�J�E���g���L�����ۂ�(True�ŗL��). */
	private boolean _isValid = false;

	/** ���b�Z�[�W���O�p. */
	private static Logger _log = Logger.getLogger(Account.class.getName());

	/**
	 * �R���X�g���N�^.
	 */
	private Account() {
	}

	/**
	 * �p�X���[�h���Í�������.
	 * 
	 * @param rawPassword
	 *            �����̃p�X���[�h
	 * @return String
	 * @throws NoSuchAlgorithmException
	 *             �Í��A���S���Y�����g�p�ł��Ȃ����̎�
	 * @throws UnsupportedEncodingException
	 *             �����̃G���R�[�h���T�|�[�g����Ă��Ȃ���
	 */
	private static String encodePassword(final String rawPassword)
			throws NoSuchAlgorithmException, UnsupportedEncodingException {
		byte[] buf = rawPassword.getBytes("UTF-8");
		buf = MessageDigest.getInstance("SHA").digest(buf);

		return Base64.encodeBytes(buf);
	}

	/**
	 * �A�J�E���g��V�K�쐬����.
	 * 
	 * @param name
	 *            �A�J�E���g��
	 * @param rawPassword
	 *            �����p�X���[�h
	 * @param ip
	 *            �ڑ����IP�A�h���X
	 * @param host
	 *            �ڑ���̃z�X�g��
	 * @return Account
	 */
	public static Account create(final String name, final String rawPassword,
			final String ip, final String host) {
		Connection con = null;
		PreparedStatement pstm = null;
		try {

			Account account = new Account();
			account._name = name;
			account._password = encodePassword(rawPassword);
			account._ip = ip;
			account._host = host;
			account._banned = false;
			account._lastActive = new Timestamp(System.currentTimeMillis());

			con = L1DatabaseFactory.getInstance().getConnection();
			String sqlstr = "INSERT INTO accounts SET login=?,password=?,lastactive=?,access_level=?,ip=?,host=?,banned=?,character_slot=?";
			pstm = con.prepareStatement(sqlstr);
			pstm.setString(1, account._name);
			pstm.setString(2, account._password);
			pstm.setTimestamp(3, account._lastActive);
			pstm.setInt(4, 0);
			pstm.setString(5, account._ip);
			pstm.setString(6, account._host);
			pstm.setInt(7, account._banned ? 1 : 0);
			pstm.setInt(8, 0);
			pstm.execute();
			_log.info("created new account for " + name);

			return account;
		} catch (SQLException e) {
			_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
		} catch (NoSuchAlgorithmException e) {
			_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
		} catch (UnsupportedEncodingException e) {
			_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
		} finally {
			SQLUtil.close(pstm);
			SQLUtil.close(con);
		}
		return null;
	}

	/**
	 * �A�J�E���g����DB���璊�o����.
	 * 
	 * @param name
	 *            �A�J�E���g��
	 * @return Account
	 */
	public static Account load(final String name) {
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		Account account = null;
		try {
			con = L1DatabaseFactory.getInstance().getConnection();
			String sqlstr = "SELECT * FROM accounts WHERE login=? LIMIT 1";
			pstm = con.prepareStatement(sqlstr);
			pstm.setString(1, name);
			rs = pstm.executeQuery();
			if (!rs.next()) {
				return null;
			}
			account = new Account();
			account._name = rs.getString("login");
			account._password = rs.getString("password");
			account._lastActive = rs.getTimestamp("lastactive");
			account._accessLevel = rs.getInt("access_level");
			account._ip = rs.getString("ip");
			account._host = rs.getString("host");
			account._banned = rs.getInt("banned") == 0 ? false : true;
			account._characterSlot = rs.getInt("character_slot");

			_log.fine("account exists");
		} catch (SQLException e) {
			_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
		} finally {
			SQLUtil.close(rs);
			SQLUtil.close(pstm);
			SQLUtil.close(con);
		}

		return account;
	}

	/**
	 * �ŏI���O�C������DB�ɔ��f����.
	 * 
	 * @param account
	 *            �A�J�E���g
	 */
	public static void updateLastActive(final Account account) {
		Connection con = null;
		PreparedStatement pstm = null;
		Timestamp ts = new Timestamp(System.currentTimeMillis());

		try {
			con = L1DatabaseFactory.getInstance().getConnection();
			String sqlstr = "UPDATE accounts SET lastactive=? WHERE login = ?";
			pstm = con.prepareStatement(sqlstr);
			pstm.setTimestamp(1, ts);
			pstm.setString(2, account.getName());
			pstm.execute();
			account._lastActive = ts;
			_log.fine("update lastactive for " + account.getName());
		} catch (Exception e) {
			_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
		} finally {
			SQLUtil.close(pstm);
			SQLUtil.close(con);
		}
	}

	/**
	 * �X���b�g����DB�ɔ��f����.
	 * 
	 * @param account
	 *            �A�J�E���g
	 */
	public static void updateCharacterSlot(final Account account) {
		Connection con = null;
		PreparedStatement pstm = null;

		try {
			con = L1DatabaseFactory.getInstance().getConnection();
			String sqlstr = "UPDATE accounts SET character_slot=? WHERE login=?";
			pstm = con.prepareStatement(sqlstr);
			pstm.setInt(1, account.getCharacterSlot());
			pstm.setString(2, account.getName());
			pstm.execute();
			account._characterSlot = account.getCharacterSlot();
			_log.fine("update characterslot for " + account.getName());
		} catch (Exception e) {
			_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
		} finally {
			SQLUtil.close(pstm);
			SQLUtil.close(con);
		}
	}

	/**
	 * �L�����N�^�[���L�����J�E���g����.
	 * 
	 * @return int
	 */
	public int countCharacters() {
		int result = 0;
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			con = L1DatabaseFactory.getInstance().getConnection();
			String sqlstr = "SELECT count(*) as cnt FROM characters WHERE account_name=?";
			pstm = con.prepareStatement(sqlstr);
			pstm.setString(1, _name);
			rs = pstm.executeQuery();
			if (rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
		} finally {
			SQLUtil.close(rs);
			SQLUtil.close(pstm);
			SQLUtil.close(con);
		}
		return result;
	}

	/**
	 * �A�J�E���g�𖳌��ɂ���.
	 * 
	 * @param login
	 *            �A�J�E���g��
	 */
	public static void ban(final String login) {
		Connection con = null;
		PreparedStatement pstm = null;
		try {
			con = L1DatabaseFactory.getInstance().getConnection();
			String sqlstr = "UPDATE accounts SET banned=1 WHERE login=?";
			pstm = con.prepareStatement(sqlstr);
			pstm.setString(1, login);
			pstm.execute();
		} catch (SQLException e) {
			_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
		} finally {
			SQLUtil.close(pstm);
			SQLUtil.close(con);
		}
	}

	/**
	 * ���͂��ꂽ�p�X���[�h��DB��̃p�X���[�h���ƍ�����.
	 * 
	 * @param rawPassword
	 *            �����p�X���[�h
	 * @return boolean
	 */
	public boolean validatePassword(final String rawPassword) {
		// �F�ؐ�����ɍēx�F�؂��ꂽ�ꍇ�͎��s������B
		if (_isValid) {
			return false;
		}
		try {
			_isValid = _password.equals(encodePassword(rawPassword));
			if (_isValid) {
				_password = null; // �F�؂����������ꍇ�A�p�X���[�h��j������B
			}
			return _isValid;
		} catch (Exception e) {
			_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
		}
		return false;
	}

	/**
	 * �A�J�E���g���L�����ǂ�����Ԃ�(True�ŗL��).
	 * 
	 * @return boolean
	 */
	public boolean isValid() {
		return _isValid;
	}

	/**
	 * �A�J�E���g���Q�[���}�X�^���ǂ����Ԃ�(True�ŃQ�[���}�X�^).
	 * 
	 * @return boolean
	 */
	public boolean isGameMaster() {
		return 0 < _accessLevel;
	}

	/**
	 * �A�J�E���g�����擾����.
	 * 
	 * @return String
	 */
	public String getName() {
		return _name;
	}

	/**
	 * �ڑ����IP�A�h���X���擾����.
	 * 
	 * @return String
	 */
	public String getIp() {
		return _ip;
	}

	/**
	 * �ŏI���O�C�������擾����.
	 */
	public Timestamp getLastActive() {
		return _lastActive;
	}

	/**
	 * �A�N�Z�X���x�����擾����.
	 * 
	 * @return int
	 */
	public int getAccessLevel() {
		return _accessLevel;
	}

	/**
	 * �z�X�g�����擾����.
	 * 
	 * @return String
	 */
	public String getHost() {
		return _host;
	}

	/**
	 * �A�N�Z�X�֎~�����擾����.
	 * 
	 * @return boolean
	 */
	public boolean isBanned() {
		return _banned;
	}

	/**
	 * �L�����N�^�[�̒ǉ��X���b�g�����擾����.
	 * 
	 * @return int
	 */
	public int getCharacterSlot() {
		return _characterSlot;
	}

	public void setCharacterSlot(int i) {
		_characterSlot = i;
	}
}
