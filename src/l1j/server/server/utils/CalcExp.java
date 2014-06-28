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
package l1j.server.server.utils;

import static l1j.server.server.model.skill.L1SkillId.COOKING_1_7_N;
import static l1j.server.server.model.skill.L1SkillId.COOKING_1_7_S;
import static l1j.server.server.model.skill.L1SkillId.COOKING_2_7_N;
import static l1j.server.server.model.skill.L1SkillId.COOKING_2_7_S;
import static l1j.server.server.model.skill.L1SkillId.COOKING_3_7_N;
import static l1j.server.server.model.skill.L1SkillId.COOKING_3_7_S;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import l1j.server.Config;
import l1j.server.server.datatables.ExpTable;
import l1j.server.server.datatables.PetTable;
import l1j.server.server.model.L1Character;
import l1j.server.server.model.L1Object;
import l1j.server.server.model.L1World;
import l1j.server.server.model.Instance.L1NpcInstance;
import l1j.server.server.model.Instance.L1PcInstance;
import l1j.server.server.model.Instance.L1PetInstance;
import l1j.server.server.model.Instance.L1SummonInstance;
import l1j.server.server.serverpackets.S_PetPack;
import l1j.server.server.serverpackets.S_ServerMessage;
import l1j.server.server.templates.L1Pet;
import l1j.server.server.utils.collections.Lists;

public class CalcExp {
	private static Logger _log = Logger.getLogger(CalcExp.class.getName());
	public static final int MAX_EXP = ExpTable.getExpByLevel(100) - 1;

	private CalcExp() {
	}

	private static final double RoyalPartyBonus = .059;
	private static final double MemberPartyBonus = .04;
	private static final double PetPenalty = .12;

	/**
	 * Returns a two element array containing the total experience hate and
	 * total alternate (karma and lawful hate). Warning: prunes the parameter
	 * lists!
	 */
	private static int[] pruneAndSumHate(ArrayList<L1Character> characters,
			ArrayList<Integer> hateList) {
		int[] hateTotals = { 0, 0 };
		for (int i = hateList.size() - 1; i >= 0; i--) {
			L1Character character = characters.get(i);
			int hate = hateList.get(i);
			if (character == null || character.isDead()) {
				characters.remove(i);
				hateList.remove(i);
			} else {
				hateTotals[0] += hate;
				if (character instanceof L1PcInstance)
					hateTotals[1] += hate;
			}
		}
		return hateTotals;
	}

	/**
	 * Partitions a list of players, summons, and pets into groups divided by
	 * party, where pets and summons are in the same group as their masters.
	 * UGLY: Bite the bullet and do the searching instead? Makes for an uglier
	 * overall procedure but removes most of the extraneous wrapping.
	 */
	private static List<List<Pair<L1Character, Integer>>> partitionByParty(
			List<Pair<L1Character, Integer>> characters) {
		List<List<Pair<L1Character, Integer>>> groups = new ArrayList<List<Pair<L1Character, Integer>>>();
		List<Pair<L1NpcInstance, Integer>> stragglers = new ArrayList<Pair<L1NpcInstance, Integer>>();

		for (Pair<L1Character, Integer> pair : characters) {
			L1Character character = pair.getFirst();
			Integer hate = pair.getSecond();

			// Pull pets and summons for now.
			if (!(character instanceof L1PcInstance)) {
				stragglers.add(new Pair<L1NpcInstance, Integer>(
						(L1NpcInstance) character, hate));
				continue;
			}

			L1PcInstance player = (L1PcInstance) character;
			if (player.isInParty()) {
				// TODO: fix dumb quadratic search?
				boolean found = false;
				for (List<Pair<L1Character, Integer>> group : groups) {
					L1PcInstance representative = (L1PcInstance) group.get(0)
							.getFirst();
					if (representative.isInParty()
							&& representative.getParty() == player.getParty()) {
						found = true;
						group.add(new Pair<L1Character, Integer>(player, hate));
						break;
					}
				}
				if (!found)
					groups.add(Lists.of(new Pair<L1Character, Integer>(
							character, hate)));
			} else {
				groups.add(Lists.of(new Pair<L1Character, Integer>(character,
						hate)));
			}
		}

		// Put pets and summons in the same group as their masters.
		for (Pair<L1NpcInstance, Integer> pair : stragglers) {
			L1NpcInstance character = pair.getFirst();
			for (List<Pair<L1Character, Integer>> group : groups) {
				if (group.contains(character.getMaster())) {
					group.add(new Pair<L1Character, Integer>(character, pair
							.getSecond()));
					break;
				}
			}
		}

		return groups;
	}

