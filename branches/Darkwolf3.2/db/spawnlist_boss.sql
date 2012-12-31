/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 14:11:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `spawnlist_boss`
-- ----------------------------
DROP TABLE IF EXISTS `spawnlist_boss`;
CREATE TABLE `spawnlist_boss` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location` varchar(45) NOT NULL DEFAULT '',
  `cycle_type` varchar(20) NOT NULL DEFAULT '',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  `npc_id` int(10) unsigned NOT NULL DEFAULT '0',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `locx` int(10) unsigned NOT NULL DEFAULT '0',
  `locy` int(10) unsigned NOT NULL DEFAULT '0',
  `randomx` int(10) unsigned NOT NULL DEFAULT '0',
  `randomy` int(10) unsigned NOT NULL DEFAULT '0',
  `locx1` int(10) unsigned NOT NULL DEFAULT '0',
  `locy1` int(10) unsigned NOT NULL DEFAULT '0',
  `locx2` int(10) unsigned NOT NULL DEFAULT '0',
  `locy2` int(10) unsigned NOT NULL DEFAULT '0',
  `heading` int(10) unsigned NOT NULL DEFAULT '0',
  `mapid` int(10) unsigned NOT NULL DEFAULT '0',
  `respawn_screen` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `movement_distance` int(10) unsigned NOT NULL DEFAULT '0',
  `rest` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `spawn_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `percentage` tinyint(3) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=213 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of spawnlist_boss
