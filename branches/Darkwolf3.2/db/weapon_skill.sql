/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:47:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `weapon_skill`
-- ----------------------------
DROP TABLE IF EXISTS `weapon_skill`;
CREATE TABLE `weapon_skill` (
  `weapon_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `note` varchar(255) DEFAULT NULL,
  `probability` int(11) unsigned NOT NULL DEFAULT '0',
  `fix_damage` int(11) unsigned NOT NULL DEFAULT '0',
  `random_damage` int(11) unsigned NOT NULL DEFAULT '0',
  `area` int(11) NOT NULL DEFAULT '0',
  `skill_id` int(11) unsigned NOT NULL DEFAULT '0',
  `skill_time` int(11) unsigned NOT NULL DEFAULT '0',
  `effect_id` int(11) unsigned NOT NULL DEFAULT '0',
  `effect_target` int(11) unsigned NOT NULL DEFAULT '0',
  `arrow_type` int(11) unsigned NOT NULL DEFAULT '0',
  `attr` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`weapon_id`)
) ENGINE=MyISAM AUTO_INCREMENT=450004 DEFAULT CHARSET=utf8 COMMENT='MyISAM free: 10240 kB';

-- ----------------------------
-- Records of weapon_skill
-- ----------------------------
INSERT INTO `weapon_skill` VALUES ('47', 'Sword of Silence', '7', '0', '0', '0', '64', '16', '2177', '0', '0', '0');
INSERT INTO `weapon_skill` VALUES ('54', 'Sword of Kurtz ', '15', '35', '25', '0', '0', '0', '10', '0', '0', '8');
INSERT INTO `weapon_skill` VALUES ('58', 'Fire Sword of Death Knight', '7', '75', '15', '0', '0', '0', '1811', '0', '0', '2');
INSERT INTO `weapon_skill` VALUES ('76', 'Edoryu of Ronde', '15', '35', '25', '0', '0', '0', '1805', '0', '0', '1');
INSERT INTO `weapon_skill` VALUES ('121', 'Staff of Ice Queen', '25', '95', '55', '0', '0', '0', '1810', '0', '0', '4');
INSERT INTO `weapon_skill` VALUES ('450000', 'Thor\'s Hammer', '16', '20', '25', '0', '0', '0', '3940', '0', '0', '0');
INSERT INTO `weapon_skill` VALUES ('450001', 'Paagrio\'s Hatred', '12', '25', '20', '0', '0', '0', '245', '0', '0', '0');
INSERT INTO `weapon_skill` VALUES ('450002', 'Maphr\'s Retribution', '10', '20', '30', '0', '0', '0', '1812', '0', '0', '0');
INSERT INTO `weapon_skill` VALUES ('450003', 'Orcish Bume Smache', '15', '15', '30', '0', '0', '0', '762', '0', '0', '0');
INSERT INTO `weapon_skill` VALUES ('36', 'Eva\'s Scorn', '16', '20', '15', '0', '0', '0', '1714', '0', '0', '0');
INSERT INTO `weapon_skill` VALUES ('203', 'Two-Handed Sword of Varlok', '15', '90', '90', '2', '0', '0', '762', '0', '0', '2');
INSERT INTO `weapon_skill` VALUES ('256', 'Pumpkin Sword', '8', '35', '25', '0', '0', '0', '2750', '0', '0', '1');
INSERT INTO `weapon_skill` VALUES ('205', 'Longbow of Moon', '10', '8', '0', '0', '0', '0', '6288', '0', '1', '0');
INSERT INTO `weapon_skill` VALUES ('257', 'unknown', '8', '35', '25', '0', '0', '0', '2750', '0', '0', '1');
INSERT INTO `weapon_skill` VALUES ('258', 'unknown', '8', '35', '25', '0', '0', '0', '2750', '0', '0', '1');
