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
package l1j.server.server;

import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.HashMap;
import java.util.Map;

import static l1j.server.server.encryptions.Opcodes.*;
import l1j.server.Config;
import l1j.server.server.clientpackets.*;
import l1j.server.server.clientpackets.ClientBasePacket;
import l1j.server.server.model.Instance.L1PcInstance;
import l1j.server.server.serverpackets.S_SystemMessage;

/**
 * PacketHandler
 */
public class PacketHandler {

    private static Logger _log = Logger.getLogger(PacketHandler.class.getName());
    private static final Map<Integer, ClientBasePacket> OP_LIST = new HashMap<Integer, ClientBasePacket>();
    private final ClientThread _client;

    /**
     * @param client
     */
    public PacketHandler(ClientThread client) {
        _client = client;
    }

    public void handlePacket(byte[] abyte0, L1PcInstance object)
            throws Exception {
        ClientBasePacket basePacket = null;
        if (abyte0 == null) {
            return;
        }
        if (abyte0.length <= 0) {
            return;
        }
        try {
            int i = abyte0[0] & 0xff;
            basePacket = OP_LIST.get(i);
            if (basePacket == null) {
                _log.warning("Unused Opcode." + i);
                return;
            } else {
                basePacket.execute(abyte0, _client);
            }
        } catch (final Exception e) {
            _log.log(Level.SEVERE, e.getLocalizedMessage(), e);
        } finally {
            basePacket = null;
        }
    }

