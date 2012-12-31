ALTER TABLE characters ADD birthday datetime DEFAULT NULL COMMENT 'Birthday' after char_name;

-- pettables
-- ----------------------------
-- Table structure for `petitem`
-- ----------------------------
DROP TABLE IF EXISTS `petitem`;
CREATE TABLE `petitem` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `note` varchar(45) NOT NULL DEFAULT '',
  `use_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'UseType',
  `hitmodifier` int(3) NOT NULL DEFAULT '0',
  `dmgmodifier` int(3) NOT NULL DEFAULT '0',
  `ac` int(3) NOT NULL DEFAULT '0',
  `add_str` int(2) NOT NULL DEFAULT '0',
  `add_con` int(2) NOT NULL DEFAULT '0',
  `add_dex` int(2) NOT NULL DEFAULT '0',
  `add_int` int(2) NOT NULL DEFAULT '0',
  `add_wis` int(2) NOT NULL DEFAULT '0',
  `add_hp` int(10) NOT NULL DEFAULT '0',
  `add_mp` int(10) NOT NULL DEFAULT '0',
  `add_sp` int(10) NOT NULL DEFAULT '0',
  `m_def` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40767 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of petitem
-- ----------------------------
INSERT INTO `petitem` VALUES ('40749', '', 'tooth', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `petitem` VALUES ('40750', '', 'tooth', '-3', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `petitem` VALUES ('40751', '', 'tooth', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `petitem` VALUES ('40752', '', 'tooth', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `petitem` VALUES ('40756', '', 'tooth', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0');
INSERT INTO `petitem` VALUES ('40757', '', 'tooth', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `petitem` VALUES ('40758', '', 'tooth', '2', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `petitem` VALUES ('40761', '', 'armor', '0', '0', '-4', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `petitem` VALUES ('40762', '', 'armor', '0', '0', '-7', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `petitem` VALUES ('40763', '', 'armor', '0', '0', '-8', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `petitem` VALUES ('40764', '', 'armor', '0', '0', '-12', '0', '0', '0', '1', '1', '0', '0', '0', '10');
INSERT INTO `petitem` VALUES ('40765', '', 'armor', '0', '0', '-13', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `petitem` VALUES ('40766', '', 'armor', '0', '0', '-20', '0', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `pettypes`
-- ----------------------------
DROP TABLE IF EXISTS `pettypes`;
CREATE TABLE `pettypes` (
  `BaseNpcId` int(10) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `ItemIdForTaming` int(10) NOT NULL,
  `HpUpMin` int(10) NOT NULL,
  `HpUpMax` int(10) NOT NULL,
  `MpUpMin` int(10) NOT NULL,
  `MpUpMax` int(10) NOT NULL,
  `EvolvItemId` int(10) NOT NULL DEFAULT '40070',
  `NpcIdForEvolving` int(10) NOT NULL,
  `MessageId1` int(10) NOT NULL,
  `MessageId2` int(10) NOT NULL,
  `MessageId3` int(10) NOT NULL,
  `MessageId4` int(10) NOT NULL,
  `MessageId5` int(10) NOT NULL,
  `DefyMessageId` int(10) NOT NULL,
  `canUseEquipment` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'UseType',
  PRIMARY KEY (`BaseNpcId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pettypes
