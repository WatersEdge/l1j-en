/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:40:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bugs`
-- ----------------------------
DROP TABLE IF EXISTS `bugs`;
CREATE TABLE `bugs` (
  `id` int(13) unsigned NOT NULL AUTO_INCREMENT,
  `bugtext` varchar(255) NOT NULL DEFAULT '',
  `charname` varchar(45) NOT NULL DEFAULT '',
  `mapID` int(6) NOT NULL DEFAULT '0',
  `mapX` int(6) NOT NULL DEFAULT '0',
  `mapY` int(6) NOT NULL DEFAULT '0',
  `resolved` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bugs
-- ----------------------------
