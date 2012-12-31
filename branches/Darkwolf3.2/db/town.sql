/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:47:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `town`
-- ----------------------------
DROP TABLE IF EXISTS `town`;
CREATE TABLE `town` (
  `town_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(45) NOT NULL DEFAULT '',
  `leader_id` int(10) unsigned NOT NULL DEFAULT '0',
  `leader_name` varchar(45) DEFAULT NULL,
  `tax_rate` int(10) unsigned NOT NULL DEFAULT '0',
  `tax_rate_reserved` int(10) unsigned NOT NULL DEFAULT '0',
  `sales_money` int(10) unsigned NOT NULL DEFAULT '0',
  `sales_money_yesterday` int(10) unsigned NOT NULL DEFAULT '0',
  `town_tax` int(10) unsigned NOT NULL DEFAULT '0',
  `town_fix_tax` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`town_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of town
-- ----------------------------
INSERT INTO `town` VALUES ('1', 'Talking Island Village', '0', null, '0', '0', '0', '0', '0', '884');
INSERT INTO `town` VALUES ('2', 'Silver Knight Town', '307058084', 'Belenthrond', '0', '0', '0', '0', '0', '7134');
INSERT INTO `town` VALUES ('3', 'Gludio', '290675889', 'ARES', '0', '0', '0', '0', '0', '0');
INSERT INTO `town` VALUES ('4', 'Fire Farmers Town', '291961946', 'HP', '0', '0', '0', '0', '0', '0');
INSERT INTO `town` VALUES ('5', 'Windawood', '0', null, '0', '0', '0', '0', '0', '0');
INSERT INTO `town` VALUES ('6', 'Kent Village', '0', null, '0', '0', '0', '0', '0', '0');
INSERT INTO `town` VALUES ('7', 'Giran', '272333725', 'Filth', '0', '0', '0', '0', '0', '35258');
INSERT INTO `town` VALUES ('8', 'Heine', '0', null, '0', '0', '0', '0', '0', '0');
INSERT INTO `town` VALUES ('9', 'Werldern Village', '300686371', 'Lysandria', '0', '0', '0', '0', '0', '20456');
INSERT INTO `town` VALUES ('10', 'Oren', '295792391', 'Escence', '0', '0', '0', '0', '0', '168746');
