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

import java.util.Calendar;

import l1j.server.Annotations.Configure;

class CustomLoaders {
	interface CustomLoader {
		Object loadValue(Configure config, Class<?> type, String value);
	}

	static class DefaultLoader implements CustomLoader {
		@Override
		public Object loadValue(Configure config, Class<?> type, String value) {
			Object result = null;
			
			if (type.equals(int.class)) {
				result = Integer.parseInt(value);
			} else if (type.equals(String.class)) {
				result = value;
			} else if (type.equals(boolean.class)) {
				result = Boolean.parseBoolean(value);
			} else if (type.equals(double.class)) {
				result = Double.parseDouble(value);
			}
			return result;
		}
	}

	static class WarTimeLoader implements CustomLoader {
		@Override
		public Object loadValue(Configure config, Class<?> type, String value) {
			String time = value.replaceFirst("^(\\d+)d|h|m$", "$1");
			return Integer.parseInt(time);
		}
	}

	static class WarTimeUnitLoader implements CustomLoader {
		@Override
		public Object loadValue(Configure config, Class<?> type, String value) {
			String unit = value.replaceFirst("^\\d+(d|h|m)$", "$1");
			if (unit.equals("d")) {
				return Calendar.DATE;
			}
			if (unit.equals("h")) {
				return Calendar.HOUR_OF_DAY;
			}
			if (unit.equals("m")) {
				return Calendar.MINUTE;
			}
			throw new IllegalArgumentException();
		}
	}
}