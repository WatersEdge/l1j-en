/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:39:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ban_ip`
-- ----------------------------
DROP TABLE IF EXISTS `ban_ip`;
CREATE TABLE `ban_ip` (
  `ip` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='MyISAM free: 3072 kB';

-- ----------------------------
-- Records of ban_ip
-- ----------------------------
INSERT INTO `ban_ip` VALUES ('58.120.214.241');
INSERT INTO `ban_ip` VALUES ('69.246.255.39');
INSERT INTO `ban_ip` VALUES ('70.188.175.243');
INSERT INTO `ban_ip` VALUES ('75.172.49.146');
