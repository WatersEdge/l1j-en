/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:45:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `logstatusup`
-- ----------------------------
DROP TABLE IF EXISTS `logstatusup`;
CREATE TABLE `logstatusup` (
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Ip` varchar(255) DEFAULT NULL,
  `Account` varchar(255) DEFAULT NULL,
  `CharId` int(11) DEFAULT NULL,
  `CharName` varchar(255) DEFAULT NULL,
  `Level` int(11) DEFAULT NULL,
  `Str` int(11) DEFAULT NULL,
  `BaseStr` int(11) DEFAULT NULL,
  `Dex` int(11) DEFAULT NULL,
  `BaseDex` int(11) DEFAULT NULL,
  `Con` int(11) DEFAULT NULL,
  `BaseCon` int(11) DEFAULT NULL,
  `Int` int(11) DEFAULT NULL,
  `BaseInt` int(11) DEFAULT NULL,
  `Wis` int(11) DEFAULT NULL,
  `BaseWis` int(11) DEFAULT NULL,
  `Cha` int(11) DEFAULT NULL,
  `BaseCha` int(11) DEFAULT NULL,
  `SorceStat` int(11) DEFAULT NULL,
  `BonusStats` int(11) DEFAULT NULL,
  `AllStats` int(11) DEFAULT NULL,
  `DiffSc` int(11) DEFAULT NULL,
  `DiffSr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logstatusup
-- ----------------------------
