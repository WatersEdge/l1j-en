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

import l1j.server.server.hackdetections.LogPickUpItem;
import l1j.server.server.ActionCodes;
import l1j.server.server.ClientThread;
import l1j.server.server.model.L1Inventory;
import l1j.server.server.model.L1Object;
import l1j.server.server.model.L1World;
import l1j.server.server.model.Instance.L1ItemInstance;
import l1j.server.server.model.Instance.L1PcInstance;
import l1j.server.server.model.item.L1ItemId;
import l1j.server.server.serverpackets.S_AttackPacket;
import l1j.server.server.serverpackets.S_ServerMessage;

public class C_PickUpItem extends ClientBasePacket {

	private static final String C_PICK_UP_ITEM = "[C] C_PickUpItem";
	private static Logger _log = Logger.getLogger(C_PickUpItem.class.getName());

    @Override
    public void execute(byte[] decrypt, ClientThread client) {
        try {
            read(decrypt);
   		   
            int x = readH();
            int y = readH();
            int objectId = readD();
            
            L1PcInstance pc = client.getActiveChar();
            if (pc == null) {
                return;
            }
    		//TRICIDTODO: Set configurable auto ban
            int pickupCount = readD();

    		if (pickupCount < 0)
    		{
    			_log.info(pc.getName() + " Attempted Dupe Exploit (C_PickUpItem).");
    			return;
    		}
    		
    		if (pc.isDead() || pc.isGhost()) {
    			return;
    		}

    		if (pc.isInvisble()) {
    			return;
    		}

    		if (pc.isInvisDelay()) {
    			return;
    		}
             
             L1Inventory groundInventory = L1World.getInstance().getInventory(x,
                     y, pc.getMapId());
             L1Object object = groundInventory.getItem(objectId);
             if (object != null && !pc.isDead()) {
     			L1ItemInstance item = (L1ItemInstance) object;

     			if (item.getItemOwnerId() != 0 && pc.getId() != item.getItemOwnerId()) {
     				pc.sendPackets(new S_ServerMessage(623));
     				return;
     			}
     			
     			if (pc.getLocation().getTileLineDistance(item.getLocation()) > 3) {
     				return;
     			}

     			if (item.getItem().getItemId() == L1ItemId.ADENA) {
     				L1ItemInstance inventoryItem = pc.getInventory().findItemId(L1ItemId.ADENA);
     				int inventoryItemCount = 0;
     				if (inventoryItem != null) {
     					inventoryItemCount = inventoryItem.getCount();
     				}

     				if ((long) inventoryItemCount + (long) pickupCount > 2000000000L) {
     					pc.sendPackets(new S_ServerMessage(166, "You Cannot Carry More Than 2,000,000,000 Of An Item."));
     					return;
     				}
     			}
     			int before_inven = 0;
     			int after_ground = 0;
     			int after_inven = 0;
     			int brfore_ground = groundInventory.getItem(objectId).getCount();
     			if (pc.getInventory().checkAddItem(item, pickupCount) == L1Inventory.OK) {
     				if (item.getX() != 0 && item.getY() != 0) { 
     					groundInventory.tradeItem(item, pickupCount, pc.getInventory());
     					pc.turnOnOffLight();
     					LogPickUpItem lpui = new LogPickUpItem();
     					lpui.storeLogPickUpItem(pc, item, before_inven, after_inven, brfore_ground, after_ground, (int)pickupCount);
     					pc.sendPackets(new S_AttackPacket(pc, objectId, ActionCodes.ACTION_Pickup));
     					if (!pc.isGmInvis()) {
     						pc.broadcastPacket(new S_AttackPacket(pc, objectId, ActionCodes.ACTION_Pickup));
                     }
                 }
             }
           }
         } catch (final Exception e) {
             _log.log(Level.SEVERE, e.getLocalizedMessage(), e);
         } finally {
             finish();
         }
     }

     @Override
     public String getType() {
         return C_PICK_UP_ITEM;
     }
 }