/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:39:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `board`
-- ----------------------------
DROP TABLE IF EXISTS `board`;
CREATE TABLE `board` (
  `id` int(10) NOT NULL DEFAULT '0',
  `name` varchar(16) DEFAULT NULL,
  `date` varchar(16) DEFAULT NULL,
  `title` varchar(16) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of board
-- ----------------------------
