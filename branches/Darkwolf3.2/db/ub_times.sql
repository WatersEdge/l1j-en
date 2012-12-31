/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:47:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ub_times`
-- ----------------------------
DROP TABLE IF EXISTS `ub_times`;
CREATE TABLE `ub_times` (
  `ub_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ub_time` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ub_times
-- ----------------------------
INSERT INTO `ub_times` VALUES ('1', '500');
INSERT INTO `ub_times` VALUES ('1', '1600');
INSERT INTO `ub_times` VALUES ('1', '2100');
INSERT INTO `ub_times` VALUES ('2', '400');
INSERT INTO `ub_times` VALUES ('2', '1500');
INSERT INTO `ub_times` VALUES ('2', '2000');
INSERT INTO `ub_times` VALUES ('3', '300');
INSERT INTO `ub_times` VALUES ('3', '1400');
INSERT INTO `ub_times` VALUES ('3', '1900');
INSERT INTO `ub_times` VALUES ('4', '200');
INSERT INTO `ub_times` VALUES ('4', '1300');
INSERT INTO `ub_times` VALUES ('4', '1800');
INSERT INTO `ub_times` VALUES ('5', '100');
INSERT INTO `ub_times` VALUES ('5', '600');
INSERT INTO `ub_times` VALUES ('5', '1700');