	private static final double ROYAL_BONUS = .06;
	// TODO: finalize - starting off a little shorter than shout.
	private static final int EXP_RANGE = 40;

	private static boolean groupContainsRoyal(
			List<Pair<L1Character, Integer>> group) {
		if (group.size() == 0)
			return false;
		L1Character first = group.get(0).getFirst();
		if (first instanceof L1PcInstance) {
			return partyContainsRoyal((L1PcInstance) first);
		} else if (first instanceof L1SummonInstance) {
			L1SummonInstance summon = (L1SummonInstance) first;
			return partyContainsRoyal((L1PcInstance) summon.getMaster());
		} else if (first instanceof L1PetInstance) {
			L1PetInstance pet = (L1PetInstance) first;
			return partyContainsRoyal((L1PcInstance) pet.getMaster());
		}
		// Can't actually get here.
		return false;
	}

	private static boolean partyContainsRoyal(final L1PcInstance player) {
		for (L1PcInstance member : player.getParty().getMembers())
			if (member.isCrown())
				return true;
		return false;
	}

	public static void calcExp(int targetId,
			ArrayList<L1Character> acquisitors, ArrayList<Integer> hateList,
			int experience, int lawful, int karma) {

		if (acquisitors.size() != hateList.size())
			return;

		L1Object object = L1World.getInstance().findObject(targetId);
		L1NpcInstance npc = (L1NpcInstance) object;

		if (object == null || npc instanceof L1PetInstance
				|| npc instanceof L1SummonInstance)
			return;

		int[] hateTotals = pruneAndSumHate(acquisitors, hateList);
		int totalExpHate = hateTotals[0];
		int totalAltHate = hateTotals[1]; // Shared for lawful/karma.

		List<Pair<L1Character, Integer>> zipped = Pairs.zip(acquisitors,
				hateList);

		if (totalExpHate == 0) {
			return;
		}

		// Common case handling...
		if (acquisitors.size() == 1) {
			L1Character killer = acquisitors.get(0);
			if (killer instanceof L1PcInstance) {
				// TODO: pull this into AddExp call if we end up switching.
				int penalized = (int) (experience * (1 - PetPenalty
						* killer.getPetList().values().size()));
				AddExp((L1PcInstance) killer, penalized, lawful, karma);
			} else if (killer instanceof L1PetInstance) {
				AddExpPet((L1PetInstance) killer, experience);
			}
			return;
		}

		// For each group, calculate their proportion of hate, then give
		// them that amount of the experience/lawful/karma from the monster.
		for (List<Pair<L1Character, Integer>> group : partitionByParty(zipped)) {
			int groupExpHate = 0;
			int groupAltHate = 0;

			for (Pair<L1Character, Integer> member : group) {
				int hate = member.getSecond();
				if (member.getFirst() instanceof L1PcInstance)
					groupAltHate += hate;
				groupExpHate += hate;
			}

			int groupKarma = karma * (groupAltHate / totalAltHate);
			int groupLawful = lawful * (groupAltHate / totalAltHate);
			int groupExp = experience * (groupExpHate / totalExpHate);

			if (groupContainsRoyal(group))
				groupExp *= (1.0 + ROYAL_BONUS);

			for (Pair<L1Character, Integer> member : group) {
				L1Character character = member.getFirst();

				// No credit for characters on different maps (though their
				// party members benefit from contributed hate) or if you
				// didn't hit the mob at all.
				if (character.getMapId() != npc.getMapId()
						|| character.getLineDistance(npc) >= EXP_RANGE
						|| member.getSecond() <= 0)
					continue;

				if (character instanceof L1PcInstance) {
					// TODO: pull this into AddExp call if we end up switching.
					int penalized = (int) (groupExp * (1 - PetPenalty
							* character.getPetList().values().size()));
					AddExp((L1PcInstance) character, penalized, groupLawful,
							groupKarma);
				} else if (character instanceof L1PetInstance) {
					AddExpPet((L1PetInstance) character, groupExp);
				}
			}
		}
	}

