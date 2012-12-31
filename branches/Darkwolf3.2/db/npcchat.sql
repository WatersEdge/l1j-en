/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 14:12:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `npcchat`
-- ----------------------------
DROP TABLE IF EXISTS `npcchat`;
CREATE TABLE `npcchat` (
  `npc_id` int(10) unsigned NOT NULL DEFAULT '0',
  `chat_timing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `note` varchar(45) NOT NULL DEFAULT '',
  `start_delay_time` int(10) NOT NULL DEFAULT '0',
  `chat_id1` varchar(45) NOT NULL DEFAULT '',
  `chat_id2` varchar(45) NOT NULL DEFAULT '',
  `chat_id3` varchar(45) NOT NULL DEFAULT '',
  `chat_id4` varchar(45) NOT NULL DEFAULT '',
  `chat_id5` varchar(45) NOT NULL DEFAULT '',
  `chat_interval` int(10) unsigned NOT NULL DEFAULT '0',
  `is_shout` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_world_chat` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_repeat` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `repeat_interval` int(10) unsigned NOT NULL DEFAULT '0',
  `game_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`npc_id`,`chat_timing`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of npcchat
-- ----------------------------
INSERT INTO `npcchat` VALUES ('45473', '0', 'Baltuzar', '0', '$339', '', '', '', '', '60', '1', '0', '1', '20000', '0');
INSERT INTO `npcchat` VALUES ('45488', '0', 'Caspa', '5000', '$340', '', '', '', '', '60', '1', '0', '1', '20000', '0');
INSERT INTO `npcchat` VALUES ('45497', '0', 'Merkyor', '10000', '$341', '', '', '', '', '60', '1', '0', '1', '20000', '0');
INSERT INTO `npcchat` VALUES ('45464', '0', 'Sema', '15000', '$342', '', '', '', '', '60', '1', '0', '1', '20000', '0');
INSERT INTO `npcchat` VALUES ('45545', '0', 'Dark Elder', '0', '$993', '', '', '', '', '60', '1', '0', '1', '10000', '0');
INSERT INTO `npcchat` VALUES ('45545', '1', 'Dark Elder', '0', '$995', '', '', '', '', '60', '1', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('45600', '0', 'Kurtz', '0', '$275', '$279', '$281', '$285', '$287', '60', '0', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('45600', '1', 'Kurtz', '0', '$302', '', '', '', '', '60', '1', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('45264', '2', 'Harpy', '0', '$994', '', '', '', '', '60', '0', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('45573', '0', 'Baphomet', '0', '$825', '', '', '', '', '0', '1', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('45931', '1', 'Spirit of Water', '0', '$5167', '', '', '', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('45935', '0', 'Cursed Medusa', '0', '$5169', '', '', '', '', '0', '0', '0', '0', '10000', '0');
INSERT INTO `npcchat` VALUES ('45941', '1', 'Cursed Exorcist Saell', '0', '$5166', '', '', '', '', '0', '1', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('45942', '0', 'Cursed Great Spirit of Water', '0', '$5170', '', '', '', '', '0', '1', '0', '0', '10000', '0');
INSERT INTO `npcchat` VALUES ('45943', '1', 'Kapu', '0', '$5165', '', '', '', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('46083', '0', 'Patrol 2', '0', '$5016', '', '', '', '', '0', '1', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('46098', '0', 'Patrol 2', '0', '$5014', '', '', '', '', '0', '1', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('45577', '1', 'Brigade Commander Dark Fencer', '0', '$3892', '', '', '', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('45607', '1', 'Evil Power Squad Leader Kybar', '0', '$3900', '', '', '', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('45863', '1', 'Dread Queen Laia', '0', '$3908', '', '', '', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('45676', '1', 'Bright Magic King Hellvine', '0', '$3923', '', '', '', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('45648', '1', 'Slave of Assassin King', '0', '$3940', '', '', '', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('45588', '1', 'Division Commander Sinclair', '0', '$3901', '', '', '', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('45602', '1', 'Evil Magic Squad Leader Carmiel', '0', '$3903', '', '', '', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('45608', '1', 'Mercenary Commander Mephaisto', '0', '$3930', '', '', '', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('45612', '1', 'Temple Head Bounty', '0', '$3912', '', '', '', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('45844', '1', 'Dread King Baranka', '0', '$3895', '', '', '', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('45615', '1', 'Bright Magic Troup Leader Crepus', '0', '$3917', '', '', '', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('45585', '1', 'Assassin Squad Leader Blaze', '0', '$3939', '', '', '', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('45574', '1', 'Palace General Kyte', '0', '$3938', '', '', '', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('45492', '1', 'Kuman', '0', '$3943', '', '', '', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('45548', '1', 'Jose', '0', '$4030', '', '', '', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('45955', '1', 'Supreme Court Justice Kenya', '0', '$4625', '', '', '', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('45959', '1', 'Supreme Court Justice Edea', '0', '$4626', '', '', '', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('45963', '1', 'New King Adjutant Cassandra', '0', '$3888', '', '', '', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('46157', '1', 'Orc Emissary', '0', '$6127', '', '', '', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('46158', '1', 'Orc Emissary', '0', '$6127', '', '', '', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('46159', '1', 'Orc Emissary', '0', '$6127', '', '', '', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('81175', '0', 'Wanted Criminal Kuzak', '0', '$5325', '', '', '', '', '0', '1', '0', '1', '15000', '0');
INSERT INTO `npcchat` VALUES ('81175', '1', 'Wanted Criminal Kuzak', '0', '$5327', '', '', '', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `npcchat` VALUES ('45458', '1', 'Captain Drake', '0', '$3603', '', '', '', '', '0', '0', '0', '0', '0', '0');
