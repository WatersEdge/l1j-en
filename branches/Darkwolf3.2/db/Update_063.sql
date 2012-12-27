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