-- ----------------------------
INSERT INTO `spawnlist_boss` VALUES ('1', 'Sea Dancer', 'SeaDancer', '1', '45228', '0', '32804', '32869', '0', '0', '32576', '32640', '32895', '32959', '5', '63', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('2', 'Tiger', 'Tiger', '1', '45313', '0', '32767', '32899', '0', '0', '32660', '32791', '32875', '33007', '0', '480', '0', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('3', 'Bandit', 'Bandit', '1', '45317', '0', '32770', '32730', '0', '0', '32704', '32704', '32831', '32831', '5', '56', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('4', 'Crocodile', 'Crocodile', '1', '45338', '0', '33503', '33205', '0', '0', '33485', '33185', '33522', '33227', '0', '4', '1', '100', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('5', 'Bandit Leader', 'BanditLeader', '1', '45370', '0', '33878', '32749', '10', '10', '0', '0', '0', '0', '0', '4', '0', '100', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('6', 'Bandit Leader', 'BanditLeader', '1', '45370', '0', '33859', '32766', '10', '10', '0', '0', '0', '0', '0', '4', '0', '100', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('7', 'Bandit Leader', 'BanditLeader', '1', '45370', '0', '33781', '32681', '10', '10', '0', '0', '0', '0', '0', '4', '0', '100', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('8', 'Bandit Leader', 'BanditLeader', '1', '45370', '0', '33841', '32778', '10', '10', '0', '0', '0', '0', '0', '4', '0', '100', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('9', 'Bandit Leader', 'BanditLeader', '1', '45370', '0', '33820', '32664', '10', '10', '0', '0', '0', '0', '0', '4', '0', '100', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('10', 'Necromancer', 'etc1', '1', '45456', '15', '32727', '32751', '0', '0', '32704', '32704', '32831', '32831', '0', '12', '0', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('11', 'Spirit of Drake', 'Oren', '1', '45458', '0', '32764', '32837', '0', '0', '0', '0', '0', '0', '5', '443', '0', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('16', 'Caspa', 'Caspa', '1', '45488', '14', '32739', '32740', '3', '3', '0', '0', '0', '0', '0', '10', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('17', 'Caspa', 'Caspa', '1', '45488', '14', '32762', '32768', '3', '3', '0', '0', '0', '0', '0', '9', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('18', 'Kuman', 'etc1', '1', '45492', '49', '32767', '32899', '0', '0', '32673', '32861', '32834', '32970', '0', '480', '0', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('21', 'Zenith Queen', 'ZenithQueen', '1', '45513', '0', '32798', '32798', '0', '0', '32704', '32704', '32895', '32895', '6', '110', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('22', 'Ifrit', 'Ifrit', '1', '45516', '0', '33644', '32269', '0', '0', '33635', '32232', '33659', '32300', '0', '4', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('23', 'Ifrit', 'Ifrit', '1', '45516', '0', '33672', '32311', '0', '0', '33655', '32288', '33690', '32335', '0', '4', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('24', 'Ifrit', 'Ifrit', '1', '45516', '0', '33719', '32269', '0', '0', '33697', '32237', '33740', '32283', '0', '4', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('25', 'Ifrit', 'Ifrit', '1', '45516', '0', '33737', '32281', '0', '0', '33723', '32270', '33765', '32329', '0', '4', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('26', 'Drake', '2Drake', '1', '45529', '17', '33406', '32412', '0', '0', '33398', '32403', '33410', '32415', '5', '4', '1', '100', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('27', 'Drake', '1Drake', '1', '45529', '0', '33355', '32353', '0', '0', '33339', '32348', '33354', '32363', '5', '4', '1', '100', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('28', 'Drake', '1Drake', '1', '45529', '0', '33389', '32336', '0', '0', '33382', '32330', '33397', '32345', '5', '4', '1', '100', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('29', 'Drake', '2Drake', '1', '45529', '17', '33365', '32384', '0', '0', '33356', '32375', '33371', '32390', '5', '4', '1', '100', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('30', 'Mambo Rabbit Orange Vest', 'Caspa', '1', '45535', '21', '32799', '32839', '0', '0', '32723', '32787', '32875', '32892', '0', '430', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('31', 'Dark Elder', 'DarkElder', '1', '45545', '16', '33385', '32349', '1', '1', '0', '0', '0', '0', '0', '4', '1', '100', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('32', 'Dark Elder', 'DarkElder', '1', '45545', '16', '33271', '32394', '1', '1', '0', '0', '0', '0', '0', '4', '1', '100', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('33', 'Doppelganger', 'DoppelGanger', '1', '45546', '0', '33709', '33307', '0', '0', '33698', '33281', '33745', '33328', '0', '4', '1', '100', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('34', 'Seer', 'Seer', '1', '45547', '0', '32800', '32799', '0', '0', '32722', '32722', '32877', '32877', '0', '120', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('35', 'Baphomet', 'Baphomet', '1', '45573', '0', '32706', '32846', '0', '0', '32704', '32842', '32711', '32849', '5', '2', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('36', 'Beleth', 'Beleth', '1', '45583', '0', '32768', '32768', '0', '0', '32758', '32758', '32777', '32777', '0', '24', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('37', 'Greater Minotaur', 'Aden', '1', '45584', '0', '32652', '32726', '0', '0', '32640', '32713', '32676', '32761', '0', '70', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('38', 'Kurtz', 'Night', '1', '45600', '13', '32635', '32959', '0', '0', '32621', '32951', '32640', '32971', '0', '0', '1', '35', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('39', 'Death Knight', 'DK', '1', '45601', '0', '32799', '32804', '0', '0', '32704', '32704', '32831', '32831', '0', '11', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('40', 'Death Knight', 'DK', '1', '45601', '0', '32793', '32784', '0', '0', '32704', '32704', '32831', '32831', '0', '12', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('42', 'Vampire', 'Oren', '1', '45606', '0', '32799', '32799', '0', '0', '32722', '32722', '32877', '32877', '6', '130', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('43', 'Ice Queen', 'Oren', '1', '45609', '0', '32767', '32900', '0', '0', '32763', '32886', '32783', '32910', '5', '74', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('44', 'Ancient Giant', 'Aden', '1', '45610', '0', '34230', '33369', '0', '0', '34238', '33383', '34254', '33406', '0', '4', '1', '100', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('45', 'DeathKnight', 'DK', '1', '45614', '0', '32729', '32813', '12', '12', '0', '0', '0', '0', '4', '51', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('46', 'Phoenix', 'DK', '1', '45617', '0', '33723', '32255', '0', '0', '33718', '32240', '33725', '32268', '0', '4', '1', '100', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('47', 'Knight Vald', 'Oren', '1', '45618', '0', '32724', '32822', '0', '0', '32576', '32768', '32767', '32959', '5', '180', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('48', 'Chaos', 'DK', '1', '45625', '0', '32734', '32895', '6', '6', '0', '0', '0', '0', '0', '522', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('49', 'Unicorn', 'Unicorn', '3', '45640', '0', '32740', '32735', '0', '0', '32728', '32717', '32752', '32753', '4', '303', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('50', 'Great Spirit of Earth', 'Caspa', '1', '45642', '0', '32727', '32749', '0', '0', '32685', '32701', '32770', '32798', '4', '303', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('51', 'Great Spirit of Water', 'Caspa', '1', '45643', '0', '32762', '32616', '0', '0', '32717', '32593', '32808', '32640', '4', '303', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('52', 'Great Spirit of Wind', 'Caspa', '1', '45644', '0', '32624', '32807', '0', '0', '32588', '32739', '32660', '32876', '4', '303', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('53', 'Great Spirit of Fire', 'Caspa', '1', '45645', '0', '32833', '32778', '0', '0', '32798', '32738', '32869', '32818', '4', '303', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('54', 'Abyss Master', 'Oren', '1', '45646', '0', '32824', '32815', '0', '0', '32704', '32768', '32959', '33023', '0', '430', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('55', 'Demon', 'Oren', '1', '45649', '0', '32698', '32823', '0', '0', '32640', '32768', '32767', '32895', '0', '82', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('56', 'Zombie Lord', 'Oren', '1', '45650', '0', '32800', '32797', '0', '0', '32722', '32722', '32877', '32877', '0', '140', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('57', 'Dread King Baranka', 'Aden', '1', '45651', '0', '32915', '32896', '0', '0', '32964', '32881', '32998', '32915', '0', '320', '0', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('58', 'Cougar', 'Oren', '1', '45652', '0', '32794', '32800', '0', '0', '32722', '32722', '32877', '32877', '5', '150', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('59', 'Mummy Lord', 'Oren', '1', '45653', '0', '32721', '32822', '0', '0', '32576', '32768', '32767', '32959', '3', '160', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('60', 'Iris', 'Oren', '1', '45654', '0', '32721', '32822', '0', '0', '32576', '32768', '32767', '32959', '0', '170', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('61', 'Aaarrrggg...', 'Aden', '1', '45671', '0', '32681', '32947', '0', '0', '32678', '32937', '32692', '32948', '5', '243', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('62', 'Lich', 'Oren', '1', '45672', '0', '32716', '32817', '0', '0', '32576', '32768', '32767', '32959', '0', '190', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('63', 'Grim Reaper', 'Oren', '1', '45673', '0', '32784', '32806', '0', '0', '32576', '32768', '32831', '33023', '6', '200', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('64', 'Death', 'DK', '1', '45674', '0', '32746', '32897', '0', '0', '0', '0', '0', '0', '0', '523', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('65', 'Yahee', 'DK', '1', '45675', '0', '32733', '32894', '0', '0', '0', '0', '0', '0', '0', '524', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('68', 'Ken Rauhel', 'Aden', '1', '45680', '18', '34092', '33262', '0', '0', '34079', '33250', '34100', '33271', '0', '4', '0', '100', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('69', 'Lindvior', 'Dragon', '1', '45681', '0', '34041', '33007', '3', '3', '0', '0', '0', '0', '0', '4', '0', '100', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('70', 'Antharas', 'Dragon', '1', '45682', '0', '32697', '32823', '3', '3', '0', '0', '0', '0', '0', '37', '0', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('71', 'Fafurion', 'Dragon', '1', '45683', '0', '32771', '32831', '3', '3', '0', '0', '0', '0', '0', '65', '0', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('72', 'Valakas', 'Dragon', '1', '45684', '0', '32725', '32800', '3', '3', '0', '0', '0', '0', '0', '67', '0', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('73', 'Tarak', 'DK', '1', '45685', '0', '32904', '32801', '0', '0', '32889', '32788', '32916', '32810', '0', '410', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('74', 'Jindo Puppy', 'Unknown', '1', '45711', '0', '32511', '33024', '0', '0', '32276', '32785', '32746', '33263', '0', '440', '0', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('75', 'Jindo Puppy', 'Unknown', '1', '45711', '0', '32767', '32899', '0', '0', '32660', '32791', '32875', '33007', '0', '480', '0', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('76', 'Jindo Puppy', 'Unknown', '1', '45711', '0', '32796', '32863', '0', '0', '32629', '32692', '32964', '32978', '0', '70', '0', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('77', 'Jindo Puppy', 'Unknown', '1', '45711', '0', '32671', '32862', '0', '0', '32527', '32718', '32815', '33007', '0', '69', '0', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('78', 'Jindo Puppy', 'Unknown', '1', '45711', '0', '32522', '33013', '0', '0', '32299', '32787', '32745', '33240', '0', '0', '0', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('79', 'Jindo Puppy', 'Unknown', '1', '45711', '0', '32804', '32734', '0', '0', '32654', '32591', '32955', '32878', '0', '68', '0', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('80', 'Jindo Puppy', 'Unknown', '5', '45711', '0', '33408', '32834', '0', '0', '32528', '32200', '34288', '33519', '0', '4', '0', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('81', 'Great King Squid', 'Unknown', '1', '45734', '0', '32781', '32799', '0', '0', '32704', '32768', '33215', '33279', '0', '558', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('82', 'Chief Mermaid', 'Unknown', '1', '45735', '0', '32781', '32799', '0', '0', '32704', '32768', '33215', '33279', '0', '558', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('83', 'Varlok', 'DK', '1', '45752', '0', '32726', '32832', '0', '0', '0', '0', '0', '0', '0', '603', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('84', 'Polluted Orc Warrior', 'Unknown', '1', '45772', '0', '32729', '32792', '0', '0', '32729', '32792', '32809', '32930', '5', '244', '1', '100', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('85', 'Spirit', 'Unknown', '1', '45795', '0', '32841', '32913', '0', '0', '32841', '32913', '32880', '32947', '5', '244', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('86', 'Diamond Golem of Maino Shaman', 'Unknown', '1', '45801', '0', '32778', '32797', '0', '0', '0', '0', '0', '0', '5', '255', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('87', 'Maino Shaman', 'Unknown', '1', '45802', '0', '32696', '32793', '0', '0', '32640', '32768', '32895', '33023', '5', '256', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('88', 'Barbados', 'Unknown', '1', '45829', '0', '32675', '32860', '0', '0', '0', '0', '0', '0', '0', '254', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('89', 'Elindaire', 'Caspa', '1', '81081', '0', '32727', '32808', '0', '0', '32640', '32768', '32767', '32895', '5', '60', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('90', 'Elindaire', 'Caspa', '1', '81081', '0', '32727', '32808', '0', '0', '32640', '32768', '32767', '32895', '5', '61', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('91', 'Jose', 'Oren', '1', '45548', '0', '32775', '32849', '0', '0', '32710', '32770', '32830', '32895', '5', '484', '0', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('92', 'Assassin Squad Leader Blaze', 'Unknown', '1', '45585', '0', '32785', '32837', '0', '0', '0', '0', '0', '0', '5', '495', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('93', 'Palace General Kyte', 'Unknown', '1', '45574', '0', '32831', '32762', '0', '0', '0', '0', '0', '0', '5', '494', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('94', 'Slave of Assassin King', 'Unknown', '1', '45648', '0', '32853', '32863', '0', '0', '0', '0', '0', '0', '5', '492', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('95', 'Brigade Commander Dark Fencer', 'Unknown', '1', '45577', '0', '32783', '32837', '0', '0', '0', '0', '0', '0', '5', '452', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('96', 'Dread King Baranka', 'Unknown', '1', '45844', '0', '32838', '32758', '0', '0', '0', '0', '0', '0', '5', '453', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('97', 'Division Commander Sinclair', 'Unknown', '1', '45588', '0', '32745', '32823', '0', '0', '0', '0', '0', '0', '5', '456', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('98', 'Evil Power Squad Leader Kybar', 'Unknown', '1', '45607', '0', '32758', '32823', '0', '0', '0', '0', '0', '0', '5', '455', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('99', 'Temple Head Bounty', 'Unknown', '1', '45612', '0', '32770', '32829', '0', '0', '0', '0', '0', '0', '5', '466', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('100', 'Evil Magic Squad Leader Carmiel', 'Unknown', '1', '45602', '0', '32842', '32821', '0', '0', '0', '0', '0', '0', '5', '461', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('101', 'Dread Queen Laia', 'Unknown', '1', '45863', '0', '32805', '32839', '0', '0', '0', '0', '0', '0', '5', '462', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('102', 'Mercenary Commander Mephaisto', 'Unknown', '1', '45608', '0', '32791', '32815', '0', '0', '0', '0', '0', '0', '5', '471', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('103', 'Bright Magic Troup Leader Crepus', 'Unknown', '1', '45615', '0', '32922', '32846', '0', '0', '0', '0', '0', '0', '5', '473', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('104', 'Bright Magic King Hellvine', 'Unknown', '1', '45676', '0', '32785', '32844', '0', '0', '0', '0', '0', '0', '5', '475', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('19', 'Mambo Rabbit Pink Vest', 'Caspa', '1', '45534', '20', '32594', '33009', '0', '0', '32581', '32993', '32654', '33044', '0', '440', '1', '100', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('109', 'Cursed Medusa', '1Drake', '1', '45935', '0', '32700', '32830', '0', '0', '32640', '32768', '32767', '32895', '0', '60', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('110', 'Cursed Great Spirit of Water', '1Drake', '1', '45942', '0', '32700', '32830', '0', '0', '32640', '32768', '32767', '32895', '0', '61', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('111', 'Spirit of Water', '1Drake', '1', '45941', '0', '32735', '32799', '0', '0', '32576', '32640', '32895', '32959', '0', '63', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('112', 'Spirit of Water', '1Drake', '1', '45931', '0', '32735', '32799', '0', '0', '32576', '32640', '32895', '32959', '0', '63', '1', '0', '1', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('113', 'Kapu', '1Drake', '1', '45943', '0', '32735', '32799', '0', '0', '32576', '32640', '32895', '32959', '0', '63', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('114', 'Giant Worm', '1Drake', '1', '45944', '0', '32735', '32799', '0', '0', '32576', '32640', '32895', '32959', '0', '63', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('115', 'Supreme Court Justice Keyna', 'Unknown', '1', '45955', '0', '32862', '32840', '0', '0', '0', '0', '0', '0', '5', '530', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('116', 'Supreme Court Justice Viatas', 'Unknown', '1', '45956', '0', '32757', '32744', '0', '0', '0', '0', '0', '0', '5', '531', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('117', 'Supreme Court Justice Baromes', 'Unknown', '1', '45957', '0', '32791', '32786', '0', '0', '0', '0', '0', '0', '5', '531', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('118', 'Supreme Court Justice Endias', 'Unknown', '1', '45958', '0', '32845', '32857', '0', '0', '0', '0', '0', '0', '5', '531', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('119', 'Supreme Court Justice Edea', 'Unknown', '1', '45959', '0', '32789', '32812', '0', '0', '0', '0', '0', '0', '5', '532', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('120', 'Supreme Court Justice Tiames', 'Unknown', '1', '45960', '0', '32859', '32897', '0', '0', '0', '0', '0', '0', '5', '533', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('121', 'Supreme Court Justice Ramias', 'Unknown', '1', '45961', '0', '32789', '32891', '0', '0', '0', '0', '0', '0', '5', '533', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('122', 'Supreme Court Justice Barode', 'Unknown', '1', '45962', '0', '32753', '32811', '0', '0', '0', '0', '0', '0', '5', '533', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('123', 'New King Adjutant Cassandra', 'Unknown', '1', '45963', '0', '32858', '32821', '0', '0', '0', '0', '0', '0', '5', '534', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('12', 'Evil Spirit of Heine', '1Drake', '1', '45923', '0', '32700', '32830', '0', '0', '32640', '32768', '32767', '32895', '0', '59', '1', '100', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('13', 'Evil Spirit of Heine', '1Drake', '1', '45923', '0', '32700', '32830', '0', '0', '32640', '32768', '32767', '32895', '0', '60', '1', '100', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('14', 'Evil Spirit of Heine', '1Drake', '1', '45923', '0', '32700', '32830', '0', '0', '32640', '32768', '32767', '32895', '0', '61', '1', '100', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('15', 'Count Taros', 'Oren', '1', '46025', '0', '32797', '32788', '0', '0', '0', '0', '0', '0', '0', '251', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('20', 'Mammon', 'Oren', '1', '46026', '0', '32797', '32792', '0', '0', '0', '0', '0', '0', '0', '251', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('105', 'General Hamel Full of Resentment', 'Caspa', '1', '45916', '0', '32626', '32658', '0', '0', '0', '0', '0', '0', '4', '4', '1', '0', '1', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('41', 'Dread Queen Laia', 'Aden', '1', '45677', '0', '33033', '32935', '0', '0', '0', '0', '0', '0', '6', '320', '0', '100', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('66', 'Teranus', 'Aden', '1', '45666', '0', '32773', '32913', '0', '0', '0', '0', '0', '0', '6', '450', '0', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('67', 'Zyrus', 'Aden', '1', '45668', '0', '32771', '32897', '0', '0', '0', '0', '0', '0', '6', '450', '0', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('200', 'Great Spirit of Earth', 'Caspa', '1', '45642', '0', '32727', '32749', '0', '0', '32685', '32701', '32770', '32798', '4', '303', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('201', 'Great Spirit of Earth', 'Caspa', '1', '45642', '0', '32727', '32749', '0', '0', '32685', '32701', '32770', '32798', '4', '303', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('202', 'Great Spirit of Water', 'Caspa', '1', '45643', '0', '32762', '32616', '0', '0', '32717', '32593', '32808', '32640', '4', '303', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('203', 'Great Spirit of Water', 'Caspa', '1', '45643', '0', '32762', '32616', '0', '0', '32717', '32593', '32808', '32640', '4', '303', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('204', 'Great Spirit of Fire', 'Caspa', '1', '45645', '0', '32833', '32778', '0', '0', '32798', '32738', '32869', '32818', '4', '303', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('205', 'Great Spirit of Fire', 'Caspa', '1', '45645', '0', '32833', '32778', '0', '0', '32798', '32738', '32869', '32818', '4', '303', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('206', 'Cronos', 'Cronos', '1', '90004', '0', '32744', '32996', '0', '0', '0', '0', '0', '0', '5', '69', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('207', 'Kugas', 'Kugas', '1', '90010', '0', '32744', '32996', '0', '0', '0', '0', '0', '0', '5', '69', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('208', 'Elazer', 'Elazer', '1', '90005', '0', '32663', '32654', '0', '0', '0', '0', '0', '0', '5', '68', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('209', 'Zarlok', 'Zarlok', '1', '90009', '0', '32738', '32781', '0', '0', '0', '0', '0', '0', '5', '69', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('210', 'Baell Zaer', 'BaellZaer', '1', '90003', '0', '32744', '32996', '12', '12', '0', '0', '0', '0', '5', '1', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('211', 'Girtas', 'Girtas', '1', '81163', '0', '32868', '32862', '0', '0', '0', '0', '0', '0', '5', '535', '1', '0', '0', '0', '100');
INSERT INTO `spawnlist_boss` VALUES ('212', 'Dread Tom Kidd', 'DreadTomKid', '1', '81315', '0', '32877', '32638', '12', '12', '0', '0', '0', '0', '5', '701', '1', '100', '0', '0', '100');