	/**
	 * Expect this to be called once per monster death.
	 * 
	 * @param l1pcinstance
	 *            The last attacker.
	 */
	public static void calcExp(L1PcInstance l1pcinstance, int targetid,
			ArrayList<L1Character> acquisitors, ArrayList<Integer> hateList,
			int exp) {

		int i = 0;
		double partyLevel = 0;
		double dist = 0;
		int member_exp = 0;
		int member_lawful = 0;
		L1Object l1object = L1World.getInstance().findObject(targetid);
		L1NpcInstance npc = (L1NpcInstance) l1object;
		L1Character acquisitor;
		int hate = 0;
		int acquire_exp = 0;
		int acquire_lawful = 0;
		int party_exp = 0;
		int party_lawful = 0;
		int totalHateExp = 0;
		int totalHateLawful = 0;
		int partyHateExp = 0;
		int partyHateLawful = 0;
		int ownHateExp = 0;

		if (acquisitors.size() != hateList.size()) {
			return;
		}

		if (l1object == null || npc instanceof L1PetInstance
				|| npc instanceof L1SummonInstance) {
			return;
		}

		for (i = hateList.size() - 1; i >= 0; i--) {
			acquisitor = acquisitors.get(i);
			hate = hateList.get(i);
			if (acquisitor != null && !acquisitor.isDead()) {
				totalHateExp += hate;
				if (acquisitor instanceof L1PcInstance) {
					totalHateLawful += hate;
				}
			} else {
				acquisitors.remove(i);
				hateList.remove(i);
			}
		}

		if (totalHateExp == 0) {
			return;
		}

		if (!L1World.getInstance().isProcessingContributionTotal()
				&& l1pcinstance.getHomeTownId() > 0) {
			int contribution = npc.getLevel() / 10;
			l1pcinstance.addContribution(contribution);
		}

		int lawful = npc.getLawful();

		if (l1pcinstance.isInParty()) { // During Party
			// Sums party hate
			// This is the allocation of non-Party members
			partyHateExp = 0;
			partyHateLawful = 0;

			double royalBonus = getRoyalBonus(l1pcinstance);
			double partyBonus = getPartyBonus(l1pcinstance);
			/* double */partyLevel = getPartyLevel(l1pcinstance);

			for (i = hateList.size() - 1; i >= 0; i--) {
				acquisitor = acquisitors.get(i);
				hate = hateList.get(i);
				if (acquisitor instanceof L1PcInstance) {
					L1PcInstance pc = (L1PcInstance) acquisitor;
					if (pc == l1pcinstance) {
						partyHateExp += hate;
						partyHateLawful += hate;
					} else if (l1pcinstance.getParty().isMember(pc)) {
						partyHateExp += hate;
						partyHateLawful += hate;
					} else {
						if (totalHateExp > 0) {
							acquire_exp = (exp * hate / totalHateExp);
						}
						if (totalHateLawful > 0) {
							acquire_lawful = (lawful * hate / totalHateLawful);
						}
						AddExp(pc, acquire_exp, acquire_lawful);
					}
				} else if (acquisitor instanceof L1PetInstance) {
					L1PetInstance pet = (L1PetInstance) acquisitor;
					L1PcInstance master = (L1PcInstance) pet.getMaster();
					if (master == l1pcinstance) {
						partyHateExp += hate;
					} else if (l1pcinstance.getParty().isMember(master)) {
						partyHateExp += hate;
					} else {
						if (totalHateExp > 0) {
							acquire_exp = (exp * hate / totalHateExp);
						}
						AddExpPet(pet, acquire_exp);
					}
				} else if (acquisitor instanceof L1SummonInstance) {
					L1SummonInstance summon = (L1SummonInstance) acquisitor;
					L1PcInstance master = (L1PcInstance) summon.getMaster();
					if (master == l1pcinstance) {
						partyHateExp += hate;
					} else if (l1pcinstance.getParty().isMember(master)) {
						partyHateExp += hate;
					}
				}
			}

			if (totalHateExp > 0) {
				party_exp = (exp * partyHateExp / totalHateExp);
			}
			if (totalHateLawful > 0) {
				party_lawful = (lawful * partyHateLawful / totalHateLawful);
			}

			// EXP

			// PT Calculate the value of experience
			party_exp = (int) (party_exp * Config.PARTYEXP_RATE * (1 + partyBonus + royalBonus));

			// Summon the pet's character and self-hate sums
			if (partyLevel > 0) {
				dist = ((l1pcinstance.getLevel() * l1pcinstance.getLevel()) / partyLevel);
			}
			member_exp = (int) (party_exp * dist);
			member_lawful = (int) (party_lawful * dist);

			ownHateExp = 0;
			for (i = hateList.size() - 1; i >= 0; i--) {
				acquisitor = acquisitors.get(i);
				hate = hateList.get(i);
				if (acquisitor instanceof L1PcInstance) {
					L1PcInstance pc = (L1PcInstance) acquisitor;
					if (pc == l1pcinstance) {
						ownHateExp += hate;
					}
				} else if (acquisitor instanceof L1PetInstance) {
					L1PetInstance pet = (L1PetInstance) acquisitor;
					L1PcInstance master = (L1PcInstance) pet.getMaster();
					if (master == l1pcinstance) {
						ownHateExp += hate;
					}
				} else if (acquisitor instanceof L1SummonInstance) {
					L1SummonInstance summon = (L1SummonInstance) acquisitor;
					L1PcInstance master = (L1PcInstance) summon.getMaster();
					if (master == l1pcinstance) {
						ownHateExp += hate;
					}
				}
			}
			// Summon the character and self-distribute pets
			if (ownHateExp != 0) { // Participating in the attack.
				for (i = hateList.size() - 1; i >= 0; i--) {
					acquisitor = acquisitors.get(i);
					hate = hateList.get(i);
					if (acquisitor instanceof L1PcInstance) {
						L1PcInstance pc = (L1PcInstance) acquisitor;
						if (pc == l1pcinstance) {
							if (ownHateExp > 0) {
								acquire_exp = (member_exp * hate / ownHateExp);
							}
							AddExp(pc, acquire_exp, member_lawful);
						}
					} else if (acquisitor instanceof L1PetInstance) {
						L1PetInstance pet = (L1PetInstance) acquisitor;
						L1PcInstance master = (L1PcInstance) pet.getMaster();
						if (master == l1pcinstance) {
							if (ownHateExp > 0) {
								acquire_exp = (member_exp * hate / ownHateExp);
							}
							AddExpPet(pet, acquire_exp);
						}
					} else if (acquisitor instanceof L1SummonInstance) {
					}
				}
			} else { // It did not participate in attack
				// Character only self-distribution
				AddExp(l1pcinstance, member_exp, member_lawful);
			}

			// Party members and their pet hate sums of Salmon
			L1PcInstance[] ptMembers = l1pcinstance.getParty().getMembers();
			for (int cnt = 0; cnt < ptMembers.length; cnt++) {
				if (l1pcinstance.knownsObject(ptMembers[cnt])) {
					if (partyLevel > 0) {
						dist = ((ptMembers[cnt].getLevel() * ptMembers[cnt]
								.getLevel()) / partyLevel);
					}
					member_exp = (int) (party_exp * dist);
					member_lawful = (int) (party_lawful * dist);

					ownHateExp = 0;
					for (i = hateList.size() - 1; i >= 0; i--) {
						acquisitor = acquisitors.get(i);
						hate = hateList.get(i);
						if (acquisitor instanceof L1PcInstance) {
							L1PcInstance pc = (L1PcInstance) acquisitor;
							if (pc == ptMembers[cnt]) {
								ownHateExp += hate;
							}
						} else if (acquisitor instanceof L1PetInstance) {
							L1PetInstance pet = (L1PetInstance) acquisitor;
							L1PcInstance master = (L1PcInstance) pet
									.getMaster();
							if (master == ptMembers[cnt]) {
								ownHateExp += hate;
							}
						} else if (acquisitor instanceof L1SummonInstance) {
							L1SummonInstance summon = (L1SummonInstance) acquisitor;
							L1PcInstance master = (L1PcInstance) summon
									.getMaster();
							if (master == ptMembers[cnt]) {
								ownHateExp += hate;
							}
						}
					}
					// Party members and their pets and distributes Salmon
					if (ownHateExp != 0) { // Participating in the attack.
						for (i = hateList.size() - 1; i >= 0; i--) {
							acquisitor = acquisitors.get(i);
							hate = hateList.get(i);
							if (acquisitor instanceof L1PcInstance) {
								L1PcInstance pc = (L1PcInstance) acquisitor;
								if (pc == ptMembers[cnt]) {
									if (ownHateExp > 0) {
										acquire_exp = (member_exp * hate / ownHateExp);
									}
									AddExp(pc, acquire_exp, member_lawful);
								}
							} else if (acquisitor instanceof L1PetInstance) {
								L1PetInstance pet = (L1PetInstance) acquisitor;
								L1PcInstance master = (L1PcInstance) pet
										.getMaster();
								if (master == ptMembers[cnt]) {
									if (ownHateExp > 0) {
										acquire_exp = (member_exp * hate / ownHateExp);
									}
									AddExpPet(pet, acquire_exp);
								}
							} else if (acquisitor instanceof L1SummonInstance) {
							}
						}
					} else { // It did not participate in attack
						// Party members only distribute
						AddExp(ptMembers[cnt], member_exp, member_lawful);
					}
				}
			}
		} else { // solo
			for (i = hateList.size() - 1; i >= 0; i--) {
				acquisitor = acquisitors.get(i);
				hate = hateList.get(i);
				acquire_exp = (exp * hate / totalHateExp);
				if (acquisitor instanceof L1PcInstance) {
					if (totalHateLawful > 0)
						acquire_lawful = lawful * hate / totalHateLawful;
					AddExp((L1PcInstance) acquisitor, acquire_exp,
							acquire_lawful);
				} else if (acquisitor instanceof L1PetInstance) {
					AddExpPet((L1PetInstance) acquisitor, acquire_exp);
				}
			}
		}
	}

