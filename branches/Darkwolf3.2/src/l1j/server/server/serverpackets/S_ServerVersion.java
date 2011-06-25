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

public class S_ServerVersion extends ServerBasePacket {
	private static final String S_SERVER_VERSION = "[S] ServerVersion";

	public S_ServerVersion() {
		writeC(Opcodes.S_OPCODE_SERVERVERSION);
		// Auth Check client Version
		// 1 = Check
		// 0 = no check
		// > 1 no check
		// type : boolean
		writeC(0x00);

		// your server id, first id = 2
		// id = 0, ????
		// id = 1, ????
		writeC(0x02);

		// all version
		// If the user level is a administrator,
		// inputs /ver to be able to print out all version in game
		// If the user level isn't a administrator
		// inputs /ver to be able to print out client version in game

		//writeD(0x00009D7C); // server verion 2.70C
		//writeD(0x0000791A); // cache verion 2.70C
		//writeD(0x0000791A); // auth verion 2.70C
		//writeD(0x00009DD1); // npc verion 2.70C

		//writeD(0x000160c9); // server verion 3.0C
		//writeD(0x0001606a); // cache verion 3.0C
		//writeD(0x0000ee01); // auth verion 3.0C
		//writeD(0x00013cdb); // npc verion 3.0C 

		writeD(0x00018778); // server verion 3.2C
		writeD(0x00016450); // cache verion 3.2C
		writeD(0x0000ee01); // auth verion 3.2C
		writeD(0x00016395); // npc verion 3.2C

		//writeD(0x009a45e9); // server verion 3.3C
		//writeD(0x009a44a9); // server verion 3.3C
		//writeD(0x77cf6eba); // server verion 3.3C
		//writeD(0x00018978); // server verion 3.3C
		// ↓ unknown
		// ↓ Old 270Lin.bin
		// ↓ New 270Lin.bin
		// ↓ isn't game time
		// writeD(0x882a2cc6); // 2.70C
		// writeD(0x49c466ec); // 3.0C
		 writeD(0x4b98bcc2); // 3.2C
		//writeD(0x4cf07bc0); //3.3C
		writeC(0x00); // unknown
		writeC(0x00); // unknown

		// Country
		// 0.US 3.Taiwan 4.Janpan 5.China
		writeC(0x00);
	}

	@Override
	public byte[] getContent() {
		return getBytes();
	}

	@Override
	public String getType() {
		return S_SERVER_VERSION;
	}
}