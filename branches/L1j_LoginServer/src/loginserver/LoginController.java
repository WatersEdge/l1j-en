/**
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
package loginserver;

import java.security.GeneralSecurityException;
import java.security.KeyPairGenerator;
import java.security.interfaces.RSAPrivateKey;
import java.security.spec.RSAKeyGenParameterSpec;

import java.util.Random;
import org.apache.log4j.Logger;

import javax.crypto.Cipher;

import l1j-emu.loginserver.network.crypt.ScrambledKeyPair;

/**
 * @author -Darkwolf-
 */
public class LoginController
{
	protected static final Logger	log				= Logger.getLogger(LoginController.class);

	private static LoginController	instance;

	protected ScrambledKeyPair[]	_keyPairs;

	private Random					_rnd			= new Random();

	protected byte[][]				_blowfishKeys;
	private static final int		BLOWFISH_KEYS	= 20;

	public static void load() throws GeneralSecurityException
	{
		if (instance == null)
		{
			instance = new LoginController();
		}
		else
		{
			throw new IllegalStateException("LoginController can only be loaded a one time.");
		}
	}

	public static LoginController getInstance()
	{
		return instance;
	}

	private LoginController() throws GeneralSecurityException
	{
		log.info("Loading LoginContoller...");

		_keyPairs = new ScrambledKeyPair[10];

		KeyPairGenerator keygen = null;

		keygen = KeyPairGenerator.getInstance("RSA");
		RSAKeyGenParameterSpec spec = new RSAKeyGenParameterSpec(1024, RSAKeyGenParameterSpec.F4);
		keygen.initialize(spec);

		// generate the initial set of keys
		for (int i = 0; i < 10; i++)
		{
			_keyPairs[i] = new ScrambledKeyPair(keygen.generateKeyPair());
		}
		log.info("Cached 10 KeyPairs for RSA communication");

		this.testCipher((RSAPrivateKey) _keyPairs[0]._pair.getPrivate());

		// Store keys for blowfish communication
		this.generateBlowFishKeys();
	}

	/**
	 * This is mostly to force the initialization of the Crypto Implementation, avoiding it being done on runtime when
	 * its first needed.<BR>
	 * In short it avoids the worst-case execution time on runtime by doing it on loading.
	 * 
	 * @param key
	 *            Any private RSA Key just for testing purposes.
	 * @throws GeneralSecurityException
	 *             if a underlying exception was thrown by the Cipher
	 */
	private void testCipher(RSAPrivateKey key) throws GeneralSecurityException
	{
		// avoid worst-case execution, KenM
		Cipher rsaCipher = Cipher.getInstance("RSA/ECB/nopadding");
		rsaCipher.init(Cipher.DECRYPT_MODE, key);
	}

	private void generateBlowFishKeys()
	{
		_blowfishKeys = new byte[BLOWFISH_KEYS][16];

		for (int i = 0; i < BLOWFISH_KEYS; i++)
		{
			for (int j = 0; j < _blowfishKeys[i].length; j++)
			{
				_blowfishKeys[i][j] = (byte) (_rnd.nextInt(255) + 1);
			}
		}
		log.info("Stored " + _blowfishKeys.length + " keys for Blowfish communication");
	}

	/**
	 * @return Returns a random key
	 */
	public byte[] getBlowfishKey()
	{
		return _blowfishKeys[(int) (Math.random() * BLOWFISH_KEYS)];
	}

	/**
	 * <p>
	 * This method returns one of the cached {@link ScrambledKeyPair ScrambledKeyPairs} for communication with Login
	 * Clients.
	 * </p>
	 * 
	 * @return a scrambled keypair
	 */
	public ScrambledKeyPair getScrambledRSAKeyPair()
	{
		return _keyPairs[_rnd.nextInt(10)];
	}
}
