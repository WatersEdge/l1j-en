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
package l1j.server.server.model.Instance;

import java.util.Arrays;
import java.util.concurrent.ScheduledFuture;
import java.util.LinkedList;

import l1j.server.server.GeneralThreadPool;
import static l1j.server.server.ActionCodes.*;
import l1j.server.server.model.L1World;
import l1j.server.server.model.L1Object;
import l1j.server.server.model.L1Character;
import l1j.server.server.serverpackets.S_DoActionGFX;
import l1j.server.server.serverpackets.S_DollPack;
import l1j.server.server.serverpackets.S_OwnCharStatus;
import l1j.server.server.serverpackets.S_SkillHaste;
import l1j.server.server.serverpackets.S_SkillIconGFX;
import l1j.server.server.serverpackets.S_SkillSound;
import l1j.server.server.templates.L1MagicDoll;
import l1j.server.server.templates.L1Npc;
import l1j.server.server.encryptions.IdFactory;
import l1j.server.server.RandomGenerator.RandomGenerator;
import l1j.server.server.RandomGenerator.RandomGeneratorFactory;

public class L1DollInstance extends L1NpcInstance {
	private static final long serialVersionUID = 1L;
	public static final int DOLL_TIME = 1800000;
	private static RandomGenerator _random = RandomGeneratorFactory.newRandom();
	private ScheduledFuture<?> _dollFuture;
	private int _itemId;
	private int _itemObjId;
	private boolean _isDelete = false;
	private static final int[] DollAction = { ACTION_Think, ACTION_Aggress, ACTION_Salute, ACTION_Cheer };
	private int sleeptime_PT = 10;
	
	public boolean noTarget() {
		if (_master.isDead()) {
			if (isChargeDoll()) {
				L1ItemInstance item = _master.getInventory().getItem(getItemObjId());
				item.stopChargeTimer();
			}
			deleteDoll();
			_isDelete = true;
			return true;
		} else if (_master != null && _master.getMapId() == getMapId()) {
			int dir = moveDirection(_master.getX(), _master.getY());
			if (getLocation().getTileLineDistance(_master.getLocation()) > 3) {
				setDirectionMove(dir);
				setSleepTime(calcSleepTime(getPassispeed(), MOVE_SPEED));
			} else {
				if (sleeptime_PT == 0) {
					broadcastPacket(new S_DoActionGFX(getId(), DollAction[_random.nextInt(2)]));
					sleeptime_PT = _random.nextInt(20) + 10;
				} else {
					--sleeptime_PT;
					setSleepTime(500);
				}
			}
		} else {
			if (isChargeDoll()) {
				L1ItemInstance item = _master.getInventory().getItem(getItemObjId());
				item.stopChargeTimer();
			}
			deleteDoll();
			_isDelete = true;
			return true;
		}
		return false;
	}

	@Override
	public int moveDirection(int x, int y, double d) {
		int dir = 0;
		if (d > courceRange) {
			dir = targetDirection(x, y);
			dir = checkObject(getX(), getY(), getMapId(), dir);
		} else {
			dir = _serchCource(x, y);
			if (dir == -1) {
				dir = targetDirection(x, y);
				if (!isExsistCharacterBetweenTarget(dir)) {
					dir = checkObject(getX(), getY(), getMapId(), dir);
				}
			}
		}
		return dir;
	}

