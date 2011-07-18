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

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Logger;

import l1j.server.server.model.map.L1WorldMap;

public class L1InstanceMap {
		private static final Logger _log = Logger
		.getLogger(L1InstanceMap.class.getName());
		private int _curId;
		private Object _monitor = new Object();
		private static final short FIRST_ID =10000 ;
		private static final short LAST_ID =12000 ;
		private static L1InstanceMap _instance;
		
		public static L1InstanceMap getInstance() {
			if (_instance == null) {
				_instance = new L1InstanceMap();
			}
			return _instance;
		}

	private final List<Integer> _instanceMapList = new ArrayList<Integer>();

	L1InstanceMap(){
		_curId=FIRST_ID;
	}
	/**
	 * @param mapId
	 * @return
	 */
	public int addInstanceMap(int mapId) {
		L1Map instanceMap = L1WorldMap.getInstance().getMap((short)mapId).clone();
		int nextId=nextId();
		while(_instanceMapList.contains(nextId)){
			nextId=nextId();
		}
		instanceMap.setId(nextId);
		L1WorldMap.getInstance().addMap(instanceMap);
		_instanceMapList.add(instanceMap.getId());
		return instanceMap.getId();
	}

	/**
	 * @param mapId
	 * @return true
	 */
	public boolean removeInstanceMap(int mapId) {
		if (!_instanceMapList.contains( mapId)) {
			return false;
		}
		 for (Iterator<Integer> i =_instanceMapList.listIterator(); i.hasNext();) {
			  int key=i.next();
			  if(key==mapId){
				  i.remove();
				  break;
			  }
		 }
		L1WorldMap.getInstance().removeMap(mapId);
		return true;
	}

	public List<Integer> getInstanceMap() {
		return _instanceMapList;
	}

	public int getNumOfInstanceMaps() {
		return _instanceMapList.size();
	}

	public int nextId() {
		synchronized (_monitor) {
			if(_curId>LAST_ID){
				_curId=FIRST_ID;
			}
			return _curId++;
		}
	}
}