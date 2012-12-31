/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:40:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `castle`
-- ----------------------------
DROP TABLE IF EXISTS `castle`;
CREATE TABLE `castle` (
  `castle_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(45) NOT NULL DEFAULT '',
  `war_time` datetime DEFAULT NULL,
  `tax_rate` int(11) NOT NULL DEFAULT '0',
  `public_money` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`castle_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of castle
-- ----------------------------
INSERT INTO `castle` VALUES ('1', 'Kent Castle', '2008-09-06 22:00:00', '10', '0');
INSERT INTO `castle` VALUES ('2', 'Orc Castle', '2008-05-01 21:00:00', '10', '0');
INSERT INTO `castle` VALUES ('3', 'Windawood Castle', '2008-10-06 22:00:00', '10', '0');
INSERT INTO `castle` VALUES ('4', 'Giran Castle', '2008-09-29 22:00:00', '10', '0');
INSERT INTO `castle` VALUES ('5', 'Heine Castle', '2008-10-08 22:00:00', '10', '0');
INSERT INTO `castle` VALUES ('6', 'Dwarf Castle', '2008-10-06 20:00:00', '10', '0');
INSERT INTO `castle` VALUES ('7', 'Aden Castle', '2008-10-08 20:00:00', '10', '0');
INSERT INTO `castle` VALUES ('8', 'Diad Fortress', '2008-10-06 20:00:00', '10', '0');
