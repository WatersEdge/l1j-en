/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:39:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `armor_set`
-- ----------------------------
DROP TABLE IF EXISTS `armor_set`;
CREATE TABLE `armor_set` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `note` varchar(45) DEFAULT NULL,
  `sets` varchar(1000) NOT NULL,
  `polyid` int(10) NOT NULL DEFAULT '0',
  `ac` int(2) NOT NULL DEFAULT '0',
  `hp` int(5) NOT NULL DEFAULT '0',
  `mp` int(5) NOT NULL DEFAULT '0',
  `hpr` int(5) NOT NULL DEFAULT '0',
  `mpr` int(5) NOT NULL DEFAULT '0',
  `mr` int(5) NOT NULL DEFAULT '0',
  `str` int(2) NOT NULL DEFAULT '0',
  `dex` int(2) NOT NULL DEFAULT '0',
  `con` int(2) NOT NULL DEFAULT '0',
  `wis` int(2) NOT NULL DEFAULT '0',
  `cha` int(2) NOT NULL DEFAULT '0',
  `intl` int(2) NOT NULL DEFAULT '0',
  `defense_water` int(2) NOT NULL DEFAULT '0',
  `defense_wind` int(2) NOT NULL DEFAULT '0',
  `defense_fire` int(2) NOT NULL DEFAULT '0',
  `defense_earth` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='MyISAM free: 10240 kB';

-- ----------------------------
-- Records of armor_set
-- ----------------------------
INSERT INTO `armor_set` VALUES ('1', 'Demon Set - Demon', '20009,20099,20165,20197', '3889', '-2', '0', '0', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('2', 'Death Knight Set - Death Knight', '20010,20100,20166,20198', '6137', '-4', '0', '0', '-7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('3', 'Pretender King Set - Ken Rahuel', '20024,20118,20170,20203', '3903', '-3', '0', '0', '12', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('4', 'Kurtz Set - Kurtz', '20041,20150,20184,20214', '3101', '-4', '0', '0', '-7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('5', 'Cerenis Set - Cerenis', '20042,20151,20185,20215', '3902', '-2', '0', '100', '0', '12', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('6', 'Pumpkin Set - Jack-O-Lantern', '20047', '2501', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('7', 'Cloak of Vampire - Vampire', '20079', '3952', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('8', 'Cloak of Sashin - Death', '20342', '2388', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('9', 'Easter Bunny Hat - Pink Vest Mambo', '20343', '4767', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('10', 'Easter Bunny Hat w/Carrot - Orange Vest Mambo', '20344', '4769', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('11', 'Left-Hand Ring of Dopple Boss - Skeleton', '20278', '2374', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('12', 'Right-Hand Ring of Dopple Boss - Orc Fighter', '20277', '3864', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('13', 'Necklace of Doppleganger Boss - Werewolf', '20250', '3865', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('14', 'High Collie Choker - High Collie', '20345', '4928', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('15', 'High Raccoon Necklace - High Raccoon', '20346', '4929', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('16', 'Hakama - Blue Hakama', '20347', '4227', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('17', 'Holiday Attire - Orange Haregi', '20348', '3750', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('18', 'Amulet of Beagle - Beagle', '20349', '938', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('19', 'Amulet of Snow Man - Snowman', '20350', '2064', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('20', 'Carrot and Stocking - Snowman', '20351,20352', '2064', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('21', 'Lucky Cat Scarf - Manekineko Cat', '20420', '5719', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('22', 'Red Mask - Red Orc', '20382', '6010', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('23', 'Drake Captain Transformation Turban', '20452', '6089', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('24', 'Iris Transformation Turban', '20453', '4001', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('25', 'Knight Vald Transformation Turban', '20454', '4000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('26', 'Succubus Queen Transformation Turban', '20455', '4004', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('27', 'Red Soccer Uniform - Red Soccer Player', '20456', '5184', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('28', 'Blue Soccer Uniform - blue Soccer Player', '20457', '5186', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('29', 'Red Orc Mask - Red Orc', '20458', '6010', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('30', 'Helmet for Horse Riding  - Mounted Royal', '20383', '6080', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('31', 'Halloween Blessing Cap - Jack-O-Lantern', '20380', '6400', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('32', 'High Bear Choker - High Bear', '20419', '5976', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('33', 'Leather Set', '20001,20090,20193,20219', '-1', '-3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('34', 'Orcish Fighter Set - Orc Fighter', '20034,20072,20135,20237', '3864', '-3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('35', 'Dwarf Set - Dwarf', '20007,20052,20223', '3863', '-1', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('36', 'Studded Leather Set', '20038,20148,20241,20212', '-1', '-3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('37', 'Bone Set', '20045,20124,20221', '-1', '-2', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('38', 'Elven Named Set', '20389,20393,20401,20409,20406', '-1', '-2', '15', '10', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('39', 'Mage Set', '20012,20111', '-1', '0', '0', '50', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('40', 'Iron Set', '20003,20091,20163,20194,20220', '-1', '-7', '30', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('41', 'Blue Pirate Set', '20044,20155,20188,20217', '-1', '-1', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('42', 'Yahee Set', '20031,20069,20083,20131,20179,20209,20290,20261', '-1', '-88', '100', '100', '15', '15', '0', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('43', 'Arcane King Set', '20057,20109,20178,20200', '-1', '0', '30', '30', '10', '10', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('44', 'Fidelity Set', '20390,20395,20402,20410,20408', '-1', '-20', '100', '20', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('45', 'Wet Set', '21051,21052,21053,21054,21055,21056', '-1', '-10', '100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('46', 'Hope Set', '20413,20428', '-1', '0', '0', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('47', 'Luck Set', '20414,20430', '-1', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('48', 'Passion Set', '20415,20429', '-1', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('49', 'Truth Set', '20416,20431', '-1', '0', '15', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('50', 'Miracle Set', '20417,20432', '-1', '0', '15', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('51', 'Affection Set', '20418,20433', '-1', '0', '0', '0', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('52', 'Red Curse Set', '20423,21019', '-1', '0', '0', '0', '0', '0', '0', '2', '0', '-2', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('53', 'Blue Curse Set', '20424,21019', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-2', '0', '2', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('54', 'Green Curse Set', '20425,21019', '-1', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '-2', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('75', 'Red Knight Set', '20230,20027', '-1', '-2', '10', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('56', '????????', '21062', '5412', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('57', '?????????', '21063', '6746', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('58', '??????????', '21064', '6747', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('59', '??????????', '21065', '6749', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('60', '????????', '21066', '6750', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_set` VALUES ('55', '', '21061', '5484', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
