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

import l1j.server.Config;
import l1j.server.server.ClientThread;
import l1j.server.server.encryptions.Opcodes;
import l1j.server.server.datatables.ChatLogTable;
import l1j.server.server.model.L1World;
import l1j.server.server.model.Instance.L1PcInstance;
import l1j.server.server.serverpackets.S_ChatPacket;
import l1j.server.server.serverpackets.S_ServerMessage;

// Referenced classes of package l1j.server.server.clientpackets:
// ClientBasePacket
public class C_ChatWhisper extends ClientBasePacket {

    private static final String C_CHAT_WHISPER = "[C] C_ChatWhisper";

    private static Logger _log = Logger
            .getLogger(C_ChatWhisper.class.getName());

    @Override
    public void execute(byte[] decrypt, ClientThread client) {
        try {
            read(decrypt);
            String targetName = readS();
            String text = readS();
            L1PcInstance pc = client.getActiveChar();
            
            if (pc == null) {
                return;
            }
            
            if (pc.hasSkillEffect(1005)) {
                pc.sendPackets(new S_ServerMessage(242));
                return;
            }
            
            if (pc.getLevel() < Config.WHISPER_CHAT_LEVEL) {
                pc.sendPackets(new S_ServerMessage(404, String
                        .valueOf(Config.WHISPER_CHAT_LEVEL)));
                return;
            }
            
    		L1PcInstance whisperFrom = client.getActiveChar();

    		if (whisperFrom.hasSkillEffect(1005)) {
    			whisperFrom.sendPackets(new S_ServerMessage(242));
    			return;
    		}
    		if (whisperFrom.getLevel() < Config.WHISPER_CHAT_LEVEL) {
    			whisperFrom.sendPackets(new S_ServerMessage(404, String.valueOf(Config.WHISPER_CHAT_LEVEL)));
    			return;
    		}
    		
            if (whisperFrom == null) {
                return;
            }
              
    		L1PcInstance whisperTo = L1World.getInstance().getPlayer(targetName);

            if (whisperTo == null) {
                pc.sendPackets(new S_ServerMessage(73, targetName));
                return;
            }
            
            if (whisperTo.equals(pc)) {
                return;
            }
    		if (whisperTo == null) {
    			whisperFrom.sendPackets(new S_ServerMessage(73, targetName));
    			return;
    		}
    		if (whisperTo.equals(whisperFrom)) {
    			return;
    		}
    		//TRICIDTODO: Make this configurable
    		if (whisperTo.getExcludingList().contains(whisperFrom.getName()) && !whisperFrom.isGm() && !whisperFrom.isMonitor()) { // do not remove gm/mon whisper ability
    			whisperFrom.sendPackets(new S_ServerMessage(117, whisperTo.getName()));
    			return;
    		}
    		if (!whisperTo.isCanWhisper() && !whisperFrom.isGm() && !whisperFrom.isMonitor()) { // do not remove gm/mon whisper ability
    			whisperFrom.sendPackets(new S_ServerMessage(205, whisperTo.getName()));
    			return;
    		}
            if (text.length() > 52) { // Max of 52 for chat lenght
                text = text.substring(0, 52); // begin - end
            }
            ChatLogTable.getInstance().storeChat(pc, whisperTo, text, 1);
            pc.sendPackets(new S_ChatPacket(whisperTo, text,
                    Opcodes.S_OPCODE_GLOBALCHAT, 9));
            whisperTo.sendPackets(new S_ChatPacket(pc, text,
                    Opcodes.S_OPCODE_WHISPERCHAT, 16));
        } catch (final Exception e) {
            _log.log(Level.SEVERE, e.getLocalizedMessage(), e);
        } finally {
            finish();
        }
    }

    @Override
    public String getType() {
        return C_CHAT_WHISPER;
    }
}