	private static double getRoyalBonus(final L1PcInstance player) {
		if (!player.isInParty())
			return 0.;
		for (L1PcInstance member : player.getParty().getMembers()) {
			if (member.isCrown()
					&& (player.knownsObject(member) || player.equals(member)))
				return RoyalPartyBonus;
		}
		return 0.;
	}

	private static double getPartyLevel(final L1PcInstance player) {
		double level = 0.;
		for (L1PcInstance member : player.getParty().getMembers())
			if (player.knownsObject(member) || player.equals(member))
				level += player.getLevel() * player.getLevel();
		return level;
	}

	private static double getPartyBonus(final L1PcInstance player) {
		int known = 0;
		for (L1PcInstance member : player.getParty().getMembers())
			if (player.knownsObject(member))
				known++;
		return known * MemberPartyBonus;
	}

	private static void AddExp(L1PcInstance pc, int experience, int lawful) {
		AddExp(pc, experience, lawful, 0);
	}

	private static void AddExp(L1PcInstance pc, int exp, int lawful, int karma) {
		// Shouldn't really be the case, but just in case... =)
		if (pc.isDead()) {
			return;
		}

		int add_lawful = (int) (lawful * Config.RATE_LA) * -1;
		pc.addLawful(add_lawful);

		boolean aligned = Integer.signum(karma) == Integer
				.signum(pc.getKarma());
		pc.addKarma((int) (karma * Config.RATE_KARMA * (aligned ? 5 : 1)));

		double exppenalty = ExpTable.getPenaltyRate(pc.getLevel());
		double foodBonus = 1.0;
		if (pc.hasSkillEffect(COOKING_1_7_N)
				|| pc.hasSkillEffect(COOKING_1_7_S)) {
			foodBonus = 1.01;
		}
		if (pc.hasSkillEffect(COOKING_2_7_N)
				|| pc.hasSkillEffect(COOKING_2_7_S)) {
			foodBonus = 1.02;
		}
		if (pc.hasSkillEffect(COOKING_3_7_N)
				|| pc.hasSkillEffect(COOKING_3_7_S)) {
			foodBonus = 1.03;
		}
		int add_exp = (int) (exp * exppenalty * Config.RATE_XP * foodBonus);

		pc.addExp(add_exp);
	}