-- ----------------------------
INSERT INTO `pettypes` VALUES ('45034', 'Sheperd', '40057', '5', '8', '1', '2', '40070', '45687', '1088', '1089', '1090', '1091', '1092', '1074', '0');
INSERT INTO `pettypes` VALUES ('45039', 'Cat', '40057', '3', '6', '3', '5', '40070', '45696', '2728', '2729', '2730', '2731', '2731', '2732', '0');
INSERT INTO `pettypes` VALUES ('45040', 'Bear', '40057', '8', '14', '1', '2', '40070', '45690', '2738', '2739', '2740', '2741', '2741', '2742', '0');
INSERT INTO `pettypes` VALUES ('45042', 'Doberman', '40057', '3', '6', '1', '2', '40070', '45688', '1088', '1089', '1090', '1091', '1092', '1074', '0');
INSERT INTO `pettypes` VALUES ('45043', 'Wold', '40057', '3', '9', '1', '2', '40070', '45686', '1088', '1089', '1090', '1091', '1092', '1074', '0');
INSERT INTO `pettypes` VALUES ('45044', 'Racoon', '40057', '3', '9', '2', '4', '40070', '45697', '3578', '3579', '3580', '3581', '3581', '3582', '0');
INSERT INTO `pettypes` VALUES ('45046', 'Beagle', '40057', '4', '8', '2', '4', '40070', '45692', '1088', '1089', '1090', '1091', '1092', '1074', '0');
INSERT INTO `pettypes` VALUES ('45047', 'Saint bernard', '40057', '6', '10', '2', '4', '40070', '45693', '1088', '1089', '1090', '1091', '1092', '1074', '0');
INSERT INTO `pettypes` VALUES ('45048', 'Fox', '40057', '3', '9', '2', '3', '40070', '45694', '2733', '2734', '2735', '2736', '2736', '2737', '0');
INSERT INTO `pettypes` VALUES ('45049', 'Killer Rabbit', '40060', '3', '8', '3', '5', '40070', '45695', '2723', '2724', '2725', '2726', '2726', '2727', '0');
INSERT INTO `pettypes` VALUES ('45053', 'Husky', '40057', '8', '13', '1', '2', '40070', '45689', '1088', '1089', '1090', '1091', '1092', '1074', '0');
INSERT INTO `pettypes` VALUES ('45054', 'Collie', '40057', '8', '11', '3', '4', '40070', '45691', '1088', '1089', '1090', '1091', '1092', '1074', '0');
INSERT INTO `pettypes` VALUES ('45313', 'Tiger', '40057', '8', '14', '3', '5', '40070', '45710', '4135', '4136', '4137', '4138', '4138', '4134', '0');
INSERT INTO `pettypes` VALUES ('45686', 'High Wolf', '0', '3', '9', '1', '2', '41310', '46046', '2823', '2824', '2825', '2826', '2826', '1074', '1');
INSERT INTO `pettypes` VALUES ('45687', 'High Sheperd', '0', '5', '8', '1', '2', '41310', '46046', '2819', '2820', '2821', '2822', '2822', '1074', '1');
INSERT INTO `pettypes` VALUES ('45688', 'High Doberman', '0', '4', '6', '1', '2', '41310', '46046', '2811', '2812', '2813', '2814', '2814', '1074', '1');
INSERT INTO `pettypes` VALUES ('45689', 'High Husky', '0', '10', '15', '1', '2', '41310', '46046', '2815', '2816', '2817', '2818', '2818', '1074', '1');
INSERT INTO `pettypes` VALUES ('45690', 'High Bear', '0', '8', '14', '1', '2', '41310', '46046', '2831', '2832', '2833', '2834', '2834', '2742', '1');
INSERT INTO `pettypes` VALUES ('45691', 'High Collie', '0', '10', '14', '3', '4', '41310', '46046', '2827', '2828', '2829', '2830', '2830', '1074', '1');
INSERT INTO `pettypes` VALUES ('45692', 'High Beagle', '0', '4', '8', '2', '4', '41310', '46046', '2847', '2848', '2849', '2850', '2850', '1074', '1');
INSERT INTO `pettypes` VALUES ('45693', 'High Saint Bernard', '0', '6', '9', '2', '4', '41310', '46046', '2851', '2852', '2853', '2854', '2854', '1074', '1');
INSERT INTO `pettypes` VALUES ('45694', 'High Fox', '0', '3', '9', '2', '4', '41310', '46046', '2835', '2836', '2837', '2838', '2838', '2737', '1');
INSERT INTO `pettypes` VALUES ('45695', 'High Rabbit', '0', '3', '8', '3', '5', '41310', '46046', '2843', '2844', '2845', '2846', '2846', '2727', '1');
INSERT INTO `pettypes` VALUES ('45696', 'High Cat', '0', '3', '6', '3', '5', '41310', '46046', '2839', '2840', '2841', '2842', '2842', '2732', '1');
INSERT INTO `pettypes` VALUES ('45697', 'High Racoon', '0', '5', '9', '3', '5', '41310', '46046', '3583', '3584', '3585', '3586', '3586', '3582', '1');
INSERT INTO `pettypes` VALUES ('45710', 'Battle Tiger', '0', '10', '15', '3', '5', '41310', '46046', '4140', '4141', '4142', '4143', '4143', '4134', '1');
INSERT INTO `pettypes` VALUES ('45711', 'Jindo Puppy', '40057', '3', '6', '3', '5', '40070', '45712', '4125', '4126', '4127', '4128', '4128', '4124', '0');
INSERT INTO `pettypes` VALUES ('45712', 'Jindo Dog', '0', '5', '8', '3', '5', '41310', '46046', '4130', '4131', '4132', '4133', '4133', '4124', '1');

