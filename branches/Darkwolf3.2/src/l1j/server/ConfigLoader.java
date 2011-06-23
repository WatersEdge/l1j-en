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
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.Map;
import java.util.regex.Pattern;

import l1j.server.Annotations.Configure;
import l1j.server.CustomLoaders.CustomLoader;
import l1j.server.server.utils.ReflectionUtil;
import l1j.server.server.utils.collections.Maps;

class ConfigLoader {
	private Map<File, L1Properties> _propsMap = Maps.newHashMap();

	private L1Properties loadProps(File propsFile) throws IOException {
		L1Properties result = L1Properties.load(propsFile);
		_propsMap.put(propsFile, result);
		return result;
	}

	private L1Properties getProps(String path) throws IOException {
		File propsFile = new File(path);
		L1Properties result = _propsMap.get(propsFile);
		if (result == null) {
			result = loadProps(propsFile);
		}
		return result;
	}

	String makeDefaultKey(String fieldName) {
		if (!Pattern.matches("^[A-Z0-9]+(_[A-Z0-9]+)*$", fieldName)) {
			throw new IllegalArgumentException(fieldName);
		}
		StringBuilder result = new StringBuilder();
		for (String seq : fieldName.split("_")) {
			result.append(seq.charAt(0));
			result.append(seq.substring(1).toLowerCase());
		}
		return result.toString();
	}

	private void loadValue(Field f, Configure config) throws IOException,
			IllegalAccessException {
		L1Properties props = getProps(config.file());
		if (props.isNull() && !config.isOptional()) {
			throw new IOException(props.getException());
		}
		String key = config.key().isEmpty() ? makeDefaultKey(f.getName())
				: config.key();
		String value = props.getProperty(key, config.allowDefaultValue());
		if (value == null) {
			return;
		}
		CustomLoader loader = ReflectionUtil.newInstance(config.loader());

		f.set(null, loader.loadValue(config, f.getType(), value));
	}

	public void load(Class<?> configClass) {
		try {
			for (Field f : configClass.getFields()) {
				Configure config = f.getAnnotation(Configure.class);
				if (config == null) {
					continue;
				}
				loadValue(f, config);
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}