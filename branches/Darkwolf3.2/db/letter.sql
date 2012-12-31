/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:44:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `letter`
-- ----------------------------
DROP TABLE IF EXISTS `letter`;
CREATE TABLE `letter` (
  `item_object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `code` int(10) unsigned NOT NULL DEFAULT '0',
  `sender` varchar(16) DEFAULT NULL,
  `receiver` varchar(16) DEFAULT NULL,
  `date` varchar(16) DEFAULT NULL,
  `template_id` int(5) unsigned NOT NULL DEFAULT '0',
  `subject` blob,
  `content` blob,
  PRIMARY KEY (`item_object_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of letter
-- ----------------------------
