SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `magic_doll`
-- ----------------------------
DROP TABLE IF EXISTS `magic_doll`;
CREATE TABLE IF NOT EXISTS `magic_doll` (
  `item_id` int(10) unsigned NOT NULL,
  `note` varchar(45) DEFAULT '',
  `doll_id` int(10) unsigned NOT NULL,
  `ac` tinyint(3) NOT NULL DEFAULT '0',
  `str` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `con` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dex` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `int` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `wis` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cha` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hp` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hpr` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hpr_time` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mp` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mpr` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mpr_time` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mr` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dmg` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dmg_chance` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `bow_hit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `bow_dmg` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dmg_reduction` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dmg_reduction_chance` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dmg_evasion_chance` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `weight_reduction` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `resist_stun` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `resist_stone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `resist_sleep` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `resist_freeze` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `resist_hold` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `resist_blind` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `exp_bonus` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `make_item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `skill_id` int(10) unsigned NOT NULL DEFAULT '0',
  `skill_chance` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of magic_doll
-- ----------------------------
INSERT INTO `magic_doll` VALUES(41248, '', 80106, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(41249, '', 80107, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(41250, '', 80108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49037, '', 80129, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49038, '', 80130, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49039, '', 80131, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49289, '', 80153, -3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49290, '', 80154, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 98, 5);
INSERT INTO `magic_doll` VALUES(49291, '', 80155, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49292, '', 80156, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 50, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49293, '', 80157, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49294, '', 80158, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49295, '', 80159, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49296, '', 80160, 0, 0, 0, 0, 0, 0, 0, 0, 40, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49297, '', 80161, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49298, '', 80162, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 0, 0, 0, 0, 49302, 0, 0);
INSERT INTO `magic_doll` VALUES(49299, '', 80163, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 0, 0, 0, 0, 49302, 0, 0);
INSERT INTO `magic_doll` VALUES(49300, '', 80164, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 0, 0, 0, 0, 49302, 0, 0);
INSERT INTO `magic_doll` VALUES(49301, '', 80165, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 0, 0, 0, 0, 49302, 0, 0);
INSERT INTO `magic_doll` VALUES(49318, '', 80169, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49319, '', 80170, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49320, '', 80214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49321, '', 80215, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 5, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49322, '', 80216, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 5, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49323, '', 80217, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 14, 5, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49324, '', 80218, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 17, 5, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49325, '', 80219, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 17, 5, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 28, 5);
INSERT INTO `magic_doll` VALUES(49326, '', 80220, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49327, '', 80221, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49328, '', 80222, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49329, '', 80223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49330, '', 80224, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49331, '', 80225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49332, '', 80226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49333, '', 80227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49334, '', 80228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49335, '', 80229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 35, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49336, '', 80230, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49337, '', 80231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 29, 5);
INSERT INTO `magic_doll` VALUES(49338, '', 80232, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49339, '', 80233, 0, 0, 0, 0, 0, 0, 0, 0, 15, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49340, '', 80234, 0, 0, 0, 0, 0, 0, 0, 0, 15, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49341, '', 80235, 0, 0, 0, 0, 0, 0, 0, 0, 15, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49342, '', 80236, 0, 0, 0, 0, 0, 0, 0, 0, 15, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49343, '', 80237, 0, 0, 0, 0, 0, 0, 0, 0, 15, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 50532, 0, 0);
INSERT INTO `magic_doll` VALUES(49344, '', 80244, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 20, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49345, '', 80245, 0, 1, 1, 0, 0, 0, 0, 0, 30, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49346, '', 80246, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49347, '', 80247, 0, 0, 2, 0, 0, 0, 0, 0, 30, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49348, '', 80248, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49349, '', 80249, 0, 0, 0, 2, 0, 0, 0, 0, 30, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49350, '', 80250, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49351, '', 80251, 0, 0, 0, 0, 2, 0, 0, 0, 30, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49352, '', 80252, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49353, '', 80253, 0, 1, 0, 1, 0, 0, 0, 0, 30, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49354, '', 80254, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49355, '', 80255, 0, 2, 0, 0, 0, 0, 0, 0, 30, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49356, '', 80256, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49357, '', 80257, 0, 0, 0, 0, 1, 1, 0, 0, 30, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49358, '', 80258, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49359, '', 80268, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49360, '', 80269, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49361, '', 80270, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49362, '', 80271, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49363, '', 80272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49364, '', 80273, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49365, '', 80274, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49366, '', 80275, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49367, '', 80276, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49368, '', 80277, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49369, '', 80278, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49370, '', 80279, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49371, '', 80280, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49372, '', 80281, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49373, '', 80282, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49374, '', 80283, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49375, '', 80284, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `magic_doll` VALUES(49376, '', 80285, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