	private static void AddExpPet(L1PetInstance pet, int exp) {
		L1PcInstance pc = (L1PcInstance) pet.getMaster();

		int petItemObjId = pet.getItemObjId();
		int levelBefore = pet.getLevel();
		int totalExp = (int) (exp * Config.PETEXP_RATE + pet.getExp());
		pet.setExp(totalExp);
		pet.setLevel(ExpTable.getLevelByExp(totalExp));

		int expPercentage = ExpTable.getExpPercentage(pet.getLevel(), totalExp);

		int gap = pet.getLevel() - levelBefore;
		for (int i = 1; i <= gap; i++) {
			IntRange hpUpRange = pet.getPetType().getHpUpRange();
			IntRange mpUpRange = pet.getPetType().getMpUpRange();
			pet.addMaxHp(hpUpRange.randomValue());
			pet.addMaxMp(mpUpRange.randomValue());
		}

		pet.setExpPercent(expPercentage);
		pc.sendPackets(new S_PetPack(pet, pc));

		if (gap != 0) { // After you write the next level DB
			L1Pet petTemplate = PetTable.getInstance()
					.getTemplate(petItemObjId);
			if (petTemplate == null) { // PetTable no
				_log.warning("L1Pet == null");
				return;
			}
			petTemplate.set_exp(pet.getExp());
			petTemplate.set_level(pet.getLevel());
			petTemplate.set_hp(pet.getMaxHp());
			petTemplate.set_mp(pet.getMaxMp());
			PetTable.getInstance().storePet(petTemplate);
			pc.sendPackets(new S_ServerMessage(320, pet.getName()));
			// top off pet's HP/MP on level up
			pet.setCurrentHp(pet.getMaxHp());
			pet.setCurrentMp(pet.getMaxMp());
		}
	}
}
