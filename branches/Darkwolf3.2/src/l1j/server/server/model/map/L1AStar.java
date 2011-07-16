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
package l1j.server.server.model.map;

import l1j.server.server.model.L1Character;
import l1j.server.server.model.Instance.L1NpcInstance;
import l1j.server.server.model.map.L1Map;
import l1j.server.server.model.map.L1WorldMap;

public class L1AStar {
	private L1Node	OpenNode, ClosedNode;
	private static final int LIMIT_LOOP = 150;
	private static final int HEADING_TABLE_X[] = { 0, 1, 1, 1, 0, -1, -1, -1 };
	private static final int HEADING_TABLE_Y[] = { -1, -1, 0, 1, 1, 1, 0, -1 };
	
	public L1AStar() {
		OpenNode = null;
		ClosedNode = null;
	}
	
	public void Reset() {
		OpenNode = null;
		ClosedNode = null;
	}
	
	public L1Node FindPath(L1NpcInstance npc, L1Character target) {
		return FindPath(npc, target.getX(), target.getY(), target.getMapId());
	}
	
	public L1Node FindPath(L1NpcInstance npc, int tx, int ty, int mapId) {
		L1Node	src, best = null;
		src = new L1Node();
		src.g = 0;
		src.h = (tx - npc.getX()) * (tx - npc.getX()) + (ty - npc.getY()) * (ty - npc.getY());
		src.f = src.h;
		src.x = npc.getX();
		src.y = npc.getY();
		OpenNode = src;
		
		for (int i = 0; i < LIMIT_LOOP; i++ ) {
			if ( OpenNode == null ) {
				return best;
			}
			best = OpenNode;
			OpenNode = best.next;
			best.next = ClosedNode;
			ClosedNode = best;
			if (best == null) {
				return null;
			}
			if (Math.max(Math.abs(tx - best.x), Math.abs(ty - best.y)) == 1) {
				return best;
			}
			if( MakeChild(npc, best, tx, ty, npc.getMapId()) == 0 && i == 0 ) {
				return null;
			}
		}
		return best;
	}
	
	public char MakeChild(L1NpcInstance npc, L1Node node, int tx, int ty, short m) {
		int		x, y;
		char	flag = 0;
		
		x = node.x;
		y = node.y;
		L1Map map = L1WorldMap.getInstance().getMap(npc.getMapId());	
		
		for(int i=0 ; i<8 ; ++i){
				int nx = x + HEADING_TABLE_X[i];
				int ny = y + HEADING_TABLE_Y[i];
				if(map.isPassable(x, y, i)){
					MakeChildSub(node, nx, ny, tx, ty);
					flag = 1;
				}
		}
		return flag;
	}
	
	public void MakeChildSub(L1Node node, int x, int y, int tx, int ty) {
		L1Node	old = null, child = null;
		int		i;
		int		g = node.g + 1;
		if ( (old = IsOpen(x, y)) != null ) {
			for ( i = 0; i < 8; i++ ) {
				if ( node.direct[i] == null ) {
					node.direct[i] = old;
					break;
				}
			}
			if ( g < old.g ) {
				old.prev = node;
				old.g = g;
				old.f = old.h + old.g;
			}
		}
		else if ( (old = IsClosed(x, y)) != null ) {
			for ( i = 0; i < 8; i++ ) {
				if ( node.direct[i] == null ) {
					node.direct[i] = old;
					break;
				}
			}
			if ( g < old.g ) {
				old.prev = node;
				old.g = g;
				old.f = old.h + old.g;
			}
		}
		else {
			child = new L1Node();
			child.prev = node;
			child.g = g;
			child.h = (x-tx)*(x-tx) + (y-ty)*(y-ty);
			child.f = child.h + child.g;
			child.x = x;
			child.y = y;
			
			InsertNode(child);

			for ( i = 0; i < 8; i++ ) {
				if ( node.direct[i] == null ) {
					node.direct[i] = child;
					break;
				}
			}
		}
	}
	
	public L1Node IsOpen(int x, int y) {
		L1Node tmp = OpenNode;
		while ( tmp != null ) {
			if ( tmp.x == x && tmp.y == y ) {
				return tmp;
			}
			tmp = tmp.next;
		}
		return null;
	}
	
	public L1Node IsClosed(int x, int y) {
		L1Node tmp = ClosedNode;
		while ( tmp != null ) {
			if ( tmp.x == x && tmp.y == y ) {
				return tmp;
			}
			tmp = tmp.next;
		}
		return null;
	}
	
	public void InsertNode(L1Node src) {
		L1Node old = null, tmp = null;
		if( OpenNode == null ) {
			OpenNode = src;
			return;
		}
		tmp = OpenNode;
		while ( tmp != null && (tmp.f < src.f) ) {
			old = tmp;
			tmp = tmp.next;
		}
		if ( old != null ) {
			src.next = tmp;
			old.next = src;
		} else {
			src.next = tmp;
			OpenNode = src;
		}
	}
}