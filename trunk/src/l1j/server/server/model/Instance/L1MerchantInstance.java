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

import java.util.Timer;
import java.util.TimerTask;
import java.util.logging.Logger;

import l1j.server.server.datatables.NPCTalkDataTable;
import l1j.server.server.datatables.TownTable;
import l1j.server.server.model.L1Attack;
import l1j.server.server.model.L1CastleLocation;
import l1j.server.server.model.L1Clan;
import l1j.server.server.model.L1NpcTalkData;
import l1j.server.server.model.L1Quest;
import l1j.server.server.model.L1TownLocation;
import l1j.server.server.model.L1World;
import l1j.server.server.model.Instance.L1QuestInstance.RestMonitor;
import l1j.server.server.model.gametime.L1GameTimeClock;
import l1j.server.server.serverpackets.S_NPCTalkReturn;
import l1j.server.server.serverpackets.S_ServerMessage;
import l1j.server.server.templates.L1Npc;
import l1j.server.server.serverpackets.S_ChangeHeading;

public class L1MerchantInstance extends L1NpcInstance {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static Logger _log = Logger.getLogger(L1MerchantInstance.class
			.getName());

	/**
	 * @param template
	 */
	public L1MerchantInstance(L1Npc template) {
		super(template);
	}

	@Override
	public void onAction(L1PcInstance pc) {
		L1Attack attack = new L1Attack(pc, this);
		attack.calcHit();
		attack.action();
	}
	
	@Override
	public void onNpcAI() {
		if (isAiRunning()) {
			return;
		}
		setActived(false);
		startAI();
	}

