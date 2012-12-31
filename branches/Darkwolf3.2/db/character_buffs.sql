/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:40:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `character_buffs`
-- ----------------------------
DROP TABLE IF EXISTS `character_buffs`;
CREATE TABLE `character_buffs` (
  `char_obj_id` int(10) unsigned NOT NULL DEFAULT '0',
  `skill_id` int(10) unsigned NOT NULL DEFAULT '0',
  `remaining_time` int(10) NOT NULL DEFAULT '0',
  `poly_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attr_kind` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_obj_id`,`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of character_buffs
-- ----------------------------
