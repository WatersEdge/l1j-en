/*
MySQL Data Transfer
Source Host: localhost
Source Database: name_code
Target Host: localhost
Target Database: name_code
Date: 2008/04/25 2:54:11
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for name_code
-- ----------------------------
CREATE TABLE `name_code` (
  `$` varchar(50) DEFAULT NULL,
  `Number` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Number`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `name_code` VALUES ('$', '1', 'Axe');
INSERT INTO `name_code` VALUES ('$', '2', 'Lamp');
INSERT INTO `name_code` VALUES ('$', '3', 'Two Handed Sword');
INSERT INTO `name_code` VALUES ('$', '4', 'Adena');
INSERT INTO `name_code` VALUES ('$', '5', 'Janitor');
INSERT INTO `name_code` VALUES ('$', '6', 'Floating Eye');
INSERT INTO `name_code` VALUES ('$', '7', 'Skeleton');
INSERT INTO `name_code` VALUES ('$', '8', 'Slime');
INSERT INTO `name_code` VALUES ('$', '9', 'Armed');
INSERT INTO `name_code` VALUES ('$', '10', 'Turned On');
INSERT INTO `name_code` VALUES ('$', '11', 'No Oil');
INSERT INTO `name_code` VALUES ('$', '12', 'Elven Dagger');
INSERT INTO `name_code` VALUES ('$', '13', 'Orcish Dagger');
INSERT INTO `name_code` VALUES ('$', '14', 'Athame');
INSERT INTO `name_code` VALUES ('$', '15', 'Scalpel');
INSERT INTO `name_code` VALUES ('$', '16', 'Katana');
INSERT INTO `name_code` VALUES ('$', '17', 'Tsurugi');
INSERT INTO `name_code` VALUES ('$', '18', 'Werewolf');
INSERT INTO `name_code` VALUES ('$', '19', 'Elder');
INSERT INTO `name_code` VALUES ('$', '20', 'Mace');
INSERT INTO `name_code` VALUES ('$', '21', 'Door ');
INSERT INTO `name_code` VALUES ('$', '22', 'Corpse');
INSERT INTO `name_code` VALUES ('$', '23', 'Meat');
INSERT INTO `name_code` VALUES ('$', '24', 'Bow');
INSERT INTO `name_code` VALUES ('$', '25', 'Spear');
INSERT INTO `name_code` VALUES ('$', '26', 'Lesser Healing Potion');
INSERT INTO `name_code` VALUES ('$', '27', 'Maple Wand');
INSERT INTO `name_code` VALUES ('$', '28', 'Pine Wand');
INSERT INTO `name_code` VALUES ('$', '29', 'Oak Wand');
INSERT INTO `name_code` VALUES ('$', '30', 'Bad Scroll');
INSERT INTO `name_code` VALUES ('$', '31', 'Bad Scroll');
INSERT INTO `name_code` VALUES ('$', '32', 'Bad Scroll');
INSERT INTO `name_code` VALUES ('$', '33', 'Bad Scroll');
INSERT INTO `name_code` VALUES ('$', '34', 'Bad Scroll');
INSERT INTO `name_code` VALUES ('$', '35', 'Bad Scroll');
INSERT INTO `name_code` VALUES ('$', '36', 'Bad Scroll');
INSERT INTO `name_code` VALUES ('$', '37', 'Bad Scroll');
INSERT INTO `name_code` VALUES ('$', '38', 'Bad Scroll');
INSERT INTO `name_code` VALUES ('$', '39', 'Bad Scroll');
INSERT INTO `name_code` VALUES ('$', '40', 'Bad Scroll');
INSERT INTO `name_code` VALUES ('$', '41', 'Bad Scroll');
INSERT INTO `name_code` VALUES ('$', '42', 'Bad Scroll');
INSERT INTO `name_code` VALUES ('$', '43', 'Bad Scroll');
INSERT INTO `name_code` VALUES ('$', '44', 'Bad Scroll');
INSERT INTO `name_code` VALUES ('$', '45', 'Bad Scroll');
INSERT INTO `name_code` VALUES ('$', '46', 'Bad Scroll');
INSERT INTO `name_code` VALUES ('$', '47', 'Bad Scroll');
INSERT INTO `name_code` VALUES ('$', '48', 'Bad Scroll');
INSERT INTO `name_code` VALUES ('$', '49', 'Bad Scroll');
INSERT INTO `name_code` VALUES ('$', '50', 'Bad Scroll');
INSERT INTO `name_code` VALUES ('$', '51', 'Bad Scroll');
INSERT INTO `name_code` VALUES ('$', '52', 'Bad Scroll');
INSERT INTO `name_code` VALUES ('$', '53', 'Bad Scroll');
INSERT INTO `name_code` VALUES ('$', '54', 'Bad Scroll');
INSERT INTO `name_code` VALUES ('$', '55', 'Scroll of Identify');
INSERT INTO `name_code` VALUES ('$', '56', 'Stone Golem');
INSERT INTO `name_code` VALUES ('$', '57', 'Zombie');
INSERT INTO `name_code` VALUES ('$', '58', 'Dwarf');
INSERT INTO `name_code` VALUES ('$', '59', 'Orc');
INSERT INTO `name_code` VALUES ('$', '60', 'Battle Axe');
INSERT INTO `name_code` VALUES ('$', '61', 'Arrow');
INSERT INTO `name_code` VALUES ('$', '62', 'Bardiche');
INSERT INTO `name_code` VALUES ('$', '63', 'Bill-guisarme');
INSERT INTO `name_code` VALUES ('$', '64', 'Elven Bow');
INSERT INTO `name_code` VALUES ('$', '65', 'Orcish Bow');
INSERT INTO `name_code` VALUES ('$', '66', 'Broad Sword');
INSERT INTO `name_code` VALUES ('$', '67', 'Candle');
INSERT INTO `name_code` VALUES ('$', '68', 'Carrot');
INSERT INTO `name_code` VALUES ('$', '69', 'Club ');
INSERT INTO `name_code` VALUES ('$', '70', 'Dagger');
INSERT INTO `name_code` VALUES ('$', '71', 'Bec de Corbin');
INSERT INTO `name_code` VALUES ('$', '72', 'Egg');
INSERT INTO `name_code` VALUES ('$', '73', 'Fauchard');
INSERT INTO `name_code` VALUES ('$', '74', 'Flail');
INSERT INTO `name_code` VALUES ('$', '75', 'Glave');
INSERT INTO `name_code` VALUES ('$', '76', 'Guisarme');
INSERT INTO `name_code` VALUES ('$', '77', 'Halberd');
INSERT INTO `name_code` VALUES ('$', '78', 'Horn');
INSERT INTO `name_code` VALUES ('$', '79', 'Javelin');
INSERT INTO `name_code` VALUES ('$', '80', 'Key');
INSERT INTO `name_code` VALUES ('$', '81', 'Lance');
INSERT INTO `name_code` VALUES ('$', '82', 'Lemon');
INSERT INTO `name_code` VALUES ('$', '83', 'Lucern Hammer');
INSERT INTO `name_code` VALUES ('$', '84', 'Morning Star');
INSERT INTO `name_code` VALUES ('$', '85', 'Orange');
INSERT INTO `name_code` VALUES ('$', '86', 'Pizza');
INSERT INTO `name_code` VALUES ('$', '87', 'Partisan');
INSERT INTO `name_code` VALUES ('$', '88', 'Quarterstaff');
INSERT INTO `name_code` VALUES ('$', '89', 'Ranseur');
INSERT INTO `name_code` VALUES ('$', '90', 'Ring');
INSERT INTO `name_code` VALUES ('$', '91', 'Rune Sword');
INSERT INTO `name_code` VALUES ('$', '92', 'Scimitar');
INSERT INTO `name_code` VALUES ('$', '93', 'Silver Arrow ');
INSERT INTO `name_code` VALUES ('$', '94', 'Dwarvish Axe');
INSERT INTO `name_code` VALUES ('$', '95', 'Elven Spear');
INSERT INTO `name_code` VALUES ('$', '96', 'Orcish Spear');
INSERT INTO `name_code` VALUES ('$', '97', 'Dwarvish Short Sword');
INSERT INTO `name_code` VALUES ('$', '98', 'Elven Short Sword');
INSERT INTO `name_code` VALUES ('$', '99', 'Orcish Short Sword');
INSERT INTO `name_code` VALUES ('$', '100', 'Short Sword');
INSERT INTO `name_code` VALUES ('$', '101', 'Stiletto');
INSERT INTO `name_code` VALUES ('$', '102', 'Trident');
INSERT INTO `name_code` VALUES ('$', '103', 'Unicorn Horn');
INSERT INTO `name_code` VALUES ('$', '104', 'Voulge');
INSERT INTO `name_code` VALUES ('$', '105', 'Yummi');
INSERT INTO `name_code` VALUES ('$', '106', 'Apple');
INSERT INTO `name_code` VALUES ('$', '107', 'Banana');
INSERT INTO `name_code` VALUES ('$', '108', 'Fortune Cookie');
INSERT INTO `name_code` VALUES ('$', '109', 'Cream Pie');
INSERT INTO `name_code` VALUES ('$', '110', 'Elven Wafer');
INSERT INTO `name_code` VALUES ('$', '111', 'War Hammer');
INSERT INTO `name_code` VALUES ('$', '112', 'Gunter\'s House');
INSERT INTO `name_code` VALUES ('$', '113', 'Gereng\'s House');
INSERT INTO `name_code` VALUES ('$', '114', 'Log Cabin');
INSERT INTO `name_code` VALUES ('$', '115', 'Village');
INSERT INTO `name_code` VALUES ('$', '116', 'Leather Armor');
INSERT INTO `name_code` VALUES ('$', '117', 'Worn');
INSERT INTO `name_code` VALUES ('$', '118', 'Elven Leather Helm');
INSERT INTO `name_code` VALUES ('$', '119', 'Leather Cap');
INSERT INTO `name_code` VALUES ('$', '120', 'Orcish Helm');
INSERT INTO `name_code` VALUES ('$', '121', 'Skull Helm');
INSERT INTO `name_code` VALUES ('$', '122', 'Dwarvish Iron Helm');
INSERT INTO `name_code` VALUES ('$', '123', 'Hard Hat');
INSERT INTO `name_code` VALUES ('$', '124', 'Fedora');
INSERT INTO `name_code` VALUES ('$', '125', 'Conical Hat');
INSERT INTO `name_code` VALUES ('$', '126', 'Peaked Hood');
INSERT INTO `name_code` VALUES ('$', '127', 'Dented Pot');
INSERT INTO `name_code` VALUES ('$', '128', 'Helmet');
INSERT INTO `name_code` VALUES ('$', '129', 'Plumed Helm');
INSERT INTO `name_code` VALUES ('$', '130', 'Helm of Brilliance');
INSERT INTO `name_code` VALUES ('$', '131', 'Etched Helm');
INSERT INTO `name_code` VALUES ('$', '132', 'Helm of Opposite Alignment');
INSERT INTO `name_code` VALUES ('$', '133', 'Crested Helm');
INSERT INTO `name_code` VALUES ('$', '134', 'Helm of Telepathy');
INSERT INTO `name_code` VALUES ('$', '135', 'Visored Helm');
INSERT INTO `name_code` VALUES ('$', '136', 'Gray Dragon Scale Mail');
INSERT INTO `name_code` VALUES ('$', '137', 'Red Dragon Armor');
INSERT INTO `name_code` VALUES ('$', '138', 'White Dragon Armor');
INSERT INTO `name_code` VALUES ('$', '139', 'Orange Dragon Scale Mail');
INSERT INTO `name_code` VALUES ('$', '140', 'Black Dragon Scale Mail');
INSERT INTO `name_code` VALUES ('$', '141', 'Blue Dragon Armor');
INSERT INTO `name_code` VALUES ('$', '142', 'Green Dragon Armor');
INSERT INTO `name_code` VALUES ('$', '143', 'Yellow Dragon Scale Mail');
INSERT INTO `name_code` VALUES ('$', '144', 'Gray Dragon Scales');
INSERT INTO `name_code` VALUES ('$', '145', 'Red Dragon Scales');
INSERT INTO `name_code` VALUES ('$', '146', 'White Dragon Scales');
INSERT INTO `name_code` VALUES ('$', '147', 'Orange Dragon Scales');
INSERT INTO `name_code` VALUES ('$', '148', 'Black Dragon Scales');
INSERT INTO `name_code` VALUES ('$', '149', 'Blue Dragon Scales');
INSERT INTO `name_code` VALUES ('$', '150', 'Green Dragon Scales');
INSERT INTO `name_code` VALUES ('$', '151', 'Yellow Dragon Scales');
INSERT INTO `name_code` VALUES ('$', '152', 'Plate Mail');
INSERT INTO `name_code` VALUES ('$', '153', 'Crystal Plate Mail');
INSERT INTO `name_code` VALUES ('$', '154', 'Bronze Plate Mail');
INSERT INTO `name_code` VALUES ('$', '155', 'Splint Mail');
INSERT INTO `name_code` VALUES ('$', '156', 'Banded Mail');
INSERT INTO `name_code` VALUES ('$', '157', 'Dwarvish Mithril Coat');
INSERT INTO `name_code` VALUES ('$', '158', 'Elven Mithril Coat');
INSERT INTO `name_code` VALUES ('$', '159', 'Chain Mail');
INSERT INTO `name_code` VALUES ('$', '160', 'Orcish Chain Mail');
INSERT INTO `name_code` VALUES ('$', '161', null);
INSERT INTO `name_code` VALUES ('$', '162', null);
INSERT INTO `name_code` VALUES ('$', '163', null);
INSERT INTO `name_code` VALUES ('$', '164', null);
INSERT INTO `name_code` VALUES ('$', '165', null);
INSERT INTO `name_code` VALUES ('$', '166', null);
INSERT INTO `name_code` VALUES ('$', '167', null);
INSERT INTO `name_code` VALUES ('$', '168', null);
INSERT INTO `name_code` VALUES ('$', '169', null);
INSERT INTO `name_code` VALUES ('$', '170', null);
INSERT INTO `name_code` VALUES ('$', '171', null);
INSERT INTO `name_code` VALUES ('$', '172', null);
INSERT INTO `name_code` VALUES ('$', '173', null);
INSERT INTO `name_code` VALUES ('$', '174', null);
INSERT INTO `name_code` VALUES ('$', '175', null);
INSERT INTO `name_code` VALUES ('$', '176', null);
INSERT INTO `name_code` VALUES ('$', '177', null);
INSERT INTO `name_code` VALUES ('$', '178', null);
INSERT INTO `name_code` VALUES ('$', '179', null);
INSERT INTO `name_code` VALUES ('$', '180', null);
INSERT INTO `name_code` VALUES ('$', '181', null);
INSERT INTO `name_code` VALUES ('$', '182', null);
INSERT INTO `name_code` VALUES ('$', '183', null);
INSERT INTO `name_code` VALUES ('$', '184', null);
INSERT INTO `name_code` VALUES ('$', '185', null);
INSERT INTO `name_code` VALUES ('$', '186', null);
INSERT INTO `name_code` VALUES ('$', '187', null);
INSERT INTO `name_code` VALUES ('$', '188', null);
INSERT INTO `name_code` VALUES ('$', '189', null);
INSERT INTO `name_code` VALUES ('$', '190', null);
INSERT INTO `name_code` VALUES ('$', '191', null);
INSERT INTO `name_code` VALUES ('$', '192', null);
INSERT INTO `name_code` VALUES ('$', '193', null);
INSERT INTO `name_code` VALUES ('$', '194', null);
INSERT INTO `name_code` VALUES ('$', '195', null);
INSERT INTO `name_code` VALUES ('$', '196', null);
INSERT INTO `name_code` VALUES ('$', '197', null);
INSERT INTO `name_code` VALUES ('$', '198', null);
INSERT INTO `name_code` VALUES ('$', '199', null);
INSERT INTO `name_code` VALUES ('$', '200', null);
INSERT INTO `name_code` VALUES ('$', '201', null);
INSERT INTO `name_code` VALUES ('$', '202', null);
INSERT INTO `name_code` VALUES ('$', '203', null);
INSERT INTO `name_code` VALUES ('$', '204', null);
INSERT INTO `name_code` VALUES ('$', '205', null);
INSERT INTO `name_code` VALUES ('$', '206', null);
INSERT INTO `name_code` VALUES ('$', '207', null);
INSERT INTO `name_code` VALUES ('$', '208', null);
INSERT INTO `name_code` VALUES ('$', '209', null);
INSERT INTO `name_code` VALUES ('$', '210', null);
INSERT INTO `name_code` VALUES ('$', '211', null);
INSERT INTO `name_code` VALUES ('$', '212', null);
INSERT INTO `name_code` VALUES ('$', '213', null);
INSERT INTO `name_code` VALUES ('$', '214', null);
INSERT INTO `name_code` VALUES ('$', '215', null);
INSERT INTO `name_code` VALUES ('$', '216', null);
INSERT INTO `name_code` VALUES ('$', '217', null);
INSERT INTO `name_code` VALUES ('$', '218', null);
INSERT INTO `name_code` VALUES ('$', '219', null);
INSERT INTO `name_code` VALUES ('$', '220', null);
INSERT INTO `name_code` VALUES ('$', '221', null);
INSERT INTO `name_code` VALUES ('$', '222', null);
INSERT INTO `name_code` VALUES ('$', '223', null);
INSERT INTO `name_code` VALUES ('$', '224', null);
INSERT INTO `name_code` VALUES ('$', '225', null);
INSERT INTO `name_code` VALUES ('$', '226', null);
INSERT INTO `name_code` VALUES ('$', '227', null);
INSERT INTO `name_code` VALUES ('$', '228', null);
INSERT INTO `name_code` VALUES ('$', '229', null);
INSERT INTO `name_code` VALUES ('$', '230', null);
INSERT INTO `name_code` VALUES ('$', '231', null);
INSERT INTO `name_code` VALUES ('$', '232', null);
INSERT INTO `name_code` VALUES ('$', '233', null);
INSERT INTO `name_code` VALUES ('$', '234', null);
INSERT INTO `name_code` VALUES ('$', '235', null);
INSERT INTO `name_code` VALUES ('$', '236', null);
INSERT INTO `name_code` VALUES ('$', '237', null);
INSERT INTO `name_code` VALUES ('$', '238', null);
INSERT INTO `name_code` VALUES ('$', '239', null);
INSERT INTO `name_code` VALUES ('$', '240', null);
INSERT INTO `name_code` VALUES ('$', '241', null);
INSERT INTO `name_code` VALUES ('$', '242', null);
INSERT INTO `name_code` VALUES ('$', '243', null);
INSERT INTO `name_code` VALUES ('$', '244', null);
INSERT INTO `name_code` VALUES ('$', '245', null);
INSERT INTO `name_code` VALUES ('$', '246', null);
INSERT INTO `name_code` VALUES ('$', '247', null);
INSERT INTO `name_code` VALUES ('$', '248', null);
INSERT INTO `name_code` VALUES ('$', '249', null);
INSERT INTO `name_code` VALUES ('$', '250', null);