-- ----------------------------
-- Table structure for `cooking_ingredients`
-- ----------------------------
DROP TABLE IF EXISTS `cooking_ingredients`;
CREATE TABLE IF NOT EXISTS `cooking_ingredients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cooking_recipe_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58 ;

-- ----------------------------
-- Records of cooking_ingredients
-- ----------------------------
INSERT INTO `cooking_ingredients` VALUES(1, 0, 40057, 1);
INSERT INTO `cooking_ingredients` VALUES(2, 1, 41275, 1);
INSERT INTO `cooking_ingredients` VALUES(3, 2, 41263, 1);
INSERT INTO `cooking_ingredients` VALUES(4, 2, 41265, 1);
INSERT INTO `cooking_ingredients` VALUES(5, 3, 41274, 1);
INSERT INTO `cooking_ingredients` VALUES(6, 3, 41267, 1);
INSERT INTO `cooking_ingredients` VALUES(7, 4, 40062, 1);
INSERT INTO `cooking_ingredients` VALUES(8, 4, 40069, 1);
INSERT INTO `cooking_ingredients` VALUES(9, 4, 40064, 1);
INSERT INTO `cooking_ingredients` VALUES(10, 5, 40056, 1);
INSERT INTO `cooking_ingredients` VALUES(11, 5, 40060, 1);
INSERT INTO `cooking_ingredients` VALUES(12, 5, 40061, 1);
INSERT INTO `cooking_ingredients` VALUES(13, 6, 41276, 1);
INSERT INTO `cooking_ingredients` VALUES(14, 7, 40499, 1);
INSERT INTO `cooking_ingredients` VALUES(15, 7, 40060, 1);
INSERT INTO `cooking_ingredients` VALUES(16, 8, 49040, 1);
INSERT INTO `cooking_ingredients` VALUES(17, 8, 49048, 1);
INSERT INTO `cooking_ingredients` VALUES(18, 9, 49041, 1);
INSERT INTO `cooking_ingredients` VALUES(19, 9, 49048, 1);
INSERT INTO `cooking_ingredients` VALUES(20, 10, 49042, 1);
INSERT INTO `cooking_ingredients` VALUES(21, 10, 41265, 1);
INSERT INTO `cooking_ingredients` VALUES(22, 10, 49048, 1);
INSERT INTO `cooking_ingredients` VALUES(23, 11, 49043, 1);
INSERT INTO `cooking_ingredients` VALUES(24, 11, 49048, 1);
INSERT INTO `cooking_ingredients` VALUES(25, 12, 49044, 1);
INSERT INTO `cooking_ingredients` VALUES(26, 12, 49048, 1);
INSERT INTO `cooking_ingredients` VALUES(27, 13, 49045, 1);
INSERT INTO `cooking_ingredients` VALUES(28, 13, 49048, 1);
INSERT INTO `cooking_ingredients` VALUES(29, 14, 49046, 1);
INSERT INTO `cooking_ingredients` VALUES(30, 14, 49048, 1);
INSERT INTO `cooking_ingredients` VALUES(31, 15, 49047, 1);
INSERT INTO `cooking_ingredients` VALUES(32, 15, 40499, 1);
INSERT INTO `cooking_ingredients` VALUES(33, 15, 49048, 1);
INSERT INTO `cooking_ingredients` VALUES(34, 16, 49048, 1);
INSERT INTO `cooking_ingredients` VALUES(35, 16, 49243, 1);
INSERT INTO `cooking_ingredients` VALUES(36, 16, 49260, 1);
INSERT INTO `cooking_ingredients` VALUES(37, 17, 49048, 1);
INSERT INTO `cooking_ingredients` VALUES(38, 17, 49243, 1);
INSERT INTO `cooking_ingredients` VALUES(39, 17, 49261, 1);
INSERT INTO `cooking_ingredients` VALUES(40, 18, 49048, 1);
INSERT INTO `cooking_ingredients` VALUES(41, 18, 49243, 1);
INSERT INTO `cooking_ingredients` VALUES(42, 18, 49262, 1);
INSERT INTO `cooking_ingredients` VALUES(43, 19, 49048, 1);
INSERT INTO `cooking_ingredients` VALUES(44, 19, 49243, 1);
INSERT INTO `cooking_ingredients` VALUES(45, 19, 49263, 1);
INSERT INTO `cooking_ingredients` VALUES(46, 20, 49048, 1);
INSERT INTO `cooking_ingredients` VALUES(47, 20, 49243, 1);
INSERT INTO `cooking_ingredients` VALUES(48, 20, 49264, 1);
INSERT INTO `cooking_ingredients` VALUES(49, 21, 49048, 1);
INSERT INTO `cooking_ingredients` VALUES(50, 21, 49243, 1);
INSERT INTO `cooking_ingredients` VALUES(51, 21, 49265, 1);
INSERT INTO `cooking_ingredients` VALUES(52, 22, 49048, 1);
INSERT INTO `cooking_ingredients` VALUES(53, 22, 49243, 1);
INSERT INTO `cooking_ingredients` VALUES(54, 22, 49266, 1);
INSERT INTO `cooking_ingredients` VALUES(55, 23, 49048, 1);
INSERT INTO `cooking_ingredients` VALUES(56, 23, 49243, 1);
INSERT INTO `cooking_ingredients` VALUES(57, 23, 49267, 1);
INSERT INTO `cooking_ingredients` VALUES(58, 23, 40499, 1);

-- ----------------------------
-- Table structure for `cooking_recipes`
-- ----------------------------
DROP TABLE IF EXISTS `cooking_recipes`;
CREATE TABLE IF NOT EXISTS `cooking_recipes` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `dish_id` int(10) unsigned NOT NULL,
  `dish_amount` int(10) unsigned NOT NULL,
  `fantasy_dish_id` int(10) unsigned NOT NULL,
  `fantasy_dish_amount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

