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

import java.util.Map;
import java.util.Arrays;
import java.util.concurrent.ScheduledFuture;
import java.util.logging.Logger;

import l1j.server.server.ActionCodes;
import l1j.server.server.GeneralThreadPool;
import l1j.server.server.encryptions.IdFactory;
import l1j.server.server.datatables.SprTable;
import l1j.server.server.model.L1Character;
import l1j.server.server.model.L1World;
import l1j.server.server.model.Instance.L1PcInstance;
import l1j.server.server.serverpackets.S_DoActionGFX;
import l1j.server.server.serverpackets.S_DollPack;
import l1j.server.server.serverpackets.S_OwnCharStatus;
import l1j.server.server.serverpackets.S_SkillIconGFX;
import l1j.server.server.serverpackets.S_SkillSound;
import l1j.server.server.templates.L1Npc;
import l1j.server.server.templates.L1MagicDoll;
import l1j.server.server.utils.RandomArrayList;

public class L1DollInstance extends L1NpcInstance {
	private static Logger _log = Logger.getLogger(L1DollInstance.class.getName());
	private static final long serialVersionUID = 1L;
	public static final int DOLLTYPE_BUGBEAR = 0;
	public static final int DOLLTYPE_SUCCUBUS = 1;
    public static final int DOLLTYPE_WEREWOLF = 2; 
    public static final int DOLLTYPE_ELDER = 3; 
    public static final int DOLLTYPE_CRUSTANCEAN = 4; 
    public static final int DOLLTYPE_GOLEM = 5; 
    public static final int DOLLTYPE_SEADANCER = 6; 
    public static final int DOLLTYPE_RAMIA = 7; 
    public static final int DOLLTYPE_YETI = 8; 
    public static final int DOLLTYPE_COCKATRICE = 9; 
    public static final int DOLLTYPE_SPARTOI = 10; 
    public static final int DOLL_TIME = 1800000;
	private ScheduledFuture<?> _dollFuture;
	private int _dollType;
	private int _itemObjId;
	private int run;
	private int _itemId;
	private boolean _isDelete = false;

	public boolean noTarget(int depth) {
		if (_master.isDead()) {
			deleteDoll();
			return true;
		} else if (_master != null && _master.getMapId() == getMapId()) {
			if (getLocation().getTileLineDistance(_master.getLocation()) > 2) {
				int dir = moveDirection(_master.getX(), _master.getY());
				if (dir == -1) {
					if (!isAiRunning()) {
						startAI();
					}
					return true;
				} else {
					setDirectionMove(dir);
					setSleepTime(calcSleepTime(getPassispeed(), MOVE_SPEED));
				}
			}
		} else {
			deleteDoll();
			return true;
		}
		return false;
	}

	class DollTimer implements Runnable {
		@Override
		public void run() {
			if (_destroyed) { 
				return;
			}
			deleteDoll();
		}
	}

	public L1DollInstance(L1Npc template, L1PcInstance master, int dollType,
			int itemObjId) {
		super(template);
		setId(IdFactory.getInstance().nextId());
		setDollType(dollType);
		setItemObjId(itemObjId);
		_dollFuture = GeneralThreadPool.getInstance().schedule(
				new DollTimer(), DOLL_TIME);

		setMaster(master);
		setX(master.getX() + RandomArrayList.nextInt(5) - 2);
		setY(master.getY() + RandomArrayList.nextInt(5) - 2);
		setMap(master.getMapId());
		setHeading(5);
		setLightSize(template.getLightSize());
		L1World.getInstance().storeObject(this);
		L1World.getInstance().addVisibleObject(this);
		for (L1PcInstance pc : L1World.getInstance().getRecognizePlayer(this)) {
			onPerceive(pc);
		}
		master.addDoll(this);
		if (!isAiRunning()) {
			startAI();
		}
	/*	if (isAcByDoll()) {
			master.getAcByDoll(); //yeti
		}
		if (isRegistFreezeByDoll()) {
			master.getRegistFreezeByDoll(); //yeti
		}
		if (isDamageByDoll()) {
			master.getDamageByDoll(); //crustacean // werewolf
		}
		if (isDamageReductionByDoll()) {
			master.getDamageReductionByDoll(); // golem
		}
		if (isDamageEvasionByDoll()) {
			master.getDamageEvasionByDoll(); // spartoi
		}
		if (isBowHitAddByDoll()) {
			master.getBowDamageByDoll(); //cockatrice
		}
		if (isBowDamageByDoll()) { 
			master.getBowDamageByDoll(); //cockatrice 
		}
		if (isWeightReductionByDoll()) {
			master.getWeightReductionByDoll(); // bugbear
		}*/
		if (isHpRegeneration()) {
			master.startHpRegenerationByDoll(); // ramia // seadancer
		}
		if (isMpRegeneration()) {
			master.startMpRegenerationByDoll(); // elder // succubus
		}
	}

