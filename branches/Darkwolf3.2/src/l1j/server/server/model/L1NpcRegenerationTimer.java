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
package l1j.server.server.model;

import java.util.Timer;
import l1j.server.server.model.Instance.L1NpcInstance;
/**
 * The NPC is scheduled TimerTask natural recovery for the class Timer
 * 
 */
public class L1NpcRegenerationTimer extends Timer {
	private static L1NpcInstance _npc;
	private static L1NpcRegenerationTimer _instance = null;
	
	public L1NpcRegenerationTimer(L1NpcInstance npc) {
		_npc = npc;
	}

	public void run() {
		try {
			if (_npc.isDead()) {
				return;
			}
			regenMp();
			regenHp();
		} catch (Throwable e) {
			// _log.log(Level.WARNING, e.getLocalizedMessage(), e);
		}
	}

	public void regenMp() {
		int newMp = _npc.getCurrentMp() + 15;
		if (newMp < 0) {
			newMp = 0;
		}
		_npc.setCurrentMp(newMp);
	}

	public void regenHp() {
		int newHp = _npc.getCurrentHp() + 25;
		if (newHp < 0) {
			newHp = 0;
		}
		_npc.setCurrentMp(newHp);
	}
	
	public static L1NpcRegenerationTimer getInstance() {
		if (_instance == null) {
			_instance = new L1NpcRegenerationTimer(_npc);
		}
		return _instance;
	}
}