-- ----------------------------
-- Records of cooking_recipes
-- ----------------------------
INSERT INTO `cooking_recipes` VALUES(0, 'Monster Eye Steak of Fantasy', 41277, 1, 41285, 1);
INSERT INTO `cooking_recipes` VALUES(1, 'Roasted Bear Meat of Fantasy', 41278, 1, 41286, 1);
INSERT INTO `cooking_recipes` VALUES(2, 'Seed Stuffed Pancake of Fantasy', 41279, 1, 41287, 1);
INSERT INTO `cooking_recipes` VALUES(3, 'Roasted Ant Legs with Cheese of Fantasy', 41280, 1, 41288, 1);
INSERT INTO `cooking_recipes` VALUES(4, 'Fruit Salad of Fantasy', 41281, 1, 41289, 1);
INSERT INTO `cooking_recipes` VALUES(5, 'Sweet Sour Fruit of Fantasy', 41282, 1, 41290, 1);
INSERT INTO `cooking_recipes` VALUES(6, 'Roasted Boar Skewers of Fantasy', 41283, 1, 41291, 1);
INSERT INTO `cooking_recipes` VALUES(7, 'Mushroom Soup of Fantasy', 41284, 1, 41292, 1);
INSERT INTO `cooking_recipes` VALUES(8, 'Cavier Canape of Fantasy', 49049, 1, 49057, 1);
INSERT INTO `cooking_recipes` VALUES(9, 'Alligator Steak of Fantasy', 49050, 1, 49058, 1);
INSERT INTO `cooking_recipes` VALUES(10, 'Turtle Dragon Cookie of Fantasy', 49051, 1, 49059, 1);
INSERT INTO `cooking_recipes` VALUES(11, 'Roasted Kiwi Parrot of Fantasy', 49052, 1, 49060, 1);
INSERT INTO `cooking_recipes` VALUES(12, 'Roasted Scorpion of Fantasy', 49053, 1, 49061, 1);
INSERT INTO `cooking_recipes` VALUES(13, 'Elekkadom Stew of Fantasy', 49054, 1, 49062, 1);
INSERT INTO `cooking_recipes` VALUES(14, 'Roasted Spider Leg of Fantasy', 49055, 1, 49063, 1);
INSERT INTO `cooking_recipes` VALUES(15, 'Crab Meat Soup of Fantasy', 49056, 1, 49064, 1);
INSERT INTO `cooking_recipes` VALUES(16, '', 49244, 1, 49252, 1);
INSERT INTO `cooking_recipes` VALUES(17, '', 49245, 1, 49253, 1);
INSERT INTO `cooking_recipes` VALUES(18, '', 49246, 1, 49254, 1);
INSERT INTO `cooking_recipes` VALUES(19, '', 49247, 1, 49255, 1);
INSERT INTO `cooking_recipes` VALUES(20, '', 49248, 1, 49256, 1);
INSERT INTO `cooking_recipes` VALUES(21, '', 49249, 1, 49257, 1);
INSERT INTO `cooking_recipes` VALUES(22, '', 49250, 1, 49258, 1);
INSERT INTO `cooking_recipes` VALUES(23, '', 49251, 1, 49259, 1);

DROP TABLE IF EXISTS `character_buff`;
-- ----------------------------
-- Table structure for `character_buffs`
-- ----------------------------
DROP TABLE IF EXISTS `character_buffs`;
CREATE TABLE IF NOT EXISTS `character_buffs` (
  `char_obj_id` int(10) unsigned NOT NULL DEFAULT '0',
  `skill_id` int(10) unsigned NOT NULL DEFAULT '0',
  `remaining_time` int(10) NOT NULL DEFAULT '0',
  `poly_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attr_kind` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_obj_id`,`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;