	public void deleteDoll() {
		broadcastPacket(new S_SkillSound(getId(), 5936));
		if (_master != null && _isDelete) {
			L1PcInstance pc = (L1PcInstance) _master;
			pc.sendPackets(new S_SkillIconGFX(56, 0));
			pc.sendPackets(new S_OwnCharStatus(pc));
		}
		if (L1MagicDoll.isAc(_master)) { 
			((L1PcInstance) _master).stopAcByDoll(); 
		}
		if (L1MagicDoll.isRegistFreeze(_master)) { 
			((L1PcInstance) _master).stopRegistFreezeByDoll(); 
		}
		if (L1MagicDoll.isDamage(_master)) { 
			((L1PcInstance) _master).stopDamageByDoll(); 
		}
		if (L1MagicDoll.isDamageReduction(_master)) { 
			((L1PcInstance) _master).stopDamageReductionByDoll(); 
		}
		if (L1MagicDoll.isDamageEvasion(_master)) { 
			((L1PcInstance) _master).stopDamageEvasionByDoll(); 
		}
		if (L1MagicDoll.isBowHit(_master)) { 
			((L1PcInstance) _master).stopBowHitAddByDoll(); 
		}
		if (L1MagicDoll.isBowDamage(_master)) { 
			((L1PcInstance) _master).stopBowDamageByDoll(); 
		}
		if (L1MagicDoll.isWeightReduction(_master)) { 
			((L1PcInstance) _master).stopWeightReductionByDoll(); 
		}	
		if (L1MagicDoll.isItemMake(_master)) { 
			((L1PcInstance) _master).stopItemMakeByDoll(); 
		}
		if (isMpRegeneration()) {
			((L1PcInstance) _master).stopMpRegenerationByDoll();
		}
		if (isHpRegeneration()) {
			((L1PcInstance) _master).stopHpRegenerationByDoll();
		}
		_master.getDollList().remove(getId());
		deleteMe();
	}


	@Override
	public void onPerceive(L1PcInstance perceivedFrom) {
		if (perceivedFrom.getMapId() > 10000
				&& perceivedFrom.getInnKeyId() != _master.getInnKeyId()) {
			return;
		}
		perceivedFrom.addKnownObject(this);
		perceivedFrom.sendPackets(new S_DollPack(this));
	}

	@Override
	public void onItemUse() {
		if (!isActived()) {
			useItem(USEITEM_HASTE, 100);
		}
	}

	@Override
	public void onGetItem(L1ItemInstance item, int count) {
		if (getNpcTemplate().get_digestitem() > 0) {
			setDigestItem(item);
		}
		if (Arrays.binarySearch(haestPotions, item.getItem().getItemId()) >= 0) {
			useItem(USEITEM_HASTE, 100);
		}
	}

	public int getDollType() {
		return _dollType;
	}

