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
package l1j.server.server.datatables;

import java.util.Map;
import l1j.server.server.templates.L1CookingRecipe;
import l1j.server.server.utils.collections.Maps;

public class CookingRecipeTable {
	private static Map<Integer, L1CookingRecipe> _recipes = null;

	private CookingRecipeTable() {
	}

	public static void initialize() {
		if (_recipes != null) {
			throw new DataTableAlreadyInitializedException(CookingRecipeTable.class);
		}
		_recipes = load();
	}

	private static Map<Integer, L1CookingRecipe> load() {
		Map<Integer, L1CookingRecipe> result = Maps.newHashMap();

		for (L1CookingRecipe recipe : L1CookingRecipe.all()) {
			result.put(recipe.getId(), recipe);
		}
		return result;
	}

	public static L1CookingRecipe findById(int id) {
		return _recipes.get(id);
	}
}