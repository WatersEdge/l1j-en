/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:46:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `mobgroup`
-- ----------------------------
DROP TABLE IF EXISTS `mobgroup`;
CREATE TABLE `mobgroup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `note` varchar(255) NOT NULL DEFAULT '',
  `remove_group_if_leader_die` int(10) unsigned NOT NULL DEFAULT '0',
  `leader_id` int(10) unsigned NOT NULL DEFAULT '0',
  `minion1_id` int(10) unsigned NOT NULL DEFAULT '0',
  `minion1_count` int(10) unsigned NOT NULL DEFAULT '0',
  `minion2_id` int(10) unsigned NOT NULL DEFAULT '0',
  `minion2_count` int(10) unsigned NOT NULL DEFAULT '0',
  `minion3_id` int(10) unsigned NOT NULL DEFAULT '0',
  `minion3_count` int(10) unsigned NOT NULL DEFAULT '0',
  `minion4_id` int(10) unsigned NOT NULL DEFAULT '0',
  `minion4_count` int(10) unsigned NOT NULL DEFAULT '0',
  `minion5_id` int(10) unsigned NOT NULL DEFAULT '0',
  `minion5_count` int(10) unsigned NOT NULL DEFAULT '0',
  `minion6_id` int(10) unsigned NOT NULL DEFAULT '0',
  `minion6_count` int(10) unsigned NOT NULL DEFAULT '0',
  `minion7_id` int(10) unsigned NOT NULL DEFAULT '0',
  `minion7_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=177 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mobgroup