	private int _serchCource(int x, int y) {
		int i;
		int locCenter = courceRange + 1;
		int diff_x = x - locCenter; 
		int diff_y = y - locCenter; 
		int[] locBace = { getX() - diff_x, getY() - diff_y, 0, 0 };
		int[] locNext = new int[4];
		int[] locCopy;
		int[] dirFront = new int[5];
		boolean serchMap[][] = new boolean[locCenter * 2 + 1][locCenter * 2 + 1];
		LinkedList<int[]> queueSerch = new LinkedList<int[]>();

		for (int j = courceRange * 2 + 1; j > 0; j--) {
			for (i = courceRange - Math.abs(locCenter - j); i >= 0; i--) {
				serchMap[j][locCenter + i] = true;
				serchMap[j][locCenter - i] = true;
			}
		}

		int[] firstCource = { 2, 4, 6, 0, 1, 3, 5, 7 };
		for (i = 0; i < 8; i++) {
			System.arraycopy(locBace, 0, locNext, 0, 4);
			_moveLocation(locNext, firstCource[i]);
			if (locNext[0] - locCenter == 0 && locNext[1] - locCenter == 0) {
				return firstCource[i];
			}
			if (serchMap[locNext[0]][locNext[1]]) {
				int tmpX = locNext[0] + diff_x;
				int tmpY = locNext[1] + diff_y;
				boolean found = false;
				if (i == 0) {
					found = getMap().isPassable(tmpX, tmpY + 1, i);
				} else if (i == 1) {
					found = getMap().isPassable(tmpX - 1, tmpY + 1, i);
				} else if (i == 2) {
					found = getMap().isPassable(tmpX - 1, tmpY, i);
				} else if (i == 3) {
					found = getMap().isPassable(tmpX - 1, tmpY - 1, i);
				} else if (i == 4) {
					found = getMap().isPassable(tmpX, tmpY - 1, i);
				} else if (i == 5) {
					found = getMap().isPassable(tmpX + 1, tmpY - 1, i);
				} else if (i == 6) {
					found = getMap().isPassable(tmpX + 1, tmpY, i);
				} else if (i == 7) {
					found = getMap().isPassable(tmpX + 1, tmpY + 1, i);
				}
				if (found)
				{
					locCopy = new int[4];
					System.arraycopy(locNext, 0, locCopy, 0, 4);
					locCopy[2] = firstCource[i];
					locCopy[3] = firstCource[i];
					queueSerch.add(locCopy);
				}
				serchMap[locNext[0]][locNext[1]] = false;
			}
		}
		locBace = null;

		while (queueSerch.size() > 0) {
			locBace = queueSerch.removeFirst();
			_getFront(dirFront, locBace[2]);
			for (i = 4; i >= 0; i--) {
				System.arraycopy(locBace, 0, locNext, 0, 4);
				_moveLocation(locNext, dirFront[i]);
				if (locNext[0] - locCenter == 0 && locNext[1] - locCenter == 0) {
					return locNext[3];
				}
				if (serchMap[locNext[0]][locNext[1]]) {
					int tmpX = locNext[0] + diff_x;
					int tmpY = locNext[1] + diff_y;
					boolean found = false;
					if (i == 0) {
						found = getMap().isPassable(tmpX, tmpY + 1, i);
					} else if (i == 1) {
						found = getMap().isPassable(tmpX - 1, tmpY + 1, i);
					} else if (i == 2) {
						found = getMap().isPassable(tmpX - 1, tmpY, i);
					} else if (i == 3) {
						found = getMap().isPassable(tmpX - 1, tmpY - 1, i);
					} else if (i == 4) {
						found = getMap().isPassable(tmpX, tmpY - 1, i);
					}
					if (found)
					{
						locCopy = new int[4];
						System.arraycopy(locNext, 0, locCopy, 0, 4);
						locCopy[2] = dirFront[i];
						queueSerch.add(locCopy);
					}
					serchMap[locNext[0]][locNext[1]] = false;
				}
			}
			locBace = null;
		}
		return -1;
	}
	
