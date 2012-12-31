/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:45:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `logelfwarehousein`
-- ----------------------------
DROP TABLE IF EXISTS `logelfwarehousein`;
CREATE TABLE `logelfwarehousein` (
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Ip` varchar(255) DEFAULT NULL,
  `Account` varchar(255) DEFAULT NULL,
  `CharId` int(11) DEFAULT NULL,
  `CharName` varchar(255) DEFAULT NULL,
  `ClanId` int(11) DEFAULT NULL,
  `ClanName` varchar(255) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ItemName` varchar(255) DEFAULT NULL,
  `EnchantLevel` int(11) DEFAULT NULL,
  `ItemCountBefore` int(11) DEFAULT NULL,
  `ItemCountAfter` int(11) DEFAULT NULL,
  `ItemCountDiff` int(11) DEFAULT NULL,
  `ItemCount` int(11) DEFAULT NULL,
  `InCount` int(11) DEFAULT NULL,
  `CountDiff` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logelfwarehousein
-- ----------------------------