    static {
        put(C_OPCODE_BOOKMARK, new C_AddBookmark());
        put(C_OPCODE_BOOKMARKDELETE, new C_DeleteBookmark());
        put(C_OPCODE_CHATGLOBAL, new C_Chat());
        put(C_OPCODE_CHATWHISPER, new C_ChatWhisper());
        put(C_OPCODE_CHAT, new C_Chat());
        put(C_OPCODE_EXCLUDE, new C_Exclude());
        put(C_OPCODE_TITLE, new C_Title());
        put(C_OPCODE_CREATECLAN, new C_CreateClan());
        put(C_OPCODE_JOINCLAN, new C_JoinClan());
        put(C_OPCODE_LEAVECLAN, new C_LeaveClan());
        put(C_OPCODE_BANCLAN, new C_BanClan());
        put(C_OPCODE_RANK, new C_Rank());
        put(C_OPCODE_PLEDGE, new C_Pledge());
        put(C_OPCODE_EMBLEM, new C_Emblem());
        put(C_OPCODE_CLAN, new C_Clan());
        put(C_OPCODE_WAR, new C_War());
        put(C_OPCODE_TAXRATE, new C_TaxRate());
        put(C_OPCODE_CHANGEWARTIME, new C_ChangeWarTime());
        put(C_OPCODE_COMMONCLICK, new C_CommonClick());
        put(C_OPCODE_NEWCHAR, new C_CreateChar());
        put(C_OPCODE_CHANGECHAR, new C_NewCharSelect());
        put(C_OPCODE_DELETECHAR, new C_DeleteChar());
        put(C_OPCODE_CHANGEHEADING, new C_ChangeHeading());
        put(C_OPCODE_MOVECHAR, new C_MoveChar());
        put(C_OPCODE_ATTACK, new C_Attack());
        put(C_OPCODE_ARROWATTACK, new C_Attack());
        put(C_OPCODE_EXTCOMMAND, new C_ExtraCommand());
        put(C_OPCODE_CHARRESET, new C_CharReset());
        put(C_OPCODE_BOARDWRITE, new C_BoardWrite());
        put(C_OPCODE_BOARDREAD, new C_BoardRead());
        put(C_OPCODE_BOARD, new C_Board());
        put(C_OPCODE_BOARDBACK, new C_BoardBack());
        put(C_OPCODE_BOARD, new C_BoardBack());
        put(C_OPCODE_BOARDDELETE, new C_BoardDelete());
        put(C_OPCODE_USEITEM, new C_ItemUSe());
        put(C_OPCODE_USESKILL, new C_UseSkill());
        put(C_OPCODE_USEPETITEM, new C_UsePetItem());
        put(C_OPCODE_CREATEPARTY, new C_CreateParty());
        put(C_OPCODE_PARTY, new C_Party());
        put(C_OPCODE_CHATPARTY, new C_ChatParty());
        put(C_OPCODE_BANPARTY, new C_BanParty());
        put(C_OPCODE_LEAVEPARTY, new C_LeaveParty());
        put(C_OPCODE_ENTERPORTAL, new C_EnterPortal());
        put(C_OPCODE_AMOUNT, new C_Amount());
        put(C_OPCODE_FIX_WEAPON_LIST, new C_FixWeaponList());
        put(C_OPCODE_SELECTLIST, new C_SelectList());
        put(C_OPCODE_EXIT_GHOST, new C_ExitGhost());
        put(C_OPCODE_CALL, new C_CallPlayer());
        put(C_OPCODE_HIRESOLDIER, new C_HireSoldier());
        put(C_OPCODE_FISHCLICK, new C_FishClick());
        put(C_OPCODE_SELECTTARGET, new C_SelectTarget());
        put(C_OPCODE_PETMENU, new C_PetMenu());
        put(C_OPCODE_TELEPORT, new C_Teleport());
        put(C_OPCODE_FIGHT, new C_Fight());
        put(C_OPCODE_SHIP, new C_Ship());
        put(C_OPCODE_MAIL, new C_Mail());
        put(C_OPCODE_SENDLOCATION, new C_SendLocation());
        put(C_OPCODE_DELETEINVENTORYITEM, new C_DeleteInventoryItem());
        put(C_OPCODE_PICKUPITEM, new C_PickUpItem());
        put(C_OPCODE_DROPITEM, new C_DropItem());
        put(C_OPCODE_WHO, new C_Who());
        put(C_OPCODE_GIVEITEM, new C_GiveItem());
        put(C_OPCODE_NPCTALK, new C_NPCTalk());
        put(C_OPCODE_ADDBUDDY, new C_AddBuddy());
        put(C_OPCODE_DELBUDDY, new C_DelBuddy());
        put(C_OPCODE_BUDDYLIST, new C_Buddy());
        put(C_OPCODE_CLIENTVERSION, new C_ServerVersion());
        put(C_OPCODE_LOGINPACKET, new C_AuthLogin());
        put(C_OPCODE_RETURNTOLOGIN, new C_ReturnToLogin());
        put(C_OPCODE_LOGINTOSERVER, new C_LoginToServer());
        put(C_OPCODE_KEEPALIVE, new C_KeepALIVE());
        put(C_OPCODE_RESTART, new C_Restart());
        put(C_OPCODE_SHOP, new C_Shop());
        put(C_OPCODE_PRIVATESHOPLIST, new C_ShopList());
        put(C_OPCODE_ATTR, new C_Attr());
        put(C_OPCODE_RESULT, new C_Result());
        put(C_OPCODE_DEPOSIT, new C_Deposit());
        put(C_OPCODE_DRAWAL, new C_Drawal());
        put(C_OPCODE_LOGINTOSERVEROK, new C_LoginToServerOK());
        put(C_OPCODE_TRADE, new C_Trade());
        put(C_OPCODE_TRADEADDCANCEL, new C_TradeCancel());
        put(C_OPCODE_TRADEADDITEM, new C_TradeAddItem());
        put(C_OPCODE_TRADEADDOK, new C_TradeOK());
        put(C_OPCODE_CHECKPK, new C_CheckPK());
        put(C_OPCODE_PROPOSE, new C_Propose());
        put(C_OPCODE_SKILLBUY, new C_SkillBuy());
        put(C_OPCODE_SKILLBUYOK, new C_SkillBuyOK());
        put(C_OPCODE_CHARACTERCONFIG, new C_CharacterConfig());
        put(C_OPCODE_DOOR, new C_Door());
        put(C_OPCODE_NPCACTION, new C_NPCAction());
    }

    /**
     *
     * @param key
     * @param value
     */
    private static void put(final Integer key, final ClientBasePacket value) {
        if (OP_LIST.get(key) == null) {
            OP_LIST.put(key, value);
        } else {
            if (!key.equals(-19)) {
                _log.warning("Packet + : " + key + " " + value.getType());
            }
        }
    }
}