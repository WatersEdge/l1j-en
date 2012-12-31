/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:44:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `inn`
-- ----------------------------
DROP TABLE IF EXISTS `inn`;
CREATE TABLE `inn` (
  `name` varchar(45) DEFAULT '',
  `npcid` int(10) NOT NULL,
  `room_number` int(5) NOT NULL,
  `key_id` int(11) DEFAULT NULL,
  `lodger_id` int(11) DEFAULT NULL,
  `hall` tinyint(2) DEFAULT NULL,
  `due_time` datetime DEFAULT NULL,
  PRIMARY KEY (`npcid`,`room_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of inn
-- ----------------------------
INSERT INTO `inn` VALUES ('Talking Island', '70012', '0', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Talking Island', '70012', '1', '0', '0', '1', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Talking Island', '70012', '2', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Talking Island', '70012', '3', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Talking Island', '70012', '4', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Talking Island', '70012', '5', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Talking Island', '70012', '6', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Talking Island', '70012', '7', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Talking Island', '70012', '8', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Talking Island', '70012', '9', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Talking Island', '70012', '10', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Talking Island', '70012', '11', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Talking Island', '70012', '12', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Talking Island', '70012', '13', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Talking Island', '70012', '14', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Talking Island', '70012', '15', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Gludio', '70019', '0', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Gludio', '70019', '1', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Gludio', '70019', '2', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Gludio', '70019', '3', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Gludio', '70019', '4', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Gludio', '70019', '5', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Gludio', '70019', '6', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Gludio', '70019', '7', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Gludio', '70019', '8', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Gludio', '70019', '9', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Gludio', '70019', '10', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Gludio', '70019', '11', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Gludio', '70019', '12', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Gludio', '70019', '13', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Gludio', '70019', '14', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Gludio', '70019', '15', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Giran', '70031', '0', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Giran', '70031', '1', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Giran', '70031', '2', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Giran', '70031', '3', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Giran', '70031', '4', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Giran', '70031', '5', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Giran', '70031', '6', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Giran', '70031', '7', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Giran', '70031', '8', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Giran', '70031', '9', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Giran', '70031', '10', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Giran', '70031', '11', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Giran', '70031', '12', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Giran', '70031', '13', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Giran', '70031', '14', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Giran', '70031', '15', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Ivory Tower Town', '70065', '0', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Ivory Tower Town', '70065', '1', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Ivory Tower Town', '70065', '2', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Ivory Tower Town', '70065', '3', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Ivory Tower Town', '70065', '4', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Ivory Tower Town', '70065', '5', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Ivory Tower Town', '70065', '6', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Ivory Tower Town', '70065', '7', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Ivory Tower Town', '70065', '8', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Ivory Tower Town', '70065', '9', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Ivory Tower Town', '70065', '10', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Ivory Tower Town', '70065', '11', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Ivory Tower Town', '70065', '12', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Ivory Tower Town', '70065', '13', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Ivory Tower Town', '70065', '14', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Ivory Tower Town', '70065', '15', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('WoodBec', '70070', '0', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('WoodBec', '70070', '1', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('WoodBec', '70070', '2', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('WoodBec', '70070', '3', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('WoodBec', '70070', '4', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('WoodBec', '70070', '5', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('WoodBec', '70070', '6', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('WoodBec', '70070', '7', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('WoodBec', '70070', '8', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('WoodBec', '70070', '9', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('WoodBec', '70070', '10', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('WoodBec', '70070', '11', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('WoodBec', '70070', '12', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('WoodBec', '70070', '13', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('WoodBec', '70070', '14', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('WoodBec', '70070', '15', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Silver Knights Town', '70075', '0', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Silver Knights Town', '70075', '1', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Silver Knights Town', '70075', '2', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Silver Knights Town', '70075', '3', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Silver Knights Town', '70075', '4', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Silver Knights Town', '70075', '5', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Silver Knights Town', '70075', '6', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Silver Knights Town', '70075', '7', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Silver Knights Town', '70075', '8', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Silver Knights Town', '70075', '9', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Silver Knights Town', '70075', '10', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Silver Knights Town', '70075', '11', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Silver Knights Town', '70075', '12', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Silver Knights Town', '70075', '13', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Silver Knights Town', '70075', '14', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Silver Knights Town', '70075', '15', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Heine', '70084', '0', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Heine', '70084', '1', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Heine', '70084', '2', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Heine', '70084', '3', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Heine', '70084', '4', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Heine', '70084', '5', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Heine', '70084', '6', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Heine', '70084', '7', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Heine', '70084', '8', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Heine', '70084', '9', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Heine', '70084', '10', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Heine', '70084', '11', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Heine', '70084', '12', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Heine', '70084', '13', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Heine', '70084', '14', '0', '0', '0', '2011-05-19 05:46:37');
INSERT INTO `inn` VALUES ('Heine', '70084', '15', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Aden', '70054', '0', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Aden', '70054', '1', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Aden', '70054', '2', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Aden', '70054', '3', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Aden', '70054', '4', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Aden', '70054', '5', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Aden', '70054', '6', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Aden', '70054', '7', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Aden', '70054', '8', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Aden', '70054', '9', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Aden', '70054', '10', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Aden', '70054', '11', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Aden', '70054', '12', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Aden', '70054', '13', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Aden', '70054', '14', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Aden', '70054', '15', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Pirate Island', '70096', '0', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Pirate Island', '70096', '1', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Pirate Island', '70096', '2', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Pirate Island', '70096', '3', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Pirate Island', '70096', '4', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Pirate Island', '70096', '5', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Pirate Island', '70096', '6', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Pirate Island', '70096', '7', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Pirate Island', '70096', '8', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Pirate Island', '70096', '9', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Pirate Island', '70096', '10', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Pirate Island', '70096', '11', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Pirate Island', '70096', '12', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Pirate Island', '70096', '13', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Pirate Island', '70096', '14', '0', '0', '0', '2011-05-19 05:16:07');
INSERT INTO `inn` VALUES ('Pirate Island', '70096', '15', '0', '0', '0', '2011-05-19 05:16:07');
