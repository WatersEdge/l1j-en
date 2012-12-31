/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:39:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `beginner`
-- ----------------------------
DROP TABLE IF EXISTS `beginner`;
CREATE TABLE `beginner` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_id` int(6) NOT NULL DEFAULT '0',
  `count` int(10) NOT NULL DEFAULT '0',
  `enchantlvl` int(6) NOT NULL DEFAULT '0',
  `item_name` varchar(50) NOT NULL DEFAULT '',
  `activate` char(1) NOT NULL DEFAULT 'A',
  `is_id` int(1) DEFAULT '0',
  `charge_count` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of beginner
-- ----------------------------
INSERT INTO `beginner` VALUES ('1', '40308', '100', '0', 'Adena', 'A', '0', '0');
INSERT INTO `beginner` VALUES ('2', '4', '1', '0', 'Dagger', 'A', '0', '0');
INSERT INTO `beginner` VALUES ('4', '173', '1', '0', 'Short Bow', 'E', '0', '0');
INSERT INTO `beginner` VALUES ('5', '40743', '100', '0', 'Arrow', 'E', '0', '0');
INSERT INTO `beginner` VALUES ('7', '20322', '1', '0', 'Leather Jacket', 'P', '0', '0');
INSERT INTO `beginner` VALUES ('8', '20322', '1', '0', 'Leather Jacket', 'K', '0', '0');
INSERT INTO `beginner` VALUES ('9', '20322', '1', '0', 'Leather Jacket', 'W', '0', '0');
INSERT INTO `beginner` VALUES ('10', '20322', '1', '0', 'Leather Jacket', 'D', '0', '0');
INSERT INTO `beginner` VALUES ('3', '29001', '1', '0', 'Wooden Jacket', 'E', '0', '0');
INSERT INTO `beginner` VALUES ('6', '40641', '1', '0', 'Talking Scroll', 'A', '0', '0');
