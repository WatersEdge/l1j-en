/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:40:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `character_config`
-- ----------------------------
DROP TABLE IF EXISTS `character_config`;
CREATE TABLE `character_config` (
  `object_id` int(10) NOT NULL DEFAULT '0',
  `length` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob,
  PRIMARY KEY (`object_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of character_config
-- ----------------------------
