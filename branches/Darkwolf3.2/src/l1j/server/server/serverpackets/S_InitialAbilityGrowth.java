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

import l1j.server.server.encryptions.Opcodes;
import l1j.server.server.model.Instance.L1PcInstance;

public class S_InitialAbilityGrowth extends ServerBasePacket {
    private static final String S_INITIAL_ABILITY_GROWTH = "[S] S_InitialAbilityGrowth";
    private byte[] _byte = null;

    public S_InitialAbilityGrowth(final L1PcInstance pc) {
        final int Str = pc.getOriginalStr();
        final int Dex = pc.getOriginalDex();
        final int Con = pc.getOriginalCon();
        final int Wis = pc.getOriginalWis();
        final int Cha = pc.getOriginalCha();
        final int Int = pc.getOriginalInt();
        final int[] growth = new int[6];

        if (pc.isCrown()) {
            final int Initial[] = { 13, 10, 10, 11, 13, 10 };
            growth[0] = Str - Initial[0];
            growth[1] = Dex - Initial[1];
            growth[2] = Con - Initial[2];
            growth[3] = Wis - Initial[3];
            growth[4] = Cha - Initial[4];
            growth[5] = Int - Initial[5];
        }
        
        if (pc.isWizard()) {
            final int[] Initial = { 8, 7, 12, 12, 8, 12 };
            growth[0] = Str - Initial[0];
            growth[1] = Dex - Initial[1];
            growth[2] = Con - Initial[2];
            growth[3] = Wis - Initial[3];
            growth[4] = Cha - Initial[4];
            growth[5] = Int - Initial[5];
        }

        if (pc.isKnight()) {
            final int[] Initial = { 16, 12, 14, 9, 12, 8 };
            growth[0] = Str - Initial[0];
            growth[1] = Dex - Initial[1];
            growth[2] = Con - Initial[2];
            growth[3] = Wis - Initial[3];
            growth[4] = Cha - Initial[4];
            growth[5] = Int - Initial[5];
        }

        if (pc.isElf()) {
            final int[] Initial = { 11, 12, 12, 12, 9, 12 };
            growth[0] = Str - Initial[0];
            growth[1] = Dex - Initial[1];
            growth[2] = Con - Initial[2];
            growth[3] = Wis - Initial[3];
            growth[4] = Cha - Initial[4];
            growth[5] = Int - Initial[5];
        }

        if (pc.isDarkelf()) {
            final int[] Initial = { 12, 15, 8, 10, 9, 11 };
            growth[0] = Str - Initial[0];
            growth[1] = Dex - Initial[1];
            growth[2] = Con - Initial[2];
            growth[3] = Wis - Initial[3];
            growth[4] = Cha - Initial[4];
            growth[5] = Int - Initial[5];
        }

        if (pc.isDragonKnight()) {
            final int[] Initial = { 13, 11, 14, 12, 8, 11 };
            growth[0] = Str - Initial[0];
            growth[1] = Dex - Initial[1];
            growth[2] = Con - Initial[2];
            growth[3] = Wis - Initial[3];
            growth[4] = Cha - Initial[4];
            growth[5] = Int - Initial[5];
        }

        if (pc.isIllusionist()) {
            final int[] Initial = { 11, 10, 12, 12, 8, 12 };
            growth[0] = Str - Initial[0];
            growth[1] = Dex - Initial[1];
            growth[2] = Con - Initial[2];
            growth[3] = Wis - Initial[3];
            growth[4] = Cha - Initial[4];
            growth[5] = Int - Initial[5];
        }

        buildPacket(pc, growth[0], growth[1], growth[2], growth[3], growth[4],
                growth[5]);
    }

    /**
     * @param pc
     * @param Str
     * @param Dex
     * @param Con
     * @param Wis
     * @param Cha
     * @param Int
     */
    private void buildPacket(final L1PcInstance pc, final int Str,
            final int Dex, final int Con, final int Wis, final int Cha,
            final int Int) {
        final int write1 = (Int * 16) + Str;
        final int write2 = (Dex * 16) + Wis;
        final int write3 = (Cha * 16) + Con;
        writeC(Opcodes.S_OPCODE_CHARRESET);
        writeC(0x04);
        writeC(write1);
        writeC(write2);
        writeC(write3);
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
        return S_INITIAL_ABILITY_GROWTH;
    }
}