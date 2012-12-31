/*
Navicat MySQL Data Transfer

Source Server         : root2
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tikal

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-30 08:43:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cooking_recipes`
-- ----------------------------
DROP TABLE IF EXISTS `cooking_recipes`;
CREATE TABLE `cooking_recipes` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `dish_id` int(10) unsigned NOT NULL,
  `dish_amount` int(10) unsigned NOT NULL,
  `fantasy_dish_id` int(10) unsigned NOT NULL,
  `fantasy_dish_amount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cooking_recipes
-- ----------------------------
INSERT INTO `cooking_recipes` VALUES ('0', 'Monster Eye Steak of Fantasy', '41277', '1', '41285', '1');
INSERT INTO `cooking_recipes` VALUES ('1', 'Roasted Bear Meat of Fantasy', '41278', '1', '41286', '1');
INSERT INTO `cooking_recipes` VALUES ('2', 'Seed Stuffed Pancake of Fantasy', '41279', '1', '41287', '1');
INSERT INTO `cooking_recipes` VALUES ('3', 'Roasted Ant Legs with Cheese of Fantasy', '41280', '1', '41288', '1');
INSERT INTO `cooking_recipes` VALUES ('4', 'Fruit Salad of Fantasy', '41281', '1', '41289', '1');
INSERT INTO `cooking_recipes` VALUES ('5', 'Sweet Sour Fruit of Fantasy', '41282', '1', '41290', '1');
INSERT INTO `cooking_recipes` VALUES ('6', 'Roasted Boar Skewers of Fantasy', '41283', '1', '41291', '1');
INSERT INTO `cooking_recipes` VALUES ('7', 'Mushroom Soup of Fantasy', '41284', '1', '41292', '1');
INSERT INTO `cooking_recipes` VALUES ('8', 'Cavier Canape of Fantasy', '49049', '1', '49057', '1');
INSERT INTO `cooking_recipes` VALUES ('9', 'Alligator Steak of Fantasy', '49050', '1', '49058', '1');
INSERT INTO `cooking_recipes` VALUES ('10', 'Turtle Dragon Cookie of Fantasy', '49051', '1', '49059', '1');
INSERT INTO `cooking_recipes` VALUES ('11', 'Roasted Kiwi Parrot of Fantasy', '49052', '1', '49060', '1');
INSERT INTO `cooking_recipes` VALUES ('12', 'Roasted Scorpion of Fantasy', '49053', '1', '49061', '1');
INSERT INTO `cooking_recipes` VALUES ('13', 'Elekkadom Stew of Fantasy', '49054', '1', '49062', '1');
INSERT INTO `cooking_recipes` VALUES ('14', 'Roasted Spider Leg of Fantasy', '49055', '1', '49063', '1');
INSERT INTO `cooking_recipes` VALUES ('15', 'Crab Meat Soup of Fantasy', '49056', '1', '49064', '1');
INSERT INTO `cooking_recipes` VALUES ('16', '', '49244', '1', '49252', '1');
INSERT INTO `cooking_recipes` VALUES ('17', '', '49245', '1', '49253', '1');
INSERT INTO `cooking_recipes` VALUES ('18', '', '49246', '1', '49254', '1');
INSERT INTO `cooking_recipes` VALUES ('19', '', '49247', '1', '49255', '1');
INSERT INTO `cooking_recipes` VALUES ('20', '', '49248', '1', '49256', '1');
INSERT INTO `cooking_recipes` VALUES ('21', '', '49249', '1', '49257', '1');
INSERT INTO `cooking_recipes` VALUES ('22', '', '49250', '1', '49258', '1');
INSERT INTO `cooking_recipes` VALUES ('23', '', '49251', '1', '49259', '1');
