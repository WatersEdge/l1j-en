/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:44:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `getback_restart`
-- ----------------------------
DROP TABLE IF EXISTS `getback_restart`;
CREATE TABLE `getback_restart` (
  `area` int(10) NOT NULL DEFAULT '0',
  `note` varchar(50) DEFAULT NULL,
  `locx` int(10) NOT NULL DEFAULT '0',
  `locy` int(10) NOT NULL DEFAULT '0',
  `mapid` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`area`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of getback_restart
-- ----------------------------
INSERT INTO `getback_restart` VALUES ('5', 'Talking Island Ship to Aden Mainland', '32631', '32983', '0');
INSERT INTO `getback_restart` VALUES ('6', 'Aden Mainland Ship to Talking Island', '32543', '32728', '4');
INSERT INTO `getback_restart` VALUES ('70', '', '32828', '32848', '70');
INSERT INTO `getback_restart` VALUES ('75', '', '34047', '32283', '4');
INSERT INTO `getback_restart` VALUES ('76', '', '34047', '32283', '4');
INSERT INTO `getback_restart` VALUES ('77', '', '34047', '32283', '4');
INSERT INTO `getback_restart` VALUES ('78', '', '34047', '32283', '4');
INSERT INTO `getback_restart` VALUES ('79', '', '34047', '32283', '4');
INSERT INTO `getback_restart` VALUES ('80', '', '34047', '32283', '4');
INSERT INTO `getback_restart` VALUES ('81', '', '34047', '32283', '4');
INSERT INTO `getback_restart` VALUES ('82', '', '34047', '32283', '4');
INSERT INTO `getback_restart` VALUES ('83', 'Aden Mainland Ship to Forgotten Island', '33426', '33499', '4');
INSERT INTO `getback_restart` VALUES ('84', 'Forgotten Island Ship to Aden Mainland', '32936', '33057', '70');
INSERT INTO `getback_restart` VALUES ('88', 'Giran Colosseum', '33442', '32797', '0');
INSERT INTO `getback_restart` VALUES ('91', 'Talking island Colosseum', '32580', '32931', '4');
INSERT INTO `getback_restart` VALUES ('92', 'Gludio Colosseum', '32612', '32734', '0');
INSERT INTO `getback_restart` VALUES ('95', 'Silver knight Colosseum', '33080', '33392', '4');
INSERT INTO `getback_restart` VALUES ('98', 'Welldone Colosseum', '33705', '32504', '4');
INSERT INTO `getback_restart` VALUES ('101', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('102', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('103', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('104', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('105', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('106', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('107', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('108', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('109', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('110', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('111', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('112', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('113', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('114', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('115', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('116', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('117', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('118', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('119', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('120', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('121', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('122', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('123', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('124', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('125', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('126', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('127', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('128', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('129', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('130', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('131', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('132', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('133', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('134', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('135', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('136', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('137', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('138', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('139', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('140', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('141', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('142', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('143', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('144', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('145', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('146', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('147', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('148', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('149', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('150', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('151', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('152', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('153', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('154', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('155', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('156', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('157', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('158', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('159', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('160', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('161', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('162', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('163', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('164', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('165', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('166', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('167', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('168', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('169', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('170', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('171', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('172', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('173', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('174', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('175', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('176', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('177', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('178', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('179', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('180', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('181', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('182', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('183', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('184', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('185', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('186', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('187', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('188', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('189', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('190', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('191', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('192', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('193', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('194', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('195', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('196', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('197', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('198', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('199', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('200', '', '32781', '32816', '101');
INSERT INTO `getback_restart` VALUES ('303', '', '33976', '32936', '4');
INSERT INTO `getback_restart` VALUES ('446', 'Ship Pirate island to Hidden dock', '32297', '33087', '440');
INSERT INTO `getback_restart` VALUES ('447', 'Ship Hidden dock to Pirate island', '32750', '32874', '445');
INSERT INTO `getback_restart` VALUES ('451', '', '32744', '32818', '450');
INSERT INTO `getback_restart` VALUES ('452', '', '32744', '32818', '450');
INSERT INTO `getback_restart` VALUES ('453', '', '32744', '32818', '450');
INSERT INTO `getback_restart` VALUES ('454', '', '32744', '32818', '450');
INSERT INTO `getback_restart` VALUES ('455', '', '32744', '32818', '450');
INSERT INTO `getback_restart` VALUES ('456', '', '32744', '32818', '450');
INSERT INTO `getback_restart` VALUES ('460', '', '32667', '32863', '457');
INSERT INTO `getback_restart` VALUES ('461', '', '32667', '32863', '457');
INSERT INTO `getback_restart` VALUES ('462', '', '32667', '32863', '457');
INSERT INTO `getback_restart` VALUES ('463', '', '32667', '32863', '457');
INSERT INTO `getback_restart` VALUES ('464', '', '32667', '32863', '457');
INSERT INTO `getback_restart` VALUES ('465', '', '32667', '32863', '457');
INSERT INTO `getback_restart` VALUES ('466', '', '32667', '32863', '457');
INSERT INTO `getback_restart` VALUES ('470', '', '32671', '32855', '467');
INSERT INTO `getback_restart` VALUES ('471', '', '32671', '32855', '467');
INSERT INTO `getback_restart` VALUES ('472', '', '32671', '32855', '467');
INSERT INTO `getback_restart` VALUES ('473', '', '32671', '32855', '467');
INSERT INTO `getback_restart` VALUES ('474', '', '32671', '32855', '467');
INSERT INTO `getback_restart` VALUES ('475', '', '32671', '32855', '467');
INSERT INTO `getback_restart` VALUES ('476', '', '32671', '32855', '467');
INSERT INTO `getback_restart` VALUES ('477', '', '32671', '32855', '467');
INSERT INTO `getback_restart` VALUES ('478', '', '32671', '32855', '467');
INSERT INTO `getback_restart` VALUES ('490', '', '32744', '32818', '450');
INSERT INTO `getback_restart` VALUES ('491', '', '32744', '32818', '450');
INSERT INTO `getback_restart` VALUES ('492', '', '32744', '32818', '450');
INSERT INTO `getback_restart` VALUES ('493', '', '32744', '32818', '450');
INSERT INTO `getback_restart` VALUES ('494', '', '32744', '32818', '450');
INSERT INTO `getback_restart` VALUES ('495', '', '32744', '32818', '450');
INSERT INTO `getback_restart` VALUES ('496', '', '32744', '32818', '450');
INSERT INTO `getback_restart` VALUES ('530', '', '32744', '32792', '536');
INSERT INTO `getback_restart` VALUES ('531', '', '32744', '32792', '536');
INSERT INTO `getback_restart` VALUES ('532', '', '32744', '32792', '536');
INSERT INTO `getback_restart` VALUES ('533', '', '32744', '32792', '536');
INSERT INTO `getback_restart` VALUES ('534', '', '32744', '32792', '536');
INSERT INTO `getback_restart` VALUES ('535', '', '32744', '32792', '536');
INSERT INTO `getback_restart` VALUES ('550', '', '32844', '32694', '550');
INSERT INTO `getback_restart` VALUES ('551', '', '32844', '32694', '550');
INSERT INTO `getback_restart` VALUES ('552', '', '32844', '32694', '550');
INSERT INTO `getback_restart` VALUES ('553', '', '32844', '32694', '550');
INSERT INTO `getback_restart` VALUES ('554', '', '32844', '32694', '550');
INSERT INTO `getback_restart` VALUES ('555', '', '32844', '32694', '550');
INSERT INTO `getback_restart` VALUES ('556', '', '32844', '32694', '550');
INSERT INTO `getback_restart` VALUES ('557', '', '32844', '32694', '550');
INSERT INTO `getback_restart` VALUES ('558', '', '32844', '32694', '550');
INSERT INTO `getback_restart` VALUES ('600', '', '32608', '33178', '4');
INSERT INTO `getback_restart` VALUES ('601', '', '32608', '33178', '4');
INSERT INTO `getback_restart` VALUES ('608', '', '34053', '32284', '4');
INSERT INTO `getback_restart` VALUES ('778', '', '32608', '33178', '4');
INSERT INTO `getback_restart` VALUES ('5140', '', '32624', '32813', '4');
INSERT INTO `getback_restart` VALUES ('5124', 'Fishing place', '32815', '32809', '5124');
INSERT INTO `getback_restart` VALUES ('5125', 'petmatch place', '32628', '32781', '4');
INSERT INTO `getback_restart` VALUES ('5131', 'petmatch place', '32628', '32781', '4');
INSERT INTO `getback_restart` VALUES ('5132', 'petmatch place', '32628', '32781', '4');
INSERT INTO `getback_restart` VALUES ('5133', 'petmatch place', '32628', '32781', '4');
INSERT INTO `getback_restart` VALUES ('5134', 'petmatch place', '32628', '32781', '4');
INSERT INTO `getback_restart` VALUES ('16384', 'Talking Island Hotel', '32599', '32931', '0');
INSERT INTO `getback_restart` VALUES ('16896', 'Talking Island Hotel', '32599', '32931', '0');
INSERT INTO `getback_restart` VALUES ('17408', 'Gludio Hotel', '32631', '32761', '4');
INSERT INTO `getback_restart` VALUES ('17920', 'Gludio Hotel', '32631', '32761', '4');
INSERT INTO `getback_restart` VALUES ('18432', 'Giran Hotel', '33437', '32790', '4');
INSERT INTO `getback_restart` VALUES ('18944', 'Giran Hotel', '33437', '32790', '4');
INSERT INTO `getback_restart` VALUES ('19456', 'Oren Hotel', '34067', '32254', '4');
INSERT INTO `getback_restart` VALUES ('19968', 'Oren Hotel', '34067', '32254', '4');
INSERT INTO `getback_restart` VALUES ('20480', 'Windawood Hotel', '32627', '33167', '4');
INSERT INTO `getback_restart` VALUES ('20992', 'Windawood Hotel', '32627', '33167', '4');
INSERT INTO `getback_restart` VALUES ('21504', 'SKT Hotel', '33115', '33379', '4');
INSERT INTO `getback_restart` VALUES ('22016', 'SKT Hotel', '33115', '33379', '4');
INSERT INTO `getback_restart` VALUES ('22528', 'Heine Hotel', '33604', '33276', '4');
INSERT INTO `getback_restart` VALUES ('23040', 'Heine Hotel', '33604', '33276', '4');
INSERT INTO `getback_restart` VALUES ('53', '', '33426', '32823', '4');
INSERT INTO `getback_restart` VALUES ('54', '', '33426', '32823', '4');
INSERT INTO `getback_restart` VALUES ('55', '', '33426', '32823', '4');
INSERT INTO `getback_restart` VALUES ('56', '', '33426', '32823', '4');
INSERT INTO `getback_restart` VALUES ('777', '', '34043', '32184', '4');
INSERT INTO `getback_restart` VALUES ('779', '', '32608', '33178', '4');
INSERT INTO `getback_restart` VALUES ('780', '', '33966', '33253', '4');
INSERT INTO `getback_restart` VALUES ('781', '', '33966', '33253', '4');
INSERT INTO `getback_restart` VALUES ('782', '', '33966', '33253', '4');
INSERT INTO `getback_restart` VALUES ('783', '', '32795', '32751', '783');
INSERT INTO `getback_restart` VALUES ('784', '', '32795', '32751', '783');
INSERT INTO `getback_restart` VALUES ('1002', '', '33705', '32504', '4');
INSERT INTO `getback_restart` VALUES ('2005', '', '32691', '32864', '2005');
INSERT INTO `getback_restart` VALUES ('5143', '', '32628', '32772', '4');
INSERT INTO `getback_restart` VALUES ('1005', 'Antharas Lair', '33710', '32521', '4');
INSERT INTO `getback_restart` VALUES ('1006', 'Antharas Lair', '33710', '32521', '4');
INSERT INTO `getback_restart` VALUES ('1007', 'Antharas Lair', '33710', '32521', '4');
INSERT INTO `getback_restart` VALUES ('1008', 'Antharas Lair', '33710', '32521', '4');
INSERT INTO `getback_restart` VALUES ('1009', 'Antharas Lair', '33710', '32521', '4');
INSERT INTO `getback_restart` VALUES ('1010', 'Antharas Lair', '33710', '32521', '4');
