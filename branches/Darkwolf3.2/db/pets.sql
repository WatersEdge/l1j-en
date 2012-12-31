/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:46:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `pets`
-- ----------------------------
DROP TABLE IF EXISTS `pets`;
CREATE TABLE `pets` (
  `item_obj_id` int(10) unsigned NOT NULL DEFAULT '0',
  `objid` int(10) unsigned NOT NULL DEFAULT '0',
  `npcid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(45) NOT NULL DEFAULT '',
  `lvl` int(10) unsigned NOT NULL DEFAULT '0',
  `hp` int(10) unsigned NOT NULL DEFAULT '0',
  `mp` int(10) unsigned NOT NULL DEFAULT '0',
  `exp` int(10) unsigned NOT NULL DEFAULT '0',
  `lawful` int(10) unsigned NOT NULL DEFAULT '0',
  `food` int(2) NOT NULL DEFAULT '0',
  `itemid1` int(10) unsigned NOT NULL DEFAULT '0',
  `itemid2` int(10) unsigned NOT NULL DEFAULT '0',
  `itemid3` int(10) unsigned NOT NULL DEFAULT '0',
  `itemid4` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_obj_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pets
-- ----------------------------