-- ----------------------------
INSERT INTO `mobgroup` VALUES ('1', 'Black Knight Search Party(8)', '0', '81066', '81066', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('2', 'Elmore General(1) Elmore Soldier(2) Elmore Wizard(2)', '0', '45248', '45216', '2', '45224', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('3', 'Elmore General(1) Elmore Soldier(1) Elmore Wizard(2)', '0', '45248', '45216', '1', '45224', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('4', 'Elmore General(1) Elmore Soldier(2) Elmore Wizard(1)', '0', '45248', '45216', '2', '45224', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('5', 'Goblin(8)', '0', '45008', '45008', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('6', 'Hobgoblin(1) Goblin(3)', '0', '45140', '45008', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('7', 'Elder(1) Floating Eye(2)', '0', '45215', '45068', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('8', 'Orc Fighter(1) Orc(2) Orc Archer(2)', '0', '45082', '45017', '2', '45019', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('9', 'Fire Egg(4)', '0', '45206', '45206', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('10', 'Ghast Lord(1) Ghast(3)', '0', '45346', '45213', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('11', 'Zombie(16)', '0', '45065', '45065', '15', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('12', 'Mermaid(1) Merman(3)', '0', '45154', '45159', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('13', 'Kurtz (1) Black Knight(8)', '0', '45600', '45165', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('14', 'Caspa(1) Merkyor(1) Baltazar(1) Sema(1)', '0', '45488', '45497', '1', '45473', '1', '45464', '1', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('15', 'Necromancer(1) Ghoul(4) Floating Eye(2)', '0', '45456', '45157', '4', '45068', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('16', 'Dark Elder(1) Spartoi(2)', '0', '45545', '45161', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('17', 'Drake(2)', '0', '45529', '45529', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('18', 'Ken Rahuel(1) Cerenis(1)', '0', '45680', '45678', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('19', 'Dread King Baranka(1) Laia(1)', '0', '45651', '45677', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('20', 'Mambo Rabbit(1) Mambo Rabbit Servant(3)', '0', '45534', '45366', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('21', 'Mambo Rabbit(1) Mambo Rabbit Servant(3)', '0', '45535', '45366', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('22', 'Abyss Master(1) Fang of Earth(1) Fang of Water(1)Fang of Flame(1) Fang of Wind(1)', '0', '45646', '45416', '1', '45419', '1', '45424', '1', '45418', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('23', 'Mutant Arachnevil Elder(3)', '0', '45348', '45348', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('24', 'Medusa(3)', '0', '45380', '45380', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('25', 'Cimaera(3)', '0', '45407', '45407', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('26', 'Cockatrice(3)', '0', '81173', '81173', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('27', 'Succubus(3)', '0', '45394', '45394', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('28', 'Dire Wolf(3)', '0', '45409', '45409', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('29', 'Wicked Beholder(3)', '0', '45406', '45406', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('30', 'Dancing Sword(3)', '0', '45386', '45386', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('31', 'Nightmare(3)', '0', '45440', '45440', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('32', 'Horrific Fire Egg(3)', '0', '45384', '45384', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('33', 'Horrific Cerberus(3)', '0', '45471', '45471', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('34', 'Lesser Demon(3)', '0', '45481', '45481', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('35', 'Ifrit(3)', '0', '45515', '45515', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('36', 'Raging Skeleton Pike(3)', '0', '45403', '45403', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('37', 'Raging Ghoul(3)', '0', '45454', '45454', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('38', 'Raging Spartoi(3)', '0', '45455', '45455', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('39', 'Raging Skeleton Marksman(3)', '0', '45494', '45494', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('40', 'Cursed Elmore General(3)', '0', '45541', '45541', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('41', 'Spirit Taurverus of Fire(3)', '0', '45520', '45520', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('42', 'Astagio of Fire(3)', '0', '45572', '45572', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('43', 'Fire Archer of Darkness(3)', '0', '45532', '45532', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('44', 'Insolent Zenith Queen(3)', '0', '45581', '45581', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('45', 'Marquise Vampire(3)', '0', '45604', '45604', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('46', 'Zombie Lord of Fear(3)', '0', '45589', '45589', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('47', 'Great Spirit of Fire(2)', '0', '45622', '45622', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('48', 'Great Spirit of Water(2)', '0', '45620', '45620', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('49', 'Kuman(1) Heavy Lizardman(2)', '0', '45492', '81174', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('50', 'Black Knight(8)', '0', '45165', '45165', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('51', 'Count Elite Guard General(1) Guard Dog(2)', '1', '46024', '46019', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('172', 'Orc Emissary(1) Escort of Orc Emissary(2)', '1', '46157', '46160', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('173', 'Orc Emissary(1) Escort of Orc Emissary(2)', '1', '46158', '46160', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('174', 'Orc Emissary(1) Escort of Orc Emissary(2)', '1', '46159', '46160', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('175', 'Hen(5)', '0', '70981', '70981', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('176', 'Pig(5)', '0', '70983', '70983', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('52', '', '0', '46082', '46083', '1', '46084', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('53', '', '0', '46085', '46086', '1', '46087', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('54', '', '0', '46088', '46089', '1', '46090', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('55', '', '0', '46097', '46098', '1', '46099', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('56', '', '0', '46100', '46101', '1', '46102', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('57', '', '0', '46103', '46104', '1', '46105', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('58', '', '0', '45539', '45501', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('59', '', '0', '45539', '45502', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('60', '', '0', '45422', '45297', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('61', '', '0', '45423', '45374', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('62', '', '0', '45603', '45537', '1', '45530', '1', '45498', '1', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('63', '', '0', '46107', '46107', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('64', '', '0', '46135', '46135', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('65', '', '0', '46138', '46138', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('66', '', '0', '46139', '46139', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('67', '', '0', '46137', '46137', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('68', '', '0', '46141', '46140', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('69', '', '0', '45448', '45836', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('70', '', '0', '45315', '45647', '1', '45579', '1', '45569', '1', '45482', '1', '45450', '1', '45391', '1', '0', '0');
INSERT INTO `mobgroup` VALUES ('71', '', '0', '45570', '45571', '1', '45582', '1', '45587', '1', '45605', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('72', '', '1', '46157', '46160', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('73', '', '1', '46158', '46160', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('74', '', '1', '46159', '46160', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('75', '', '0', '45624', '45628', '2', '45629', '1', '45630', '1', '45596', '2', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('76', '', '0', '45623', '45631', '2', '45632', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('77', '', '0', '91266', '91265', '2', '91266', '2', '91267', '2', '91268', '2', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('78', '', '0', '91272', '91273', '2', '91270', '1', '91271', '3', '91276', '1', '91274', '1', '91275', '1', '0', '0');
INSERT INTO `mobgroup` VALUES ('79', '', '0', '91272', '91273', '4', '91270', '3', '91271', '3', '91274', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('80', '', '0', '91271', '91273', '2', '91270', '2', '91271', '1', '91274', '4', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('81', '', '0', '91272', '91273', '1', '91271', '2', '91276', '3', '91275', '2', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('82', '', '0', '91269', '91273', '2', '91270', '3', '91271', '2', '91276', '1', '91274', '1', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('83', '', '0', '91270', '91273', '1', '91270', '1', '91271', '2', '91272', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('84', '', '0', '91273', '91273', '1', '91271', '3', '91276', '2', '91274', '2', '91275', '3', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('86', '', '0', '91340', '91340', '1', '45278', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('85', '', '0', '91341', '91340', '2', '91341', '2', '91342', '2', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mobgroup` VALUES ('87', '', '0', '91341', '91341', '1', '45298', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
