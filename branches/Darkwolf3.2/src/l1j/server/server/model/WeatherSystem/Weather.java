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
package l1j.server.server.model.WeatherSystem;

import java.util.Random;
import java.util.logging.Logger;

import l1j.server.server.model.L1World;
import l1j.server.server.serverpackets.S_Weather;


public class Weather implements Runnable {
	private static Random _random = new Random(System.nanoTime());
	private static Logger _log = Logger.getLogger(Weather.class
		.getName());
	private static int[] WeatherId =
	{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19 };
	private static Weather _instance;

	public static Weather getInstance() {
		if (_instance == null) {
			_instance = new Weather();
		}
		return _instance;
	}
	
	public void run() {
		try {
			while (true) {
				Weather();
				Thread.sleep(6400000);
			}
		} catch (Exception e1) {
			_log.warning(e1.getMessage());
		}
	}

	private void Weather() {
		int ran = _random.nextInt(19);
		L1World.getInstance().setWeather(WeatherId[ran]);
		L1World.getInstance().broadcastPacketToAll(new S_Weather(WeatherId[ran]));
		System.out.println("[****** Server Weather System Updated ******]");
	}
}