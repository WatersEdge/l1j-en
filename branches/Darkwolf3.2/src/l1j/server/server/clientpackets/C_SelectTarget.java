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
package l1j.server.server.clientpackets;

import java.util.logging.Logger;
import java.util.logging.Level;

import l1j.server.server.ClientThread;
import l1j.server.server.model.L1Character;
import l1j.server.server.model.L1World;
import l1j.server.server.model.Instance.L1MonsterInstance;
import l1j.server.server.model.Instance.L1PcInstance;
import l1j.server.server.model.Instance.L1PetInstance;
import l1j.server.server.model.Instance.L1SummonInstance;
import l1j.server.server.serverpackets.S_ServerMessage;

// Referenced classes of package l1j.server.server.clientpackets:
// ClientBasePacket

public class C_SelectTarget extends ClientBasePacket {

        private static final String C_SELECT_TARGET = "[C] C_SelectTarget";
        private static Logger _log = Logger.getLogger(C_SelectTarget.class.getName());

        @Override
        public void execute(byte[] decrypt, ClientThread client) {
            try {
                read(decrypt);

                int petId = readD();
                int type = readC();
                int targetId = readD();

                L1PetInstance pet = (L1PetInstance) L1World.getInstance().findObject(petId);
                L1Character target = (L1Character) L1World.getInstance().findObject(targetId);

                if (pet != null && target != null) {
                    if (target instanceof L1PcInstance) {
                        final L1PcInstance pc = (L1PcInstance) target;
                        if ((pc.getZoneType() == 1) || (pet.getZoneType() == 1)
                                || (pc.checkNonPvP(pc, pet))) {
                            if (pet.getMaster() instanceof L1PcInstance) {
                                final L1PcInstance petMaster = (L1PcInstance) pet
                                        .getMaster();
                                petMaster.sendPackets(new S_ServerMessage(328));
                            }
                            return;
                        }
                        if (pc == pet.getMaster()) {
                            return;
                        }
                    }
                    else if (target instanceof L1PetInstance) {
                        final L1PetInstance targetPet = (L1PetInstance) target;
                        if ((targetPet.getZoneType() == 1) || (pet.getZoneType() == 1)) {
                            if (pet.getMaster() instanceof L1PcInstance) {
                                final L1PcInstance petMaster = (L1PcInstance) pet
                                        .getMaster();
                                petMaster.sendPackets(new S_ServerMessage(328));
                            }
                            return;
                        }
                    }
                    else if (target instanceof L1SummonInstance) {
                        final L1SummonInstance targetSummon = (L1SummonInstance) target;
                        
                        if ((targetSummon.getZoneType() == 1) || (pet.getZoneType() == 1)) {
                            if (pet.getMaster() instanceof L1PcInstance) {
                                final L1PcInstance petMaster = (L1PcInstance) pet
                                        .getMaster();
                                petMaster.sendPackets(new S_ServerMessage(328));
                            }
                            return;
                        }
                    }
                    pet.setMasterTarget(target);
                }
            } catch (final Exception e) {
                _log.log(Level.SEVERE, e.getLocalizedMessage(), e);
            } finally {
                finish();
            }
        }

        @Override
        public String getType() {
            return C_SELECT_TARGET;
        }
    }