/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 14:12:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `board_auction`
-- ----------------------------
DROP TABLE IF EXISTS `board_auction`;
CREATE TABLE `board_auction` (
  `house_id` int(10) unsigned NOT NULL DEFAULT '0',
  `house_name` varchar(45) NOT NULL DEFAULT '',
  `house_area` int(10) unsigned NOT NULL DEFAULT '0',
  `deadline` datetime DEFAULT NULL,
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  `location` varchar(45) NOT NULL DEFAULT '',
  `old_owner` varchar(45) NOT NULL DEFAULT '',
  `old_owner_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bidder` varchar(45) NOT NULL DEFAULT '',
  `bidder_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`house_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of board_auction
-- ----------------------------
INSERT INTO `board_auction` VALUES ('262145', 'Giran House 1', '78', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262148', 'Giran House 4', '45', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262149', 'Giran House 5', '78', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262151', 'Giran House 7', '45', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262152', 'Giran House 8', '78', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262153', 'Giran House 9', '78', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262155', 'Giran House 11', '78', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262156', 'Giran House 12', '78', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262157', 'Giran House 13', '120', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262158', 'Giran House 14', '78', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262159', 'Giran House 15', '45', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262160', 'Giran House 16', '78', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262161', 'Giran House 17', '45', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262162', 'Giran House 18', '120', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262163', 'Giran House 19', '78', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262164', 'Giran House 20', '78', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262165', 'Giran House 21', '45', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262167', 'Giran House 23', '78', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262168', 'Giran House 24', '45', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262169', 'Giran House 25', '45', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262171', 'Giran House 27', '78', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262172', 'Giran House 28', '45', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262173', 'Giran House 29', '78', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262174', 'Giran House 30', '45', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262175', 'Giran House 31', '78', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262176', 'Giran House 32', '78', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262177', 'Giran House 33', '45', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262178', 'Giran House 34', '45', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262181', 'Giran House 37', '78', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262182', 'Giran House 38', '78', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262183', 'Giran House 39', '45', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262184', 'Giran House 40', '78', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262185', 'Giran House 41', '78', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262186', 'Giran House 42', '45', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262187', 'Giran House 43', '120', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262189', 'Giran House 45', '78', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('327681', 'Heine House 1', '0', '2013-01-04 13:00:00', '100000', 'Heine', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('327682', 'Heine House 2', '0', '2013-01-04 13:00:00', '100000', 'Heine', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('327683', 'Heine House 3', '0', '2013-01-04 13:00:00', '100000', 'Heine', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('327684', 'Heine House 4', '0', '2013-01-04 13:00:00', '100000', 'Heine', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('327685', 'Heine House 5', '0', '2013-01-04 13:00:00', '100000', 'Heine', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('327686', 'Heine House 6', '0', '2013-01-04 13:00:00', '100000', 'Heine', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('327687', 'Heine House 7', '0', '2013-01-04 13:00:00', '100000', 'Heine', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('327688', 'Heine House 8', '0', '2013-01-04 13:00:00', '100000', 'Heine', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('327689', 'Heine House 9', '0', '2013-01-04 13:00:00', '100000', 'Heine', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('327690', 'Heine House 10', '0', '2013-01-04 13:00:00', '100000', 'Heine', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('327691', 'Heine House 11', '0', '2013-01-04 13:00:00', '100000', 'Heine', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('524289', 'Gludio House 1', '48', '2013-01-04 13:00:00', '100000', 'Gludio', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('524290', 'Gludio House 2', '71', '2013-01-04 13:00:00', '100000', 'Gludio', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('524291', 'Gludio House 3', '48', '2013-01-04 13:00:00', '100000', 'Gludio', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('524292', 'Gludio House 4', '48', '2013-01-04 13:00:00', '100000', 'Gludio', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('524293', 'Gludio House 5', '82', '2013-01-04 13:00:00', '100000', 'Gludio', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('524294', 'Gludio House 6', '40', '2013-01-04 13:00:00', '100000', 'Gludio', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458753', 'Aden House 1', '51', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458754', 'Aden House 2', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458755', 'Aden House 3', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458756', 'Aden House 4', '56', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458757', 'Aden House 5', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458758', 'Aden House 6', '63', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458759', 'Aden House 7', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458760', 'Aden House 8', '63', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458761', 'Aden House 9', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458762', 'Aden House 10', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458763', 'Aden House 11', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458764', 'Aden House 12', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458765', 'Aden House 13', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458766', 'Aden House 14', '63', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458767', 'Aden House 15', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458768', 'Aden House 16', '56', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458769', 'Aden House 17', '63', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458770', 'Aden House 18', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458771', 'Aden House 19', '32', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458772', 'Aden House 20', '64', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458773', 'Aden House 21', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458774', 'Aden House 22', '20', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458775', 'Aden House 23', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458776', 'Aden House 24', '56', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458777', 'Aden House 25', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458778', 'Aden House 26', '20', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458779', 'Aden House 27', '42', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458780', 'Aden House 28', '15', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458781', 'Aden House 29', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458782', 'Aden House 30', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458783', 'Aden House 31', '42', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458784', 'Aden House 32', '48', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458785', 'Aden House 33', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458786', 'Aden House 34', '15', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458787', 'Aden House 35', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458788', 'Aden House 36', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458789', 'Aden House 37', '64', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458790', 'Aden House 38', '15', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458791', 'Aden House 39', '15', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458792', 'Aden House 40', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458793', 'Aden House 41', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458794', 'Aden House 42', '29', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458795', 'Aden House 43', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458796', 'Aden House 44', '15', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458797', 'Aden House 45', '56', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458798', 'Aden House 46', '15', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458799', 'Aden House 47', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458800', 'Aden House 48', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458801', 'Aden House 49', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458802', 'Aden House 50', '48', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458803', 'Aden House 51', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458804', 'Aden House 52', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458805', 'Aden House 53', '54', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458806', 'Aden House 54', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458807', 'Aden House 55', '63', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458808', 'Aden House 56', '63', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458809', 'Aden House 57', '42', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458810', 'Aden House 58', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458811', 'Aden House 59', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458812', 'Aden House 60', '63', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458813', 'Aden House 61', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458814', 'Aden House 62', '21', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458815', 'Aden House 63', '63', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458816', 'Aden House 64', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458817', 'Aden House 65', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458818', 'Aden House 66', '48', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458819', 'Aden House 67', '24', '2013-01-04 13:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262166', 'Giran House 22', '120', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262170', 'Giran House 26', '120', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262179', 'Giran House 35', '120', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262180', 'Giran House 36', '45', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262188', 'Giran House 44', '120', '2013-01-04 13:00:00', '100000', 'Giran', '', '0', '', '0');