	private void _getFront(int[] ary, int d) {
		if (d == 1) {
			ary[4] = 2;
			ary[3] = 0;
			ary[2] = 1;
			ary[1] = 3;
			ary[0] = 7;
		} else if (d == 2) {
			ary[4] = 2;
			ary[3] = 4;
			ary[2] = 0;
			ary[1] = 1;
			ary[0] = 3;
		} else if (d == 3) {
			ary[4] = 2;
			ary[3] = 4;
			ary[2] = 1;
			ary[1] = 3;
			ary[0] = 5;
		} else if (d == 4) {
			ary[4] = 2;
			ary[3] = 4;
			ary[2] = 6;
			ary[1] = 3;
			ary[0] = 5;
		} else if (d == 5) {
			ary[4] = 4;
			ary[3] = 6;
			ary[2] = 3;
			ary[1] = 5;
			ary[0] = 7;
		} else if (d == 6) {
			ary[4] = 4;
			ary[3] = 6;
			ary[2] = 0;
			ary[1] = 5;
			ary[0] = 7;
		} else if (d == 7) {
			ary[4] = 6;
			ary[3] = 0;
			ary[2] = 1;
			ary[1] = 5;
			ary[0] = 7;
		} else if (d == 0) {
			ary[4] = 2;
			ary[3] = 6;
			ary[2] = 0;
			ary[1] = 1;
			ary[0] = 7;
		}
	}
	
	private boolean isExsistCharacterBetweenTarget(int dir) {
		
		if (_target == null) {
			return false;
		}

		int locX = getX();
		int locY = getY();
		int targetX = locX;
		int targetY = locY;

		if (dir == 1) {
			targetX = locX + 1;
			targetY = locY - 1;
			dir = checkObject(getX(), getY(), getMapId(), dir);
		} else if (dir == 2) {
			targetX = locX + 1;
			dir = checkObject(getX(), getY(), getMapId(), dir);
		} else if (dir == 3) {
			targetX = locX + 1;
			targetY = locY + 1;
			dir = checkObject(getX(), getY(), getMapId(), dir);
		} else if (dir == 4) {
			targetY = locY + 1;
			dir = checkObject(getX(), getY(), getMapId(), dir);
		} else if (dir == 5) {
			targetX = locX - 1;
			targetY = locY + 1;
			dir = checkObject(getX(), getY(), getMapId(), dir);
		} else if (dir == 6) {
			targetX = locX - 1;
			dir = checkObject(getX(), getY(), getMapId(), dir);
		} else if (dir == 7) {
			targetX = locX - 1;
			targetY = locY - 1;
			dir = checkObject(getX(), getY(), getMapId(), dir);
		} else if (dir == 0) {
			targetY = locY - 1;
			dir = checkObject(getX(), getY(), getMapId(), dir);
		}

		for (L1Object object : L1World.getInstance().getVisibleObjects(this, 1)) {
			// PC, Summon, Pet
			if (object instanceof L1PcInstance
					|| object instanceof L1SummonInstance
					|| object instanceof L1PetInstance) {
				L1Character cha = (L1Character) object;
				if (cha.getX() == targetX && cha.getY() == targetY
						&& cha.getMapId() == getMapId()) {
					if (object instanceof L1PcInstance) {
						L1PcInstance pc = (L1PcInstance) object;
						if (pc.isGhost()) {
							continue;
						}
					}
					_hateList.add(cha, 0);
					_target = cha;
					return true;
				}
			}
		}
		return false;
	}
	
	private void _moveLocation(int[] ary, int d) {
		if (d == 1) {
			ary[0] = ary[0] + 1;
			ary[1] = ary[1] - 1;
		} else if (d == 2) {
			ary[0] = ary[0] + 1;
		} else if (d == 3) {
			ary[0] = ary[0] + 1;
			ary[1] = ary[1] + 1;
		} else if (d == 4) {
			ary[1] = ary[1] + 1;
		} else if (d == 5) {
			ary[0] = ary[0] - 1;
			ary[1] = ary[1] + 1;
		} else if (d == 6) {
			ary[0] = ary[0] - 1;
		} else if (d == 7) {
			ary[0] = ary[0] - 1;
			ary[1] = ary[1] - 1;
		} else if (d == 0) {
			ary[1] = ary[1] - 1;
		}
		ary[2] = d;
	}
	
