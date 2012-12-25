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

package l1j.server.server.serverpackets;

import java.util.concurrent.atomic.AtomicInteger;
import java.util.logging.Logger;

import l1j.server.server.ActionCodes;
import l1j.server.server.encryptions.Opcodes;
import l1j.server.server.model.L1Character;
import l1j.server.server.model.Instance.L1PcInstance;
import l1j.server.server.model.skill.L1SkillId;
import static l1j.server.server.model.skill.L1SkillId.*;

// Referenced classes of package l1j.server.server.serverpackets:
// ServerBasePacket
public class S_UseAttackSkill extends ServerBasePacket {
	private static final String S_USE_ATTACK_SKILL = "[S] S_UseAttackSkill";
	private static Logger _log = Logger.getLogger(S_UseAttackSkill.class.getName());
    private static AtomicInteger _sequentialNumber = new AtomicInteger(0);
    private byte[] _byte = null;
    
    private static int calcheading(int myx, int myy, int tx, int ty) {
        int newheading = 0;
        if (tx > myx && ty > myy) {
            newheading = 3;
        }
        if (tx < myx && ty < myy) {
            newheading = 7;
        }
        if (tx > myx && ty == myy) {
            newheading = 2;
        }
        if (tx < myx && ty == myy) {
            newheading = 6;
        }
        if (tx == myx && ty < myy) {
            newheading = 0;
        }
        if (tx == myx && ty > myy) {
            newheading = 4;
        }
        if (tx < myx && ty > myy) {
            newheading = 5;
        }
        if (tx > myx && ty < myy) {
            newheading = 1;
        }
        return newheading;
    }

    public S_UseAttackSkill(L1Character cha, int targetobj, int spellgfx,
            int x, int y, int actionId) {
        buildPacket(cha, targetobj, spellgfx, x, y, actionId, 6, true);
    }

    public S_UseAttackSkill(L1Character cha, int targetobj, int spellgfx,
            int x, int y, int actionId, boolean motion) {
        buildPacket(cha, targetobj, spellgfx, x, y, actionId, 0, motion);
    }

    public S_UseAttackSkill(L1Character cha, int targetobj, int spellgfx,
            int x, int y, int actionId, int isHit) {
        buildPacket(cha, targetobj, spellgfx, x, y, actionId, isHit, true);
    }

    private void buildPacket(L1Character cha, int targetobj, int spellgfx,
            int x, int y, int actionId, int isHit, boolean withCastMotion) {
        if (cha instanceof L1PcInstance) {
            if (cha.hasSkillEffect(SHAPE_CHANGE)
                    && actionId == ActionCodes.ACTION_SkillAttack) {
                int tempchargfx = cha.getTempCharGfx();
                if (tempchargfx == 5727 || tempchargfx == 5730) {
                    actionId = ActionCodes.ACTION_SkillBuff;
                } else if (tempchargfx == 5733 || tempchargfx == 5736) {
                    actionId = ActionCodes.ACTION_Attack;
                }
            }
        }

        if (cha.getTempCharGfx() == 4013) {
            actionId = ActionCodes.ACTION_Attack;
        }

        int newheading = calcheading(cha.getX(), cha.getY(), x, y);
        cha.setHeading(newheading);
        writeC(Opcodes.S_OPCODE_ATTACKPACKET);
        writeC(actionId);
        writeD(withCastMotion ? cha.getId() : 0x00000000);
        writeD(targetobj);
        writeH(isHit > 0 ? isHit : 0x0000);
        writeC(newheading);
        writeD(_sequentialNumber.incrementAndGet());
        writeH(spellgfx);
        writeC(0x00);
        writeH(cha.getX());
        writeH(cha.getY());
        writeH(x);
        writeH(y);
        writeD(0x00000000);
        writeC(0x00);
    }
    
    @Override
    public byte[] getContent() {
        if (_byte == null) {
            _byte = getBytes();
        }
        return _byte;
    }

    @Override
    public String getType() {
        return S_USE_ATTACK_SKILL;
    }
}