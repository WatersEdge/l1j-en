/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:44:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `house`
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
  `house_id` int(10) unsigned NOT NULL DEFAULT '0',
  `house_name` varchar(45) NOT NULL DEFAULT '',
  `house_area` int(10) unsigned NOT NULL DEFAULT '0',
  `location` varchar(45) NOT NULL DEFAULT '',
  `keeper_id` int(10) unsigned NOT NULL DEFAULT '0',
  `is_on_sale` int(10) unsigned NOT NULL DEFAULT '0',
  `is_purchase_basement` int(10) unsigned NOT NULL DEFAULT '0',
  `tax_deadline` datetime DEFAULT NULL,
  PRIMARY KEY (`house_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of house
-- ----------------------------
INSERT INTO `house` VALUES ('262145', 'Giran House 1', '78', 'Giran', '50527', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262146', 'Giran House 2', '45', 'Giran', '50505', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262147', 'Giran House 3', '120', 'Giran', '50519', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262148', 'Giran House 4', '45', 'Giran', '50545', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262149', 'Giran House 5', '78', 'Giran', '50531', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262150', 'Giran House 6', '120', 'Giran', '50529', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262151', 'Giran House 7', '45', 'Giran', '50516', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262152', 'Giran House 8', '78', 'Giran', '50538', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262153', 'Giran House 9', '78', 'Giran', '50518', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262154', 'Giran House 10', '120', 'Giran', '50509', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262155', 'Giran House 11', '78', 'Giran', '50536', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262156', 'Giran House 12', '78', 'Giran', '50520', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262157', 'Giran House 13', '120', 'Giran', '50543', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262158', 'Giran House 14', '78', 'Giran', '50526', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262159', 'Giran House 15', '45', 'Giran', '50512', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262160', 'Giran House 16', '78', 'Giran', '50510', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262161', 'Giran House 17', '45', 'Giran', '50504', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262162', 'Giran House 18', '120', 'Giran', '50525', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262163', 'Giran House 19', '78', 'Giran', '50534', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262164', 'Giran House 20', '78', 'Giran', '50540', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262165', 'Giran House 21', '45', 'Giran', '50515', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262166', 'Giran House 22', '120', 'Giran', '50513', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262167', 'Giran House 23', '78', 'Giran', '50528', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262168', 'Giran House 24', '45', 'Giran', '50533', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262169', 'Giran House 25', '45', 'Giran', '50542', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262170', 'Giran House 26', '120', 'Giran', '50511', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262171', 'Giran House 27', '78', 'Giran', '50501', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262172', 'Giran House 28', '45', 'Giran', '50503', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262173', 'Giran House 29', '78', 'Giran', '50508', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262174', 'Giran House 30', '45', 'Giran', '50514', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262175', 'Giran House 31', '78', 'Giran', '50532', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262176', 'Giran House 32', '78', 'Giran', '50544', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262177', 'Giran House 33', '45', 'Giran', '50524', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262178', 'Giran House 34', '45', 'Giran', '50535', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262179', 'Giran House 35', '120', 'Giran', '50521', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262180', 'Giran House 36', '45', 'Giran', '50517', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262181', 'Giran House 37', '78', 'Giran', '50537', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262182', 'Giran House 38', '78', 'Giran', '50539', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262183', 'Giran House 39', '45', 'Giran', '50507', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262184', 'Giran House 40', '78', 'Giran', '50530', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262185', 'Giran House 41', '78', 'Giran', '50502', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262186', 'Giran House 42', '45', 'Giran', '50506', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262187', 'Giran House 43', '120', 'Giran', '50522', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262188', 'Giran House 44', '120', 'Giran', '50541', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('262189', 'Giran House 45', '78', 'Giran', '50523', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('327681', 'Heine House 1', '0', 'Heine', '50620', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('327682', 'Heine House 2', '0', 'Heine', '50623', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('327683', 'Heine House 3', '0', 'Heine', '50619', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('327684', 'Heine House 4', '0', 'Heine', '50621', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('327685', 'Heine House 5', '0', 'Heine', '50622', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('327686', 'Heine House 6', '0', 'Heine', '50624', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('327687', 'Heine House 7', '0', 'Heine', '50617', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('327688', 'Heine House 8', '0', 'Heine', '50614', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('327689', 'Heine House 9', '0', 'Heine', '50618', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('327690', 'Heine House 10', '0', 'Heine', '50616', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('327691', 'Heine House 11', '0', 'Heine', '50615', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458753', 'Aden House 1', '51', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458754', 'Aden House 2', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458755', 'Aden House 3', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458756', 'Aden House 4', '56', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458757', 'Aden House 5', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458758', 'Aden House 6', '63', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458759', 'Aden House 7', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458760', 'Aden House 8', '63', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458761', 'Aden House 9', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458762', 'Aden House 10', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458763', 'Aden House 11', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458764', 'Aden House 12', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458765', 'Aden House 13', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458766', 'Aden House 14', '63', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458767', 'Aden House 15', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458768', 'Aden House 16', '56', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458769', 'Aden House 17', '63', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458770', 'Aden House 18', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458771', 'Aden House 19', '32', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458772', 'Aden House 20', '64', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458773', 'Aden House 21', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458774', 'Aden House 22', '20', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458775', 'Aden House 23', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458776', 'Aden House 24', '56', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458777', 'Aden House 25', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458778', 'Aden House 26', '20', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458779', 'Aden House 27', '42', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458780', 'Aden House 28', '15', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458781', 'Aden House 29', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458782', 'Aden House 30', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458783', 'Aden House 31', '42', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458784', 'Aden House 32', '48', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458785', 'Aden House 33', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458786', 'Aden House 34', '15', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458787', 'Aden House 35', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458788', 'Aden House 36', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458789', 'Aden House 37', '64', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458790', 'Aden House 38', '15', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458791', 'Aden House 39', '15', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458792', 'Aden House 40', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458793', 'Aden House 41', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458794', 'Aden House 42', '29', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458795', 'Aden House 43', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458796', 'Aden House 44', '15', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458797', 'Aden House 45', '56', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458798', 'Aden House 46', '15', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458799', 'Aden House 47', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458800', 'Aden House 48', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458801', 'Aden House 49', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458802', 'Aden House 50', '48', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458803', 'Aden House 51', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458804', 'Aden House 52', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458805', 'Aden House 53', '54', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458806', 'Aden House 54', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458807', 'Aden House 55', '63', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458808', 'Aden House 56', '63', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458809', 'Aden House 57', '42', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458810', 'Aden House 58', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458811', 'Aden House 59', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458812', 'Aden House 60', '63', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458813', 'Aden House 61', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458814', 'Aden House 62', '21', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458815', 'Aden House 63', '63', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458816', 'Aden House 64', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458817', 'Aden House 65', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458818', 'Aden House 66', '48', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('458819', 'Aden House 67', '24', 'Aden', '0', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('524289', 'Gludio House 1', '48', 'Gludio', '50626', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('524290', 'Gludio House 2', '71', 'Gludio', '50627', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('524291', 'Gludio House 3', '48', 'Gludio', '50628', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('524292', 'Gludio House 4', '48', 'Gludio', '50629', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('524293', 'Gludio House 5', '82', 'Gludio', '50630', '1', '0', '2009-04-24 00:00:00');
INSERT INTO `house` VALUES ('524294', 'Gludio House 6', '40', 'Gludio', '50631', '1', '0', '2009-04-24 00:00:00');
