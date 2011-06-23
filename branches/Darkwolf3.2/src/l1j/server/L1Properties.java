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
package l1j.server;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.logging.Logger;

class L1Properties {
	private static Logger _log = Logger.getLogger(L1Properties.class.getName());
	private final Properties _props = new Properties();

	private L1Properties() {
	}

	private L1Properties(File file) throws IOException {
		InputStream is = new FileInputStream(file);
		_props.load(is);
		is.close();
	}

	public static L1Properties load(File file) {
		_log.fine("Loading properties file: " + file.getName());
		try {
			return new L1Properties(file);
		} catch (IOException e) {
			return new NullProperties(e);
		}
	}

	private void notifyLoadingDefault(String key, boolean allowDefaultValue) {
		if (!allowDefaultValue) {
			throw new RuntimeException(key
					+ " does not exists. It has not default value.");
		}
		_log.info(key + " does not exists. Server use default value.");
	}

	public String getProperty(String key, boolean allowDefaultValue) {
		if (!_props.containsKey(key)) {
			notifyLoadingDefault(key, allowDefaultValue);
			return null;
		}
		return _props.getProperty(key);
	}

	public boolean isNull() {
		return false;
	}

	public IOException getException() {
		throw new UnsupportedOperationException();
	}

	private static class NullProperties extends L1Properties {
		private IOException _e;

		public NullProperties(IOException e) {
			_e = e;
		}

		@Override
		public String getProperty(String key, boolean allowDefaultValue) {
			return null;
		}

		@Override
		public boolean isNull() {
			return true;
		}

		@Override
		public IOException getException() {
			return _e;
		}
	}
}