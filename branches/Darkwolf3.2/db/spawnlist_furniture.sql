/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:47:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `spawnlist_furniture`
-- ----------------------------
DROP TABLE IF EXISTS `spawnlist_furniture`;
CREATE TABLE `spawnlist_furniture` (
  `item_obj_id` int(10) unsigned NOT NULL DEFAULT '0',
  `npcid` int(10) unsigned NOT NULL DEFAULT '0',
  `locx` int(10) NOT NULL DEFAULT '0',
  `locy` int(10) NOT NULL DEFAULT '0',
  `mapid` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_obj_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of spawnlist_furniture
-- ----------------------------
INSERT INTO `spawnlist_furniture` VALUES ('308094770', '80122', '33379', '32823', '4');
