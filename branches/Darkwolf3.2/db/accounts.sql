/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:39:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `accounts`
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `login` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(64) DEFAULT NULL,
  `lastactive` datetime DEFAULT NULL,
  `access_level` int(11) DEFAULT NULL,
  `ip` varchar(20) NOT NULL DEFAULT '',
  `host` varchar(255) NOT NULL DEFAULT '',
  `banned` int(11) unsigned NOT NULL DEFAULT '0',
  `character_slot` int(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='MyISAM free: 3072 kB';

-- ----------------------------
-- Records of accounts
-- ----------------------------