	@Override
	public void onTalkAction(L1PcInstance player) {
		int objid = getId();
		L1NpcTalkData talking = NPCTalkDataTable.getInstance().getTemplate(
				getNpcTemplate().get_npcId());
		int npcid = getNpcTemplate().get_npcId();
		L1Quest quest = player.getQuest();
		String htmlid = null;
		String[] htmldata = null;

		int pcX = player.getX();
		int pcY = player.getY();
		int npcX = getX();
		int npcY = getY();

		if(getNpcTemplate().getChangeHead()) {
			if (pcX == npcX && pcY < npcY) {
				setHeading(0);
			} else if (pcX > npcX && pcY < npcY) {
				setHeading(1);
			} else if (pcX > npcX && pcY == npcY) {
				setHeading(2);
			} else if (pcX > npcX && pcY > npcY) {
				setHeading(3);
			} else if (pcX == npcX && pcY > npcY) {
				setHeading(4);
			} else if (pcX < npcX && pcY > npcY) {
				setHeading(5);
			} else if (pcX < npcX && pcY == npcY) {
				setHeading(6);
			} else if (pcX < npcX && pcY < npcY) {
				setHeading(7);
			}
			broadcastPacket(new S_ChangeHeading(this));

			synchronized (this) {
				if (_monitor != null) {
					_monitor.cancel();
				}
				setRest(true);
				_monitor = new RestMonitor();
				_restTimer.schedule(_monitor, REST_MILLISEC);
			}
		}
	
		if (talking != null) {
			if (npcid == 70841) { // ���[�f�B�G��
				if (player.isElf()) { // �G���t
					htmlid = "luudielE1";
				} else if (player.isDarkelf()) { // �_�[�N�G���t
					htmlid = "luudielCE1";
				} else {
					htmlid = "luudiel1";
				}
			} else if (npcid == 70522) { // �O���^�[
				if (player.isCrown()) { // �N��
					if (player.getLevel() >= 15) {
						int lv15_step = quest.get_step(L1Quest.QUEST_LEVEL15);
						if (lv15_step == 2 || lv15_step == L1Quest.QUEST_END) { // �N���A�ς�
							htmlid = "gunterp11";
						} else {
							htmlid = "gunterp9";
						}
					} else { // Lv15����
						htmlid = "gunterp12";
					}
				} else if (player.isKnight()) { // �i�C�g
					int lv30_step = quest.get_step(L1Quest.QUEST_LEVEL30);
					if (lv30_step == 0) { // ���J�n
						htmlid = "gunterk9";
					} else if (lv30_step == 1) {
						htmlid = "gunterkE1";
					} else if (lv30_step == 2) { // �O���^�[���Ӎς�
						htmlid = "gunterkE2";
					} else if (lv30_step >= 3) { // �O���^�[�I���ς�
						htmlid = "gunterkE3";
					}
				} else if (player.isElf()) { // �G���t
					htmlid = "guntere1";
				} else if (player.isWizard()) { // �E�B�U�[�h
					htmlid = "gunterw1";
				} else if (player.isDarkelf()) { // �_�[�N�G���t
					htmlid = "gunterde1";
				}
			} else if (npcid == 70653) { // �}�V���[
				if (player.isCrown()) { // �N��
					if (player.getLevel() >= 45) {
						if (quest.isEnd(L1Quest.QUEST_LEVEL30)) { // lv30�N���A�ς�
							int lv45_step = quest
									.get_step(L1Quest.QUEST_LEVEL45);
							if (lv45_step == L1Quest.QUEST_END) { // �N���A�ς�
								htmlid = "masha4";
							} else if (lv45_step >= 1) { // ���Ӎς�
								htmlid = "masha3";
							} else { // ������
								htmlid = "masha1";
							}
						}
					}
				} else if (player.isKnight()) { // �i�C�g
					if (player.getLevel() >= 45) {
						if (quest.isEnd(L1Quest.QUEST_LEVEL30)) { // Lv30�N�G�X�g�I���ς�
							int lv45_step = quest
									.get_step(L1Quest.QUEST_LEVEL45);
							if (lv45_step == L1Quest.QUEST_END) { // �N���A�ς�
								htmlid = "mashak3";
							} else if (lv45_step == 0) { // ���J�n
								htmlid = "mashak1";
							} else if (lv45_step >= 1) { // ���Ӎς�
								htmlid = "mashak2";
							}
						}
					}
				} else if (player.isElf()) { // �G���t
					if (player.getLevel() >= 45) {
						if (quest.isEnd(L1Quest.QUEST_LEVEL30)) { // Lv30�N�G�X�g�I���ς�
							int lv45_step = quest
									.get_step(L1Quest.QUEST_LEVEL45);
							if (lv45_step == L1Quest.QUEST_END) { // �N���A�ς�
								htmlid = "mashae3";
							} else if (lv45_step >= 1) { // ���Ӎς�
								htmlid = "mashae2";
							} else { // ������
								htmlid = "mashae1";
							}
						}
					}
				}
			} else if (npcid == 70554) { // �[��
				if (player.isCrown()) { // �N��
					if (player.getLevel() >= 15) {
						int lv15_step = quest.get_step(L1Quest.QUEST_LEVEL15);
						if (lv15_step == 1) { // �[���N���A�ς�
							htmlid = "zero5";
						} else if (lv15_step == L1Quest.QUEST_END) { // �[���A�O���^�[�N���A�ς�
							htmlid = "zero1";// 6
						} else {
							htmlid = "zero1";
						}
					} else { // Lv15����
						htmlid = "zero6";
					}
				}
			} else if (npcid == 70783) { // �A���A
				if (player.isCrown()) { // �N��
					if (player.getLevel() >= 30) {
						if (quest.isEnd(L1Quest.QUEST_LEVEL15)) { // lv15�����N���A�ς�
							int lv30_step = quest
									.get_step(L1Quest.QUEST_LEVEL30);
							if (lv30_step == L1Quest.QUEST_END) { // �N���A�ς�
								htmlid = "aria3";
							} else if (lv30_step == 1) { // ���Ӎς�
								htmlid = "aria2";
							} else { // ������
								htmlid = "aria1";
							}
						}
					}
				}
			} else if (npcid == 70782) { // �T�[�`�A���g
				if (player.getTempCharGfx() == 1037) {// �W���C�A���g�A���g�ϐg
					if (player.isCrown()) { // �N��
						if (quest.get_step(L1Quest.QUEST_LEVEL30) == 1) {
							htmlid = "ant1";
						} else {
							htmlid = "ant3";
						}
					} else { // �N��ȊO
						htmlid = "ant3";
					}
				}
			} else if (npcid == 70545) { // ���`���[�h
				if (player.isCrown()) { // �N��
					int lv45_step = quest.get_step(L1Quest.QUEST_LEVEL45);
					if (lv45_step >= 1 && lv45_step != L1Quest.QUEST_END) { // �J�n�����I��
						if (player.getInventory().checkItem(40586)) { // ���Ƃ̖��(��)
							htmlid = "richard4";
						} else {
							htmlid = "richard1";
						}
					}
				}
			} else if (npcid == 70776) { // ���O
				if (player.isCrown()) { // �N��
					int lv45_step = quest.get_step(L1Quest.QUEST_LEVEL45);
					if (lv45_step == 1) {
						htmlid = "meg1";
					} else if (lv45_step == 2 && lv45_step <= 3 ) { // ���O���Ӎς�
						htmlid = "meg2";
					} else if (lv45_step >= 4) { // ���O�N���A�ς�
						htmlid = "meg3";
					}
				}
			} else if (npcid == 71200) { // �����p�t �s�G�^
				if (player.isCrown()) { // �N��
					int lv45_step = quest.get_step(L1Quest.QUEST_LEVEL45);
					if (lv45_step == 2 && player.getInventory().checkItem(41422)) {	
						player.getInventory().consumeItem(41422, 1);
						final int[] item_ids = { 40568 };
						final int[] item_amounts = { 1 };
						for (int i = 0; i < item_ids.length; i++) {
							player.getInventory().storeItem(
									item_ids[i], item_amounts[i]);
						}
					}
				}
			// } else if (npcid == 71200) { // �����p�t �s�G�^
				// if (player.isCrown()) { // �N��
					// int lv45_step = quest.get_step(L1Quest.QUEST_LEVEL45);
					// if (lv45_step >= 6 && lv45_step == L1Quest.QUEST_END ) {
					// //���O�N���A�ς�or�I��
						// htmlid = "pieta9";
					// } else if (lv45_step == 2) { // �N�G�X�g�J�n�O�E���O���Ӎς�
						// htmlid = "pieta2";
					// } else if (lv45_step == 2 ||
								// player.getInventory().checkItem(41422) ) {//
								// �P�������������ێ�
						// htmlid = "pieta4";
					// } else if (lv45_step == 3) { // �P����������������
						// htmlid = "pieta6";
					// } else {//lv45����or�N�G�X�g30��
						// htmlid = "pieta8";
					// }
				// } else { // �N��ȊO
					// htmlid = "pieta1";
				// }
			// } else if (npcid == 70751) { // �u���b�h
				// if (player.isCrown()) { // �N��
					// if (player.getLevel() >= 45) {
						// if (quest.get_step(L1Quest.QUEST_LEVEL45) == 2) { //
						// ���O���Ӎς�
							// htmlid = "brad1";
						// }
					// }
				// }
			} else if (npcid == 70798) { // ���b�L�[
				if (player.isKnight()) { // �i�C�g
					if (player.getLevel() >= 15) {
						int lv15_step = quest.get_step(L1Quest.QUEST_LEVEL15);
						if (lv15_step >= 1) { // ���b�L�[�N���A�ς�
							htmlid = "riky5";
						} else {
							htmlid = "riky1";
						}
					} else { // Lv15����
						htmlid = "riky6";
					}
				}
			} else if (npcid == 70802) { // �A�m��
				if (player.isKnight()) { // �i�C�g
					if (player.getLevel() >= 15) {
						int lv15_step = quest.get_step(L1Quest.QUEST_LEVEL15);
						if (lv15_step == L1Quest.QUEST_END) { // �A�m���N���A�ς�
							htmlid = "aanon7";
						} else if (lv15_step == 1) { // ���b�L�[�N���A�ς�
							htmlid = "aanon4";
						}
					}
				}
			} else if (npcid == 70775) { // �}�[�N
				if (player.isKnight()) { // �i�C�g
					if (player.getLevel() >= 30) {
						if (quest.isEnd(L1Quest.QUEST_LEVEL15)) { // LV15�N�G�X�g�I���ς�
							int lv30_step = quest
									.get_step(L1Quest.QUEST_LEVEL30);
							if (lv30_step == 0) { // ���J�n
								htmlid = "mark1";
							} else {
								htmlid = "mark2";
							}
						}
					}
				}
			} else if (npcid == 70794) { // �Q���h
				if (player.isCrown()) { // �N��
					htmlid = "gerardp1";
				} else if (player.isKnight()) { // �i�C�g
					int lv30_step = quest.get_step(L1Quest.QUEST_LEVEL30);
					if (lv30_step == L1Quest.QUEST_END) { // �Q���h�I���ς�
						htmlid = "gerardkEcg";
					} else if (lv30_step < 3) { // �O���^�[���I��
						htmlid = "gerardk7";
					} else if (lv30_step == 3) { // �O���^�[�I���ς�
						htmlid = "gerardkE1";
					} else if (lv30_step == 4) { // �Q���h���Ӎς�
						htmlid = "gerardkE2";
					} else if (lv30_step == 5) { // ���~�A�̗� �I���ς�
						htmlid = "gerardkE3";
					} else if (lv30_step >= 6) { // �����̃|�[�V�������Ӎς�
						htmlid = "gerardkE4";
					}
				} else if (player.isElf()) { // �G���t
					htmlid = "gerarde1";
				} else if (player.isWizard()) { // �E�B�U�[�h
					htmlid = "gerardw1";
				} else if (player.isDarkelf()) { // �_�[�N�G���t
					htmlid = "gerardde1";
				}
			} else if (npcid == 70555) { // �W��
				if (player.getTempCharGfx() == 2374) { // �X�P���g���ϐg
					if (player.isKnight()) { // �i�C�g
						if (quest.get_step(L1Quest.QUEST_LEVEL30) == 6) { // �����̃|�[�V�������Ӎς�
							htmlid = "jim2";
						} else {
							htmlid = "jim4";
						}
					} else { // �i�C�g�ȊO
						htmlid = "jim4";
					}
				}
			} else if (npcid == 70715) { // �W�[��
				if (player.isKnight()) { // �i�C�g
					int lv45_step = quest.get_step(L1Quest.QUEST_LEVEL45);
					if (lv45_step == 1) { // �}�V���[���Ӎς�
						htmlid = "jimuk1";
					} else if (lv45_step >= 2) { // �W�[�����Ӎς�
						htmlid = "jimuk2";
					}
				}
			} else if (npcid == 70711) { // �W���C�A���g �G���_�[
				if (player.isKnight()) { // �i�C�g
					int lv45_step = quest.get_step(L1Quest.QUEST_LEVEL45);
					if (lv45_step == 2) { // �W�[�����Ӎς�
						if (player.getInventory().checkItem(20026)) { // �i�C�g�r�W����
							htmlid = "giantk1";
						}
					} else if (lv45_step == 3) { // �W���C�A���g�G���_�[���Ӎς�
						htmlid = "giantk2";
					} else if (lv45_step >= 4) { // �Ñ�̃L�[�F�㔼��
						htmlid = "giantk3";
					}
				}
			} else if (npcid == 70826) { // �I�X
				if (player.isElf()) { // �G���t
					if (player.getLevel() >= 15) {
						if (quest.isEnd(L1Quest.QUEST_LEVEL15)) {
							htmlid = "oth5";
						} else {
							htmlid = "oth1";
						}
					} else { // ���x���P�T����
						htmlid = "oth6";
					}
				}
			} else if (npcid == 70844) { // �X�ƃG���t�̕�
				if (player.isElf()) { // �G���t
					if (player.getLevel() >= 30) {
						if (quest.isEnd(L1Quest.QUEST_LEVEL15)) { // Lv15�I���ς�
							int lv30_step = quest
									.get_step(L1Quest.QUEST_LEVEL30);
							if (lv30_step == L1Quest.QUEST_END) { // �I���ς�
								htmlid = "motherEE3";
							} else if (lv30_step >= 1) { // ���Ӎς�
								htmlid = "motherEE2";
							} else if (lv30_step <= 0) { // ������
								htmlid = "motherEE1";
							}
						} else { // Lv15���I��
							htmlid = "mothere1";
						}
					} else { // Lv30����
						htmlid = "mothere1";
					}
				}
			} else if (npcid == 70724) { // �w�C�g
				if (player.isElf()) { // �G���t
					int lv45_step = quest.get_step(L1Quest.QUEST_LEVEL45);
					if (lv45_step >= 4) { // �w�C�g�I���ς�
						htmlid = "heit5";
					} else if (lv45_step >= 3) { // �t���[�g�����ς�
						htmlid = "heit3";
					} else if (lv45_step >= 2) { // �w�C�g���Ӎς�
						htmlid = "heit2";
					} else if (lv45_step >= 1) { // �}�V���[���Ӎς�
						htmlid = "heit1";
					}
				}
			} else if (npcid == 70531) { // �[��
				if (player.isWizard()) { // �E�B�U�[�h
					if (player.getLevel() >= 15) {
						if (quest.isEnd(L1Quest.QUEST_LEVEL15)) { // �I���ς�
							htmlid = "jem6";
						} else {
							htmlid = "jem1";
						}
					}
				}
			} else if (npcid == 70009) { // �Q����
				if (player.isCrown()) { // �N��
					htmlid = "gerengp1";
				} else if (player.isKnight()) { // �i�C�g
					htmlid = "gerengk1";
				} else if (player.isElf()) { // �G���t
					htmlid = "gerenge1";
				} else if (player.isWizard()) { // �E�B�U�[�h
					if (player.getLevel() >= 30) {
						if (quest.isEnd(L1Quest.QUEST_LEVEL15)) {
							int lv30_step = quest
									.get_step(L1Quest.QUEST_LEVEL30);
							if (lv30_step >= 4) { // �Q�����I���ς�
								htmlid = "gerengw3";
							} else if (lv30_step >= 3) { // �v���ς�
								htmlid = "gerengT4";
							} else if (lv30_step >= 2) { // �A���f�b�h�̍������ς�
								htmlid = "gerengT3";
							} else if (lv30_step >= 1) { // ���Ӎς�
								htmlid = "gerengT2";
							} else { // ������
								htmlid = "gerengT1";
							}
						} else { // Lv15�N�G�X�g���I��
							htmlid = "gerengw3";
						}
					} else { // Lv30����
						htmlid = "gerengw3";
					}
				} else if (player.isDarkelf()) { // �_�[�N�G���t
					htmlid = "gerengde1";
				}
			} else if (npcid == 70763) { // �^���X
				if (player.isWizard()) { // �E�B�U�[�h
					int lv30_step = quest.get_step(L1Quest.QUEST_LEVEL30);
					if (lv30_step == L1Quest.QUEST_END) {
						if (player.getLevel() >= 45) {
							int lv45_step = quest
									.get_step(L1Quest.QUEST_LEVEL45);
							if (lv45_step >= 1
									&& lv45_step != L1Quest.QUEST_END) { // ���Ӎς�
								htmlid = "talassmq2";
							} else if (lv45_step <= 0) { // ������
								htmlid = "talassmq1";
							}
						}
					} else if (lv30_step == 4) {
						htmlid = "talassE1";
					} else if (lv30_step == 5) {
						htmlid = "talassE2";
					}
				}
			} else if (npcid == 81105) { // �_��̊�
				if (player.isWizard()) { // �E�B�U�[�h
					int lv45_step = quest.get_step(L1Quest.QUEST_LEVEL45);
					if (lv45_step >= 3) { // �_��̊�I���ς�
						htmlid = "stoenm3";
					} else if (lv45_step >= 2) { // �_��̊� ���Ӎς�
						htmlid = "stoenm2";
					} else if (lv45_step >= 1) { // �^���X ���Ӎς�
						htmlid = "stoenm1";
					}
				}
			} else if (npcid == 70739) { // �f�B�K���f�B��
				if (player.getLevel() >= 50) {
					int lv50_step = quest.get_step(L1Quest.QUEST_LEVEL50);
					if (lv50_step == L1Quest.QUEST_END) {
						if (player.isCrown()) { // �N��
							htmlid = "dicardingp3";
						} else if (player.isKnight()) { // �i�C�g
							htmlid = "dicardingk3";
						} else if (player.isElf()) { // �G���t
							htmlid = "dicardinge3";
						} else if (player.isWizard()) { // �E�B�U�[�h
							htmlid = "dicardingw3";
						} else if (player.isDarkelf()) { // �_�[�N�G���t
							htmlid = "dicarding";
						}
					} else if (lv50_step >= 1) { // �f�B�K���f�B�� ���Ӎς�
						if (player.isCrown()) { // �N��
							htmlid = "dicardingp2";
						} else if (player.isKnight()) { // �i�C�g
							htmlid = "dicardingk2";
						} else if (player.isElf()) { // �G���t
							htmlid = "dicardinge2";
						} else if (player.isWizard()) { // �E�B�U�[�h
							htmlid = "dicardingw2";
						} else if (player.isDarkelf()) { // �_�[�N�G���t
							htmlid = "dicarding";
						}
					} else if (lv50_step >= 0) {
						if (player.isCrown()) { // �N��
							htmlid = "dicardingp1";
						} else if (player.isKnight()) { // �i�C�g
							htmlid = "dicardingk1";
						} else if (player.isElf()) { // �G���t
							htmlid = "dicardinge1";
						} else if (player.isWizard()) { // �E�B�U�[�h
							htmlid = "dicardingw1";
						} else if (player.isDarkelf()) { // �_�[�N�G���t
							htmlid = "dicarding";
						}
					} else {
						htmlid = "dicarding";
					}
				} else { // Lv50����
					htmlid = "dicarding";
				}
			} else if (npcid == 70885) { // �J�[��
				if (player.isDarkelf()) { // �_�[�N�G���t
					if (player.getLevel() >= 15) {
						int lv15_step = quest.get_step(L1Quest.QUEST_LEVEL15);
						if (lv15_step == L1Quest.QUEST_END) { // �I���ς�
							htmlid = "kanguard3";
						} else if (lv15_step >= 1) { // ���Ӎς�
							htmlid = "kanguard2";
						} else { // ������
							htmlid = "kanguard1";
						}
					} else { // Lv15����
						htmlid = "kanguard5";
					}
				}
			} else if (npcid == 70892) { // �����h�D
				if (player.isDarkelf()) { // �_�[�N�G���t
					if (player.getLevel() >= 30) {
						if (quest.isEnd(L1Quest.QUEST_LEVEL15)) {
							int lv30_step = quest
									.get_step(L1Quest.QUEST_LEVEL30);
							if (lv30_step == L1Quest.QUEST_END) { // �I���ς�
								htmlid = "ronde5";
							} else if (lv30_step >= 2) { // ��������ς�
								htmlid = "ronde3";
							} else if (lv30_step >= 1) { // ���Ӎς�
								htmlid = "ronde2";
							} else { // ������
								htmlid = "ronde1";
							}
						} else { // Lv15�N�G�X�g���I��
							htmlid = "ronde7";
						}
					} else { // Lv30����
						htmlid = "ronde7";
					}
				}
			} else if (npcid == 70895) { // �u���f�B�J
				if (player.isDarkelf()) { // �_�[�N�G���t
					if (player.getLevel() >= 45) {
						if (quest.isEnd(L1Quest.QUEST_LEVEL30)) {
							int lv45_step = quest
									.get_step(L1Quest.QUEST_LEVEL45);
							if (lv45_step == L1Quest.QUEST_END) { // �I���ς�
								if (player.getLevel() < 50) { // Lv50����
									htmlid = "bluedikaq3";
								} else {
									int lv50_step = quest
											.get_step(L1Quest.QUEST_LEVEL50);
									if (lv50_step == L1Quest.QUEST_END) { // �I���ς�
										htmlid = "bluedikaq8";
									} else {
										htmlid = "bluedikaq6";
									}
								}
							} else if (lv45_step >= 1) { // ���Ӎς�
								htmlid = "bluedikaq2";
							} else { // ������
								htmlid = "bluedikaq1";
							}
						} else { // Lv30�N�G�X�g���I��
							htmlid = "bluedikaq5";
						}
					} else { // Lv45����
						htmlid = "bluedikaq5";
					}
				}
			} else if (npcid == 70904) { // �N�v
				if (player.isDarkelf()) {
					if (quest.get_step(L1Quest.QUEST_LEVEL45) == 1) { // �u���f�B�J���Ӎς�
						htmlid = "koup12";
					}
				}
			} else if (npcid == 70824) { // �A�T�V���}�X�^�[�̒Ǐ]��
				if (player.isDarkelf()) {
					if (player.getTempCharGfx() == 3634) { // �A�T�V���ϐg
						int lv45_step = quest.get_step(L1Quest.QUEST_LEVEL45);
						if (lv45_step == 1) {
							htmlid = "assassin1";
						} else if (lv45_step == 2) {
							htmlid = "assassin2";
						} else {
							htmlid = "assassin3";
						}
					} else { // �_�[�N�G���t�ȊO
						htmlid = "assassin3";
					}
				}
			} else if (npcid == 70744) { // ���W�F
				if (player.isDarkelf()) { // �_�[�N�G���t
					int lv45_step = quest.get_step(L1Quest.QUEST_LEVEL45);
					if (lv45_step >= 5) { // ���W�F�Q��ړ��Ӎς�
						htmlid = "roje14";
					} else if (lv45_step >= 4) { // �C�G�e�B�̓��� �����ς�
						htmlid = "roje13";
					} else if (lv45_step >= 3) { // ���W�F ���Ӎς�
						htmlid = "roje12";
					} else if (lv45_step >= 2) { // �A�T�V���}�X�^�[�̒Ǐ]�� ���Ӎς�
						htmlid = "roje11";
					} else { // �A�T�V���}�X�^�[�̒Ǐ]�� ������
						htmlid = "roje15";
					}
				}
			} else if (npcid == 70811) { // ���C��
				if (quest.get_step(L1Quest.QUEST_LYRA) >= 1) { // �_��ς�
					htmlid = "lyraEv3";
				} else { // ���_��
					htmlid = "lyraEv1";
				}
			} else if (npcid == 70087) { // �Z�f�B�A
				if (player.isDarkelf()) {
					htmlid = "sedia";
				}
			} else if (npcid == 70099) { // �N�[�p�[
				if (!quest.isEnd(L1Quest.QUEST_OILSKINMANT)) {
					if (player.getLevel() > 13) {
						htmlid = "kuper1";
					}
				}
			} else if (npcid == 70796) { // �_���n��
				if (!quest.isEnd(L1Quest.QUEST_OILSKINMANT)) {
					if (player.getLevel() > 13) {
						htmlid = "dunham1";
					}
				}
			} else if (npcid == 70011) { // �b���铇�̑D�����Ǘ��l
				int time = L1GameTimeClock.getInstance().currentTime()
						.getSeconds() % 86400;
				if (time < 60 * 60 * 6 || time > 60 * 60 * 20) { // 20:00�`6:00
					htmlid = "shipEvI6";
				}
			} else if (npcid == 70553) { // �P���g�� ���]�� �C�X�}�G��
				boolean hascastle = checkHasCastle(player,
						L1CastleLocation.KENT_CASTLE_ID);
				if (hascastle) { // ���N������
					if (checkClanLeader(player)) { // ������
						htmlid = "ishmael1";
					} else {
						htmlid = "ishmael6";
						htmldata = new String[] { player.getName() };
					}
				} else {
					htmlid = "ishmael7";
				}
			} else if (npcid == 70822) { // �I�[�N�̐X �Z�Q�� �A�g�D�o
				boolean hascastle = checkHasCastle(player,
						L1CastleLocation.OT_CASTLE_ID);
				if (hascastle) { // ���N������
					if (checkClanLeader(player)) { // ������
						htmlid = "seghem1";
					} else {
						htmlid = "seghem6";
						htmldata = new String[] { player.getName() };
					}
				} else {
					htmlid = "seghem7";
				}
			} else if (npcid == 70784) { // �E�B���_�E�b�h�� ���]�� �I�X�����h
				boolean hascastle = checkHasCastle(player,
						L1CastleLocation.WW_CASTLE_ID);
				if (hascastle) { // ���N������
					if (checkClanLeader(player)) { // ������
						htmlid = "othmond1";
					} else {
						htmlid = "othmond6";
						htmldata = new String[] { player.getName() };
					}
				} else {
					htmlid = "othmond7";
				}
			} else if (npcid == 70623) { // �M������ ���]�� �I�[�r��
				boolean hascastle = checkHasCastle(player,
						L1CastleLocation.GIRAN_CASTLE_ID);
				if (hascastle) { // ���N������
					if (checkClanLeader(player)) { // ������
						htmlid = "orville1";
					} else {
						htmlid = "orville6";
						htmldata = new String[] { player.getName() };
					}
				} else {
					htmlid = "orville7";
				}
			} else if (npcid == 70880) { // �n�C�l�� ���]�� �t�B�b�V���[
				boolean hascastle = checkHasCastle(player,
						L1CastleLocation.HEINE_CASTLE_ID);
				if (hascastle) { // ���N������
					if (checkClanLeader(player)) { // ������
						htmlid = "fisher1";
					} else {
						htmlid = "fisher6";
						htmldata = new String[] { player.getName() };
					}
				} else {
					htmlid = "fisher7";
				}
			} else if (npcid == 70665) { // �h���[�t�� ���]�� �|�e���s��
				boolean hascastle = checkHasCastle(player,
						L1CastleLocation.DOWA_CASTLE_ID);
				if (hascastle) { // ���N������
					if (checkClanLeader(player)) { // ������
						htmlid = "potempin1";
					} else {
						htmlid = "potempin6";
						htmldata = new String[] { player.getName() };
					}
				} else {
					htmlid = "potempin7";
				}
			} else if (npcid == 70721) { // �A�f���� ���]�� �e�B����
				boolean hascastle = checkHasCastle(player,
						L1CastleLocation.ADEN_CASTLE_ID);
				if (hascastle) { // ���N������
					if (checkClanLeader(player)) { // ������
						htmlid = "timon1";
					} else {
						htmlid = "timon6";
						htmldata = new String[] { player.getName() };
					}
				} else {
					htmlid = "timon7";
				}
			} else if (npcid == 81155) { // �f�B�A�h�v�� �I�[��
				boolean hascastle = checkHasCastle(player,
						L1CastleLocation.DIAD_CASTLE_ID);
				if (hascastle) { // ���N������
					if (checkClanLeader(player)) { // ������
						htmlid = "olle1";
					} else {
						htmlid = "olle6";
						htmldata = new String[] { player.getName() };
					}
				} else {
					htmlid = "olle7";
				}
			} else if (npcid == 80057) { // �A���t�H���X
				int karmaLevel = player.getKarmaLevel();
				String[] html1 = { "alfons1", "cbk1", "cbk2", "cbk3", "cbk4",
						"cbk5", "cbk6", "cbk7", "cbk8" }; // 0 ~ 8
				String[] html2 = { "cyk1", "cyk2", "cyk3", "cyk4", "cyk5",
						"cyk6", "cyk7", "cyk8" }; // -1 ~ -8
				if (karmaLevel < 0) {
					htmlid = html2[Math.abs(karmaLevel) - 1];
				} else if (karmaLevel >= 0) {
					htmlid = html1[karmaLevel];
				} else {
					htmlid = "alfons1";
				}
			} else if (npcid == 80058) { // �����̔�(����)
				int level = player.getLevel();
				if (level <= 44) {
					htmlid = "cpass03";
				} else if (level <= 51 && 45 <= level) {
					htmlid = "cpass02";
				} else {
					htmlid = "cpass01";
				}
			} else if (npcid == 80059) { // �����̔�(�y)
				if (player.getKarmaLevel() > 0) {
					htmlid = "cpass03";
				} else if (player.getInventory().checkItem(40921)) { // ���f�̎x�z��
					htmlid = "wpass02";
				} else if (player.getInventory().checkItem(40917)) { // �n�̎x�z��
					htmlid = "wpass14";
				} else if (player.getInventory().checkItem(40912) // ���̒ʍs��
						|| player.getInventory().checkItem(40910) // ���̒ʍs��
						|| player.getInventory().checkItem(40911)) { // �΂̒ʍs��
					htmlid = "wpass04";
				} else if (player.getInventory().checkItem(40909)) { // �n�̒ʍs��
					int count = getNecessarySealCount(player);
					if (player.getInventory().checkItem(40913, count)) { // �n�̈��
						createRuler(player, 1, count);
						htmlid = "wpass06";
					} else {
						htmlid = "wpass03";
					}
				} else if (player.getInventory().checkItem(40913)) { // �n�̈��
					htmlid = "wpass08";
				} else {
					htmlid = "wpass05";
				}
			} else if (npcid == 80060) { // �����̔�(��)
				if (player.getKarmaLevel() > 0) {
					htmlid = "cpass03";
				} else if (player.getInventory().checkItem(40921)) { // ���f�̎x�z��
					htmlid = "wpass02";
				} else if (player.getInventory().checkItem(40920)) { // ���̎x�z��
					htmlid = "wpass13";
				} else if (player.getInventory().checkItem(40909) // �n�̒ʍs��
						|| player.getInventory().checkItem(40910) // ���̒ʍs��
						|| player.getInventory().checkItem(40911)) { // �΂̒ʍs��
					htmlid = "wpass04";
				} else if (player.getInventory().checkItem(40912)) { // ���̒ʍs��
					int count = getNecessarySealCount(player);
					if (player.getInventory().checkItem(40916, count)) { // ���̈��
						createRuler(player, 8, count);
						htmlid = "wpass06";
					} else {
						htmlid = "wpass03";
					}
				} else if (player.getInventory().checkItem(40916)) { // ���̈��
					htmlid = "wpass08";
				} else {
					htmlid = "wpass05";
				}
			} else if (npcid == 80061) { // �����̔�(��)
				if (player.getKarmaLevel() > 0) {
					htmlid = "cpass03";
				} else if (player.getInventory().checkItem(40921)) { // ���f�̎x�z��
					htmlid = "wpass02";
				} else if (player.getInventory().checkItem(40918)) { // ���̎x�z��
					htmlid = "wpass11";
				} else if (player.getInventory().checkItem(40909) // �n�̒ʍs��
						|| player.getInventory().checkItem(40912) // ���̒ʍs��
						|| player.getInventory().checkItem(40911)) { // �΂̒ʍs��
					htmlid = "wpass04";
				} else if (player.getInventory().checkItem(40910)) { // ���̒ʍs��
					int count = getNecessarySealCount(player);
					if (player.getInventory().checkItem(40914, count)) { // ���̈��
						createRuler(player, 4, count);
						htmlid = "wpass06";
					} else {
						htmlid = "wpass03";
					}
				} else if (player.getInventory().checkItem(40914)) { // ���̈��
					htmlid = "wpass08";
				} else {
					htmlid = "wpass05";
				}
			} else if (npcid == 80062) { // �����̔�(��)
				if (player.getKarmaLevel() > 0) {
					htmlid = "cpass03";
				} else if (player.getInventory().checkItem(40921)) { // ���f�̎x�z��
					htmlid = "wpass02";
				} else if (player.getInventory().checkItem(40919)) { // �΂̎x�z��
					htmlid = "wpass12";
				} else if (player.getInventory().checkItem(40909) // �n�̒ʍs��
						|| player.getInventory().checkItem(40912) // ���̒ʍs��
						|| player.getInventory().checkItem(40910)) { // ���̒ʍs��
					htmlid = "wpass04";
				} else if (player.getInventory().checkItem(40911)) { // �΂̒ʍs��
					int count = getNecessarySealCount(player);
					if (player.getInventory().checkItem(40915, count)) { // �΂̈��
						createRuler(player, 2, count);
						htmlid = "wpass06";
					} else {
						htmlid = "wpass03";
					}
				} else if (player.getInventory().checkItem(40915)) { // �΂̈��
					htmlid = "wpass08";
				} else {
					htmlid = "wpass05";
				}
			} else if (npcid == 80065) { // �o�����O�̖���
				if (player.getKarmaLevel() < 3) {
					htmlid = "uturn0";
				} else {
					htmlid = "uturn1";
				}
			} else if (npcid == 80047) { // ���q�̏��g
				if (player.getKarmaLevel() > -3) {
					htmlid = "uhelp1";
				} else {
					htmlid = "uhelp2";
				}
			} else if (npcid == 80049) { // �h�炮��
				if (player.getKarma() <= -10000000) {
					htmlid = "betray11";
				} else {
					htmlid = "betray12";
				}
			} else if (npcid == 80050) { // ���q�̎�����
				if (player.getKarmaLevel() > -1) {
					htmlid = "meet103";
				} else {
					htmlid = "meet101";
				}
			} else if (npcid == 80053) { // ���q�̒b�艮
				int karmaLevel = player.getKarmaLevel();
				if (karmaLevel == 0) {
					htmlid = "aliceyet";
				} else if (karmaLevel >= 1) {
					if (player.getInventory().checkItem(196)
							|| player.getInventory().checkItem(197)
							|| player.getInventory().checkItem(198)
							|| player.getInventory().checkItem(199)
							|| player.getInventory().checkItem(200)
							|| player.getInventory().checkItem(201)
							|| player.getInventory().checkItem(202)
							|| player.getInventory().checkItem(203)) {
						htmlid = "alice_gd";
					} else {
						htmlid = "gd";
					}
				} else if (karmaLevel <= -1) {
					if (player.getInventory().checkItem(40991)) {
						if (karmaLevel <= -1) {
							htmlid = "Mate_1";
						}
					} else if (player.getInventory().checkItem(196)) {
						if (karmaLevel <= -2) {
							htmlid = "Mate_2";
						} else {
							htmlid = "alice_1";
						}
					} else if (player.getInventory().checkItem(197)) {
						if (karmaLevel <= -3) {
							htmlid = "Mate_3";
						} else {
							htmlid = "alice_2";
						}
					} else if (player.getInventory().checkItem(198)) {
						if (karmaLevel <= -4) {
							htmlid = "Mate_4";
						} else {
							htmlid = "alice_3";
						}
					} else if (player.getInventory().checkItem(199)) {
						if (karmaLevel <= -5) {
							htmlid = "Mate_5";
						} else {
							htmlid = "alice_4";
						}
					} else if (player.getInventory().checkItem(200)) {
						if (karmaLevel <= -6) {
							htmlid = "Mate_6";
						} else {
							htmlid = "alice_5";
						}
					} else if (player.getInventory().checkItem(201)) {
						if (karmaLevel <= -7) {
							htmlid = "Mate_7";
						} else {
							htmlid = "alice_6";
						}
					} else if (player.getInventory().checkItem(202)) {
						if (karmaLevel <= -8) {
							htmlid = "Mate_8";
						} else {
							htmlid = "alice_7";
						}
					} else if (player.getInventory().checkItem(203)) {
						htmlid = "alice_8";
					} else {
						htmlid = "alice_no";
					}
				}
			} else if (npcid == 80055) { // ���q�̕⍲��
				int amuletLevel = 0;
				if (player.getInventory().checkItem(20358)) { // �z��̃A�~�����b�g
					amuletLevel = 1;
				} else if (player.getInventory().checkItem(20359)) { // �񑩂̃A�~�����b�g
					amuletLevel = 2;
				} else if (player.getInventory().checkItem(20360)) { // ����̃A�~�����b�g
					amuletLevel = 3;
				} else if (player.getInventory().checkItem(20361)) { // ���̃A�~�����b�g
					amuletLevel = 4;
				} else if (player.getInventory().checkItem(20362)) { // �����̃A�~�����b�g
					amuletLevel = 5;
				} else if (player.getInventory().checkItem(20363)) { // �E�m�̃A�~�����b�g
					amuletLevel = 6;
				} else if (player.getInventory().checkItem(20364)) { // ���R�̃A�~�����b�g
					amuletLevel = 7;
				} else if (player.getInventory().checkItem(20365)) { // �叫�R�̃A�~�����b�g
					amuletLevel = 8;
				}
				if (player.getKarmaLevel() == -1) {
					if (amuletLevel >= 1) {
						htmlid = "uamuletd";
					} else {
						htmlid = "uamulet1";
					}
				} else if (player.getKarmaLevel() == -2) {
					if (amuletLevel >= 2) {
						htmlid = "uamuletd";
					} else {
						htmlid = "uamulet2";
					}
				} else if (player.getKarmaLevel() == -3) {
					if (amuletLevel >= 3) {
						htmlid = "uamuletd";
					} else {
						htmlid = "uamulet3";
					}
				} else if (player.getKarmaLevel() == -4) {
					if (amuletLevel >= 4) {
						htmlid = "uamuletd";
					} else {
						htmlid = "uamulet4";
					}
				} else if (player.getKarmaLevel() == -5) {
					if (amuletLevel >= 5) {
						htmlid = "uamuletd";
					} else {
						htmlid = "uamulet5";
					}
				} else if (player.getKarmaLevel() == -6) {
					if (amuletLevel >= 6) {
						htmlid = "uamuletd";
					} else {
						htmlid = "uamulet6";
					}
				} else if (player.getKarmaLevel() == -7) {
					if (amuletLevel >= 7) {
						htmlid = "uamuletd";
					} else {
						htmlid = "uamulet7";
					}
				} else if (player.getKarmaLevel() == -8) {
					if (amuletLevel >= 8) {
						htmlid = "uamuletd";
					} else {
						htmlid = "uamulet8";
					}
				} else {
					htmlid = "uamulet0";
				}
			} else if (npcid == 80056) { // �Ƃ̊Ǘ���
				if (player.getKarma() <= -10000000) {
					htmlid = "infamous11";
				} else {
					htmlid = "infamous12";
				}
			} else if (npcid == 80064) { // �o�����O�̎�����
				if (player.getKarmaLevel() < 1) {
					htmlid = "meet003";
				} else {
					htmlid = "meet001";
				}
			} else if (npcid == 80066) { // �h��߂���
				if (player.getKarma() >= 10000000) {
					htmlid = "betray01";
				} else {
					htmlid = "betray02";
				}
			} else if (npcid == 80071) { // �o�����O�̕⍲��
				int earringLevel = 0;
				if (player.getInventory().checkItem(21020)) { // �x��̃C�A�����O
					earringLevel = 1;
				} else if (player.getInventory().checkItem(21021)) { // �o�q�̃C�A�����O
					earringLevel = 2;
				} else if (player.getInventory().checkItem(21022)) { // �F�D�̃C�A�����O
					earringLevel = 3;
				} else if (player.getInventory().checkItem(21023)) { // �ɒm�̃C�A�����O
					earringLevel = 4;
				} else if (player.getInventory().checkItem(21024)) { // �\���̃C�A�����O
					earringLevel = 5;
				} else if (player.getInventory().checkItem(21025)) { // �]���̃C�A�����O
					earringLevel = 6;
				} else if (player.getInventory().checkItem(21026)) { // �����̃C�A�����O
					earringLevel = 7;
				} else if (player.getInventory().checkItem(21027)) { // �z��̃C�A�����O
					earringLevel = 8;
				}
				if (player.getKarmaLevel() == 1) {
					if (earringLevel >= 1) {
						htmlid = "lringd";
					} else {
						htmlid = "lring1";
					}
				} else if (player.getKarmaLevel() == 2) {
					if (earringLevel >= 2) {
						htmlid = "lringd";
					} else {
						htmlid = "lring2";
					}
				} else if (player.getKarmaLevel() == 3) {
					if (earringLevel >= 3) {
						htmlid = "lringd";
					} else {
						htmlid = "lring3";
					}
				} else if (player.getKarmaLevel() == 4) {
					if (earringLevel >= 4) {
						htmlid = "lringd";
					} else {
						htmlid = "lring4";
					}
				} else if (player.getKarmaLevel() == 5) {
					if (earringLevel >= 5) {
						htmlid = "lringd";
					} else {
						htmlid = "lring5";
					}
				} else if (player.getKarmaLevel() == 6) {
					if (earringLevel >= 6) {
						htmlid = "lringd";
					} else {
						htmlid = "lring6";
					}
				} else if (player.getKarmaLevel() == 7) {
					if (earringLevel >= 7) {
						htmlid = "lringd";
					} else {
						htmlid = "lring7";
					}
				} else if (player.getKarmaLevel() == 8) {
					if (earringLevel >= 8) {
						htmlid = "lringd";
					} else {
						htmlid = "lring8";
					}
				} else {
					htmlid = "lring0";
				}
			} else if (npcid == 80072) { // �o�����O�̒b�艮
				int karmaLevel = player.getKarmaLevel();
				String[] html = { "lsmith0", "lsmith1", "lsmith2", "lsmith3",
						"lsmith4", "lsmith5", "lsmith7", "lsmith8" };
				if (karmaLevel <= 8) {
					htmlid = html[karmaLevel - 1];
				} else {
					htmlid = "";
				}
			} else if (npcid == 80074) { // �Ƃ̊Ǘ���
				if (player.getKarma() >= 10000000) {
					htmlid = "infamous01";
				} else {
					htmlid = "infamous02";
				}
			} else if (npcid == 80104) { // �A�f���R�n�c��
				if (!player.isCrown()) { // �N��
					htmlid = "horseseller4";
				}
			} else if (npcid == 70528) { // �b���铇�̑� �^�E���}�X�^�[
				htmlid = talkToTownmaster(player,
						L1TownLocation.TOWNID_TALKING_ISLAND);
			} else if (npcid == 70546) { // �P���g�� �^�E���}�X�^�[
				htmlid = talkToTownmaster(player, L1TownLocation.TOWNID_KENT);
			} else if (npcid == 70567) { // �O���[�f�B���� �^�E���}�X�^�[
				htmlid = talkToTownmaster(player, L1TownLocation.TOWNID_GLUDIO);
			} else if (npcid == 70815) { // �Γc�� �^�E���}�X�^�[
				htmlid = talkToTownmaster(player,
						L1TownLocation.TOWNID_ORCISH_FOREST);
			} else if (npcid == 70774) { // �E�b�h�x�b�N�� �^�E���}�X�^�[
				htmlid = talkToTownmaster(player,
						L1TownLocation.TOWNID_WINDAWOOD);
			} else if (npcid == 70799) { // �V���o�[�i�C�g�^�E�� �^�E���}�X�^�[
				htmlid = talkToTownmaster(player,
						L1TownLocation.TOWNID_SILVER_KNIGHT_TOWN);
			} else if (npcid == 70594) { // �M�����s�s �^�E���}�X�^�[
				htmlid = talkToTownmaster(player, L1TownLocation.TOWNID_GIRAN);
			} else if (npcid == 70860) { // �n�C�l�s�s �^�E���}�X�^�[
				htmlid = talkToTownmaster(player, L1TownLocation.TOWNID_HEINE);
			} else if (npcid == 70654) { // �E�F���_���� �^�E���}�X�^�[
				htmlid = talkToTownmaster(player, L1TownLocation.TOWNID_WERLDAN);
			} else if (npcid == 70748) { // �ۉ�̓��̑� �^�E���}�X�^�[
				htmlid = talkToTownmaster(player, L1TownLocation.TOWNID_OREN);
			} else if (npcid == 70534) { // �b���铇�̑� �^�E���A�h�o�C�U�[
				htmlid = talkToTownadviser(player,
						L1TownLocation.TOWNID_TALKING_ISLAND);
			} else if (npcid == 70556) { // �P���g�� �^�E���A�h�o�C�U�[
				htmlid = talkToTownadviser(player, L1TownLocation.TOWNID_KENT);
			} else if (npcid == 70572) { // �O���[�f�B���� �^�E���A�h�o�C�U�[
				htmlid = talkToTownadviser(player, L1TownLocation.TOWNID_GLUDIO);
			} else if (npcid == 70830) { // �Γc�� �^�E���A�h�o�C�U�[
				htmlid = talkToTownadviser(player,
						L1TownLocation.TOWNID_ORCISH_FOREST);
			} else if (npcid == 70788) { // �E�b�h�x�b�N�� �^�E���A�h�o�C�U�[
				htmlid = talkToTownadviser(player,
						L1TownLocation.TOWNID_WINDAWOOD);
			} else if (npcid == 70806) { // �V���o�[�i�C�g�^�E�� �^�E���A�h�o�C�U�[
				htmlid = talkToTownadviser(player,
						L1TownLocation.TOWNID_SILVER_KNIGHT_TOWN);
			} else if (npcid == 70631) { // �M�����s�s �^�E���A�h�o�C�U�[
				htmlid = talkToTownadviser(player, L1TownLocation.TOWNID_GIRAN);
			} else if (npcid == 70876) { // �n�C�l�s�s �^�E���A�h�o�C�U�[
				htmlid = talkToTownadviser(player, L1TownLocation.TOWNID_HEINE);
			} else if (npcid == 70663) { // �E�F���_���� �^�E���A�h�o�C�U�[
				htmlid = talkToTownadviser(player,
						L1TownLocation.TOWNID_WERLDAN);
			} else if (npcid == 70761) { // �ۉ�̓��̑� �^�E���A�h�o�C�U�[
				htmlid = talkToTownadviser(player, L1TownLocation.TOWNID_OREN);
			} else if (npcid == 70997) { // �h�������h
				htmlid = talkToDoromond(player);
			} else if (npcid == 70998) { // �̂����̃K�C�h
				htmlid = talkToSIGuide(player);
			} else if (npcid == 70999) { // �A���b�N�X(�̂���)
				htmlid = talkToAlex(player);
			} else if (npcid == 71000) { // �A���b�N�X(�P����)
				htmlid = talkToAlexInTrainingRoom(player);
			} else if (npcid == 71002) { // �L�����Z���[�V�����t
				htmlid = cancellation(player);
			} else if (npcid == 70506) { // ���o�[
				htmlid = talkToRuba(player);
			} else if (npcid == 71005) { // �|�s���A
				htmlid = talkToPopirea(player);
			} else if (npcid == 71009) { // �u���A�i
				if (player.getLevel() < 13) {
					htmlid = "jpe0071";
				}
			} else if (npcid == 71011) { // �`�R���[
				if (player.getLevel() < 13) {
					htmlid = "jpe0061";
				}
			} else if (npcid == 71013) { // �J����
				if (player.isDarkelf()) {
					if (player.getLevel() <= 3) {
						htmlid = "karen1";
					} else if (player.getLevel() > 3 && player.getLevel() < 50) {
						htmlid = "karen3";
					} else if (player.getLevel() >= 50) {
						htmlid = "karen4";
					}
				}
			} else if (npcid == 71014) { // ���̎��x�c(�E)
				if (player.getLevel() < 13) {
					htmlid = "en0241";
				}
			} else if (npcid == 71015) { // ���̎��x�c(��)
				if (player.getLevel() < 13) {
					htmlid = "en0261";
				} else if (player.getLevel() >= 13 && player.getLevel() < 25) {
					htmlid = "en0262";
				}
			} else if (npcid == 71031) { // �b�����C�A��
				if (player.getLevel() < 25) {
					htmlid = "en0081";
				}
			} else if (npcid == 71032) { // �`���҃G�[�^
				if (player.isElf()) {
					htmlid = "en0091e";
				} else if (player.isDarkelf()) {
					htmlid = "en0091d";
				} else if (player.isKnight()) {
					htmlid = "en0091k";
				} else if (player.isWizard()) {
					htmlid = "en0091w";
				} else if (player.isCrown()) {
					htmlid = "en0091p";
				}
			} else if (npcid == 71034) { // ���r
				if (player.getInventory().checkItem(41227)) { // �A���b�N�X�̏Љ��
					if (player.isElf()) {
						htmlid = "en0201e";
					} else if (player.isDarkelf()) {
						htmlid = "en0201d";
					} else if (player.isKnight()) {
						htmlid = "en0201k";
					} else if (player.isWizard()) {
						htmlid = "en0201w";
					} else if (player.isCrown()) {
						htmlid = "en0201p";
					}
				}
			} else if (npcid == 71033) { // �n�[�~�b�g
				if (player.getInventory().checkItem(41228)) { // ���r�̂����
					if (player.isElf()) {
						htmlid = "en0211e";
					} else if (player.isDarkelf()) {
						htmlid = "en0211d";
					} else if (player.isKnight()) {
						htmlid = "en0211k";
					} else if (player.isWizard()) {
						htmlid = "en0211w";
					} else if (player.isCrown()) {
						htmlid = "en0211p";
					}
				}
			} else if (npcid == 71026) { // �R�R
				if (player.getLevel() < 10) {
					htmlid = "en0113";
				} else if (player.getLevel() >= 10 && player.getLevel() < 25) {
					htmlid = "en0111";
				} else if (player.getLevel() > 25) {
					htmlid = "en0112";
				}
			} else if (npcid == 71027) { // �N��
				if (player.getLevel() < 10) {
					htmlid = "en0283";
				} else if (player.getLevel() >= 10 && player.getLevel() < 25) {
					htmlid = "en0281";
				} else if (player.getLevel() > 25) {
					htmlid = "en0282";
				}
			} else if (npcid == 71021) { // ���׍H�t�}�b�e�B�[
				if (player.getLevel() < 12) {
					htmlid = "en0197";
				} else if (player.getLevel() >= 12 && player.getLevel() < 25) {
					htmlid = "en0191";
				}
			} else if (npcid == 71022) { // ���׍H�t�W�[�i��
				if (player.getLevel() < 12) {
					htmlid = "jpe0155";
				} else if (player.getLevel() >= 12 && player.getLevel() < 25) {
					if (player.getInventory().checkItem(41230)
							|| player.getInventory().checkItem(41231)
							|| player.getInventory().checkItem(41232)
							|| player.getInventory().checkItem(41233)
							|| player.getInventory().checkItem(41235)
							|| player.getInventory().checkItem(41238)
							|| player.getInventory().checkItem(41239)
							|| player.getInventory().checkItem(41240)) {
						htmlid = "jpe0158";
					}
				}
			} else if (npcid == 71023) { // ���׍H�t�P�[�C
				if (player.getLevel() < 12) {
					htmlid = "jpe0145";
				} else if (player.getLevel() >= 12 && player.getLevel() < 25) {
					if (player.getInventory().checkItem(41233)
							|| player.getInventory().checkItem(41234)) {
						htmlid = "jpe0143";	
					} else if (player.getInventory().checkItem(41238)
							|| player.getInventory().checkItem(41239)
							|| player.getInventory().checkItem(41240)) {
						htmlid = "jpe0147";
					} else if (player.getInventory().checkItem(41235)
							|| player.getInventory().checkItem(41236)
							|| player.getInventory().checkItem(41237)) {
						htmlid = "jpe0144";
					}
				}
			} else if (npcid == 71020) { // �W����
				if (player.getLevel() < 12) {
					htmlid = "jpe0125";
				} else if (player.getLevel() >= 12 && player.getLevel() < 25) {
					if (player.getInventory().checkItem(41231)) {
						htmlid = "jpe0123";	
					} else if (player.getInventory().checkItem(41232)
							|| player.getInventory().checkItem(41233)
							|| player.getInventory().checkItem(41234)
							|| player.getInventory().checkItem(41235)
							|| player.getInventory().checkItem(41238)
							|| player.getInventory().checkItem(41239)
							|| player.getInventory().checkItem(41240)) {
						htmlid = "jpe0126";
					}
				}
			} else if (npcid == 71019) { // ��q���B�[�g
				if (player.getLevel() < 12) {
					htmlid = "jpe0114";
				} else if (player.getLevel() >= 12 && player.getLevel() < 25) {
					if (player.getInventory().checkItem(41239)) { // ���B�[�g�ւ̎莆
						htmlid = "jpe0113";
					} else {
						htmlid = "jpe0111";
					}
				}
			} else if (npcid == 71018) { // �t�F�[�_
				if (player.getLevel() < 12) {
					htmlid = "jpe0133";
				} else if (player.getLevel() >= 12 && player.getLevel() < 25) {
					if (player.getInventory().checkItem(41240)) { // �t�F�[�_�ւ̎莆
						htmlid = "jpe0132";
					} else {
						htmlid = "jpe0131";
					}
				}
			} else if (npcid == 71025) { // �P�X�L��
				if (player.getLevel() < 10) {
					htmlid = "jpe0086";
				} else if (player.getLevel() >= 10 && player.getLevel() < 25) {
					if (player.getInventory().checkItem(41226)) { // �p�S�̖�
						htmlid = "jpe0084";
					} else if (player.getInventory().checkItem(41225)) { // �P�X�L���̔�����
						htmlid = "jpe0083";
					} else if (player.getInventory().checkItem(40653)
							|| player.getInventory().checkItem(40613)) { // �Ԃ����E������
						htmlid = "jpe0081";
					}
				}
			} else if (npcid == 70512) { // ���Ît�i�̂��� ���̒��j
				if (player.getLevel() >= 25) {
					htmlid = "jpe0102";
				}
			} else if (npcid == 70514) { // �w�C�X�g�t
				if (player.getLevel() >= 25) {
					htmlid = "jpe0092";
				}
			} else if (npcid == 71038) { // ���V �m�i��
				if (player.getInventory().checkItem(41060)) { // �m�i���̐��E��
					if (player.getInventory().checkItem(41090) // �l���K�̃g�[�e��
							|| player.getInventory().checkItem(41091) // �h�D�_-�}���̃g�[�e��
							|| player.getInventory().checkItem(41092)) { // �A�g�D�o�̃g�[�e��
						htmlid = "orcfnoname7";
					} else {
						htmlid = "orcfnoname8";
					}
				} else {
					htmlid = "orcfnoname1";
				}
			} else if (npcid == 71040) { // �����c�� �A�g�D�o �m�A
				if (player.getInventory().checkItem(41060)) { // �m�i���̐��E��
					if (player.getInventory().checkItem(41065)) { // �����c�̏؏�
						if (player.getInventory().checkItem(41086) // �X�s���b�h�̍�
								|| player.getInventory().checkItem(41087) // �X�s���b�h�̕\��
								|| player.getInventory().checkItem(41088) // �X�s���b�h�̗t
								|| player.getInventory().checkItem(41089)) { // �X�s���b�h�̖؂̎}
							htmlid = "orcfnoa6";
						} else {
							htmlid = "orcfnoa5";
						}
					} else {
						htmlid = "orcfnoa2";
					}
				} else {
					htmlid = "orcfnoa1";
				}
			} else if (npcid == 71041) { // �l���K �t�E��
				if (player.getInventory().checkItem(41060)) { // �m�i���̐��E��
					if (player.getInventory().checkItem(41064)) { // �����c�̏؏�
						if (player.getInventory().checkItem(41081) // �I�[�N�̃o�b�W
								|| player.getInventory().checkItem(41082) // �I�[�N�̃A�~�����b�g
								|| player.getInventory().checkItem(41083) // �V���[�}���p�E�_�[
								|| player.getInventory().checkItem(41084) // �C�����[�W�����p�E�_�[
								|| player.getInventory().checkItem(41085)) { // �\���҂̃p�[��
							htmlid = "orcfhuwoomo2";
						} else {
							htmlid = "orcfhuwoomo8";
						}
					} else {
						htmlid = "orcfhuwoomo1";
					}
				} else {
					htmlid = "orcfhuwoomo5";
				}
			} else if (npcid == 71042) { // �l���K �o�N��
				if (player.getInventory().checkItem(41060)) { // �m�i���̐��E��
					if (player.getInventory().checkItem(41062)) { // �����c�̏؏�
						if (player.getInventory().checkItem(41071) // ��̂��~
								|| player.getInventory().checkItem(41072) // ��̐C��
								|| player.getInventory().checkItem(41073) // �o���f�B�b�h�̌�
								|| player.getInventory().checkItem(41074) // �o���f�B�b�h�̑�
								|| player.getInventory().checkItem(41075)) { // ���ꂽ���̖�
							htmlid = "orcfbakumo2";
						} else {
							htmlid = "orcfbakumo8";
						}
					} else {
						htmlid = "orcfbakumo1";
					}
				} else {
					htmlid = "orcfbakumo5";
				}
			} else if (npcid == 71043) { // �h�D�_-�}�� �u�J
				if (player.getInventory().checkItem(41060)) { // �m�i���̐��E��
					if (player.getInventory().checkItem(41063)) { // �����c�̏؏�
						if (player.getInventory().checkItem(41076) // ���ꂽ�n�̃R�A
								|| player.getInventory().checkItem(41077) // ���ꂽ���̃R�A
								|| player.getInventory().checkItem(41078) // ���ꂽ�΂̃R�A
								|| player.getInventory().checkItem(41079) // ���ꂽ���̃R�A
								|| player.getInventory().checkItem(41080)) { // ���ꂽ����̃R�A
							htmlid = "orcfbuka2";
						} else {
							htmlid = "orcfbuka8";
						}
					} else {
						htmlid = "orcfbuka1";
					}
				} else {
					htmlid = "orcfbuka5";
				}
			} else if (npcid == 71044) { // �h�D�_-�}�� �J��
				if (player.getInventory().checkItem(41060)) { // �m�i���̐��E��
					if (player.getInventory().checkItem(41061)) { // �����c�̏؏�
						if (player.getInventory().checkItem(41066) // ���ꂽ��
								|| player.getInventory().checkItem(41067) // ���ꂽ�}
								|| player.getInventory().checkItem(41068) // ���ꂽ�����k
								|| player.getInventory().checkItem(41069) // ���ꂽ�^�e�K�~
								|| player.getInventory().checkItem(41070)) { // ���ꂽ�d���̉H
							htmlid = "orcfkame2";
						} else {
							htmlid = "orcfkame8";
						}
					} else {
						htmlid = "orcfkame1";
					}
				} else {
					htmlid = "orcfkame5";
				}
			} else if (npcid == 71055) { // ���P�C���i�C�����̔閧�j
				if (player.getQuest().get_step(L1Quest.QUEST_RESTA)
						== 3) {
					htmlid = "lukein13";
				} else if (player.getQuest().get_step(L1Quest.QUEST_LUKEIN1)
						== L1Quest.QUEST_END
						&& player.getQuest().get_step(L1Quest.QUEST_RESTA)
						== 2
						&& player.getInventory().checkItem(40631)) {
					htmlid = "lukein10";
				} else if (player.getQuest().get_step(L1Quest.QUEST_LUKEIN1)
						== L1Quest.QUEST_END) {
					htmlid = "lukein0";
				} else if (player.getQuest().get_step(L1Quest.QUEST_LUKEIN1)
						== 11) {
					if (player.getInventory().checkItem(40716)) {
						htmlid = "lukein9";
					}
				} else if (player.getQuest().get_step(L1Quest.QUEST_LUKEIN1)
						>= 1
						&& player.getQuest().get_step(L1Quest.QUEST_LUKEIN1)
						<= 10) {
					htmlid = "lukein8";
				}
			} else if (npcid == 71063) { // �����Ȕ�-�P�Ԗځi�C�����̔閧�j
				if (player.getQuest().get_step(L1Quest.QUEST_TBOX1)
						== L1Quest.QUEST_END) {
				} else if (player.getQuest().get_step(L1Quest.QUEST_LUKEIN1)
						== 1) {
					htmlid = "maptbox";
				}
			} else if (npcid == 71064) { // �����Ȕ�-2�Ԗ�-���n�_�i�C�����̔閧�j
				if (player.getQuest().get_step(L1Quest.QUEST_LUKEIN1) == 2) {
					htmlid = talkToSecondtbox(player);
				}
			} else if (npcid == 71065) { // �����Ȕ�-2�Ԗ�-c�n�_�i�C�����̔閧�j
				if (player.getQuest().get_step(L1Quest.QUEST_LUKEIN1) == 3) {
					htmlid = talkToSecondtbox(player);
				}
			} else if (npcid == 71066) { // �����Ȕ�-2�Ԗ�-d�n�_�i�C�����̔閧�j
				if (player.getQuest().get_step(L1Quest.QUEST_LUKEIN1) == 4) {
					htmlid = talkToSecondtbox(player);
				}
			} else if (npcid == 71067) { // �����Ȕ�-3�Ԗ�-e�n�_�i�C�����̔閧�j
				if (player.getQuest().get_step(L1Quest.QUEST_LUKEIN1) == 5) {
					htmlid = talkToThirdtbox(player);
				}
			} else if (npcid == 71068) { // �����Ȕ�-3�Ԗ�-f�n�_�i�C�����̔閧�j
				if (player.getQuest().get_step(L1Quest.QUEST_LUKEIN1) == 6) {
					htmlid = talkToThirdtbox(player);
				}
			} else if (npcid == 71069) { // �����Ȕ�-3�Ԗ�-g�n�_�i�C�����̔閧�j
				if (player.getQuest().get_step(L1Quest.QUEST_LUKEIN1) == 7) {
					htmlid = talkToThirdtbox(player);
				}
			} else if (npcid == 71070) { // �����Ȕ�-3�Ԗ�-h�n�_�i�C�����̔閧�j
				if (player.getQuest().get_step(L1Quest.QUEST_LUKEIN1) == 8) {
					htmlid = talkToThirdtbox(player);
				}
			} else if (npcid == 71071) { // �����Ȕ�-3�Ԗ�-i�n�_�i�C�����̔閧�j
				if (player.getQuest().get_step(L1Quest.QUEST_LUKEIN1) == 9) {
					htmlid = talkToThirdtbox(player);
				}
			} else if (npcid == 71072) { // �����Ȕ�-3�Ԗ�-j�n�_�i�C�����̔閧�j
				if (player.getQuest().get_step(L1Quest.QUEST_LUKEIN1) == 10) {
					htmlid = talkToThirdtbox(player);
				}
			} else if (npcid == 71056) { // �V�~�Y�i���������q�j
				if (player.getQuest().get_step(L1Quest.QUEST_RESTA)
						== 4) {
					if (player.getInventory().checkItem(40631)) {
						htmlid = "SIMIZZ11";
					} else {
						htmlid = "SIMIZZ0";
					}
				} else if (player.getQuest().get_step(L1Quest.QUEST_SIMIZZ)
						== 2) {
					htmlid = "SIMIZZ0";
				} else if (player.getQuest().get_step(L1Quest.QUEST_SIMIZZ)
						== L1Quest.QUEST_END) {
					htmlid = "SIMIZZ15";
				} else if (player.getQuest().get_step(L1Quest.QUEST_SIMIZZ)
						== 1) {
					htmlid = "SIMIZZ6";
				}
			} else if (npcid == 71057) { // �h�C���i��̒n�}1�j
				if (player.getQuest().get_step(L1Quest.QUEST_DOIL)
						== L1Quest.QUEST_END) {
					htmlid = "doil4b";
				}
			} else if (npcid == 71059) { // ���f�B�A���i��̒n�}2�j
				if (player.getQuest().get_step(L1Quest.QUEST_RUDIAN)
						== L1Quest.QUEST_END) {
					htmlid = "rudian1c";
				} else if (player.getQuest().get_step(L1Quest.QUEST_RUDIAN)
						== 1) {
					htmlid = "rudian7";
				} else if (player.getQuest().get_step(L1Quest.QUEST_DOIL)
						== L1Quest.QUEST_END) {
					htmlid = "rudian1b";
				} else {
					htmlid = "rudian1a";
				}
			} else if (npcid == 71060) { // ���X�^�i��̒n�}3�j
				if (player.getQuest().get_step(L1Quest.QUEST_RESTA)
						== L1Quest.QUEST_END) {
					htmlid = "resta1e";
				} else if (player.getQuest().get_step(L1Quest.QUEST_SIMIZZ)
						== L1Quest.QUEST_END) {
					htmlid = "resta14";
				} else if (player.getQuest().get_step(L1Quest.QUEST_RESTA)
						== 4) {
					htmlid = "resta13";
				} else if (player.getQuest().get_step(L1Quest.QUEST_RESTA)
						== 3) {
					htmlid = "resta11";
					player.getQuest().set_step(L1Quest.QUEST_RESTA, 4);
				} else if (player.getQuest().get_step(L1Quest.QUEST_RESTA)
						== 2) {
					htmlid = "resta16";
				} else if (player.getQuest().get_step(L1Quest.QUEST_SIMIZZ)
						== 2 
							&& player.getQuest().get_step(L1Quest.
									QUEST_CADMUS) == 1
							|| player.getInventory().checkItem(40647)) {
					htmlid = "resta1a";
				} else if (player.getQuest().get_step(L1Quest.QUEST_CADMUS)
						== 1 
						|| player.getInventory().checkItem(40647)) {
					htmlid = "resta1c";
				} else if (player.getQuest().get_step(L1Quest.QUEST_SIMIZZ)
						== 2) {
					htmlid = "resta1b";
				}
			} else if (npcid == 71061) { // �J�h���X�i��̒n�}4�j
				if (player.getQuest().get_step(L1Quest.QUEST_CADMUS)
						== L1Quest.QUEST_END) {
					htmlid = "cadmus1c";
				} else if (player.getQuest().get_step(L1Quest.QUEST_CADMUS)
						== 3) {
					htmlid = "cadmus8";
				} else if (player.getQuest().get_step(L1Quest.QUEST_CADMUS)
						== 2) {
					htmlid = "cadmus1a";
				} else if (player.getQuest().get_step(L1Quest.QUEST_DOIL)
						== L1Quest.QUEST_END) {
					htmlid = "cadmus1b";
				}
			} else if (npcid == 71036) { // �J�~�[���i�h���C�N�̐^���j
				if (player.getQuest().get_step(L1Quest.QUEST_KAMYLA)
						== L1Quest.QUEST_END) {
					htmlid = "kamyla26";
				} else if (player.getQuest().get_step(L1Quest.QUEST_KAMYLA)
						== 4 && player.getInventory().checkItem(40717)) {
					htmlid = "kamyla15";
				} else if (player.getQuest().get_step(L1Quest.QUEST_KAMYLA)
						== 4 ) {
					htmlid = "kamyla14";
				} else if (player.getQuest().get_step(L1Quest.QUEST_KAMYLA)
						== 3 && player.getInventory().checkItem(40630)) {
					htmlid = "kamyla12";
				} else if (player.getQuest().get_step(L1Quest.QUEST_KAMYLA)
						== 3 ) {
					htmlid = "kamyla11";
				} else if (player.getQuest().get_step(L1Quest.QUEST_KAMYLA)
						== 2 && player.getInventory().checkItem(40644)) {
					htmlid = "kamyla9";
				} else if (player.getQuest().get_step(L1Quest.QUEST_KAMYLA)
						== 1 ) {
					htmlid = "kamyla8";
				} else if (player.getQuest().get_step(L1Quest.QUEST_CADMUS)
						==  L1Quest.QUEST_END && player.getInventory()
							.checkItem(40621)) {
					htmlid = "kamyla1";
				}
			} else if (npcid == 71089) { // �t�����R�i�h���C�N�̐^���j
				if (player.getQuest().get_step(L1Quest.QUEST_KAMYLA)
						== 2 ) {
					htmlid = "francu12";
				}
			} else if (npcid == 71090) { // �����̃N���X�^��2�i�h���C�N�̐^���j
				if (player.getQuest().get_step(L1Quest.QUEST_CRYSTAL)
						== 1 && player.getInventory().checkItem(40620)) {
					htmlid = "jcrystal2";
				} else if (player.getQuest().get_step(L1Quest.QUEST_CRYSTAL)
						== 1){
					htmlid = "jcrystal3";
				}
			} else if (npcid == 71091) { // �����̃N���X�^��3�i�h���C�N�̐^���j
				if (player.getQuest().get_step(L1Quest.QUEST_CRYSTAL)
						== 2 && player.getInventory().checkItem(40654)) {
					htmlid = "jcrystall2";
				}
			} else if (npcid == 71074) { // ���U�[�h�}���̒��V
				if (player.getQuest().get_step(L1Quest.QUEST_LIZARD)
						== L1Quest.QUEST_END) {
					htmlid = "lelder0";
				} else if (player.getQuest().get_step(L1Quest.QUEST_LIZARD)
						== 3  && player.getInventory().checkItem(40634)) {
					htmlid = "lelder12";
				} else if (player.getQuest().get_step(L1Quest.QUEST_LIZARD)
						== 3) {
					htmlid = "lelder11";
				} else if (player.getQuest().get_step(L1Quest.QUEST_LIZARD)
						== 2  && player.getInventory().checkItem(40633)) {
					htmlid = "lelder7";
				} else if (player.getQuest().get_step(L1Quest.QUEST_LIZARD)
						== 2) {
					htmlid = "lelder7b";
				} else if (player.getQuest().get_step(L1Quest.QUEST_LIZARD)
						== 1) {
					htmlid = "lelder7b";
				} else if (player.getLevel() >= 40) {
					htmlid = "lelder1";
				}
			} else if (npcid == 71076) { // �����O���U�[�h�}���t�@�C�^�[
				if (player.getQuest().get_step(L1Quest.QUEST_LIZARD)
						== L1Quest.QUEST_END) {
					htmlid = "ylizardb";
				} else {
				}
			} else if (npcid == 80079) { // �P�v���V��
				if (player.getQuest().get_step(L1Quest.QUEST_KEPLISHA)
						== L1Quest.QUEST_END
								&& !player.getInventory().checkItem(41312)) {
					htmlid = "keplisha6";
				} else {
					if (player.getInventory().checkItem(41314)) { // �萯�p�t�̂����
						htmlid = "keplisha3";
					} else if (player.getInventory().checkItem(41313)) { // �萯�p�t�̋�
						htmlid = "keplisha2";
					} else if (player.getInventory().checkItem(41312)) { // �萯�p�t�̚�
						htmlid = "keplisha4";
					}
				}
			} else if (npcid == 80102) { // �t�B���X
				if (player.getInventory().checkItem(41329)) { // �����̐���˗���
					htmlid = "fillis3";
				}
			} else if (npcid == 71167) { // �t����
				if (player.getTempCharGfx() == 3887) {// �L�������O�_�[�N�G���t�ϐg
					htmlid = "frim1";
				}
			} else if (npcid == 71141) { // �B�v�I�[��1
				if (player.getTempCharGfx() == 3887) {// �L�������O�_�[�N�G���t�ϐg
					htmlid = "moumthree1";
				}
			} else if (npcid == 71142) { // �B�v�I�[��2
				if (player.getTempCharGfx() == 3887) {// �L�������O�_�[�N�G���t�ϐg
					htmlid = "moumtwo1";
				}
			} else if (npcid == 71145) { // �B�v�I�[��3
				if (player.getTempCharGfx() == 3887) {// �L�������O�_�[�N�G���t�ϐg
					htmlid = "moumone1";
				}
			} else if (npcid == 71198) { // �b���c�� �e�B�I��
				if (player.getQuest().get_step(71198) == 1) {
					htmlid = "tion4";
				} else if (player.getQuest().get_step(71198) == 2) {
					htmlid = "tion5";
				} else if (player.getQuest().get_step(71198) == 3) {
					htmlid = "tion6";
				} else if (player.getQuest().get_step(71198) == 4) {
					htmlid = "tion7";
				} else if (player.getQuest().get_step(71198) == 5) {
					htmlid = "tion5";
				} else if (player.getInventory().checkItem(21059, 1)) {
					htmlid = "tion19";
				}
			} else if (npcid == 71199) { // �W�F����
				if (player.getQuest().get_step(71199) == 1) {
					htmlid = "jeron3";
				} else if (player.getInventory().checkItem(21059, 1)
						|| player.getQuest().get_step(71199) == 255) {
					htmlid = "jeron7";
				}
			
			} else if (npcid == 81200) { // ���T�A�C�e���Ǘ��l
				if (player.getInventory().checkItem(21069) // �V���̃x���g
						|| player.getInventory().checkItem(21074)) { // �e�r�̃C�A�����O
					htmlid = "c_belt";
				}
			} else if (npcid == 80076) { // �|�ꂽ�q�C�m
				if (player.getInventory().checkItem(41058)) { // ���������q�C����
					htmlid = "voyager8";
				} else if (player.getInventory().checkItem(49082) // �������̍q�C����
						|| player.getInventory().checkItem(49083)) {
						// �y�[�W��ǉ����Ă��Ȃ����
					if (player.getInventory().checkItem(41038) // �q�C���� 1�y�[�W
							|| player.getInventory().checkItem(41039) // �q�C����
																		// 2�y�[�W
							|| player.getInventory().checkItem(41039) // �q�C����
																		// 3�y�[�W
							|| player.getInventory().checkItem(41039) // �q�C����
																		// 4�y�[�W
							|| player.getInventory().checkItem(41039) // �q�C����
																		// 5�y�[�W
							|| player.getInventory().checkItem(41039) // �q�C����
																		// 6�y�[�W
							|| player.getInventory().checkItem(41039) // �q�C����
																		// 7�y�[�W
							|| player.getInventory().checkItem(41039) // �q�C����
																		// 8�y�[�W
							|| player.getInventory().checkItem(41039) // �q�C����
																		// 9�y�[�W
							|| player.getInventory().checkItem(41039)){ // �q�C����
																		// 10�y�[�W
						htmlid = "voyager9";
					} else {
						htmlid = "voyager7";
					}
				} else if (player.getInventory().checkItem(49082) // �������̍q�C����
						|| player.getInventory().checkItem(49083)
						|| player.getInventory().checkItem(49084)
						|| player.getInventory().checkItem(49085)
						|| player.getInventory().checkItem(49086)
						|| player.getInventory().checkItem(49087)
						|| player.getInventory().checkItem(49088)
						|| player.getInventory().checkItem(49089)
						|| player.getInventory().checkItem(49090)
						|| player.getInventory().checkItem(49091)) {
						// �y�[�W��ǉ��������
					htmlid = "voyager7";
				}
			} else if (npcid == 80048) { // ��Ԃ̘c��
				int level = player.getLevel();
				if (level <= 44) {
					htmlid = "entgate3";
				} else if (level >= 45 && level <= 51) {
					htmlid = "entgate2";
				} else {
					htmlid = "entgate";
				}
			} else if (npcid == 71168) { // �^���� �_���e�X
				if (player.getInventory().checkItem(41028)) { // �f�X�i�C�g�̏�
					htmlid = "dantes1";
				}
			} else if (npcid == 80067) { // �����(�~�]�̓��A)
				if (player.getQuest().get_step(L1Quest.QUEST_DESIRE)
						== L1Quest.QUEST_END) {
					htmlid = "minicod10";
				} else if (player.getKarmaLevel() >= 1) {				
					htmlid = "minicod07";
				} else if (player.getQuest().get_step(L1Quest.QUEST_DESIRE)
						== 1 && player.getTempCharGfx() == 6034) { // �R���v�v���[�X�g�ϐg
					htmlid = "minicod03";
				} else if (player.getQuest().get_step(L1Quest.QUEST_DESIRE)
						== 1 && player.getTempCharGfx() != 6034) {
					htmlid = "minicod05";
				} else if (player.getQuest().get_step(L1Quest.QUEST_SHADOWS)
						== L1Quest.QUEST_END // �e�̐_�a���N�G�X�g�I��
						|| player.getInventory().checkItem(41121) // �J�w���̎w�ߏ�
						|| player.getInventory().checkItem(41122)) { // �J�w���̖��ߏ�
					htmlid = "minicod01";
				} else if (player.getInventory().checkItem(41130) // �����̎w�ߏ�
						&& player.getInventory().checkItem(41131)) { // �����̖��ߏ�
					htmlid = "minicod06";
				} else if (player.getInventory().checkItem(41130)) { // �����̖��ߏ�
					htmlid = "minicod02";
				}
			} else if (npcid == 81202) { // �����(�e�̐_�a)
				if (player.getQuest().get_step(L1Quest.QUEST_SHADOWS)
						== L1Quest.QUEST_END) {
					htmlid = "minitos10";
				} else if (player.getKarmaLevel() <= -1) {				
					htmlid = "minitos07";
				} else if (player.getQuest().get_step(L1Quest.QUEST_SHADOWS)
						== 1 && player.getTempCharGfx() == 6035) { // ���b�T�[�f�[�����ϐg
					htmlid = "minitos03";
				} else if (player.getQuest().get_step(L1Quest.QUEST_SHADOWS)
						== 1 && player.getTempCharGfx() != 6035) {
					htmlid = "minitos05";
				} else if (player.getQuest().get_step(L1Quest.QUEST_DESIRE)
						== L1Quest.QUEST_END // �~�]�̓��A���N�G�X�g�I��
						|| player.getInventory().checkItem(41130) // �����̎w�ߏ�
						|| player.getInventory().checkItem(41131)) { // �����̖��ߏ�
					htmlid = "minitos01";
				} else if (player.getInventory().checkItem(41121) // �J�w���̎w�ߏ�
						&& player.getInventory().checkItem(41122)) { // �J�w���̖��ߏ�
					htmlid = "minitos06";
				} else if (player.getInventory().checkItem(41121)) { // �J�w���̖��ߏ�
					htmlid = "minitos02";
				}
			} else if (npcid == 81208) { // ���ꂽ�u���b�u
				if (player.getInventory().checkItem(41129) // �����̐���
						||	player.getInventory().checkItem(41138)) { // �J�w���̐���
					htmlid = "minibrob04";
				} else if (player.getInventory().checkItem(41126) // �����̑���������
						&& player.getInventory().checkItem(41127) // �����̖��͂Ȑ���
						&& player.getInventory().checkItem(41128) // �����̉䎷�Ȑ���
						|| player.getInventory().checkItem(41135) // �J�w���̑���������
						&& player.getInventory().checkItem(41136) // �J�w���̉䎷�Ȑ���
						&& player.getInventory().checkItem(41137)) { // �J�w���̉䎷�Ȑ���
					htmlid = "minibrob02";
				}
			} else if (npcid == 50113) { // �k�J�̑� ���b�N�}��
				if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== L1Quest.QUEST_END) {
					htmlid = "orena14";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 1) {
					htmlid = "orena0";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 2) {
					htmlid = "orena2";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 3) {
					htmlid = "orena3";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 4) {
					htmlid = "orena4";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 5) {
					htmlid = "orena5";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 6) {
					htmlid = "orena6";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 7) {
					htmlid = "orena7";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 8) {
					htmlid = "orena8";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 9) {
					htmlid = "orena9";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 10) {
					htmlid = "orena10";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 11) {
					htmlid = "orena11";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 12) {
					htmlid = "orena12";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 13) {
					htmlid = "orena13";
				}
			} else if (npcid == 50112) { // ���E�̂��� �Z���A��
				if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== L1Quest.QUEST_END) {
					htmlid = "orenb14";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 1) {
					htmlid = "orenb0";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 2) {
					htmlid = "orenb2";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 3) {
					htmlid = "orenb3";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 4) {
					htmlid = "orenb4";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 5) {
					htmlid = "orenb5";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 6) {
					htmlid = "orenb6";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 7) {
					htmlid = "orenb7";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 8) {
					htmlid = "orenb8";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 9) {
					htmlid = "orenb9";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 10) {
					htmlid = "orenb10";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 11) {
					htmlid = "orenb11";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 12) {
					htmlid = "orenb12";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 13) {
					htmlid = "orenb13";
				}
			} else if (npcid == 50111) { // �b���铇 �����[
				if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== L1Quest.QUEST_END) {
					htmlid = "orenc14";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 1) {
					htmlid = "orenc1";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 2) {
					htmlid = "orenc0";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 3) {
					htmlid = "orenc3";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 4) {
					htmlid = "orenc4";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 5) {
					htmlid = "orenc5";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 6) {
					htmlid = "orenc6";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 7) {
					htmlid = "orenc7";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 8) {
					htmlid = "orenc8";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 9) {
					htmlid = "orenc9";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 10) {
					htmlid = "orenc10";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 11) {
					htmlid = "orenc11";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 12) {
					htmlid = "orenc12";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 13) {
					htmlid = "orenc13";
				}
			} else if (npcid == 50116) { // �O���f�B�I �M�I��
				if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== L1Quest.QUEST_END) {
					htmlid = "orend14";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 1) {
					htmlid = "orend3";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 2) {
					htmlid = "orend1";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 3) {
					htmlid = "orend0";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 4) {
					htmlid = "orend4";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 5) {
					htmlid = "orend5";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 6) {
					htmlid = "orend6";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 7) {
					htmlid = "orend7";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 8) {
					htmlid = "orend8";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 9) {
					htmlid = "orend9";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 10) {
					htmlid = "orend10";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 11) {
					htmlid = "orend11";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 12) {
					htmlid = "orend12";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 13) {
					htmlid = "orend13";
				}
			} else if (npcid == 50117) { // �P���g �V���A
				if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== L1Quest.QUEST_END) {
					htmlid = "orene14";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 1) {
					htmlid = "orene3";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 2) {
					htmlid = "orene4";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 3) {
					htmlid = "orene1";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 4) {
					htmlid = "orene0";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 5) {
					htmlid = "orene5";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 6) {
					htmlid = "orene6";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 7) {
					htmlid = "orene7";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 8) {
					htmlid = "orene8";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 9) {
					htmlid = "orene9";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 10) {
					htmlid = "orene10";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 11) {
					htmlid = "orene11";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 12) {
					htmlid = "orene12";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 13) {
					htmlid = "orene13";
				}
			} else if (npcid == 50119) { // �E�b�h�x�b�N �I�V�[���A
				if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== L1Quest.QUEST_END) {
					htmlid = "orenf14";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 1) {
					htmlid = "orenf3";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 2) {
					htmlid = "orenf4";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 3) {
					htmlid = "orenf5";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 4) {
					htmlid = "orenf1";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 5) {
					htmlid = "orenf0";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 6) {
					htmlid = "orenf6";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 7) {
					htmlid = "orenf7";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 8) {
					htmlid = "orenf8";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 9) {
					htmlid = "orenf9";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 10) {
					htmlid = "orenf10";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 11) {
					htmlid = "orenf11";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 12) {
					htmlid = "orenf12";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 13) {
					htmlid = "orenf13";
				}
			} else if (npcid == 50121) { // �Γc�� �z�[�j��
				if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== L1Quest.QUEST_END) {
					htmlid = "oreng14";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 1) {
					htmlid = "oreng3";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 2) {
					htmlid = "oreng4";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 3) {
					htmlid = "oreng5";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 4) {
					htmlid = "oreng6";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 5) {
					htmlid = "oreng1";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 6) {
					htmlid = "oreng0";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 7) {
					htmlid = "oreng7";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 8) {
					htmlid = "oreng8";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 9) {
					htmlid = "oreng9";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 10) {
					htmlid = "oreng10";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 11) {
					htmlid = "oreng11";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 12) {
					htmlid = "oreng12";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 13) {
					htmlid = "oreng13";
				}
			} else if (npcid == 50114) { // �G���t�̐X �`�R
				if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== L1Quest.QUEST_END) {
					htmlid = "orenh14";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 1) {
					htmlid = "orenh3";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 2) {
					htmlid = "orenh4";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 3) {
					htmlid = "orenh5";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 4) {
					htmlid = "orenh6";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 5) {
					htmlid = "orenh7";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 6) {
					htmlid = "orenh1";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 7) {
					htmlid = "orenh0";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 8) {
					htmlid = "orenh8";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 9) {
					htmlid = "orenh9";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 10) {
					htmlid = "orenh10";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 11) {
					htmlid = "orenh11";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 12) {
					htmlid = "orenh12";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 13) {
					htmlid = "orenh13";
				}
			} else if (npcid == 50120) { // �V���o�[�i�C�g�^�E�� �z�b�v
				if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== L1Quest.QUEST_END) {
					htmlid = "oreni14";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 1) {
					htmlid = "oreni3";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 2) {
					htmlid = "oreni4";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 3) {
					htmlid = "oreni5";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 4) {
					htmlid = "oreni6";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 5) {
					htmlid = "oreni7";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 6) {
					htmlid = "oreni8";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 7) {
					htmlid = "oreni1";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 8) {
					htmlid = "oreni0";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 9) {
					htmlid = "oreni9";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 10) {
					htmlid = "oreni10";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 11) {
					htmlid = "oreni11";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 12) {
					htmlid = "oreni12";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 13) {
					htmlid = "oreni13";
				}
			} else if (npcid == 50122) { // �M���� �^�[�N
				if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== L1Quest.QUEST_END) {
					htmlid = "orenj14";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 1) {
					htmlid = "orenj3";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 2) {
					htmlid = "orenj4";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 3) {
					htmlid = "orenj5";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 4) {
					htmlid = "orenj6";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 5) {
					htmlid = "orenj7";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 6) {
					htmlid = "orenj8";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 7) {
					htmlid = "orenj9";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 8) {
					htmlid = "orenj1";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 9) {
					htmlid = "orenj0";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 10) {
					htmlid = "orenj10";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 11) {
					htmlid = "orenj11";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 12) {
					htmlid = "orenj12";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 13) {
					htmlid = "orenj13";
				}
			} else if (npcid == 50123) { // �n�C�l �K���I��
				if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== L1Quest.QUEST_END) {
					htmlid = "orenk14";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 1) {
					htmlid = "orenk3";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 2) {
					htmlid = "orenk4";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 3) {
					htmlid = "orenk5";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 4) {
					htmlid = "orenk6";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 5) {
					htmlid = "orenk7";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 6) {
					htmlid = "orenk8";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 7) {
					htmlid = "orenk9";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 8) {
					htmlid = "orenk10";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 9) {
					htmlid = "orenk1";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 10) {
					htmlid = "orenk0";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 11) {
					htmlid = "orenk11";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 12) {
					htmlid = "orenk12";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 13) {
					htmlid = "orenk13";
				}
			} else if (npcid == 50125) { // �ۉ�̓� �M���o�[�g
				if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== L1Quest.QUEST_END) {
					htmlid = "orenl14";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 1) {
					htmlid = "orenl3";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 2) {
					htmlid = "orenl4";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 3) {
					htmlid = "orenl5";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 4) {
					htmlid = "orenl6";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 5) {
					htmlid = "orenl7";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 6) {
					htmlid = "orenl8";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 7) {
					htmlid = "orenl9";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 8) {
					htmlid = "orenl10";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 9) {
					htmlid = "orenl11";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 10) {
					htmlid = "orenl1";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 11) {
					htmlid = "orenl0";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 12) {
					htmlid = "orenl12";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 13) {
					htmlid = "orenl13";
				}
			} else if (npcid == 50124) { // �E�F���_�� �t�H���J��
				if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== L1Quest.QUEST_END) {
					htmlid = "orenm14";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 1) {
					htmlid = "orenm3";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 2) {
					htmlid = "orenm4";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 3) {
					htmlid = "orenm5";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 4) {
					htmlid = "orenm6";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 5) {
					htmlid = "orenm7";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 6) {
					htmlid = "orenm8";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 7) {
					htmlid = "orenm9";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 8) {
					htmlid = "orenm10";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 9) {
					htmlid = "orenm11";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 10) {
					htmlid = "orenm12";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 11) {
					htmlid = "orenm1";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 12) {
					htmlid = "orenm0";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 13) {
					htmlid = "orenm13";
				}
			} else if (npcid == 50126) { // �A�f�� �W�F���b�N
				if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== L1Quest.QUEST_END) {
					htmlid = "orenn14";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 1) {
					htmlid = "orenn3";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 2) {
					htmlid = "orenn4";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 3) {
					htmlid = "orenn5";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 4) {
					htmlid = "orenn6";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 5) {
					htmlid = "orenn7";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 6) {
					htmlid = "orenn8";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 7) {
					htmlid = "orenn9";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 8) {
					htmlid = "orenn10";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 9) {
					htmlid = "orenn11";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 10) {
					htmlid = "orenn12";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 11) {
					htmlid = "orenn13";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 12) {
					htmlid = "orenn1";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 13) {
					htmlid = "orenn0";
				}
			} else if (npcid == 50115) { // ���ق̓��A �U���}��
				if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== L1Quest.QUEST_END) {
					htmlid = "oreno0";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 1) {
					htmlid = "oreno3";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 2) {
					htmlid = "oreno4";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 3) {
					htmlid = "oreno5";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 4) {
					htmlid = "oreno6";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 5) {
					htmlid = "oreno7";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 6) {
					htmlid = "oreno8";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 7) {
					htmlid = "oreno9";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 8) {
					htmlid = "oreno10";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 9) {
					htmlid = "oreno11";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 10) {
					htmlid = "oreno12";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 11) {
					htmlid = "oreno13";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 12) {
					htmlid = "oreno14";
				} else if (player.getQuest().get_step(L1Quest.QUEST_TOSCROLL)
						== 13) {
					htmlid = "oreno1";
				}
			} else if (npcid == 71256) { // ���r���t�b�h
				if (!player.isElf()) {
					htmlid = "robinhood2";
				} else if (player.getQuest().get_step(L1Quest
						.QUEST_MOONOFLONGBOW) == 255) {
					htmlid = "robinhood12";
				} else if (player.getQuest().get_step(L1Quest
						.QUEST_MOONOFLONGBOW) == 8) {
					if (player.getInventory().checkItem(40491,30)
							&& player.getInventory().checkItem(40495,40)
							&& player.getInventory().checkItem(100,1)
							&& player.getInventory().checkItem(40509,12)
							&& player.getInventory().checkItem(40052,1)
							&& player.getInventory().checkItem(40053,1)
							&& player.getInventory().checkItem(40054,1)
							&& player.getInventory().checkItem(40055,1)
							&& player.getInventory().checkItem(41347,1)
							&& player.getInventory().checkItem(41350,1)) {
						htmlid = "robinhood11";
					} else if (player.getInventory().checkItem(40491,30)
							&& player.getInventory().checkItem(40495,40)
							&& player.getInventory().checkItem(100,1)
							&& player.getInventory().checkItem(40509,12)) {
						htmlid = "robinhood16";
					} else if ((!(player.getInventory().checkItem(40491,30)
							&& player.getInventory().checkItem(40495,40)
							&& player.getInventory().checkItem(100,1)
							&& player.getInventory().checkItem(40509,12)))) {
						htmlid = "robinhood17";
					}
				} else if (player.getQuest().get_step(L1Quest
						.QUEST_MOONOFLONGBOW) == 7) {
					if (player.getInventory().checkItem(41352,4)
							&& player.getInventory().checkItem(40618,30)
							&& player.getInventory().checkItem(40643,30)
							&& player.getInventory().checkItem(40645,30)
							&& player.getInventory().checkItem(40651,30)
							&& player.getInventory().checkItem(40676,30)
							&& player.getInventory().checkItem(40514,20)
							&& player.getInventory().checkItem(41351,1)
							&& player.getInventory().checkItem(41346,1)) {
						htmlid = "robinhood9";
					} else if (player.getInventory().checkItem(41351,1)
							&& player.getInventory().checkItem(41352,4)) {
						htmlid = "robinhood14";
					} else if (player.getInventory().checkItem(41351,1)
							&& (!(player.getInventory().checkItem(41352,4)))) {
						htmlid = "robinhood15";
					} else if (player.getInventory().checkItem(41351)) {
						htmlid = "robinhood9";
					} else {
						htmlid = "robinhood18";
					}
				} else if ((player.getQuest().get_step(L1Quest
								.QUEST_MOONOFLONGBOW) == 2)
						|| (player.getQuest().get_step(L1Quest
								.QUEST_MOONOFLONGBOW) == 3)
						|| (player.getQuest().get_step(L1Quest
								.QUEST_MOONOFLONGBOW) == 4)
						|| (player.getQuest().get_step(L1Quest
								.QUEST_MOONOFLONGBOW) == 5)
						|| (player.getQuest().get_step(L1Quest
								.QUEST_MOONOFLONGBOW) == 6)) {
					htmlid = "robinhood13";
				} else if (player.getQuest().get_step(L1Quest
						.QUEST_MOONOFLONGBOW) == 1) {
					htmlid = "robinhood8";
				} else {
					htmlid = "robinhood1";
				}
			} else if (npcid == 71257) { // �W�u����
				if (!player.isElf()) {
					htmlid = "zybril16";
				} else if ((player.getQuest().get_step(L1Quest
						.QUEST_MOONOFLONGBOW) >= 7)) {
					htmlid = "zybril19";
				} else if (player.getInventory().checkItem(41349)
						&& (player.getQuest().get_step(L1Quest
								.QUEST_MOONOFLONGBOW) == 7)) {
					htmlid = "zybril19";
				} else if (player.getInventory().checkItem(41349)
						&& (player.getQuest().get_step(L1Quest
								.QUEST_MOONOFLONGBOW) == 6)) {
					htmlid = "zybril18";
				} else if ((player.getQuest().get_step(L1Quest
								.QUEST_MOONOFLONGBOW) == 6)
						&& (!(player.getInventory().checkItem(41354)))) {
					htmlid = "zybril7";
				} else if ((player.getQuest().get_step(L1Quest
								.QUEST_MOONOFLONGBOW) == 6)
						&& player.getInventory().checkItem(41354)) {
					htmlid = "zybril17";
				} else if (player.getInventory().checkItem(41353)
						&& player.getInventory().checkItem(40514,10)
						&& player.getQuest().get_step(L1Quest
								.QUEST_MOONOFLONGBOW) == 5) {
					htmlid = "zybril8";
				} else if (player.getQuest().get_step(L1Quest
						.QUEST_MOONOFLONGBOW) == 5) {
					htmlid = "zybril13";
				} else if (player.getQuest().get_step(L1Quest
								.QUEST_MOONOFLONGBOW) == 4
						&& player.getInventory().checkItem(40048,10)
						&& player.getInventory().checkItem(40049,10)
						&& player.getInventory().checkItem(40050,10)
						&& player.getInventory().checkItem(40051,10)) {
					htmlid = "zybril7";
				} else if (player.getQuest().get_step(L1Quest
						.QUEST_MOONOFLONGBOW) == 4) {
					htmlid = "zybril12";
				} else if (player.getQuest().get_step(L1Quest
						.QUEST_MOONOFLONGBOW) == 3) {
					htmlid = "zybril3";
				} else if ((player.isElf())
						&& ((player.getQuest().get_step(L1Quest
								.QUEST_MOONOFLONGBOW) == 2)
						|| (player.getQuest().get_step(L1Quest
								.QUEST_MOONOFLONGBOW) == 1))){
					htmlid = "zybril1";
				} else {
					htmlid = "zybril1";
				}
			} else if (npcid == 71258) { // �}���o
				if (player.getLawful() <= -501) {
					htmlid = "marba1";
				} else if (player.isCrown()
						|| player.isDarkelf()
						|| player.isKnight()
						|| player.isWizard()
						|| player.isDragonKnight()
						|| player.isIllusionist()) {
					htmlid = "marba2";
				} else if (player.getInventory().checkItem(40665)
						&& (player.getInventory().checkItem(40693)
						|| player.getInventory().checkItem(40694)
						|| player.getInventory().checkItem(40695)
						|| player.getInventory().checkItem(40697)
						|| player.getInventory().checkItem(40698)
						|| player.getInventory().checkItem(40699))) {
					htmlid = "marba8";
				} else if(player.getInventory().checkItem(40665)) {
					htmlid = "marba17";
				} else if (player.getInventory().checkItem(40664)) {
					htmlid = "marba19";
				} else if (player.getInventory().checkItem(40637)) {
					htmlid = "marba18";
				} else {
					htmlid = "marba3";
				}
			} else if (npcid == 71259) { // �A���X
				if (player.getLawful() <= -501) {
					htmlid = "aras12";
				} else if (player.isCrown()
						|| player.isDarkelf()
						|| player.isKnight()
						|| player.isWizard()
						|| player.isDragonKnight()
						|| player.isIllusionist()) {
					htmlid = "aras11";
				} else if (player.getInventory().checkItem(40665)
						&& (player.getInventory().checkItem(40679)
						|| player.getInventory().checkItem(40680)
						|| player.getInventory().checkItem(40681)
						|| player.getInventory().checkItem(40682)
						|| player.getInventory().checkItem(40683)
						|| player.getInventory().checkItem(40684))) {
					htmlid = "aras3";
				} else if (player.getInventory().checkItem(40665)) {
					htmlid = "aras8";
				} else if (player.getInventory().checkItem(40679)
						|| player.getInventory().checkItem(40680)
						|| player.getInventory().checkItem(40681)
						|| player.getInventory().checkItem(40682)
						|| player.getInventory().checkItem(40683)
						|| player.getInventory().checkItem(40684)
						|| player.getInventory().checkItem(40693)
						|| player.getInventory().checkItem(40694)
						|| player.getInventory().checkItem(40695)
						|| player.getInventory().checkItem(40697)
						|| player.getInventory().checkItem(40698)
						|| player.getInventory().checkItem(40699)) {
					htmlid = "aras3";
				} else if(player.getInventory().checkItem(40664)) {
					htmlid = "aras6";
				} else if(player.getInventory().checkItem(40637)) {
					htmlid = "aras1";
				} else {
					htmlid ="aras7";
				}
			} else if (npcid == 70838) { // �l���t�@
				if (player.isCrown()
						|| player.isKnight()
						|| player.isWizard()
						|| player.isDragonKnight()
						|| player.isIllusionist()) {
					htmlid = "nerupam1";
				} else if (player.isDarkelf()
						&& (player.getLawful() <= -1)) {
					htmlid = "nerupaM2";
				} else if (player.isDarkelf()) {
					htmlid = "nerupace1";
				} else if (player.isElf()) {
					htmlid = "nerupae1";
				}
			} else if (npcid == 80094) { // �Ւd
				if (player.isIllusionist()) {
					htmlid = "altar1";
				} else if (!player.isIllusionist()) {
					htmlid = "altar2";
				}
			} else if (npcid == 80099) { // �����c�������\��
				if (player.getQuest().get_step(L1Quest
						.QUEST_GENERALHAMELOFRESENTMENT) == 1) {
					if (player.getInventory().checkItem(41325, 1)) {
						htmlid = "rarson8";
					} else {
						htmlid = "rarson10";
					}
				} else if (player.getQuest().get_step(L1Quest
						.QUEST_GENERALHAMELOFRESENTMENT) == 2) {
					if (player.getInventory().checkItem(41317, 1)
							&& player.getInventory().checkItem(41315, 1)) {
						htmlid = "rarson13";
					} else {
						htmlid = "rarson19";
					}
				} else if (player.getQuest().get_step(L1Quest
						.QUEST_GENERALHAMELOFRESENTMENT) == 3) {
					htmlid = "rarson14";
				} else if (player.getQuest().get_step(L1Quest
						.QUEST_GENERALHAMELOFRESENTMENT) == 4) {
					if (!(player.getInventory().checkItem(41326, 1))) {
						htmlid = "rarson18";
					} else if (player.getInventory().checkItem(41326, 1)) {
						htmlid = "rarson11";
					} else {
						htmlid = "rarson17";
					}
				} else if (player.getQuest().get_step(L1Quest
						.QUEST_GENERALHAMELOFRESENTMENT) >= 5 ) {
					htmlid = "rarson1";
				}
			} else if (npcid == 80101) { // �N�G��
				if (player.getQuest().get_step(L1Quest
						.QUEST_GENERALHAMELOFRESENTMENT) == 4) {
					if ((player.getInventory().checkItem(41315, 1))
							&& player.getInventory().checkItem(40494, 30)
							&& player.getInventory().checkItem(41317, 1)) {
						htmlid = "kuen4";
					} else if (player.getInventory().checkItem(41316, 1)) {
						htmlid = "kuen1";
					} else if (!player.getInventory().checkItem(41316)) {
						player.getQuest().set_step(L1Quest
								.QUEST_GENERALHAMELOFRESENTMENT, 1);
					}
				} else if ((player.getQuest().get_step(L1Quest
						.QUEST_GENERALHAMELOFRESENTMENT) == 2)
						&& (player.getInventory().checkItem(41317, 1))) {
					htmlid = "kuen3";
				} else {
					htmlid = "kuen1";
				}
			} else if (npcid == 80134) { // �^���I��
				if(player.isDragonKnight()) { // �h���S���i�C�g
					int lv30_step = quest.get_step(L1Quest.QUEST_LEVEL30);
					int lv45_step = quest.get_step(L1Quest.QUEST_LEVEL45);
					if(player.getLevel() >= 30 && lv30_step == 2) {
						htmlid = "talrion1";
					} else if(player.getLevel() >= 45 && lv45_step == 5) {
						htmlid = "talrion9";
					}
				}
			} else if (npcid == 80135) { // �G�����X
				if(player.isDragonKnight()) { // �h���S���i�C�g
					int lv30_step = quest.get_step(L1Quest.QUEST_LEVEL30);
					if (lv30_step == L1Quest.QUEST_END) {
						htmlid = "elas6";
					} else  if(player.getLevel() >= 30
							&& lv30_step >= 1) {
						htmlid = "elas1";
					}
				}
			} else if (npcid == 80136) { // ���V �v���P��
				int lv15_step = quest.get_step(L1Quest.QUEST_LEVEL15);
				int lv30_step = quest.get_step(L1Quest.QUEST_LEVEL30);
				int lv45_step = quest.get_step(L1Quest.QUEST_LEVEL45);
				int lv50_step = quest.get_step(L1Quest.QUEST_LEVEL50);
				if (player.isDragonKnight()) { // �h���S���i�C�g
					if(player.getLevel() >= 50
							&& lv45_step == L1Quest.QUEST_END) {
						if(lv50_step == 0) {
							htmlid = "prokel21";
						} else if(lv50_step == L1Quest.QUEST_END) { // �N���A�ς�
							htmlid = "prokel32";
						} else {
							htmlid = "prokel24";
						}
					} else if(player.getLevel() >= 45
							&& lv30_step == L1Quest.QUEST_END) {
						if(lv45_step == 0) {
							htmlid = "prokel15";
						} else if(lv45_step >= 5) { // �N���A�ς�
							htmlid = "prokel20";
						} else {
							htmlid = "prokel17";
						}
					} else if (player.getLevel() >= 30
							&& lv15_step == L1Quest.QUEST_END) {
						if(lv30_step == 0) {
							htmlid = "prokel8";
						} else if(lv30_step >= 2) { // �N���A�ς�
							htmlid = "prokel14";
						} else {
							htmlid = "prokel10";
						}
					} else if (player.getLevel() >= 15) {
						if (lv15_step == 0 ) {
							htmlid = "prokel2";
						} else if (	lv15_step == L1Quest.QUEST_END) { // �N���A�ς�)
							htmlid = "prokel7";
						} else {
							htmlid = "prokel4";
						}
					} else { // Lv15����
						htmlid = "prokel1";
					}
				}
			} else if (npcid == 80145) { // ���V �V�����C��
				int lv15_step = quest.get_step(L1Quest.QUEST_LEVEL15);
				int lv30_step = quest.get_step(L1Quest.QUEST_LEVEL30);
				int lv45_step = quest.get_step(L1Quest.QUEST_LEVEL45);
				int lv50_step = quest.get_step(L1Quest.QUEST_LEVEL50);
				if (player.isDragonKnight()) { // �h���S���i�C�g
					if(player.getLevel() >= 45 && lv45_step == 1) {
						htmlid = "silrein37";
					} else if (player.getLevel() >= 45 && lv45_step == 2) {
						htmlid = "silrein38";
					} else if (player.getLevel() >= 45 && lv45_step == 3) {
						htmlid = "silrein40";
					} else if (player.getLevel() >= 45 && lv45_step == 4) {
						htmlid = "silrein43";
					}
				}
			} else if (npcid == 81245) { // �I�[�N���g(HC3)
				if (player.isDragonKnight()) {
					if (player.getTempCharGfx() == 6984) { // �I�[�N���g�ϐg
						int lv30_step = player.getQuest().get_step(L1Quest.QUEST_LEVEL30);
						if (lv30_step == 1) {
							htmlid = "spy_orc1";
						}
					}
				}
			}

			// html�\���p�P�b�g���M
			if (htmlid != null) { // htmlid���w�肳��Ă���ꍇ
				if (htmldata != null) { // html�w�肪����ꍇ�͕\��
					player.sendPackets(new S_NPCTalkReturn(objid, htmlid,
							htmldata));
				} else {
					player.sendPackets(new S_NPCTalkReturn(objid, htmlid));
				}
			} else {
				if (player.getLawful() < -1000) { // �v���C���[���J�I�e�B�b�N
					player.sendPackets(new S_NPCTalkReturn(talking, objid, 2));
				} else {
					player.sendPackets(new S_NPCTalkReturn(talking, objid, 1));
				}
			}
		}
	}

	private static String talkToTownadviser(L1PcInstance pc, int town_id) {
		String htmlid;
		if (pc.getHomeTownId() == town_id
				&& TownTable.getInstance().isLeader(pc, town_id)) {
			htmlid = "secretary1";
		} else {
			htmlid = "secretary2";
		}

		return htmlid;
	}

	private static String talkToTownmaster(L1PcInstance pc, int town_id) {
		String htmlid;
		if (pc.getHomeTownId() == town_id) {
			htmlid = "hometown";
		} else {
			htmlid = "othertown";
		}
		return htmlid;
	}

	@Override
	public void onFinalAction(L1PcInstance player, String action) {
	}

	public void doFinalAction(L1PcInstance player) {
	}

	private boolean checkHasCastle(L1PcInstance player, int castle_id) {
		if (player.getClanid() != 0) { // �N����������
			L1Clan clan = L1World.getInstance().getClan(player.getClanname());
			if (clan != null) {
				if (clan.getCastleId() == castle_id) {
					return true;
				}
			}
		}
		return false;
	}

	private boolean checkClanLeader(L1PcInstance player) {
		if (player.isCrown()) { // �N��
			L1Clan clan = L1World.getInstance().getClan(player.getClanname());
			if (clan != null) {
				if (player.getId() == clan.getLeaderId()) {
					return true;
				}
			}
		}
		return false;
	}

	private int getNecessarySealCount(L1PcInstance pc) {
		int rulerCount = 0;
		int necessarySealCount = 10;
		if (pc.getInventory().checkItem(40917)) { // �n�̎x�z��
			rulerCount++;
		}
		if (pc.getInventory().checkItem(40920)) { // ���̎x�z��
			rulerCount++;
		}
		if (pc.getInventory().checkItem(40918)) { // ���̎x�z��
			rulerCount++;
		}
		if (pc.getInventory().checkItem(40919)) { // �΂̎x�z��
			rulerCount++;
		}
		if (rulerCount == 0) {
			necessarySealCount = 10;
		} else if (rulerCount == 1) {
			necessarySealCount = 100;
		} else if (rulerCount == 2) {
			necessarySealCount = 200;
		} else if (rulerCount == 3) {
			necessarySealCount = 500;
		}
		return necessarySealCount;
	}

	private void createRuler(L1PcInstance pc, int attr, int sealCount) {
		// 1.�n����,2.�Α���,4.������,8.������
		int rulerId = 0;
		int protectionId = 0;
		int sealId = 0;
		if (attr == 1) {
			rulerId = 40917;
			protectionId = 40909;
			sealId = 40913;
		} else if (attr == 2) {
			rulerId = 40919;
			protectionId = 40911;
			sealId = 40915;
		} else if (attr == 4) {
			rulerId = 40918;
			protectionId = 40910;
			sealId = 40914;
		} else if (attr == 8) {
			rulerId = 40920;
			protectionId = 40912;
			sealId = 40916;
		}
		pc.getInventory().consumeItem(protectionId, 1);
		pc.getInventory().consumeItem(sealId, sealCount);
		L1ItemInstance item = pc.getInventory().storeItem(rulerId, 1);
		if (item != null) {
			pc.sendPackets(new S_ServerMessage(143,
					getNpcTemplate().get_name(), item.getLogName())); // \f1%0��%1������܂����B
		}
	}

	private String talkToDoromond(L1PcInstance pc) {
		String htmlid = "";
		if (pc.getQuest().get_step(L1Quest.QUEST_DOROMOND) == 0) {
			htmlid = "jpe0011";
		} else if (pc.getQuest().get_step(L1Quest.QUEST_DOROMOND) == 1) {
			htmlid = "jpe0015";
		}

		return htmlid;
	}

	private String talkToAlex(L1PcInstance pc) {
		String htmlid = "";
		if (pc.getLevel() < 3) {
			htmlid = "jpe0021";
		} else if (pc.getQuest().get_step(L1Quest.QUEST_DOROMOND) < 2) {
			htmlid = "jpe0022";
		} else if (pc.getQuest().get_step(L1Quest.QUEST_AREX) == L1Quest.QUEST_END) {
			htmlid = "jpe0023";
		} else if (pc.getLevel() >= 10 && pc.getLevel() < 25) {
			if (pc.getInventory().checkItem(41227)) { // �A���b�N�X�̏Љ��
				htmlid = "jpe0023";
			} else if (pc.isCrown()) {
				htmlid = "jpe0024p";
			} else if (pc.isKnight()) {
				htmlid = "jpe0024k";
			} else if (pc.isElf()) {
				htmlid = "jpe0024e";
			} else if (pc.isWizard()) {
				htmlid = "jpe0024w";
			} else if (pc.isDarkelf()) {
				htmlid = "jpe0024d";
			}
		} else if (pc.getLevel() > 25) {
			htmlid = "jpe0023";
		} else {
			htmlid = "jpe0021";
		}
		return htmlid;
	}

	private String talkToAlexInTrainingRoom(L1PcInstance pc) {
		String htmlid = "";
		if (pc.getLevel() < 3) {
			htmlid = "jpe0031";
		} else {
			if (pc.getQuest().get_step(L1Quest.QUEST_DOROMOND) < 2) {
				htmlid = "jpe0035";
			} else {
				htmlid = "jpe0036";
			}
		}

		return htmlid;
	}

	private String cancellation(L1PcInstance pc) {
		String htmlid = "";
		if (pc.getLevel() < 13) {
			htmlid = "jpe0161";
		} else {
			htmlid = "jpe0162";
		}

		return htmlid;
	}

	private String talkToRuba(L1PcInstance pc) {
		String htmlid = "";

		if (pc.isCrown() || pc.isWizard()) {
			htmlid = "en0101";
		} else if (pc.isKnight() || pc.isElf() || pc.isDarkelf()) {
			htmlid = "en0102";
		}

		return htmlid;
	}

	private String talkToSIGuide(L1PcInstance pc) {
		String htmlid = "";
		if (pc.getLevel() < 3) {
			htmlid = "en0301";
		} else if (pc.getLevel() >= 3 && pc.getLevel() < 7) {
			htmlid = "en0302";
		} else if (pc.getLevel() >= 7 && pc.getLevel() < 9) {
			htmlid = "en0303";
		} else if (pc.getLevel() >= 9 && pc.getLevel() < 12) {
			htmlid = "en0304";
		} else if (pc.getLevel() >= 12 && pc.getLevel() < 13) {
			htmlid = "en0305";
		} else if (pc.getLevel() >= 13 && pc.getLevel() < 25) {
			htmlid = "en0306";
		} else {
			htmlid = "en0307";
		}
		return htmlid;
	}

	private String talkToPopirea(L1PcInstance pc) {
		String htmlid = "";
		if (pc.getLevel() < 25) {
			htmlid = "jpe0041";
			if (pc.getInventory().checkItem(41209)
					|| pc.getInventory().checkItem(41210)
					|| pc.getInventory().checkItem(41211)
					|| pc.getInventory().checkItem(41212)) {
				htmlid = "jpe0043";
			}
			if (pc.getInventory().checkItem(41213)) {
				htmlid = "jpe0044";
			}
		} else {
			htmlid = "jpe0045";
		}
		return htmlid;
	}

	private String talkToSecondtbox(L1PcInstance pc) {
		String htmlid = "";
		if (pc.getQuest().get_step(L1Quest.QUEST_TBOX1) ==  L1Quest.QUEST_END) {
			if (pc.getInventory().checkItem(40701)) {
				htmlid = "maptboxa";
			} else {
				htmlid = "maptbox0";
			}
		} else {
			htmlid = "maptbox0";
		}
		return htmlid;
	}

	private String talkToThirdtbox(L1PcInstance pc) {
		String htmlid = "";
		if (pc.getQuest().get_step(L1Quest.QUEST_TBOX2) ==  L1Quest.QUEST_END) {
			if (pc.getInventory().checkItem(40701)) {
				htmlid = "maptboxd";
			} else {
				htmlid = "maptbox0";
			}
		} else {
			htmlid = "maptbox0";
		}
		return htmlid;
	}
	
	private static final long REST_MILLISEC = 10000;

	private static final Timer _restTimer = new Timer(true);

	private RestMonitor _monitor;

	public class RestMonitor extends TimerTask {
		@Override
		public void run() {
			setRest(false);
		}
	}

}
