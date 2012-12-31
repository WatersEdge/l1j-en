/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 14:13:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `checkwartime`
-- ----------------------------
DROP TABLE IF EXISTS `checkwartime`;
CREATE TABLE `checkwartime` (
  `castle_id` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `isActive` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`castle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of checkwartime
-- ----------------------------
INSERT INTO `checkwartime` VALUES ('1', 'Kent Castle', '0');
INSERT INTO `checkwartime` VALUES ('2', 'Orc Castle', '0');
INSERT INTO `checkwartime` VALUES ('3', 'Windawood Castle', '0');
INSERT INTO `checkwartime` VALUES ('4', 'Giran Castle', '0');
INSERT INTO `checkwartime` VALUES ('5', 'Heine Castle', '0');
INSERT INTO `checkwartime` VALUES ('6', 'Dwarf Castle', '0');
INSERT INTO `checkwartime` VALUES ('7', 'Aden Castle', '0');
INSERT INTO `checkwartime` VALUES ('8', 'Diad Fortress', '0');
