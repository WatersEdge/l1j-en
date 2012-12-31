/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:42:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `character_pvp`
-- ----------------------------
DROP TABLE IF EXISTS `character_pvp`;
CREATE TABLE `character_pvp` (
  `killer_char_obj_id` int(11) DEFAULT NULL,
  `killer_char_name` varchar(20) DEFAULT NULL,
  `killer_lvl` int(11) DEFAULT NULL,
  `victim_char_obj_id` int(11) DEFAULT NULL,
  `victim_char_name` varchar(20) DEFAULT NULL,
  `victim_lvl` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `locx` int(11) DEFAULT NULL,
  `locy` int(11) DEFAULT NULL,
  `mapid` int(11) DEFAULT NULL,
  `penalty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of character_pvp
-- ----------------------------
