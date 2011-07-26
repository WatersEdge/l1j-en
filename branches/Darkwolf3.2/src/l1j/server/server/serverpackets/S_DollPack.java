/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful ,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not , write to the Free Software
 * Foundation , Inc., 59 Temple Place - Suite 330, Boston , MA
 * 02111-1307, USA.
 *
 * http://www.gnu.org/copyleft/gpl.html
 */
package l1j.server.server.serverpackets;

import l1j.server.server.encryptions.Opcodes;
import l1j.server.server.model.Instance.L1DollInstance;

// Referenced classes of package l1j.server.server.serverpackets:
// ServerBasePacket , S_DollPack

public class S_DollPack extends ServerBasePacket {

	private static final String S_DOLLPACK = "[S] S_DollPack";

	private byte[] _byte = null;

	public S_DollPack(L1DollInstance doll) {
		/*
		 * int addbyte = 0; int addbyte1 = 1; int addbyte2 = 13; int setting =
		 * 4;
		 */
		writeC(Opcodes.S_OPCODE_CHARPACK);
		writeH(doll.getX());
		writeH(doll.getY());
		writeD(doll.getId());
		writeH(doll.getGfxId()); // SpriteID in List.spr
		writeC(doll.getStatus()); // Modes in List.spr
		writeC(doll.getHeading());
		writeC(0); // (Bright) - 0~15
		writeC(doll.getMoveSpeed());
		writeD(0);
		writeH(0);
		writeS(doll.getNameId());
		writeS(doll.getTitle());
		writeC((doll.getBraveSpeed() * 16));
		writeD(0); // ??
		writeS(null); // ??
		writeS(doll.getMaster() != null ? doll.getMaster().getName() : "");
		writeC(0); // ??
		writeC(0xFF);
		writeC(0);
		writeC(doll.getLevel()); // PC = 0, Mon = Lv
		writeC(0);
		writeC(0xFF);
		writeC(0xFF);
	}

	@Override
	public byte[] getContent() {
		if (_byte == null) {
			_byte = _bao.toByteArray();
		}

		return _byte;
	}

	@Override
	public String getType() {
		return S_DOLLPACK;
	}
}