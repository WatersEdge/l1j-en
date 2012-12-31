/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:40:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `botreport`
-- ----------------------------
DROP TABLE IF EXISTS `botreport`;
CREATE TABLE `botreport` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `charname` varchar(45) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of botreport
-- ----------------------------
