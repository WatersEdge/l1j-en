/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:45:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `logenchantsuccess`
-- ----------------------------
DROP TABLE IF EXISTS `logenchantsuccess`;
CREATE TABLE `logenchantsuccess` (
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Ip` varchar(255) DEFAULT NULL,
  `Account` varchar(255) DEFAULT NULL,
  `CharId` int(11) DEFAULT NULL,
  `CharName` varchar(255) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ItemName` varchar(255) DEFAULT NULL,
  `ItemCount` int(11) DEFAULT NULL,
  `EnchantBefore` int(11) DEFAULT NULL,
  `EnchantAfter` int(11) DEFAULT NULL,
  `EnchantDiff` int(11) DEFAULT NULL,
  `EnchantNum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logenchantsuccess
-- ----------------------------
