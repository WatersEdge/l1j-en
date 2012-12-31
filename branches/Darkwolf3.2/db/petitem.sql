/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:46:19
*/

SET FOREIGN_KEY_CHECKS=0;

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