	public void setDollType(int i) {
		_dollType = i;
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

	public static int isAcByDoll(L1Character _master) {
		int s = 0;
		s += getTypeCountByDoll(_master.getDollList(), DOLLTYPE_YETI) * 3;
		return s;
	}
	
	public static int isRegistFreezeByDoll(L1Character _master) {
		int s = 0;
		s += getTypeCountByDoll(_master.getDollList(), DOLLTYPE_YETI) * 7;
		return s;
	}
	
	public static int isDamageByDoll(L1Character _master) {
		int s = 0;
		s += getTypeCountByDoll(_master.getDollList(), DOLLTYPE_WEREWOLF) * 15 
		+ getTypeCountByDoll(_master.getDollList(), DOLLTYPE_CRUSTANCEAN) * 15;
		return s;
	}
	
	public static int isDamageReductionByDoll(L1Character _master) {
		int s = 0;
		s += getTypeCountByDoll(_master.getDollList(), DOLLTYPE_GOLEM) * 15;
		return s;
	}
	
	public static int isDamageEvasionByDoll(L1Character _master) {
		int s = 0;
		s += getTypeCountByDoll(_master.getDollList(), DOLLTYPE_SPARTOI) * 1;
		return s;
	}
	
	public static int isBowHitAddByDoll(L1Character _master) {
		int s = 0;
		s += getTypeCountByDoll(_master.getDollList(), DOLLTYPE_COCKATRICE) * 1;
		return s;
	}
	
	public static int isBowDamageByDoll(L1Character _master) {
		int s = 0;
		s += getTypeCountByDoll(_master.getDollList(), DOLLTYPE_COCKATRICE) * 1;
		return s;
	}
	
	public static int isWeightReductionByDoll(L1Character _master) {
		int s = 0;
		s += getTypeCountByDoll(_master.getDollList(), DOLLTYPE_BUGBEAR) * 20;
		return s;
	}
	
	public int getDamageByDoll() {
		int damage = 0;
		int dollType = getDollType();
		if (dollType == DOLLTYPE_WEREWOLF || dollType == DOLLTYPE_CRUSTANCEAN) {
			int chance = RandomArrayList.nextInt(100) + 1;
			if (chance <= 3) {
				damage = 15;
				if (_master instanceof L1PcInstance) {
					L1PcInstance pc = (L1PcInstance) _master;
					pc.sendPackets(new S_SkillSound(_master.getId(), 6319));
				}
				_master.broadcastPacket(new S_SkillSound(_master.getId(), 6319));
			}
		}
		return damage;
	}

	public boolean isHpRegeneration() {
		boolean isHpRegeneration = false;
		int dollType = getDollType();
		if (dollType == DOLLTYPE_RAMIA  
				|| dollType == DOLLTYPE_SEADANCER) {
			isHpRegeneration = true;
		}
		return isHpRegeneration;
	}

	public static int getHpByDoll(L1Character _master) {
		int s = 0;
		s += getTypeCountByDoll(_master.getDollList(), DOLLTYPE_RAMIA) * 40
				+ getTypeCountByDoll(_master.getDollList(), DOLLTYPE_SEADANCER)
				* 40;
		return s;
	}
	
	public boolean isMpRegeneration() {
		boolean isMpRegeneration = false;
		int dollType = getDollType();
		if (dollType == DOLLTYPE_SUCCUBUS  
				|| dollType == DOLLTYPE_ELDER  
				|| dollType == DOLLTYPE_SEADANCER) {
			isMpRegeneration = true;
		}
		return isMpRegeneration;
	}

	public static int getMpByDoll(L1Character _master) {
		int s = 0;
		s += getTypeCountByDoll(_master.getDollList(), DOLLTYPE_SEADANCER) * 15
				+ getTypeCountByDoll(_master.getDollList(), DOLLTYPE_ELDER)
				* 15;
		return s;
	}

	private static int getTypeCountByDoll(Map<Integer, L1DollInstance> dolls,
			int type) {
		int s = 0;
		for (Object obj : dolls.values().toArray()) {
			if (((L1DollInstance) obj).getDollType() == type) {
				s++;
			}
		}
		return s;
	}

	public int getDamageEvasionByDoll() {
		int damageEvasion = 0;
		if (getDollType() == DOLLTYPE_SPARTOI) {
			int chance = RandomArrayList.nextInt(100) + 1;
			if (chance <= 4) {
				damageEvasion = 1;
				if (_master instanceof L1PcInstance) {
					L1PcInstance pc = (L1PcInstance) _master;
					pc.sendPackets(new S_SkillSound(_master.getId(), 6320));
				}
				_master.broadcastPacket(new S_SkillSound(_master.getId(), 6320));
			}
		}
		return damageEvasion;
	}

	public int getPoisonByDoll() {
		int damagePoison = 0;
		if (getDollType() == DOLLTYPE_RAMIA) {
			int chance = RandomArrayList.nextInt(100) + 1;
			if (chance <= 10) {
				damagePoison = 1;
			}
		}
		return damagePoison;
	}

	public static int getBowHitAddByDoll(L1Character _master) {
		int s = 0;
		s += getTypeCountByDoll(_master.getDollList(), DOLLTYPE_COCKATRICE * 1);
		return s;
	}

	public static int getBowDamageByDoll(L1Character _master) {
		int s = 0;
		s += getTypeCountByDoll(_master.getDollList(), DOLLTYPE_COCKATRICE * 1);
		return s;
	}

	public static int getAcByDoll(L1Character _master) {
		int s = 0;
		s -= ((getTypeCountByDoll(_master.getDollList(), DOLLTYPE_YETI)) * 3);
		return s;
	}

	public static int getRegistFreezeByDoll(L1PcInstance _master) {
		int s = 0;
		s += ((getTypeCountByDoll(_master.getDollList(), DOLLTYPE_YETI)) * 7);
		return s;
	}

	public int getWeightReductionByDoll() {
		int weightReduction = 0;
		int dollType = getDollType();
		if (dollType == DOLLTYPE_BUGBEAR) {
			weightReduction = 20;
		}
		return weightReduction;
	}

	public int getDamageReductionByDoll() {
		int damageReduction = 0;
		int dollType = getDollType();
		if (dollType == DOLLTYPE_GOLEM) {
			int chance = RandomArrayList.nextInt(100) + 1;
			if (chance <= 4) {
				damageReduction = 15;
			}
		}
		return damageReduction;
	}

    private void dollAction() {
	run = RandomArrayList.nextInt(100) + 1;
	if (run <= 10) {
		if (run <= 5) {
			broadcastPacket(new S_DoActionGFX(getId(),
					ActionCodes.ACTION_Think));
			setSleepTime(calcSleepTime(
					SprTable.getInstance().getSprSpeed(getTempCharGfx(),
							ActionCodes.ACTION_Think), MOVE_SPEED)); // 66
		} else {
			broadcastPacket(new S_DoActionGFX(getId(),
					ActionCodes.ACTION_Aggress));
			setSleepTime(calcSleepTime(
					SprTable.getInstance().getSprSpeed(getTempCharGfx(),
							ActionCodes.ACTION_Aggress), MOVE_SPEED)); // 67
		}
	}
}
}