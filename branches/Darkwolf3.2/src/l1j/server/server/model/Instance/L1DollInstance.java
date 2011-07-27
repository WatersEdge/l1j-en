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
	public static final int DOLL_TIME = 1800000;
	private int _itemId;
	private int _itemObjId;
	private int run;
	private boolean _isDelete = false;
	
	public boolean noTarget() {
			if ((_master != null) && !_master.isDead()
					&& (_master.getMapId() == getMapId())) {
				if (getLocation().getTileLineDistance(_master.getLocation()) > 2) {
					int dir = moveDirection(_master.getX(), _master.getY());
					setDirectionMove(dir);
					setSleepTime(calcSleepTime(getPassispeed(), MOVE_SPEED));
				} else {
					dollAction();
				}
			} else {
				_isDelete = true;
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

	public L1DollInstance(L1Npc template, L1PcInstance master, int itemId,
			int itemObjId) {
		super(template);
		setId(IdFactory.getInstance().nextId());

		setItemId(itemId);
		setItemObjId(itemObjId);
		GeneralThreadPool.getInstance().schedule(new DollTimer(), DOLL_TIME);

		setMaster(master);
		setX(master.getX() + RandomArrayList.nextInt(5) - 2);
		setY(master.getY() + RandomArrayList.nextInt(5) - 2);
		setMap(master.getMapId());
		setHeading(5);
		setLightSize(template.getLightSize());
		setMoveSpeed(1);
		setBraveSpeed(1);

		L1World.getInstance().storeObject(this);
		L1World.getInstance().addVisibleObject(this);
		for (L1PcInstance pc : L1World.getInstance().getRecognizePlayer(this)) {
			onPerceive(pc);
		}
		master.addDoll(this);

		if (!isAiRunning()) {
			startAI();
		}
		if (L1MagicDoll.isAc(_master)) {
			master.startAcByDoll(); //yeti
		}
		/*if (L1MagicDoll.isRegistFreezeByDoll(_master)) {
			master.getRegistFreezeByDoll(); //yeti
		}
		if (L1MagicDoll.isDamageByDoll(_master)) {
			master.getDamageByDoll(); //crustacean // werewolf
		}
		if (L1MagicDoll.isDamageReductionByDoll(_master)) {
			master.getDamageReductionByDoll(); // golem
		}
		if (L1MagicDoll.isDamageEvasionByDoll(_master)) {
			master.getDamageEvasionByDoll(); // spartoi
		}
		if (L1MagicDoll.isBowHitAddByDoll(_master)) {
			master.getBowDamageByDoll(); //cockatrice
		}
		if (L1MagicDoll.isBowDamageByDoll(_master)) {
			master.getBowDamageByDoll(); //cockatrice 
		}
		if (L1MagicDoll.isWeightReductionByDoll(_master)) {
			master.getWeightReductionByDoll(); // bugbear
		}*/
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

	private L1PcInstance _pc;
	
	public void deleteDoll() {
		broadcastPacket(new S_SkillSound(getId(), 5936));
		if (_master != null && _isDelete) {
			L1PcInstance pc = (L1PcInstance) _master;
			pc.sendPackets(new S_SkillIconGFX(56, 0));
			pc.sendPackets(new S_OwnCharStatus(pc));
		}
		if (L1MagicDoll.isAc(_master)) {
			//_pc.resetBaseAc();
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
		if (L1MagicDoll.isHpRegeneration(_master)) {
			((L1PcInstance) _master).stopHpRegenerationByDoll();
		}
		if (L1MagicDoll.isMpRegeneration(_master)) {
			((L1PcInstance) _master).stopMpRegenerationByDoll();
		}
		if (L1MagicDoll.isItemMake(_master)) {
			((L1PcInstance) _master).stopItemMakeByDoll();
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