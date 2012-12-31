/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:43:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `clan_warehouse`
-- ----------------------------
DROP TABLE IF EXISTS `clan_warehouse`;
CREATE TABLE `clan_warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clan_name` varchar(45) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `is_equipped` int(11) DEFAULT NULL,
  `enchantlvl` int(11) DEFAULT NULL,
  `is_id` int(11) DEFAULT NULL,
  `durability` int(11) DEFAULT NULL,
  `last_used` datetime DEFAULT NULL,
  `bless` int(11) DEFAULT NULL,
  `attr_enchant_level` int(11) DEFAULT NULL,
  `attr_enchant_kind` int(11) DEFAULT NULL,
  `charge_count` int(11) DEFAULT NULL,
  `remaining_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `key_id` (`clan_name`)
) ENGINE=MyISAM AUTO_INCREMENT=308179730 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clan_warehouse
-- ----------------------------