	class DollTimer implements Runnable {
		@Override
		public void run() {
			if (_destroyed) {
				return;
			}
			if (isChargeDoll()) {
				L1ItemInstance item = _master.getInventory().getItem(getItemObjId());
				item.stopChargeTimer();
			}
			deleteDoll();
		}
	}

	public L1DollInstance(L1Npc template, L1PcInstance master, int itemId, int itemObjId) {
		super(template);
		setId(IdFactory.getInstance().nextId());
		setItemId(itemId);
		setItemObjId(itemObjId);
		_dollFuture = GeneralThreadPool.getInstance().schedule(new DollTimer(), DOLL_TIME);

		setMaster(master);
		setX((_random.nextInt(5) + master.getX() - 2));
		setY((_random.nextInt(5) + master.getY() - 2));
		setMap(master.getMapId());
		setHeading(_random.nextInt(8));
		L1World.getInstance().storeObject(this);
		L1World.getInstance().addVisibleObject(this);
		for (L1PcInstance pc : L1World.getInstance().getRecognizePlayer(this)) {
			onPerceive(pc);
		}
		master.addDoll(this);
		if (!isAiRunning()) {
			startAI();
		}
		if (L1MagicDoll.isHpRegeneration(_master)) {
			master.startHpRegenerationByDoll();
		}
		if (L1MagicDoll.isMpRegeneration(_master)) {
			master.startMpRegenerationByDoll();
		}
		if (L1MagicDoll.isItemMake(_master)) {
			master.startItemMakeByDoll();
		}
	}

	public void deleteDoll() {
		L1PcInstance pc = (L1PcInstance) _master;
		L1ItemInstance item = _master.getInventory().findItemId(_itemId);
		broadcastPacket(new S_SkillSound(getId(), 5936));
		if (_master != null && _isDelete) {
			pc.sendPackets(new S_SkillIconGFX(56, 0));
			pc.sendPackets(new S_OwnCharStatus(pc));
		}
		if (L1MagicDoll.isHpRegeneration(pc)) {
			pc.stopHpRegenerationByDoll();
		}
		if (L1MagicDoll.isMpRegeneration(pc)) {
			pc.stopMpRegenerationByDoll();
		}
		if (L1MagicDoll.isItemMake(pc)) {
			pc.stopItemMakeByDoll();
		}
		if (L1MagicDoll.isHaste(pc)) {
			pc.addHasteItemEquipped(-1);
			if (pc.getHasteItemEquipped() == 0) {
				pc.setMoveSpeed(0);
				pc.sendPackets(new S_SkillHaste(pc.getId(), 0, 0));
				pc.broadcastPacket(new S_SkillHaste(pc.getId(), 0, 0));
			}
		}
		_master.getDollList().remove(getId());
		deleteMe();
	}

	@Override
	public void onPerceive(L1PcInstance perceivedFrom) {
		if (perceivedFrom.getMapId() > 10000 && perceivedFrom.getInnKeyId() != _master.getInnKeyId()) {
			return;
		}
		perceivedFrom.addKnownObject(this);
		perceivedFrom.sendPackets(new S_DollPack(this, perceivedFrom));
	}

	@Override
	public void onItemUse() {
		if (!isActived()) {
			useItem(USEITEM_HASTE, 100);
		}
	}

	@Override
	public void onGetItem(L1ItemInstance item, int count) {
		if (getNpcTemplate().getDigestItem() > 0) {
			setDigestItem(item);
		}
		if (Arrays.binarySearch(haestPotions, item.getItem().getItemId()) >= 0) {
			useItem(USEITEM_HASTE, 100);
		}
	}

	public int getItemObjId() {
		return _itemObjId;
	}

	public void setItemObjId(int i) {
		_itemObjId = i;
	}

	public int getItemId() {
		return _itemId;
	}

	public void setItemId(int i) {
		_itemId = i;
	}

	public boolean isChargeDoll() {
		L1ItemInstance item = _master.getInventory().findItemId(_itemId);
		return item.isChargeDoll();
	}
}