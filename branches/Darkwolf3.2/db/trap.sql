/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:47:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `trap`
-- ----------------------------
DROP TABLE IF EXISTS `trap`;
CREATE TABLE `trap` (
  `id` int(8) NOT NULL,
  `note` varchar(64) DEFAULT NULL,
  `type` varchar(64) NOT NULL,
  `gfxId` int(4) NOT NULL,
  `isDetectionable` tinyint(1) NOT NULL,
  `base` int(4) NOT NULL,
  `dice` int(4) NOT NULL,
  `diceCount` int(4) NOT NULL,
  `poisonType` char(1) NOT NULL DEFAULT 'n',
  `poisonDelay` int(4) NOT NULL DEFAULT '0',
  `poisonTime` int(4) NOT NULL DEFAULT '0',
  `poisonDamage` int(4) NOT NULL DEFAULT '0',
  `monsterNpcId` int(4) NOT NULL DEFAULT '0',
  `monsterCount` int(4) NOT NULL DEFAULT '0',
  `teleportX` int(4) NOT NULL DEFAULT '0',
  `teleportY` int(4) NOT NULL DEFAULT '0',
  `teleportMapId` int(4) NOT NULL DEFAULT '0',
  `skillId` int(4) NOT NULL DEFAULT '0',
  `skillTimeSeconds` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trap
-- ----------------------------
INSERT INTO `trap` VALUES ('1', 'Damage 1', 'L1DamageTrap', '1065', '1', '10', '10', '1', '-', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('2', 'Damage 2', 'L1HealingTrap', '1074', '0', '10', '10', '1', '-', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('3', 'Normal Poison', 'L1PoisonTrap', '1066', '1', '0', '0', '0', 'd', '0', '5000', '10', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('4', 'Silence Poison', 'L1PoisonTrap', '1066', '1', '0', '0', '0', 's', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('5', 'Paralysis Poison', 'L1PoisonTrap', '1066', '1', '0', '0', '0', 'p', '5000', '5000', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('6', 'Damage 3', 'L1DamageTrap', '1085', '1', '10', '10', '1', '-', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('7', 'Damage 4', 'L1DamageTrap', '1070', '1', '10', '10', '1', '-', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('8', 'TOI4F: Mutant Arachnevil Elder', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45348', '2', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('9', 'TOI8F: Cimaera', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45407', '2', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('10', 'TOI14F: Succubus', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45394', '2', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('11', 'TOI18F: Wicked Beholder', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45406', '2', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('12', 'TOI24F: Horrific Fire Egg', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45384', '2', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('13', 'TOI28F: Horrific Cerberus', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45471', '2', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('14', 'TOI34F: Raging Skeleton Pike', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45403', '2', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('15', 'TOI38F: Raging Spartoi', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45455', '2', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('16', 'TOI44F: Fire Ghost', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45514', '2', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('17', 'TOI48F: Bone Dragon', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45522', '2', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('18', 'TOI54F: Cursed Elmore Soldier', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45524', '2', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('19', 'TOI64F: Cruel Snow Tiger', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45528', '2', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('20', 'TOI74F: Black Knight of Darkness', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45503', '2', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('21', 'TOI78F: Fire Archer of Darkness', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45532', '2', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('22', 'TOI84F: Lesser Seer', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45586', '2', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('23', 'TOI94F: Great Spirit of Wind', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45621', '2', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('24', 'IT4F: Iron Golem', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45372', '2', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('25', 'IT4F: Mimic', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45141', '2', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('26', 'IT4F: Living Armor', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45322', '2', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('27', 'IT5F: Iron Golem', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45372', '3', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('28', 'IT5F: Mimic', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45141', '3', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('29', 'IT5F: Living Armor', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45322', '3', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('30', 'IT6F: Silhouette', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45162', '3', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('31', 'IT6F: Death', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45221', '3', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('32', 'IT7F: Silhouette', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45162', '4', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('33', 'IT7F: Death', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45221', '4', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('34', 'IT8F: Iron Golem', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45372', '5', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('35', 'IT8F: Silhouette', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45162', '5', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('36', 'IT8F: Death', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45221', '5', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('37', 'IT8F: Living Armor', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45322', '5', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('38', '', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45247', '4', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('39', '', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45274', '4', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('40', '', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45330', '4', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('41', '', 'L1MonsterTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45314', '4', '0', '0', '0', '0', '0');
INSERT INTO `trap` VALUES ('42', '', 'L1TeleportTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '45247', '4', '32679', '32742', '482', '0', '0');
INSERT INTO `trap` VALUES ('43', '', 'L1TeleportTrap', '0', '0', '0', '0', '0', 'n', '0', '0', '0', '0', '0', '32736', '32800', '483', '0', '0');
INSERT INTO `trap` VALUES ('44', '', 'L1SkillTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '0', '0', '0', '0', '0', '33', '0');
INSERT INTO `trap` VALUES ('45', '', 'L1SkillTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '0', '0', '0', '0', '0', '20', '5');
INSERT INTO `trap` VALUES ('46', '', 'L1SkillTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '0', '0', '0', '0', '0', '29', '5');
INSERT INTO `trap` VALUES ('47', '', 'L1SkillTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '0', '0', '0', '0', '0', '43', '5');
INSERT INTO `trap` VALUES ('48', '', 'L1TeleportTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '0', '0', '32730', '32829', '5140', '0', '0');
INSERT INTO `trap` VALUES ('49', '', 'L1TeleportTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '0', '0', '32749', '32813', '5140', '0', '0');
INSERT INTO `trap` VALUES ('50', '', 'L1TeleportTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '0', '0', '32747', '32867', '5140', '0', '0');
INSERT INTO `trap` VALUES ('51', '', 'L1TeleportTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '0', '0', '32785', '32819', '5140', '0', '0');
INSERT INTO `trap` VALUES ('52', '', 'L1TeleportTrap', '0', '0', '0', '0', '0', '-', '0', '0', '0', '0', '0', '32797', '32869', '5140', '0', '0');
