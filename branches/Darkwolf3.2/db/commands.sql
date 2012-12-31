/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:43:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `commands`
-- ----------------------------
DROP TABLE IF EXISTS `commands`;
CREATE TABLE `commands` (
  `name` varchar(255) NOT NULL,
  `access_level` int(10) NOT NULL DEFAULT '200',
  `class_name` varchar(255) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commands
-- ----------------------------
INSERT INTO `commands` VALUES ('echo', '200', 'L1Echo');
INSERT INTO `commands` VALUES ('setting', '200', 'L1Status');
INSERT INTO `commands` VALUES ('summon', '200', 'L1Summon');
INSERT INTO `commands` VALUES ('cleaning', '200', 'L1DeleteGroundItem');
INSERT INTO `commands` VALUES ('addskill', '200', 'L1AddSkill');
INSERT INTO `commands` VALUES ('level', '200', 'L1Level');
INSERT INTO `commands` VALUES ('loc', '100', 'L1Loc');
INSERT INTO `commands` VALUES ('desc', '200', 'L1Describe');
INSERT INTO `commands` VALUES ('who', '100', 'L1Who');
INSERT INTO `commands` VALUES ('allbuff', '200', 'L1AllBuff');
INSERT INTO `commands` VALUES ('speed', '100', 'L1Speed');
INSERT INTO `commands` VALUES ('adena', '200', 'L1Adena');
INSERT INTO `commands` VALUES ('hpbar', '200', 'L1HpBar');
INSERT INTO `commands` VALUES ('resettrap', '200', 'L1ResetTrap');
INSERT INTO `commands` VALUES ('reloadtrap', '200', 'L1ReloadTrap');
INSERT INTO `commands` VALUES ('showtrap', '200', 'L1ShowTrap');
INSERT INTO `commands` VALUES ('gfxid', '200', 'L1GfxId');
INSERT INTO `commands` VALUES ('invgfxid', '200', 'L1InvGfxId');
INSERT INTO `commands` VALUES ('hometown', '200', 'L1HomeTown');
INSERT INTO `commands` VALUES ('gm', '200', 'L1GM');
INSERT INTO `commands` VALUES ('present', '200', 'L1Present');
INSERT INTO `commands` VALUES ('lvpresent', '200', 'L1LevelPresent');
INSERT INTO `commands` VALUES ('shutdown', '200', 'L1Shutdown');
INSERT INTO `commands` VALUES ('create', '200', 'L1CreateItem');
INSERT INTO `commands` VALUES ('itemset', '200', 'L1CreateItemSet');
INSERT INTO `commands` VALUES ('buff', '200', 'L1Buff');
INSERT INTO `commands` VALUES ('burf', '200', 'L1Burf');
INSERT INTO `commands` VALUES ('patrol', '200', 'L1Patrol');
INSERT INTO `commands` VALUES ('banip', '200', 'L1BanIp');
INSERT INTO `commands` VALUES ('chat', '200', 'L1Chat');
INSERT INTO `commands` VALUES ('chatng', '200', 'L1ChatNG');
INSERT INTO `commands` VALUES ('skick', '200', 'L1SKick');
INSERT INTO `commands` VALUES ('kick', '200', 'L1Kick');
INSERT INTO `commands` VALUES ('powerkick', '200', 'L1PowerKick');
INSERT INTO `commands` VALUES ('accbankick', '200', 'L1AccountBanKick');
INSERT INTO `commands` VALUES ('poly', '200', 'L1Poly');
INSERT INTO `commands` VALUES ('ress', '200', 'L1Ress');
INSERT INTO `commands` VALUES ('kill', '200', 'L1Kill');
INSERT INTO `commands` VALUES ('gmroom', '100', 'L1GMRoom');
INSERT INTO `commands` VALUES ('resolve', '200', 'L1Resolve');
INSERT INTO `commands` VALUES ('tele', '100', 'L1Move');
INSERT INTO `commands` VALUES ('weather', '100', 'L1ChangeWeather');
INSERT INTO `commands` VALUES ('tospawn', '200', 'L1ToSpawn');
INSERT INTO `commands` VALUES ('f', '200', 'L1Favorite');
INSERT INTO `commands` VALUES ('recall', '200', 'L1Recall');
INSERT INTO `commands` VALUES ('show', '100', 'L1Visible');
INSERT INTO `commands` VALUES ('partyrecall', '200', 'L1PartyRecall');
INSERT INTO `commands` VALUES ('invis', '100', 'L1Invisible');
INSERT INTO `commands` VALUES ('spawn', '200', 'L1SpawnCmd');
INSERT INTO `commands` VALUES ('insert', '200', 'L1InsertSpawn');
INSERT INTO `commands` VALUES ('help', '100', 'L1CommandHelp');
INSERT INTO `commands` VALUES ('action', '200', 'L1Action');
INSERT INTO `commands` VALUES ('rates', '200', 'L1Rates');
INSERT INTO `commands` VALUES ('find', '200', 'L1Search');
INSERT INTO `commands` VALUES ('dm', '200', 'L1StartDm');
INSERT INTO `commands` VALUES ('goto', '100', 'L1ToPC');
INSERT INTO `commands` VALUES ('item', '100', 'L1ItemDrops');
INSERT INTO `commands` VALUES ('mob', '100', 'L1MobDrops');
INSERT INTO `commands` VALUES ('pbuff', '100', 'L1Pbuff');
INSERT INTO `commands` VALUES ('jail', '200', 'L1Jail');
INSERT INTO `commands` VALUES ('viewbug', '100', 'L1ViewBug');
INSERT INTO `commands` VALUES ('gotobug', '200', 'L1GotoBug');
INSERT INTO `commands` VALUES ('pet', '200', 'L1AddPet');
INSERT INTO `commands` VALUES ('findinvis', '200', 'L1FindInvis');
INSERT INTO `commands` VALUES ('exprate', '200', 'L1ChangeExp');
INSERT INTO `commands` VALUES ('droprate', '200', 'L1ChangeDrop');
INSERT INTO `commands` VALUES ('ressall', '200', 'L1RessAll');
INSERT INTO `commands` VALUES ('allbufftoall', '200', 'L1AllBuffToAll');
INSERT INTO `commands` VALUES ('shop', '200', 'L1AddItemShop');
INSERT INTO `commands` VALUES ('siege', '200', 'L1WarStart');
INSERT INTO `commands` VALUES ('remove_instancemap', '200', 'L1RemoveInstanceMap');
INSERT INTO `commands` VALUES ('add_instancemap', '200', 'L1AddInstanceMap');
INSERT INTO `commands` VALUES ('reload', '200', 'L1Reload');
INSERT INTO `commands` VALUES ('tile', '200', 'L1Tile');
