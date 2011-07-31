-- IMPORTANT: THIS UPDATE IS NOT YET FINISHED, DONT USE!

-- Queries that are pending an update should be placed here. This allows them
-- to be verified as working together. Once complete, the -pending suffix will
-- be removed.

-- update 62

-- make lasta non rtele
UPDATE mapids SET teleportable = 0 WHERE mapid > 490 AND mapid < 497;

-- make chaos agro players
UPDATE npc SET agro=1, agrososc = 1, agrocoi = 1 where npcid = 45625;

-- minor adjustment on lasta ele room spawn counts
UPDATE spawnlist SET count = 8 WHERE mapid = 464 AND count = 10;

-- remove incorrect salamander spawn in forrest of mirror
DELETE FROM spawnlist WHERE id = 9756;

-- girtas fix
update npc set passispeed = 0, alt_atk_speed = 2200, ranged=10 where npcid = 81163;
INSERT INTO `spawnlist_boss` VALUES ('211', 'Girtas', 'Girtas', '1', '81163', '0', '32868', '32862', '0', '0', '0', '0', '0', '0', '5', '535', '1', '0', '0', '0', '100');

-- inn tables -- ingore dupes dungeon teleports.

INSERT INTO `dungeon` VALUES ('32600', '32931', '0', '32745', '32803', '16384', '6', '');
INSERT INTO `dungeon` VALUES ('32746', '32803', '16384', '32599', '32931', '0', '6', '');
INSERT INTO `dungeon` VALUES ('32744', '32808', '16896', '32599', '32931', '0', '1', '');
INSERT INTO `dungeon` VALUES ('32632', '32761', '4', '32743', '32803', '17408', '6', '');
INSERT INTO `dungeon` VALUES ('32744', '32803', '17408', '32631', '32761', '4', '6', '');
INSERT INTO `dungeon` VALUES ('32745', '32807', '17920', '32631', '32761', '4', '6', '');
INSERT INTO `dungeon` VALUES ('32628', '33167', '4', '32744', '32803', '20480', '6', '');
INSERT INTO `dungeon` VALUES ('32745', '32803', '20480', '32627', '33167', '4', '6', '');
INSERT INTO `dungeon` VALUES ('32745', '32807', '20992', '32627', '33167', '4', '6', '');
INSERT INTO `dungeon` VALUES ('33116', '33379', '4', '32744', '32803', '21504', '6', '');
INSERT INTO `dungeon` VALUES ('32745', '32803', '21504', '33115', '33379', '4', '6', '');
INSERT INTO `dungeon` VALUES ('32745', '32807', '22016', '33115', '33379', '4', '6', '');
INSERT INTO `dungeon` VALUES ('33605', '33275', '4', '32744', '32803', '22528', '6', '');
INSERT INTO `dungeon` VALUES ('32745', '32803', '22528', '33604', '33276', '4', '4', '');
INSERT INTO `dungeon` VALUES ('32745', '32807', '23040', '33604', '33276', '4', '4', '');
INSERT INTO `dungeon` VALUES ('33437', '32789', '4', '32744', '32803', '18432', '6', '');
INSERT INTO `dungeon` VALUES ('32745', '32803', '18432', '33437', '32790', '4', '4', '');
INSERT INTO `dungeon` VALUES ('32745', '32807', '18944', '33437', '32790', '4', '4', '');
INSERT INTO `dungeon` VALUES ('34068', '32254', '19456', '32744', '32803', '4', '6', '');
INSERT INTO `dungeon` VALUES ('32745', '32803', '4', '34067', '32254', '19456', '6', '');
INSERT INTO `dungeon` VALUES ('32745', '32803', '19456', '34067', '32254', '4', '6', '');
INSERT INTO `dungeon` VALUES ('32745', '32807', '4', '34067', '32254', '19968', '6', '');
INSERT INTO `dungeon` VALUES ('32745', '32807', '19968', '34067', '32254', '4', '6', '');
INSERT INTO `dungeon` VALUES ('33985', '33312', '4', '32744', '32803', '24576', '6', '');
INSERT INTO `dungeon` VALUES ('32744', '32803', '24576', '33985', '33312', '4', '6', '');
INSERT INTO `dungeon` VALUES ('32450', '33047', '440', '32744', '32803', '23552', '6', '');
INSERT INTO `dungeon` VALUES ('32744', '32803', '23552', '32450', '33047', '440', '6', '');

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

-- ----------------------------
-- Table structure for `inn_key`
-- ----------------------------
DROP TABLE IF EXISTS `inn_key`;
CREATE TABLE `inn_key` (
  `item_obj_id` int(11) NOT NULL,
  `key_id` int(11) NOT NULL,
  `npc_id` int(10) DEFAULT NULL,
  `hall` tinyint(2) DEFAULT NULL,
  `due_time` datetime DEFAULT NULL,
  PRIMARY KEY (`item_obj_id`,`key_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of inn_key
-- ----------------------------

-- polyrace
insert into spawnlist_npc values (1310454,'Dufo PolyRace',1,80168,32616,32778,0,0,4,0,4,0);
INSERT INTO `npc` VALUES (80168, 'Dufo', '$5524', 'Polyrace', 'L1Merchant', 118, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'small', 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 14, 0, 1, 0);

-- door gfx table
ALTER TABLE spawnlist_door DROP direction;
ALTER TABLE spawnlist_door DROP left_edge_location;
ALTER TABLE spawnlist_door DROP right_edge_location;

DROP TABLE IF EXISTS `door_gfxs`;
CREATE TABLE `door_gfxs` (
  `gfxid` int(11) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `direction` int(11) NOT NULL,
  `left_edge_offset` int(11) NOT NULL,
  `right_edge_offset` int(11) NOT NULL,
  PRIMARY KEY (`gfxid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# ----------------------------
# Records of door_gfxs
# ----------------------------
INSERT INTO door_gfxs VALUES
(92, 'Pagos Room', 0, 0, 1),
(93, 'Pagos Room', 1, 0, 0),
(339, 'Kent Castle', 0, -1, 0),
(442, 'Windawood', 0, 0, 0),
(443, 'Dwarf Castle', 1, 0, 1),
(444, 'SKT', 1, 0, 0),
(446, 'SKT', 1, 0, 0),
(447, 'SKT', 0, 0, 0),
(448, 'SKT', 0, 0, 0),
(766, 'Orcish Forest', 1, 0, 0),
(767, 'Orcish Forest', 0, 0, 0),
(768, 'Orcish Forest', 1, 0, 0),
(845, 'SKT', 0, 0, 0),
(1010, 'SKT', 0, 0, 0),
(1327, 'Giran', 1, 0, 0),
(1329, 'Giran', 0, 0, 0),
(1330, 'Giran', 1, 0, 0),
(1331, 'Giran', 0, 0, 0),
(1332, 'Giran', 1, 0, 0),
(1333, 'Giran', 0, 0, 0),
(1334, 'Giran', 0, 0, 0),
(1336, 'Giran Castle', 0, -1, 0),
(1338, 'Giran Castle', 1, 0, 1),
(1341, 'Orcish Forest', 0, 0, 0),
(1342, 'Giran', 1, 0, 1),
(1347, 'Giran', 0, 0, 0),
(1348, 'Giran', 0, 0, 0),
(1349, 'Giran', 0, 0, 0),
(1350, 'Giran', 0, 0, 0),
(1351, 'Giran', 1, 0, 0),
(1352, 'Giran', 0, 0, 0),
(1371, 'Giran', 1, 0, 0),
(1373, 'Giran', 0, 0, 0),
(1487, 'Giran Dog Race', 1, 0, 0),
(1664, 'Heine', 1, 0, 0),
(1665, 'Heine', 0, 0, 0),
(1688, 'Heine', 1, 0, 0),
(1689, 'Heine', 0, 0, 0),
(1690, 'Heine', 0, 0, 0),
(1691, 'Heine', 0, 0, 0),
(1692, 'Heine', 1, 0, 0),
(1700, 'Heine', 0, 0, 0),
(1734, 'Heine', 1, 0, 0),
(1735, 'Heine', 0, 0, 0),
(1736, 'Heine', 0, 0, 0),
(1737, 'Heine', 1, 0, 0),
(1738, 'Heine', 0, 0, 0),
(1739, 'Heine', 1, 0, 0),
(1740, 'Heine', 0, 0, 0),
(1741, 'Heine', 1, 0, 0),
(1743, 'Heine', 0, 0, 0),
(1744, 'Heine', 1, 0, 0),
(1745, 'Heine Castle', 0, -2, 0),
(1750, 'Heine', 1, 0, 0),
(1751, 'Heine', 0, 0, 0),
(1826, 'Dwarf Castle', 1, -2, 1),
(1827, 'Dwarf Castle', 0, -1, 2),
(2083, 'Hidden Valley', 0, 0, 0),
(2089, 'Hidden Valley', 1, 0, 0),
(2114, 'Hidden Valley', 0, 0, 0),
(2128, 'Hidden Valley', 1, 0, 0),
(2160, 'Oren', 0, 0, 0),
(2161, 'Oren', 0, 0, 0),
(2162, 'Oren', 1, 0, 0),
(2163, 'Oren', 0, 0, 0),
(2164, 'Oren', 0, 0, 0),
(2190, 'Oren', 0, 0, 0),
(2191, 'Oren', 1, 0, 0),
(2301, 'Talking Island', 0, 0, 0),
(2303, 'Talking Island', 0, 0, 0),
(2304, 'Talking Island', 0, 0, 0),
(2305, 'Talking Island', 0, 0, 0),
(2306, 'Talking Island', 0, 0, 0),
(2344, 'Talking Island', 1, -364, -364),
(2345, 'Talking Island', 0, 0, 0),
(2346, 'Talking Island', 0, 0, 0),
(2510, 'race', 1, -3, 4),
(2556, 'Aden', 1, 0, 0),
(2558, 'Aden', 0, 0, 0),
(2574, 'Aden', 1, 0, 0),
(2575, 'Aden', 0, 0, 0),
(2578, 'Aden', 0, 0, 0),
(2579, 'Aden', 0, 0, 0),
(2580, 'Aden', 1, 0, 0),
(2581, 'Aden', 0, 0, 0),
(2582, 'Aden', 0, 0, 0),
(2583, 'Aden', 1, 0, 0),
(2585, 'Aden', 0, 0, 0),
(2588, 'Aden', 1, 0, 0),
(2589, 'Aden', 1, 0, 0),
(2590, 'Aden', 0, 0, 0),
(2591, 'Aden', 0, 0, 0),
(2596, 'Aden', 1, 0, 0),
(2597, 'Aden', 0, 0, 0),
(2598, 'Aden', 0, 0, 0),
(2599, 'Aden', 1, 0, 0),
(2600, 'Aden', 1, 0, 0),
(2603, 'Aden', 0, 0, 0),
(2605, 'Aden', 0, 0, 0),
(2606, 'Aden', 1, 0, 0),
(2608, 'Aden', 0, 0, 0),
(2610, 'Aden', 1, 0, 0),
(2628, 'Aden', 1, 0, 0),
(2629, 'Aden', 1, 0, 0),
(2630, 'Aden', 0, 0, 0),
(2631, 'Aden', 0, 0, 0),
(2634, 'Aden', 0, 0, 0),
(2635, 'Aden', 0, 0, 0),
(2732, 'OT Castle', 0, -1, 2),
(2736, 'Kent Castle', 1, -2, 1),
(2744, 'Giran Castle', 0, 0, 3),
(2745, 'Giran Castle', 0, -1, 2),
(2746, 'Giran Castle', 1, -2, 1),
(3234, 'Kent Castle', 0, -2, 1),
(6026, 'Gludio', 0, 0, 0),
(6027, 'Gludio', 1, 0, 0),
(6028, 'Gludio', 1, 0, 0),
(6029, 'Gludio', 0, 0, 1),
(6030, 'Gludio', 0, 0, 1),
(6031, 'Gludio', 1, 0, 0),
(6032, 'Gludio', 0, 0, 0),
(6033, 'Gludio', 1, 0, 0),
(6336, 'Haunted House', 0, -1, 1),
(6351, 'Haunted House', 1, -3, 3),
(6379, 'Haunted House', 1, 0, 2),
(6677, 'race', 1, -3, 4),
(6692, 'Death match', 0, 0, 1),
(6694, 'Death match', 1, -1, 0),
(7536, 'Hardin Quest', 0, 0, 0);

-- pet food collum added + equipe
ALTER TABLE pets ADD food int(2) NOT NULL DEFAULT 0 after lawful;
ALTER TABLE pettypes ADD canUseEquipment tinyint(1) NOT NULL DEFAULT 0 after DefyMessageId;
ALTER TABLE pettypes ADD EvolvItemId int(10) NOT NULL DEFAULT 40070 after MpUpMax;

UPDATE pettypes SET canUseEquipment = 1 WHERE BaseNpcId = 45686;
UPDATE pettypes SET canUseEquipment = 1 WHERE BaseNpcId = 45687; 
UPDATE pettypes SET canUseEquipment = 1 WHERE BaseNpcId = 45688; 
UPDATE pettypes SET canUseEquipment = 1 WHERE BaseNpcId = 45689; 
UPDATE pettypes SET canUseEquipment = 1 WHERE BaseNpcId = 45690; 
UPDATE pettypes SET canUseEquipment = 1 WHERE BaseNpcId = 45691; 
UPDATE pettypes SET canUseEquipment = 1 WHERE BaseNpcId = 45692; 
UPDATE pettypes SET canUseEquipment = 1 WHERE BaseNpcId = 45693; 
UPDATE pettypes SET canUseEquipment = 1 WHERE BaseNpcId = 45694; 
UPDATE pettypes SET canUseEquipment = 1 WHERE BaseNpcId = 45695; 
UPDATE pettypes SET canUseEquipment = 1 WHERE BaseNpcId = 45696; 
UPDATE pettypes SET canUseEquipment = 1 WHERE BaseNpcId = 45697; 
UPDATE pettypes SET canUseEquipment = 1 WHERE BaseNpcId = 45710; 
UPDATE pettypes SET canUseEquipment = 1 WHERE BaseNpcId = 45712; 
UPDATE pettypes SET canUseEquipment = 1 WHERE BaseNpcId = 46043; 
UPDATE pettypes SET canUseEquipment = 1 WHERE BaseNpcId = 46045; 
UPDATE pettypes SET canUseEquipment = 1 WHERE BaseNpcId = 46046; 
UPDATE pettypes SET canUseEquipment = 1 WHERE BaseNpcId = 91177; 
UPDATE pettypes SET canUseEquipment = 1 WHERE BaseNpcId = 91176; 
UPDATE pettypes SET canUseEquipment = 1 WHERE BaseNpcId = 91174;

DELETE FROM npcaction WHERE npcid = 81200;
INSERT INTO npcaction VALUES ('81200', 'bankoo1', 'bankoo1', '', '');

update npc set nameid = 'Bankoo' where npcid = 81200;
update npc set name = 'Bankoo' where npcid = 81200;
update npc set name = 'Sveil' where npcid = 80141;
update npc set name = 'Blacksmith Bahturu' where npcid = 80142;
update npc set name = 'Azael' where npcid = 80143;
update npc set name = 'Lark' where npcid = 80144;
update npc set name = 'Charriere' where npcid = 80146;
update npc set name = 'UnknownNpc' where npcid = 81243;
update npc set name = 'UnknownNpc' where npcid = 81244;

-- forgot to commit the race and deathmatch doors and some missing doors.
INSERT INTO `door_gfxs` VALUES ('88', 'Talking Island Caves 2F', '0', '0', '0');
INSERT INTO `door_gfxs` VALUES ('89', 'Talking Island Caves 2F', '1', '0', '0');
INSERT INTO `door_gfxs` VALUES ('6640', 'Crystal Caves 1F', '1', '-1', '3');
INSERT INTO `door_gfxs` VALUES ('6642', 'Crystal Caves 2F', '0', '-2', '2');
INSERT INTO `spawnlist_door` VALUES ('5001', 'Crystal Caves 1F', '6640', '32859', '32835', '72', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('5002', 'Crystal Caves 2F', '6640', '32862', '32764', '73', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('5003', 'Crystal Caves 2F', '6640', '32845', '32809', '73', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('5004', 'Crystal Caves 2F', '6642', '32825', '32862', '73', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('5005', 'Crystal Caves 2F', '6642', '32767', '32837', '73', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('5006', 'Crystal Caves 2F', '6642', '32752', '32753', '73', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('5007', 'Crystal Caves 3F', '6640', '32784', '32818', '74', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('5008', 'Crystal Caves 3F', '6640', '32852', '32806', '74', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('5009', 'Crystal Caves 3F', '6640', '32822', '32855', '74', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('5010', 'Crystal Caves 3F', '6642', '32762', '32916', '74', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6001', 'Talking Island Caves 2F', '92', '32664', '32807', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6002', 'Talking Island Caves 2F', '93', '32673', '32820', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6003', 'Talking Island Caves 2F', '92', '32668', '32833', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6004', 'Talking Island Caves 2F', '88', '32661', '32823', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6005', 'Talking Island Caves 2F', '89', '32672', '32858', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6006', 'Talking Island Caves 2F', '93', '32684', '32850', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6007', 'Talking Island Caves 2F', '93', '32723', '32848', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6008', 'Talking Island Caves 2F', '89', '32678', '32877', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6009', 'Talking Island Caves 2F', '89', '32732', '32872', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6010', 'Talking Island Caves 2F', '89', '32736', '32872', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6011', 'Talking Island Caves 2F', '89', '32740', '32872', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6012', 'Talking Island Caves 2F', '89', '32795', '32870', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6013', 'Talking Island Caves 2F', '88', '32803', '32862', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6014', 'Talking Island Caves 2F', '89', '32806', '32824', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6015', 'Talking Island Caves 2F', '88', '32803', '32832', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6016', 'Talking Island Caves 2F', '92', '32798', '32844', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6017', 'Talking Island Caves 2F', '93', '32759', '32847', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6018', 'Talking Island Caves 2F', '88', '32808', '32792', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6019', 'Talking Island Caves 2F', '93', '32776', '32806', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6020', 'Talking Island Caves 2F', '93', '32775', '32818', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6021', 'Talking Island Caves 2F', '88', '32741', '32804', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6022', 'Talking Island Caves 2F', '89', '32740', '32788', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6023', 'Talking Island Caves 2F', '89', '32750', '32793', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6024', 'Talking Island Caves 2F', '89', '32766', '32791', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6025', 'Talking Island Caves 2F', '93', '32755', '32818', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6026', 'Talking Island Caves 2F', '93', '32726', '32812', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6027', 'Talking Island Caves 2F', '93', '32705', '32816', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6028', 'Talking Island Caves 2F', '92', '32698', '32803', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6029', 'Talking Island Caves 2F', '92', '32680', '32797', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6030', 'Talking Island Caves 2F', '93', '32707', '32789', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6031', 'Talking Island Caves 2F', '92', '32725', '32795', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('6032', 'Talking Island Caves 2F', '92', '32667', '32871', '2', '0', '0');
INSERT INTO `spawnlist_door` VALUES ('9000', 'PetRace', '6677', '32762', '32848', '5143', '0', '5143');
INSERT INTO `spawnlist_door` VALUES ('9001', 'PetRace', '2510', '32772', '32848', '5143', '0', '5143');
INSERT INTO `spawnlist_door` VALUES ('9002', 'DeathMatch', '6692', '32638', '32884', '5153', '0', '5153');
INSERT INTO `spawnlist_door` VALUES ('9003', 'DeathMatch', '6694', '32654', '32899', '5153', '0', '5153');

-- Antharas Instance Dungeon
INSERT INTO `npcaction` VALUES ('81277', 'dsecret3', 'dsecret3', '', '');
INSERT INTO `getback_restart` VALUES ('1005', 'Antharas Lair', '33710', '32521', '4'); 
INSERT INTO `getback_restart` VALUES ('1006', 'Antharas Lair', '33710', '32521', '4');
INSERT INTO `getback_restart` VALUES ('1007', 'Antharas Lair', '33710', '32521', '4');
INSERT INTO `getback_restart` VALUES ('1008', 'Antharas Lair', '33710', '32521', '4');
INSERT INTO `getback_restart` VALUES ('1009', 'Antharas Lair', '33710', '32521', '4');
INSERT INTO `getback_restart` VALUES ('1010', 'Antharas Lair', '33710', '32521', '4');

INSERT INTO `mapids` VALUES ('1005', 'Antharas Lair', '32576', '32959', '32576', '32959', '1', '1', '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `mapids` VALUES ('1006', 'Antharas Lair', '32576', '32959', '32576', '32959', '1', '1', '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `mapids` VALUES ('1007', 'Antharas Lair', '32576', '32959', '32576', '32959', '1', '1', '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `mapids` VALUES ('1008', 'Antharas Lair', '32576', '32959', '32576', '32959', '1', '1', '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `mapids` VALUES ('1009', 'Antharas Lair', '32576', '32959', '32576', '32959', '1', '1', '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `mapids` VALUES ('1010', 'Antharas Lair', '32576', '32959', '32576', '32959', '1', '1', '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', '1');

INSERT INTO `spawnlist_npc` VALUES ('89820', '', '1', '81279', '32935', '32732', '0', '0', '6', '0', '1006', '0');
INSERT INTO `spawnlist_npc` VALUES ('89821', '', '1', '81280', '32681', '32680', '0', '0', '5', '0', '1006', '0');
INSERT INTO `spawnlist_npc` VALUES ('89822', '', '1', '81281', '32684', '32663', '0', '0', '5', '0', '1006', '0');
INSERT INTO `spawnlist_npc` VALUES ('89823', '', '1', '81279', '32935', '32732', '0', '0', '6', '0', '1007', '0');
INSERT INTO `spawnlist_npc` VALUES ('89824', '', '1', '81280', '32681', '32680', '0', '0', '5', '0', '1007', '0');
INSERT INTO `spawnlist_npc` VALUES ('89825', '', '1', '81281', '32684', '32663', '0', '0', '5', '0', '1007', '0');
INSERT INTO `spawnlist_npc` VALUES ('89826', '', '1', '81279', '32935', '32732', '0', '0', '6', '0', '1008', '0');
INSERT INTO `spawnlist_npc` VALUES ('89827', '', '1', '81280', '32681', '32680', '0', '0', '5', '0', '1008', '0');
INSERT INTO `spawnlist_npc` VALUES ('89828', '', '1', '81281', '32684', '32663', '0', '0', '5', '0', '1008', '0');
INSERT INTO `spawnlist_npc` VALUES ('89829', '', '1', '81279', '32935', '32732', '0', '0', '6', '0', '1009', '0');
INSERT INTO `spawnlist_npc` VALUES ('89830', '', '1', '81280', '32681', '32680', '0', '0', '5', '0', '1009', '0');
INSERT INTO `spawnlist_npc` VALUES ('89831', '', '1', '81281', '32684', '32663', '0', '0', '5', '0', '1009', '0');
INSERT INTO `spawnlist_npc` VALUES ('89832', '', '1', '81279', '32935', '32732', '0', '0', '6', '0', '1010', '0');
INSERT INTO `spawnlist_npc` VALUES ('89833', '', '1', '81280', '32681', '32680', '0', '0', '5', '0', '1010', '0');
INSERT INTO `spawnlist_npc` VALUES ('89834', '', '1', '81281', '32684', '32663', '0', '0', '5', '0', '1010', '0');
INSERT INTO `spawnlist_npc` VALUES ('89835', '', '1', '81292', '33051', '32536', '0', '0', '4', '0', '1012', '0');
INSERT INTO `spawnlist_npc` VALUES ('89836', '', '1', '81293', '32935', '32680', '0', '0', '5', '0', '1012', '0');
INSERT INTO `spawnlist_npc` VALUES ('89837', '', '1', '81294', '32920', '32664', '0', '0', '4', '0', '1012', '0');
INSERT INTO `spawnlist_npc` VALUES ('89838', '', '1', '81292', '33051', '32536', '0', '0', '4', '0', '1013', '0');
INSERT INTO `spawnlist_npc` VALUES ('89839', '', '1', '81293', '32935', '32680', '0', '0', '5', '0', '1013', '0');
INSERT INTO `spawnlist_npc` VALUES ('89840', '', '1', '81294', '32920', '32664', '0', '0', '4', '0', '1013', '0');
INSERT INTO `spawnlist_npc` VALUES ('89841', '', '1', '81292', '33051', '32536', '0', '0', '4', '0', '1014', '0');
INSERT INTO `spawnlist_npc` VALUES ('89842', '', '1', '81293', '32935', '32680', '0', '0', '5', '0', '1014', '0');
INSERT INTO `spawnlist_npc` VALUES ('89843', '', '1', '81294', '32920', '32664', '0', '0', '4', '0', '1014', '0');
INSERT INTO `spawnlist_npc` VALUES ('89844', '', '1', '81292', '33051', '32536', '0', '0', '4', '0', '1015', '0');
INSERT INTO `spawnlist_npc` VALUES ('89845', '', '1', '81293', '32935', '32680', '0', '0', '5', '0', '1015', '0');
INSERT INTO `spawnlist_npc` VALUES ('89846', '', '1', '81294', '32920', '32664', '0', '0', '4', '0', '1015', '0');
INSERT INTO `spawnlist_npc` VALUES ('89847', '', '1', '81292', '33051', '32536', '0', '0', '4', '0', '1016', '0');
INSERT INTO `spawnlist_npc` VALUES ('89848', '', '1', '81293', '32935', '32680', '0', '0', '5', '0', '1016', '0');
INSERT INTO `spawnlist_npc` VALUES ('89849', '', '1', '81294', '32920', '32664', '0', '0', '4', '0', '1016', '0');
INSERT INTO `spawnlist_npc` VALUES ('89850', '', '1', '80001', '32647', '32950', '0', '0', '5', '0', '0', '0');
INSERT INTO `spawnlist_npc` VALUES ('89851', '', '1', '81166', '33054', '32337', '0', '0', '6', '0', '4', '0');
INSERT INTO `spawnlist_npc` VALUES ('89852', '', '1', '71097', '33601', '33245', '0', '0', '5', '0', '4', '0');

INSERT INTO `dungeon` VALUES ('32683', '32924', '1005', '32670', '32670', '1005', '4', '');
INSERT INTO `dungeon` VALUES ('32683', '32925', '1005', '32670', '32670', '1005', '4', '');
INSERT INTO `dungeon` VALUES ('32811', '32924', '1005', '32670', '32670', '1005', '4', '');
INSERT INTO `dungeon` VALUES ('32811', '32925', '1005', '32670', '32670', '1005', '4', '');
INSERT INTO `dungeon` VALUES ('32939', '32924', '1005', '32670', '32670', '1005', '4', '');
INSERT INTO `dungeon` VALUES ('32939', '32925', '1005', '32670', '32670', '1005', '4', '');
INSERT INTO `dungeon` VALUES ('32939', '32732', '1005', '32670', '32670', '1005', '4', '');
INSERT INTO `dungeon` VALUES ('32939', '32733', '1005', '32670', '32670', '1005', '4', '');
INSERT INTO `dungeon` VALUES ('32624', '32724', '1005', '32670', '32670', '1005', '4', '');
INSERT INTO `dungeon` VALUES ('32624', '32725', '1005', '32670', '32670', '1005', '4', '');
INSERT INTO `dungeon` VALUES ('32671', '32666', '1005', '32621', '32726', '1005', '6', '');
INSERT INTO `dungeon` VALUES ('32672', '32666', '1005', '32621', '32726', '1005', '6', '');
INSERT INTO `dungeon` VALUES ('32683', '32924', '1006', '32670', '32670', '1006', '4', '');
INSERT INTO `dungeon` VALUES ('32683', '32925', '1006', '32670', '32670', '1006', '4', '');
INSERT INTO `dungeon` VALUES ('32811', '32924', '1006', '32670', '32670', '1006', '4', '');
INSERT INTO `dungeon` VALUES ('32811', '32925', '1006', '32670', '32670', '1006', '4', '');
INSERT INTO `dungeon` VALUES ('32939', '32924', '1006', '32670', '32670', '1006', '4', '');
INSERT INTO `dungeon` VALUES ('32939', '32925', '1006', '32670', '32670', '1006', '4', '');
INSERT INTO `dungeon` VALUES ('32939', '32732', '1006', '32670', '32670', '1006', '4', '');
INSERT INTO `dungeon` VALUES ('32939', '32733', '1006', '32670', '32670', '1006', '4', '');
INSERT INTO `dungeon` VALUES ('32624', '32724', '1006', '32670', '32670', '1006', '4', '');
INSERT INTO `dungeon` VALUES ('32624', '32725', '1006', '32670', '32670', '1006', '4', '');
INSERT INTO `dungeon` VALUES ('32671', '32666', '1006', '32621', '32726', '1006', '6', '');
INSERT INTO `dungeon` VALUES ('32672', '32666', '1006', '32621', '32726', '1006', '6', '');
INSERT INTO `dungeon` VALUES ('32683', '32924', '1007', '32670', '32670', '1007', '4', '');
INSERT INTO `dungeon` VALUES ('32683', '32925', '1007', '32670', '32670', '1007', '4', '');
INSERT INTO `dungeon` VALUES ('32811', '32924', '1007', '32670', '32670', '1007', '4', '');
INSERT INTO `dungeon` VALUES ('32811', '32925', '1007', '32670', '32670', '1007', '4', '');
INSERT INTO `dungeon` VALUES ('32939', '32924', '1007', '32670', '32670', '1007', '4', '');
INSERT INTO `dungeon` VALUES ('32939', '32925', '1007', '32670', '32670', '1007', '4', '');
INSERT INTO `dungeon` VALUES ('32939', '32732', '1007', '32670', '32670', '1007', '4', '');
INSERT INTO `dungeon` VALUES ('32939', '32733', '1007', '32670', '32670', '1007', '4', '');
INSERT INTO `dungeon` VALUES ('32624', '32724', '1007', '32670', '32670', '1007', '4', '');
INSERT INTO `dungeon` VALUES ('32624', '32725', '1007', '32670', '32670', '1007', '4', '');
INSERT INTO `dungeon` VALUES ('32671', '32666', '1007', '32621', '32726', '1007', '6', '');
INSERT INTO `dungeon` VALUES ('32672', '32666', '1007', '32621', '32726', '1007', '6', '');
INSERT INTO `dungeon` VALUES ('32683', '32924', '1008', '32670', '32670', '1008', '4', '');
INSERT INTO `dungeon` VALUES ('32683', '32925', '1008', '32670', '32670', '1008', '4', '');
INSERT INTO `dungeon` VALUES ('32811', '32924', '1008', '32670', '32670', '1008', '4', '');
INSERT INTO `dungeon` VALUES ('32811', '32925', '1008', '32670', '32670', '1008', '4', '');
INSERT INTO `dungeon` VALUES ('32939', '32924', '1008', '32670', '32670', '1008', '4', '');
INSERT INTO `dungeon` VALUES ('32939', '32925', '1008', '32670', '32670', '1008', '4', '');
INSERT INTO `dungeon` VALUES ('32939', '32732', '1008', '32670', '32670', '1008', '4', '');
INSERT INTO `dungeon` VALUES ('32939', '32733', '1008', '32670', '32670', '1008', '4', '');
INSERT INTO `dungeon` VALUES ('32624', '32724', '1008', '32670', '32670', '1008', '4', '');
INSERT INTO `dungeon` VALUES ('32624', '32725', '1008', '32670', '32670', '1008', '4', '');
INSERT INTO `dungeon` VALUES ('32671', '32666', '1008', '32621', '32726', '1008', '6', '');
INSERT INTO `dungeon` VALUES ('32672', '32666', '1008', '32621', '32726', '1008', '6', '');
INSERT INTO `dungeon` VALUES ('32683', '32924', '1009', '32670', '32670', '1009', '4', '');
INSERT INTO `dungeon` VALUES ('32683', '32925', '1009', '32670', '32670', '1009', '4', '');
INSERT INTO `dungeon` VALUES ('32811', '32924', '1009', '32670', '32670', '1009', '4', '');
INSERT INTO `dungeon` VALUES ('32811', '32925', '1009', '32670', '32670', '1009', '4', '');
INSERT INTO `dungeon` VALUES ('32939', '32924', '1009', '32670', '32670', '1009', '4', '');
INSERT INTO `dungeon` VALUES ('32939', '32925', '1009', '32670', '32670', '1009', '4', '');
INSERT INTO `dungeon` VALUES ('32939', '32732', '1009', '32670', '32670', '1009', '4', '');
INSERT INTO `dungeon` VALUES ('32939', '32733', '1009', '32670', '32670', '1009', '4', '');
INSERT INTO `dungeon` VALUES ('32624', '32724', '1009', '32670', '32670', '1009', '4', '');
INSERT INTO `dungeon` VALUES ('32624', '32725', '1009', '32670', '32670', '1009', '4', '');
INSERT INTO `dungeon` VALUES ('32671', '32666', '1009', '32621', '32726', '1009', '6', '');
INSERT INTO `dungeon` VALUES ('32672', '32666', '1009', '32621', '32726', '1009', '6', '');
INSERT INTO `dungeon` VALUES ('32683', '32924', '1010', '32670', '32670', '1010', '4', '');
INSERT INTO `dungeon` VALUES ('32683', '32925', '1010', '32670', '32670', '1010', '4', '');
INSERT INTO `dungeon` VALUES ('32811', '32924', '1010', '32670', '32670', '1010', '4', '');
INSERT INTO `dungeon` VALUES ('32811', '32925', '1010', '32670', '32670', '1010', '4', '');
INSERT INTO `dungeon` VALUES ('32939', '32924', '1010', '32670', '32670', '1010', '4', '');
INSERT INTO `dungeon` VALUES ('32939', '32925', '1010', '32670', '32670', '1010', '4', '');
INSERT INTO `dungeon` VALUES ('32939', '32732', '1010', '32670', '32670', '1010', '4', '');
INSERT INTO `dungeon` VALUES ('32939', '32733', '1010', '32670', '32670', '1010', '4', '');
INSERT INTO `dungeon` VALUES ('32624', '32724', '1010', '32670', '32670', '1010', '4', '');
INSERT INTO `dungeon` VALUES ('32624', '32725', '1010', '32670', '32670', '1010', '4', '');
INSERT INTO `dungeon` VALUES ('32671', '32666', '1010', '32621', '32726', '1010', '6', '');
INSERT INTO `dungeon` VALUES ('32672', '32666', '1010', '32621', '32726', '1010', '6', '');

INSERT INTO `spawnlist_npc` VALUES ('89857', '', '1', '81301', '32703', '32670', '0', '0', '0', '0', '1005', '0');
INSERT INTO `spawnlist_npc` VALUES ('89858', '', '1', '81301', '32703', '32670', '0', '0', '0', '0', '1006', '0');
INSERT INTO `spawnlist_npc` VALUES ('89859', '', '1', '81301', '32703', '32670', '0', '0', '0', '0', '1007', '0');
INSERT INTO `spawnlist_npc` VALUES ('89860', '', '1', '81301', '32703', '32670', '0', '0', '0', '0', '1008', '0');
INSERT INTO `spawnlist_npc` VALUES ('89861', '', '1', '81301', '32703', '32670', '0', '0', '0', '0', '1009', '0');
INSERT INTO `spawnlist_npc` VALUES ('89862', '', '1', '81301', '32703', '32670', '0', '0', '0', '0', '1010', '0');
INSERT INTO `spawnlist_npc` VALUES ('89863', '', '1', '81302', '32796', '32661', '0', '0', '0', '0', '1005', '0');
INSERT INTO `spawnlist_npc` VALUES ('89864', '', '1', '81302', '32796', '32661', '0', '0', '0', '0', '1006', '0');
INSERT INTO `spawnlist_npc` VALUES ('89865', '', '1', '81302', '32796', '32661', '0', '0', '0', '0', '1007', '0');
INSERT INTO `spawnlist_npc` VALUES ('89866', '', '1', '81302', '32796', '32661', '0', '0', '0', '0', '1008', '0');
INSERT INTO `spawnlist_npc` VALUES ('89867', '', '1', '81302', '32796', '32661', '0', '0', '0', '0', '1009', '0');
INSERT INTO `spawnlist_npc` VALUES ('89868', '', '1', '81302', '32796', '32661', '0', '0', '0', '0', '1010', '0');
INSERT INTO `spawnlist_npc` VALUES ('89869', '', '1', '81303', '32941', '32671', '0', '0', '0', '0', '1011', '0');
INSERT INTO `spawnlist_npc` VALUES ('89870', '', '1', '81303', '32941', '32671', '0', '0', '0', '0', '1012', '0');
INSERT INTO `spawnlist_npc` VALUES ('89871', '', '1', '81303', '32941', '32671', '0', '0', '0', '0', '1013', '0');
INSERT INTO `spawnlist_npc` VALUES ('89872', '', '1', '81303', '32941', '32671', '0', '0', '0', '0', '1014', '0');
INSERT INTO `spawnlist_npc` VALUES ('89873', '', '1', '81303', '32941', '32671', '0', '0', '0', '0', '1015', '0');
INSERT INTO `spawnlist_npc` VALUES ('89874', '', '1', '81303', '32941', '32671', '0', '0', '0', '0', '1016', '0');
INSERT INTO `spawnlist_npc` VALUES ('89875', '', '1', '81304', '32993', '32841', '0', '0', '0', '0', '1011', '0');
INSERT INTO `spawnlist_npc` VALUES ('89876', '', '1', '81304', '32993', '32841', '0', '0', '0', '0', '1012', '0');
INSERT INTO `spawnlist_npc` VALUES ('89877', '', '1', '81304', '32993', '32841', '0', '0', '0', '0', '1013', '0');
INSERT INTO `spawnlist_npc` VALUES ('89878', '', '1', '81304', '32993', '32841', '0', '0', '0', '0', '1014', '0');
INSERT INTO `spawnlist_npc` VALUES ('89879', '', '1', '81304', '32993', '32841', '0', '0', '0', '0', '1015', '0');
INSERT INTO `spawnlist_npc` VALUES ('89880', '', '1', '81304', '32993', '32841', '0', '0', '0', '0', '1016', '0');
INSERT INTO `spawnlist_npc` VALUES ('89881', '', '1', '81279', '32935', '32924', '0', '0', '6', '0', '1005', '0');
INSERT INTO `spawnlist_npc` VALUES ('89882', '', '1', '81279', '32807', '32924', '0', '0', '6', '0', '1005', '0');
INSERT INTO `spawnlist_npc` VALUES ('89883', '', '1', '81279', '32679', '32924', '0', '0', '6', '0', '1005', '0');
INSERT INTO `spawnlist_npc` VALUES ('89884', '', '1', '81279', '32935', '32924', '0', '0', '6', '0', '1006', '0');
INSERT INTO `spawnlist_npc` VALUES ('89885', '', '1', '81279', '32807', '32924', '0', '0', '6', '0', '1006', '0');
INSERT INTO `spawnlist_npc` VALUES ('89886', '', '1', '81279', '32679', '32924', '0', '0', '6', '0', '1006', '0');
INSERT INTO `spawnlist_npc` VALUES ('89887', '', '1', '81279', '32935', '32924', '0', '0', '6', '0', '1007', '0');
INSERT INTO `spawnlist_npc` VALUES ('89888', '', '1', '81279', '32807', '32924', '0', '0', '6', '0', '1007', '0');
INSERT INTO `spawnlist_npc` VALUES ('89889', '', '1', '81279', '32679', '32924', '0', '0', '6', '0', '1007', '0');
INSERT INTO `spawnlist_npc` VALUES ('89890', '', '1', '81279', '32935', '32924', '0', '0', '6', '0', '1008', '0');
INSERT INTO `spawnlist_npc` VALUES ('89891', '', '1', '81279', '32807', '32924', '0', '0', '6', '0', '1008', '0');
INSERT INTO `spawnlist_npc` VALUES ('89892', '', '1', '81279', '32679', '32924', '0', '0', '6', '0', '1008', '0');
INSERT INTO `spawnlist_npc` VALUES ('89893', '', '1', '81279', '32935', '32924', '0', '0', '6', '0', '1009', '0');
INSERT INTO `spawnlist_npc` VALUES ('89894', '', '1', '81279', '32807', '32924', '0', '0', '6', '0', '1009', '0');
INSERT INTO `spawnlist_npc` VALUES ('89895', '', '1', '81279', '32679', '32924', '0', '0', '6', '0', '1009', '0');
INSERT INTO `spawnlist_npc` VALUES ('89896', '', '1', '81279', '32935', '32924', '0', '0', '6', '0', '1010', '0');
INSERT INTO `spawnlist_npc` VALUES ('89897', '', '1', '81279', '32807', '32924', '0', '0', '6', '0', '1010', '0');
INSERT INTO `spawnlist_npc` VALUES ('89898', '', '1', '81279', '32679', '32924', '0', '0', '6', '0', '1010', '0');
INSERT INTO `spawnlist_npc` VALUES ('89899', '', '1', '81305', '32680', '32744', '0', '0', '0', '0', '1005', '0');
INSERT INTO `spawnlist_npc` VALUES ('89900', '', '1', '81305', '32680', '32744', '0', '0', '0', '0', '1006', '0');
INSERT INTO `spawnlist_npc` VALUES ('89901', '', '1', '81305', '32680', '32744', '0', '0', '0', '0', '1007', '0');
INSERT INTO `spawnlist_npc` VALUES ('89902', '', '1', '81305', '32680', '32744', '0', '0', '0', '0', '1008', '0');
INSERT INTO `spawnlist_npc` VALUES ('89903', '', '1', '81305', '32680', '32744', '0', '0', '0', '0', '1009', '0');
INSERT INTO `spawnlist_npc` VALUES ('89904', '', '1', '81305', '32680', '32744', '0', '0', '0', '0', '1010', '0');
INSERT INTO `spawnlist_npc` VALUES ('89905', '', '1', '81306', '32938', '32610', '0', '0', '0', '0', '1005', '0');
INSERT INTO `spawnlist_npc` VALUES ('89906', '', '1', '81306', '32682', '32802', '0', '0', '0', '0', '1005', '0');
INSERT INTO `spawnlist_npc` VALUES ('89907', '', '1', '81306', '32810', '32802', '0', '0', '0', '0', '1005', '0');
INSERT INTO `spawnlist_npc` VALUES ('89908', '', '1', '81306', '32938', '32802', '0', '0', '0', '0', '1005', '0'

INSERT INTO `npc` VALUES (81293, '', '$8422', '$8422', 'L1Dwarf', 1619, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0);
INSERT INTO `npc` VALUES (81294, '', '$8421', '$8421', 'L1Merchant', 1619, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0);
INSERT INTO `npc` VALUES (81292, '', '$4347', '$4347', 'L1Merchant', 7904, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0);
INSERT INTO `npc` VALUES (81279, '', '$1015', '$1015', 'L1Merchant', 1049, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0);
INSERT INTO `npc` VALUES (81281, '', '$7776', '$7776', 'L1Merchant', 1997, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0);
INSERT INTO `npc` VALUES (81280, '', '$7777', '$7777', 'L1Dwarf', 1997, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0);
INSERT INTO `npc` VALUES (81273, '', '$7747', '$7747', 'L1DragonPortal', 7554, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0);
INSERT INTO `npc` VALUES (81274, '', '$7747', '$7747', 'L1DragonPortal', 7548, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0);
INSERT INTO `npc` VALUES (81275, '', '$7747', '$7747', 'L1DragonPortal', 7552, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0);
INSERT INTO `npc` VALUES (81276, '', '$7747', '$7747', 'L1DragonPortal', 7550, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0);
INSERT INTO `npc` VALUES (81277, '', '$7747', '$7747', 'L1DragonPortal', 7585, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0);
INSERT INTO `npc` VALUES (81301, '', '$1116', '$1116', 'L1DragonPortal', 7597, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0);
INSERT INTO `npc` VALUES (81302, '', '$1116', '$1116', 'L1DragonPortal', 7597, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0);
INSERT INTO `npc` VALUES (81303, '', '$1116', '$1116', 'L1DragonPortal', 7597, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0);
INSERT INTO `npc` VALUES (81304, '', '$1116', '$1116', 'L1DragonPortal', 7597, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0);
INSERT INTO `npc` VALUES (81305, '', '$1116', '$1116', 'L1DragonPortal', 7597, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0);
INSERT INTO `npc` VALUES (81306, '', '$1116', '$1116', 'L1DragonPortal', 7597, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0);

-- turtle island spawns + getbackrestart
INSERT INTO `getback_restart` VALUES ('701', 'Turtle Island', '32574', '32941', '0');

INSERT INTO `npc` VALUES ('81315', 'Dread Tom Kidd', 'Dread Tom Kidd', '', 'L1Monster', '2417', '25', '200', '50', '-15', '20', '20', '18', '13', '12', '10', '626', '0', 'small', '1', '0', '0', '320', '880', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'pirate', '1', '-1', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '0', '0', '0', '0');
INSERT INTO `npc` VALUES ('81316', 'Pirate Club', 'Pirate', '', 'L1Monster', '2443', '21', '150', '20', '-10', '18', '18', '16', '12', '10', '9', '442', '0', 'small', '1', '0', '0', '320', '780', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'pirate', '1', '-1', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '0', '0', '0', '0');
INSERT INTO `npc` VALUES ('81317', 'Pirate Axe', 'Pirate', '', 'L1Monster', '2516', '22', '120', '22', '-9', '15', '15', '14', '11', '10', '8', '485', '0', 'small', '1', '0', '0', '320', '780', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'pirate', '0', '-1', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '0', '0', '0', '0');

-- dread tom kidd drops - missing royal nectar and teleport ocean floor scroll they are not on the database.
insert into droplist values (81315,'Dread Tom Kidd',20149,'Bronze Plate Mail',1,1,1000000);
insert into droplist values (81315,'Dread Tom Kidd',120149,'Blessed Bronze Plate Mail',1,1,1100000);
insert into droplist values (81315,'Dread Tom Kidd',20063,'Cloak of Protection',1,1,900000);
insert into droplist values (81315,'Dread Tom Kidd',20229,'Shield of Reflection',1,1,1300000);
insert into droplist values (81315,'Dread Tom Kidd',40013,'Haste Potion',1,1,50000);
insert into droplist values (81315,'Dread Tom Kidd',40016,'Potion of Wisdom',1,1,60000);
insert into droplist values (81315,'Dread Tom Kidd',40051,'High Quality Emerald',1,1,120000);
insert into droplist values (81315,'Dread Tom Kidd',40308,'Adena',85,240,1000000);

-- pirates on turtle island
insert into droplist values (81316,'Pirate',20149,'Bronze Plate Mail',1,1,1300000);
insert into droplist values (81316,'Pirate',20154,'Plate Mail',1,1,1200000);
insert into droplist values (81316,'Pirate',40308,'Adena',55,160,1300000);
insert into droplist values (81316,'Pirate',20063,'Cloak of Protection',1,1,1100000);
insert into droplist values (81316,'Pirate',20162,'Leather Gloves',1,1,800000);
insert into droplist values (81316,'Pirate',20043,'Helmet',1,1,500000);
insert into droplist values (81316,'Pirate',20085,'T-Shirt',1,1,600000);
insert into droplist values (81316,'Pirate',20213,'Low Boots',1,1,400000);
insert into droplist values (81316,'Pirate',20205,'Boots',1,1,500000);
insert into droplist values (81316,'Pirate',40015,'Potion of Mana',1,1,50000);
insert into droplist values (81316,'Pirate',40016,'Potion of Wisdom',1,1,60000);
insert into droplist values (81316,'Pirate',40044,'Diamond',1,1,70000);
insert into droplist values (81316,'Pirate',40045,'Ruby',1,1,60000);
insert into droplist values (81316,'Pirate',40047,'Emerald',1,1,80000);
insert into droplist values (81316,'Pirate',52,'Two Handed Sword',1,1,600000);
insert into droplist values (81316,'Pirate',93,'Trident',1,1,400000);
insert into droplist values (81316,'Pirate',94,'Partisan',1,1,300000);
insert into droplist values (81316,'Pirate',100095,'Lance',1,1,700000);
insert into droplist values (81316,'Pirate',100103,'Halberd',1,1,700000);
insert into droplist values (81317,'Pirate',20149,'Bronze Plate Mail',1,1,1300000);
insert into droplist values (81317,'Pirate',20154,'Plate Mail',1,1,1200000);
insert into droplist values (81317,'Pirate',40308,'Adena',60,170,1300000);
insert into droplist values (81317,'Pirate',20063,'Cloak of Protection',1,1,1100000);
insert into droplist values (81317,'Pirate',20162,'Leather Gloves',1,1,800000);
insert into droplist values (81317,'Pirate',20043,'Helmet',1,1,500000);
insert into droplist values (81317,'Pirate',20085,'T-Shirt',1,1,600000);
insert into droplist values (81317,'Pirate',20213,'Low Boots',1,1,400000);
insert into droplist values (81317,'Pirate',20205,'Boots',1,1,500000);
insert into droplist values (81317,'Pirate',40015,'Potion of Mana',1,1,50000);
insert into droplist values (81317,'Pirate',40016,'Potion of Wisdom',1,1,60000);
insert into droplist values (81317,'Pirate',40044,'Diamond',1,1,70000);
insert into droplist values (81317,'Pirate',40045,'Ruby',1,1,60000);
insert into droplist values (81317,'Pirate',40047,'Emerald',1,1,80000);
insert into droplist values (81317,'Pirate',52,'Two Handed Sword',1,1,600000);
insert into droplist values (81317,'Pirate',93,'Trident',1,1,400000);
insert into droplist values (81317,'Pirate',94,'Partisan',1,1,300000);
insert into droplist values (81317,'Pirate',100095,'Lance',1,1,700000);
insert into droplist values (81317,'Pirate',100103,'Halberd',1,1,700000);

INSERT INTO `spawnlist_boss` VALUES ('212', 'Dread Tom Kidd', 'DreadTomKid', '1', '81315', '0', '32877', '32638', '12', '12', '0', '0', '0', '0', '5', '701', '1', '100', '0', '0', '100');

INSERT INTO `spawnlist` VALUES ('801500710', 'Orc', '1', '45009', '0', '32850', '32794', '12', '12', '0', '0', '0', '0', '6', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500711', 'Orc', '1', '45009', '0', '32846', '32779', '12', '12', '0', '0', '0', '0', '7', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500712', 'Orc Archer', '1', '45019', '0', '32840', '32761', '12', '12', '0', '0', '0', '0', '6', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500713', 'Orc Archer', '1', '45019', '0', '32846', '32780', '12', '12', '0', '0', '0', '0', '5', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500714', 'Rock Golem', '1', '45045', '0', '32848', '32748', '12', '12', '0', '0', '0', '0', '0', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500715', 'Rock Golem', '1', '45045', '0', '32863', '32746', '12', '12', '0', '0', '0', '0', '2', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500716', 'Rock Golem', '1', '45045', '0', '32866', '32722', '12', '12', '0', '0', '0', '0', '0', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500717', 'Rock Golem', '1', '45045', '0', '32854', '32714', '12', '12', '0', '0', '0', '0', '0', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500718', 'Rock Golem', '1', '45045', '0', '32850', '32728', '12', '12', '0', '0', '0', '0', '4', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500719', 'Orc', '1', '45009', '0', '32840', '32720', '12', '12', '0', '0', '0', '0', '0', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500720', 'Orc Fighter', '1', '45082', '0', '32847', '32718', '12', '12', '0', '0', '0', '0', '2', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500721', 'Orc Fighter', '1', '45082', '0', '32842', '32733', '12', '12', '0', '0', '0', '0', '4', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500722', 'Orc Archer', '1', '45019', '0', '32851', '32735', '12', '12', '0', '0', '0', '0', '1', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500723', 'Orc Fighter', '1', '45082', '0', '32845', '32754', '12', '12', '0', '0', '0', '0', '5', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500724', 'Orc Fighter', '1', '45082', '0', '32847', '32771', '12', '12', '0', '0', '0', '0', '4', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500725', 'Orc Archer', '1', '45019', '0', '32841', '32770', '12', '12', '0', '0', '0', '0', '7', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500726', 'Orc Fighter', '1', '45082', '0', '32828', '32762', '12', '12', '0', '0', '0', '0', '7', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500727', 'Crustacean', '1', '45823', '0', '32855', '32758', '12', '12', '0', '0', '0', '0', '4', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500728', 'Crustacean', '1', '45823', '0', '32871', '32738', '12', '12', '0', '0', '0', '0', '0', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500729', 'Crustacean', '1', '45823', '0', '32880', '32704', '12', '12', '0', '0', '0', '0', '0', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500730', 'Turtle Dragon', '1', '45240', '0', '32893', '32685', '12', '12', '0', '0', '0', '0', '1', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500731', 'Turtle Dragon', '1', '45240', '0', '32883', '32681', '12', '12', '0', '0', '0', '0', '4', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500732', 'Turtle Dragon', '1', '45240', '0', '32876', '32713', '12', '12', '0', '0', '0', '0', '4', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500733', 'Turtle Dragon', '1', '45240', '0', '32891', '32723', '12', '12', '0', '0', '0', '0', '2', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500734', 'Crustacean', '1', '45823', '0', '32898', '32726', '12', '12', '0', '0', '0', '0', '2', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500735', 'Turtle Dragon', '1', '45240', '0', '32857', '32766', '12', '12', '0', '0', '0', '0', '4', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500736', 'Bear', '1', '45040', '0', '32856', '32695', '12', '12', '0', '0', '0', '0', '0', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500737', 'Bear', '1', '45040', '0', '32854', '32679', '12', '12', '0', '0', '0', '0', '0', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500738', 'Bear', '1', '45040', '0', '32870', '32668', '12', '12', '0', '0', '0', '0', '2', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500739', 'Bear', '1', '45040', '0', '32861', '32640', '12', '12', '0', '0', '0', '0', '0', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500740', 'Bear', '1', '45040', '0', '32822', '32657', '12', '12', '0', '0', '0', '0', '4', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500741', 'Orc', '1', '45009', '0', '32813', '32659', '12', '12', '0', '0', '0', '0', '6', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500742', 'Orc', '1', '45009', '0', '32807', '32651', '12', '12', '0', '0', '0', '0', '6', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500743', 'Orc Archer', '1', '45019', '0', '32805', '32649', '12', '12', '0', '0', '0', '0', '7', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500744', 'Orc Fighter', '1', '45082', '0', '32802', '32640', '12', '12', '0', '0', '0', '0', '0', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500745', 'Orc Fighter', '1', '45082', '0', '32789', '32642', '12', '12', '0', '0', '0', '0', '6', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500746', 'Bear', '1', '45040', '0', '32789', '32642', '12', '12', '0', '0', '0', '0', '6', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500747', 'Bear', '1', '45040', '0', '32783', '32657', '12', '12', '0', '0', '0', '0', '6', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500748', 'Bear', '1', '45040', '0', '32795', '32671', '12', '12', '0', '0', '0', '0', '4', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500749', 'Orc', '1', '45009', '0', '32794', '32684', '12', '12', '0', '0', '0', '0', '4', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500750', 'Orc', '1', '45009', '0', '32795', '32688', '12', '12', '0', '0', '0', '0', '4', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500751', 'Orc Archer', '1', '45019', '0', '32786', '32684', '12', '12', '0', '0', '0', '0', '6', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500752', 'Orc Archer', '1', '45019', '0', '32786', '32684', '12', '12', '0', '0', '0', '0', '6', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500753', 'Orc Fighter', '1', '45082', '0', '32786', '32684', '12', '12', '0', '0', '0', '0', '6', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500754', 'Bear', '1', '45040', '0', '32778', '32699', '12', '12', '0', '0', '0', '0', '5', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500755', 'Bear', '1', '45040', '0', '32794', '32711', '12', '12', '0', '0', '0', '0', '3', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500756', 'Orc', '1', '45009', '0', '32710', '32716', '12', '12', '0', '0', '0', '0', '4', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500757', 'Orc', '1', '45009', '0', '32710', '32716', '12', '12', '0', '0', '0', '0', '4', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500758', 'Orc Fighter', '1', '45082', '0', '32710', '32716', '12', '12', '0', '0', '0', '0', '4', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500759', 'Orc Fighter', '1', '45082', '0', '32705', '32721', '12', '12', '0', '0', '0', '0', '5', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500760', 'Orc Archer', '1', '45019', '0', '32702', '32716', '12', '12', '0', '0', '0', '0', '0', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500761', 'Orc Archer', '1', '45019', '0', '32702', '32716', '12', '12', '0', '0', '0', '0', '0', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500762', 'Goblin', '1', '45008', '0', '32792', '32718', '12', '12', '0', '0', '0', '0', '4', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500763', 'Goblin', '1', '45008', '0', '32798', '32704', '12', '12', '0', '0', '0', '0', '0', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500764', 'Goblin', '1', '45008', '0', '32785', '32699', '12', '12', '0', '0', '0', '0', '6', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500765', 'Goblin', '1', '45008', '0', '32796', '32675', '12', '12', '0', '0', '0', '0', '0', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500766', 'Goblin', '1', '45008', '0', '32784', '32661', '12', '12', '0', '0', '0', '0', '7', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500767', 'Goblin', '1', '45008', '0', '32790', '32642', '12', '12', '0', '0', '0', '0', '0', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500768', 'Eidlon', '1', '45027', '0', '32790', '32642', '12', '12', '0', '0', '0', '0', '0', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500769', 'Eidlon', '1', '45027', '0', '32800', '32634', '12', '12', '0', '0', '0', '0', '0', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500770', 'Eidlon', '1', '45027', '0', '32817', '32633', '12', '12', '0', '0', '0', '0', '1', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500771', 'Eidlon', '1', '45027', '0', '32828', '32621', '12', '12', '0', '0', '0', '0', '0', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500772', 'Eidlon', '1', '45027', '0', '32830', '32625', '12', '12', '0', '0', '0', '0', '4', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500773', 'Dwarf', '1', '45041', '0', '32836', '32627', '12', '12', '0', '0', '0', '0', '0', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500774', 'Dwarf', '1', '45041', '0', '32825', '32618', '12', '12', '0', '0', '0', '0', '7', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500775', 'Dwarf', '1', '45041', '0', '32806', '32618', '12', '12', '0', '0', '0', '0', '6', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500776', 'Dwarf', '1', '45041', '0', '32829', '32641', '12', '12', '0', '0', '0', '0', '2', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500777', 'Dwarf', '1', '45041', '0', '32851', '32660', '12', '12', '0', '0', '0', '0', '2', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500778', 'Dwarf', '1', '45041', '0', '32862', '32670', '12', '12', '0', '0', '0', '0', '2', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500779', 'Dwarf', '1', '45041', '0', '32874', '32686', '12', '12', '0', '0', '0', '0', '2', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500780', 'Dwarf', '1', '45041', '0', '32860', '32693', '12', '12', '0', '0', '0', '0', '6', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500781', 'Rock Golem', '1', '45045', '0', '32851', '32680', '12', '12', '0', '0', '0', '0', '0', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500782', 'Rock Golem', '1', '45045', '0', '32835', '32671', '12', '12', '0', '0', '0', '0', '6', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500783', 'Ghast', '1', '45213', '0', '32835', '32671', '12', '12', '0', '0', '0', '0', '6', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500784', 'Ghast', '1', '45213', '0', '32842', '32651', '12', '12', '0', '0', '0', '0', '0', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500785', 'Ghast', '1', '45213', '0', '32854', '32629', '12', '12', '0', '0', '0', '0', '0', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500786', 'Ghast', '1', '45213', '0', '32871', '32624', '12', '12', '0', '0', '0', '0', '2', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500787', 'Ghast', '1', '45213', '0', '32882', '32640', '12', '12', '0', '0', '0', '0', '4', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500788', 'Ogre', '1', '45278', '0', '32894', '32624', '12', '12', '0', '0', '0', '0', '0', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500789', 'Ogre', '1', '45278', '0', '32848', '32648', '12', '12', '0', '0', '0', '0', '6', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500790', 'Ogre', '1', '45278', '0', '32823', '32678', '12', '12', '0', '0', '0', '0', '4', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500793', 'Alligator', '1', '45307', '0', '32858', '32737', '12', '12', '0', '0', '0', '0', '6', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500794', 'Alligator', '1', '45307', '0', '32859', '32721', '12', '12', '0', '0', '0', '0', '0', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500795', 'Alligator', '1', '45307', '0', '32853', '32710', '12', '12', '0', '0', '0', '0', '7', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500796', 'Alligator', '1', '45307', '0', '32867', '32700', '12', '12', '0', '0', '0', '0', '2', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500797', 'Alligator', '1', '45307', '0', '32874', '32677', '12', '12', '0', '0', '0', '0', '0', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500798', 'Alligator', '1', '45307', '0', '32877', '32662', '12', '12', '0', '0', '0', '0', '0', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500799', 'Orc Wizard', '1', '45121', '0', '32875', '32655', '12', '12', '0', '0', '0', '0', '0', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500800', 'Orc Wizard', '1', '45121', '0', '32842', '32638', '12', '12', '0', '0', '0', '0', '5', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500801', 'Orc Wizard', '1', '45121', '0', '32803', '32639', '12', '12', '0', '0', '0', '0', '6', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500802', 'Orc Wizard', '1', '45121', '0', '32792', '32634', '12', '12', '0', '0', '0', '0', '6', '60', '120', '701', '0', '0', '0', '0');
INSERT INTO `spawnlist` VALUES ('801500803', 'Orc Wizard', '1', '45121', '0', '32777', '32649', '12', '12', '0', '0', '0', '0', '6', '60', '120', '701', '0', '0', '0', '0');

-- some missing fieldobjects
INSERT INTO `npc` VALUES (81307, 'FafurionStarGate', '', '', 'L1FieldObject', 1758, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0);
INSERT INTO `npc` VALUES (81308, 'SeaHorse', 'SeaHorse', '', 'L1Npc', 1584, 1, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'small', 0, 0, 0, 840, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0);
INSERT INTO `npc` VALUES (81310, 'seabra fishgroup', '', '', 'L1Npc', 1634, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'small', 0, 0, 0, 840, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0);
INSERT INTO `npc` VALUES (81311, 'yellow fishgroup', '', '', 'L1Npc', 1640, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'small', 0, 0, 0, 840, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0);
INSERT INTO `npc` VALUES (81312, 'blue fishgroup', '', '', 'L1Npc', 1653, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'small', 0, 0, 0, 840, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0);
INSERT INTO `npc` VALUES (81313, 'blueorange fishgroup', '', '', 'L1Npc', 1655, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'small', 0, 0, 0, 840, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0);
INSERT INTO `npc` VALUES (81314, 'bluered fishgroup', '', '', 'L1Npc', 1657, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'small', 0, 0, 0, 840, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0);

-- elvenforrest butterflys
INSERT INTO `spawnlist_npc` VALUES ('1900036', 'butterfly', '1', '71262', '33013', '32373', '0', '0', '4', '0', '4', '0');
INSERT INTO `spawnlist_npc` VALUES ('1900037', 'butterfly', '1', '71263', '33038', '32382', '0', '0', '2', '0', '4', '0');
INSERT INTO `spawnlist_npc` VALUES ('1900038', 'butterfly', '1', '71262', '33055', '32389', '0', '0', '0', '0', '4', '0');
INSERT INTO `spawnlist_npc` VALUES ('1900039', 'butterfly', '1', '71263', '33067', '32372', '0', '0', '0', '0', '4', '0');
INSERT INTO `spawnlist_npc` VALUES ('1900040', 'butterfly', '1', '71262', '33090', '32314', '0', '0', '4', '0', '4', '0');
INSERT INTO `spawnlist_npc` VALUES ('1900041', 'butterfly', '1', '71263', '33127', '32327', '0', '0', '5', '0', '4', '0');
INSERT INTO `spawnlist_npc` VALUES ('1900042', 'butterfly', '1', '71262', '33131', '32332', '0', '0', '4', '0', '4', '0');
INSERT INTO `spawnlist_npc` VALUES ('1900043', 'butterfly', '1', '71263', '33010', '32312', '0', '0', '6', '0', '4', '0');
INSERT INTO `spawnlist_npc` VALUES ('1900044', 'butterfly', '1', '71262', '33009', '32320', '0', '0', '4', '0', '4', '0');

-- fafurion gate star
INSERT INTO `spawnlist_npc` VALUES ('1900055', 'FafurionStarGate', '1', '81307', '32734', '32679', '0', '0', '0', '0', '63', '0');

-- kingdom of eva fishes and seahorses.
INSERT INTO `spawnlist_npc` VALUES ('1900056', 'SeaHorse', '1', '81308', '32745', '32699', '5', '5', '1', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900057', 'SeaHorse', '1', '81308', '32747', '32720', '5', '5', '5', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900058', 'seabra fishgroup', '1', '81310', '32739', '32717', '5', '5', '6', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900059', 'yellow fishgroup', '1', '81311', '32727', '32720', '5', '5', '6', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900060', 'blue fishgroup', '1', '81312', '32732', '32702', '5', '5', '0', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900061', 'blueorange fishgroup', '1', '81313', '32711', '32702', '5', '5', '6', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900062', 'bluered fishgroup', '1', '81314', '32701', '32694', '5', '5', '6', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900063', 'yellow fishgroup', '1', '81311', '32711', '32682', '5', '5', '0', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900064', 'blue fishgroup', '1', '81312', '32719', '32684', '5', '5', '2', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900065', 'blueorange fishgroup', '1', '81313', '32724', '32699', '5', '5', '4', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900066', 'bluered fishgroup', '1', '81314', '32740', '32737', '5', '5', '4', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900067', 'blue fishgroup', '1', '81312', '32752', '32746', '5', '5', '3', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900068', 'yellow fishgroup', '1', '81311', '32775', '32740', '5', '5', '2', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900069', 'seabra fishgroup', '1', '81310', '32780', '32731', '5', '5', '0', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900070', 'seabra fishgroup', '1', '81310', '32796', '32738', '5', '5', '2', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900071', 'yellow fishgroup', '1', '81311', '32800', '32740', '5', '5', '2', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900072', 'blue fishgroup', '1', '81312', '32802', '32751', '5', '5', '4', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900073', 'blueorange fishgroup', '1', '81313', '32809', '32766', '5', '5', '4', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900074', 'bluered fishgroup', '1', '81314', '32808', '32766', '5', '5', '6', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900075', 'yellow fishgroup', '1', '81311', '32802', '32782', '5', '5', '4', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900076', 'blueorange fishgroup', '1', '81313', '32813', '32791', '5', '5', '2', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900077', 'bluered fishgroup', '1', '81314', '32786', '32813', '5', '5', '4', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900078', 'seabra fishgroup', '1', '81310', '32777', '32818', '5', '5', '5', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900079', 'SeaHorse', '1', '81308', '32781', '32816', '5', '5', '0', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900080', 'SeaHorse', '1', '81308', '32767', '32816', '5', '5', '5', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900081', 'SeaHorse', '1', '81308', '32761', '32802', '5', '5', '0', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900082', 'SeaHorse', '1', '81308', '32744', '32788', '5', '5', '6', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900084', 'SeaHorse', '1', '81308', '32734', '32759', '5', '5', '0', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900085', 'seabra fishgroup', '1', '81310', '32734', '32759', '5', '5', '0', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900086', 'blue fishgroup', '1', '81312', '32741', '32756', '5', '5', '2', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900087', 'SeaHorse', '1', '81308', '32738', '32745', '5', '5', '0', '0', '63', '100');
INSERT INTO `spawnlist_npc` VALUES ('1900088', 'SeaHorse', '1', '81308', '32739', '32729', '5', '5', '1', '0', '63', '100');

-- some gmcommands
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

-- ----------------------------
-- Table structure for checkwartime
-- ----------------------------
CREATE TABLE `checkwartime` (
  `castle_id` int(12) NOT NULL auto_increment,
  `name` varchar(45) default NULL,
  `isActive` int(1) NOT NULL default '1',
  PRIMARY KEY  (`castle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO `checkwartime` VALUES ('1', 'Kent Castle', '0');
INSERT INTO `checkwartime` VALUES ('2', 'Orc Castle', '0');
INSERT INTO `checkwartime` VALUES ('3', 'Windawood Castle', '0');
INSERT INTO `checkwartime` VALUES ('4', 'Giran Castle', '0');
INSERT INTO `checkwartime` VALUES ('5', 'Heine Castle', '0');
INSERT INTO `checkwartime` VALUES ('6', 'Dwarf Castle', '0');
INSERT INTO `checkwartime` VALUES ('7', 'Aden Castle', '0');
INSERT INTO `checkwartime` VALUES ('8', 'Diad Fortress', '0');

-- missing auctions added
INSERT INTO `board_auction` VALUES ('458753', 'Aden House 1', '51', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458754', 'Aden House 2', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458755', 'Aden House 3', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458756', 'Aden House 4', '56', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458757', 'Aden House 5', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458758', 'Aden House 6', '63', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458759', 'Aden House 7', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458760', 'Aden House 8', '63', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458761', 'Aden House 9', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458762', 'Aden House 10', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458763', 'Aden House 11', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458764', 'Aden House 12', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458765', 'Aden House 13', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458766', 'Aden House 14', '63', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458767', 'Aden House 15', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458768', 'Aden House 16', '56', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458769', 'Aden House 17', '63', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458770', 'Aden House 18', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458771', 'Aden House 19', '32', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458772', 'Aden House 20', '64', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458773', 'Aden House 21', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458774', 'Aden House 22', '20', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458775', 'Aden House 23', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458776', 'Aden House 24', '56', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458777', 'Aden House 25', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458778', 'Aden House 26', '20', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458779', 'Aden House 27', '42', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458780', 'Aden House 28', '15', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458781', 'Aden House 29', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458782', 'Aden House 30', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458783', 'Aden House 31', '42', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458784', 'Aden House 32', '48', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458785', 'Aden House 33', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458786', 'Aden House 34', '15', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458787', 'Aden House 35', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458788', 'Aden House 36', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458789', 'Aden House 37', '64', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458790', 'Aden House 38', '15', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458791', 'Aden House 39', '15', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458792', 'Aden House 40', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458793', 'Aden House 41', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458794', 'Aden House 42', '29', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458795', 'Aden House 43', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458796', 'Aden House 44', '15', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458797', 'Aden House 45', '56', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458798', 'Aden House 46', '15', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458799', 'Aden House 47', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458800', 'Aden House 48', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458801', 'Aden House 49', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458802', 'Aden House 50', '48', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458803', 'Aden House 51', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458804', 'Aden House 52', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458805', 'Aden House 53', '54', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458806', 'Aden House 54', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458807', 'Aden House 55', '63', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458808', 'Aden House 56', '63', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458809', 'Aden House 57', '42', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458810', 'Aden House 58', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458811', 'Aden House 59', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458812', 'Aden House 60', '63', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458813', 'Aden House 61', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458814', 'Aden House 62', '21', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458815', 'Aden House 63', '63', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458816', 'Aden House 64', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458817', 'Aden House 65', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458818', 'Aden House 66', '48', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('458819', 'Aden House 67', '24', '2010-10-28 23:00:00', '100000', 'Aden', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262166', 'Giran House 22', '120', '2010-10-28 23:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262170', 'Giran House 26', '120', '2010-10-28 23:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262179', 'Giran House 35', '120', '2010-10-28 23:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262180', 'Giran House 36', '45', '2010-10-28 23:00:00', '100000', 'Giran', '', '0', '', '0');
INSERT INTO `board_auction` VALUES ('262188', 'Giran House 44', '120', '2010-10-28 23:00:00', '100000', 'Giran', '', '0', '', '0');

-- ----------------------------
-- Table structure for `logclanwarehousein`
-- ----------------------------
DROP TABLE IF EXISTS `logclanwarehousein`;
CREATE TABLE `logclanwarehousein` (
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Ip` varchar(255) DEFAULT NULL,
  `Account` varchar(255) DEFAULT NULL,
  `CharId` int(11) DEFAULT NULL,
  `CharName` varchar(255) DEFAULT NULL,
  `ClanId` int(11) DEFAULT NULL,
  `ClanName` varchar(255) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ItemName` varchar(255) DEFAULT NULL,
  `EnchantLevel` int(11) DEFAULT NULL,
  `ItemCountBefore` int(11) DEFAULT NULL,
  `ItemCountAfter` int(11) DEFAULT NULL,
  `ItemCountDiff` int(11) DEFAULT NULL,
  `ItemCount` int(11) DEFAULT NULL,
  `InCount` int(11) DEFAULT NULL,
  `CountDiff` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `logclanwarehouseOut`
-- ----------------------------
DROP TABLE IF EXISTS `logclanwarehouseOut`;
CREATE TABLE `logclanwarehouseOut` (
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Ip` varchar(255) DEFAULT NULL,
  `Account` varchar(255) DEFAULT NULL,
  `CharId` int(11) DEFAULT NULL,
  `CharName` varchar(255) DEFAULT NULL,
  `ClanId` int(11) DEFAULT NULL,
  `ClanName` varchar(255) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ItemName` varchar(255) DEFAULT NULL,
  `EnchantLevel` int(11) DEFAULT NULL,
  `ItemCountBefore` int(11) DEFAULT NULL,
  `ItemCountAfter` int(11) DEFAULT NULL,
  `ItemCountDiff` int(11) DEFAULT NULL,
  `ItemCount` int(11) DEFAULT NULL,
  `InCount` int(11) DEFAULT NULL,
  `CountDiff` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `LogDeleteChar`
-- ----------------------------
DROP TABLE IF EXISTS `LogDeleteChar`;
CREATE TABLE `LogDeleteChar` (
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Ip` varchar(255) DEFAULT NULL,
  `Account` varchar(255) DEFAULT NULL,
  `CharId` int(11) DEFAULT NULL,
  `CharName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `LogDeleteItem`
-- ----------------------------
DROP TABLE IF EXISTS `LogDeleteItem`;
CREATE TABLE `LogDeleteItem` (
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Ip` varchar(255) DEFAULT NULL,
  `Account` varchar(255) DEFAULT NULL,
  `CharId` int(11) DEFAULT NULL,
  `CharName` varchar(255) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ItemName` varchar(255) DEFAULT NULL,
  `EnchantLevel` int(11) DEFAULT NULL,
  `ItemCount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `LogDropItem`
-- ----------------------------
DROP TABLE IF EXISTS `LogDropItem`;
CREATE TABLE `LogDropItem` (
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Ip` varchar(255) DEFAULT NULL,
  `Account` varchar(255) DEFAULT NULL,
  `CharId` int(11) DEFAULT NULL,
  `CharName` varchar(255) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ItemName` varchar(255) DEFAULT NULL,
  `EnchantLevel` int(11) DEFAULT NULL,
  `BeforeInven` int(11) DEFAULT NULL,
  `AfterInven` int(11) DEFAULT NULL,
  `BeforeGround` int(11) DEFAULT NULL,
  `AfterGround` int(11) DEFAULT NULL,
  `Count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
		
-- ----------------------------
-- Table structure for `LogElfWareHouseIn`
-- ----------------------------
DROP TABLE IF EXISTS `LogElfWareHouseIn`;
CREATE TABLE `LogElfWareHouseIn` (
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Ip` varchar(255) DEFAULT NULL,
  `Account` varchar(255) DEFAULT NULL,
  `CharId` int(11) DEFAULT NULL,
  `CharName` varchar(255) DEFAULT NULL,
  `ClanId` int(11) DEFAULT NULL,
  `ClanName` varchar(255) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ItemName` varchar(255) DEFAULT NULL,
  `EnchantLevel` int(11) DEFAULT NULL,
  `ItemCountBefore` int(11) DEFAULT NULL,
  `ItemCountAfter` int(11) DEFAULT NULL,
  `ItemCountDiff` int(11) DEFAULT NULL,
  `ItemCount` int(11) DEFAULT NULL,
  `InCount` int(11) DEFAULT NULL,
  `CountDiff` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `LogElfWareHouseOut`
-- ----------------------------
DROP TABLE IF EXISTS `LogElfWareHouseOut`;
CREATE TABLE `LogElfWareHouseOut` (
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Ip` varchar(255) DEFAULT NULL,
  `Account` varchar(255) DEFAULT NULL,
  `CharId` int(11) DEFAULT NULL,
  `CharName` varchar(255) DEFAULT NULL,
  `ClanId` int(11) DEFAULT NULL,
  `ClanName` varchar(255) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ItemName` varchar(255) DEFAULT NULL,
  `EnchantLevel` int(11) DEFAULT NULL,
  `ItemCountBefore` int(11) DEFAULT NULL,
  `ItemCountAfter` int(11) DEFAULT NULL,
  `ItemCountDiff` int(11) DEFAULT NULL,
  `ItemCount` int(11) DEFAULT NULL,
  `InCount` int(11) DEFAULT NULL,
  `CountDiff` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `LogEnchantFail`
-- ----------------------------
DROP TABLE IF EXISTS `LogEnchantFail`;
CREATE TABLE `LogEnchantFail` (
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Ip` varchar(255) DEFAULT NULL,
  `Account` varchar(255) DEFAULT NULL,
  `CharId` int(11) DEFAULT NULL,
  `CharName` varchar(255) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ItemName` varchar(255) DEFAULT NULL,
  `EnchantLevel` int(11) DEFAULT NULL,
  `ItemCount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `LogEnchantSuccess`
-- ----------------------------
DROP TABLE IF EXISTS `LogEnchantSuccess`;
CREATE TABLE `LogEnchantSuccess` (
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Ip` varchar(255) DEFAULT NULL,
  `Account` varchar(255) DEFAULT NULL,
  `CharId` int(11) DEFAULT NULL,
  `CharName` varchar(255) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ItemName` varchar(255) DEFAULT NULL,
  `ItemCount` int(11) DEFAULT NULL,
  `EnchantBefore` int(11) DEFAULT NULL,
  `EnchantAfter` int(11) DEFAULT NULL,
  `EnchantDiff` int(11) DEFAULT NULL,
  `EnchantNum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `LogPickUpItem`
-- ----------------------------
DROP TABLE IF EXISTS `LogPickUpItem`;
CREATE TABLE `LogPickUpItem` (
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Ip` varchar(255) DEFAULT NULL,
  `Account` varchar(255) DEFAULT NULL,
  `CharId` int(11) DEFAULT NULL,
  `CharName` varchar(255) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ItemName` varchar(255) DEFAULT NULL,
  `EnchantLevel` int(11) DEFAULT NULL,
  `BeforeInven` int(11) DEFAULT NULL,
  `AfterInven` int(11) DEFAULT NULL,
  `BeforeGround` int(11) DEFAULT NULL,
  `AfterGround` int(11) DEFAULT NULL,
  `PickupCount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `LogPrivateShopBuy`
-- ----------------------------
DROP TABLE IF EXISTS `LogPrivateShopBuy`;
CREATE TABLE `LogPrivateShopBuy` (
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Ip` varchar(255) DEFAULT NULL,
  `Account` varchar(255) DEFAULT NULL,
  `CharId` int(11) DEFAULT NULL,
  `CharName` varchar(255) DEFAULT NULL,
  `TargetIp` varchar(255) DEFAULT NULL,
  `TargetAccount` varchar(255) DEFAULT NULL,
  `TargetCharId` int(11) DEFAULT NULL,
  `TargetCharName` varchar(255) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ItemName` varchar(255) DEFAULT NULL,
  `EnchantLevel` int(11) DEFAULT NULL,
  `ItemCount` int(11) DEFAULT NULL,
  `ItemBefore` int(11) DEFAULT NULL,
  `ItemAfter` int(11) DEFAULT NULL,
  `ItemDiff` int(11) DEFAULT NULL,
  `BuyCount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `LogPrivateShopSell`
-- ----------------------------
DROP TABLE IF EXISTS `LogPrivateShopSell`;
CREATE TABLE `LogPrivateShopSell` (
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Ip` varchar(255) DEFAULT NULL,
  `Account` varchar(255) DEFAULT NULL,
  `CharId` int(11) DEFAULT NULL,
  `CharName` varchar(255) DEFAULT NULL,
  `TargetIp` varchar(255) DEFAULT NULL,
  `TargetAccount` varchar(255) DEFAULT NULL,
  `TargetCharId` int(11) DEFAULT NULL,
  `TargetCharName` varchar(255) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ItemName` varchar(255) DEFAULT NULL,
  `EnchantLevel` int(11) DEFAULT NULL,
  `ItemCount` int(11) DEFAULT NULL,
  `ItemBefore` int(11) DEFAULT NULL,
  `ItemAfter` int(11) DEFAULT NULL,
  `ItemDiff` int(11) DEFAULT NULL,
  `SellCount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `LogShopBuy`
-- ----------------------------
DROP TABLE IF EXISTS `LogShopBuy`;
CREATE TABLE `LogShopBuy` (
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Ip` varchar(255) DEFAULT NULL,
  `Account` varchar(255) DEFAULT NULL,
  `CharId` int(11) DEFAULT NULL,
  `CharName` varchar(255) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ItemName` varchar(255) DEFAULT NULL,
  `EnchantLevel` int(11) DEFAULT NULL,
  `ItemCount` int(11) DEFAULT NULL,
  `AdenaBefore` int(11) DEFAULT NULL,
  `AdenaAfter` int(11) DEFAULT NULL,
  `AdenaDiff` int(11) DEFAULT NULL,
  `BuyPrice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `LogShopSell`
-- ----------------------------
DROP TABLE IF EXISTS `LogShopSell`;
CREATE TABLE `LogShopSell` (
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Ip` varchar(255) DEFAULT NULL,
  `Account` varchar(255) DEFAULT NULL,
  `CharId` int(11) DEFAULT NULL,
  `CharName` varchar(255) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ItemName` varchar(255) DEFAULT NULL,
  `EnchantLevel` int(11) DEFAULT NULL,
  `ItemCount` int(11) DEFAULT NULL,
  `AdenaBefore` int(11) DEFAULT NULL,
  `AdenaAfter` int(11) DEFAULT NULL,
  `AdenaDiff` int(11) DEFAULT NULL,
  `SellPrice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `LogSpeedHack`
-- ----------------------------
DROP TABLE IF EXISTS `LogSpeedHack`;
CREATE TABLE `LogSpeedHack` (
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Ip` varchar(255) DEFAULT NULL,
  `Account` varchar(255) DEFAULT NULL,
  `CharId` int(11) DEFAULT NULL,
  `CharName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
-- ----------------------------
-- Table structure for `LogStatusUp`
-- ----------------------------
DROP TABLE IF EXISTS `LogStatusUp`;
CREATE TABLE `LogStatusUp` (
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Ip` varchar(255) DEFAULT NULL,
  `Account` varchar(255) DEFAULT NULL,
  `CharId` int(11) DEFAULT NULL,
  `CharName` varchar(255) DEFAULT NULL,
  `Level` int(11) DEFAULT NULL,
  `Str` int(11) DEFAULT NULL,
  `BaseStr` int(11) DEFAULT NULL,
  `Dex` int(11) DEFAULT NULL,
  `BaseDex` int(11) DEFAULT NULL,
  `Con` int(11) DEFAULT NULL,
  `BaseCon` int(11) DEFAULT NULL,
  `Int` int(11) DEFAULT NULL,
  `BaseInt` int(11) DEFAULT NULL,
  `Wis` int(11) DEFAULT NULL,
  `BaseWis` int(11) DEFAULT NULL,
  `Cha` int(11) DEFAULT NULL,
  `BaseCha` int(11) DEFAULT NULL,
  `SorceStat` int(11) DEFAULT NULL,
  `BonusStats` int(11) DEFAULT NULL,
  `AllStats` int(11) DEFAULT NULL,
  `DiffSc` int(11) DEFAULT NULL,
  `DiffSr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `LogTradeAddItem`
-- ----------------------------
DROP TABLE IF EXISTS `LogTradeAddItem`;
CREATE TABLE `LogTradeAddItem` (
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Ip` varchar(255) DEFAULT NULL,
  `Account` varchar(255) DEFAULT NULL,
  `CharId` int(11) DEFAULT NULL,
  `CharName` varchar(255) DEFAULT NULL,
  `TargetIp` varchar(255) DEFAULT NULL,
  `TargetAccount` varchar(255) DEFAULT NULL,
  `TargetCharId` int(11) DEFAULT NULL,
  `TargetCharName` varchar(255) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ItemName` varchar(255) DEFAULT NULL,
  `EnchantLevel` int(11) DEFAULT NULL,
  `ItemCount` int(11) DEFAULT NULL,
  `ItemBefore` int(11) DEFAULT NULL,
  `ItemAfter` int(11) DEFAULT NULL,
  `ItemDiff` int(11) DEFAULT NULL,
  `TradeCount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `LogTradeBugItem`
-- ----------------------------
DROP TABLE IF EXISTS `LogTradeBugItem`;
CREATE TABLE `LogTradeBugItem` (
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Ip` varchar(255) DEFAULT NULL,
  `Account` varchar(255) DEFAULT NULL,
  `CharId` int(11) DEFAULT NULL,
  `CharName` varchar(255) DEFAULT NULL,
  `TargetIp` varchar(255) DEFAULT NULL,
  `TargetAccount` varchar(255) DEFAULT NULL,
  `TargetCharId` int(11) DEFAULT NULL,
  `TargetCharName` varchar(255) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ItemName` varchar(255) DEFAULT NULL,
  `EnchantLevel` int(11) DEFAULT NULL,
  `ItemCount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `LogTradeComplete`
-- ----------------------------
DROP TABLE IF EXISTS `LogTradeComplete`;
CREATE TABLE `LogTradeComplete` (
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Ip` varchar(255) DEFAULT NULL,
  `Account` varchar(255) DEFAULT NULL,
  `CharId` int(11) DEFAULT NULL,
  `CharName` varchar(255) DEFAULT NULL,
  `TargetIp` varchar(255) DEFAULT NULL,
  `TargetAccount` varchar(255) DEFAULT NULL,
  `TargetCharId` int(11) DEFAULT NULL,
  `TargetCharName` varchar(255) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ItemName` varchar(255) DEFAULT NULL,
  `EnchantLevel` int(11) DEFAULT NULL,
  `ItemCount` int(11) DEFAULT NULL,
  `ItemBeforeTrade` int(11) DEFAULT NULL,
  `ItemBeforeInven` int(11) DEFAULT NULL,
  `ItemAfter` int(11) DEFAULT NULL,
  `ItemDiff` int(11) DEFAULT NULL,
  `TradeCount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `LogWareHouseIn`
-- ----------------------------
DROP TABLE IF EXISTS `LogWareHouseIn`;
CREATE TABLE `LogWareHouseIn` (
  `Account` varchar(255) DEFAULT NULL,
  `Ip` varchar(255) DEFAULT NULL,
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `CharId` int(11) DEFAULT NULL,
  `CharName` varchar(255) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ItemName` varchar(255) DEFAULT NULL,
  `EnchantLevel` int(11) DEFAULT NULL,
  `ItemCountBefore` int(11) DEFAULT NULL,
  `ItemCountAfter` int(11) DEFAULT NULL,
  `ItemCountDiff` int(11) DEFAULT NULL,
  `ItemCount` int(11) DEFAULT NULL,
  `InCount` int(11) DEFAULT NULL,
  `CountDiff` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `LogWareHouseOut`
-- ----------------------------
DROP TABLE IF EXISTS `LogWareHouseOut`;
CREATE TABLE `LogWareHouseOut` (
  `Account` varchar(255) DEFAULT NULL,
  `Ip` varchar(255) DEFAULT NULL,
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `CharId` int(11) DEFAULT NULL,
  `CharName` varchar(255) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ItemName` varchar(255) DEFAULT NULL,
  `EnchantLevel` int(11) DEFAULT NULL,
  `ItemCountBefore` int(11) DEFAULT NULL,
  `ItemCountAfter` int(11) DEFAULT NULL,
  `ItemCountDiff` int(11) DEFAULT NULL,
  `ItemCount` int(11) DEFAULT NULL,
  `OutCount` int(11) DEFAULT NULL,
  `CountDiff` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `BotReport`
-- ----------------------------
DROP TABLE IF EXISTS `BotReport`;
CREATE TABLE `BotReport` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `charname` varchar(45) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- stone effect spell fixes.
INSERT INTO `mobskill` VALUES ('45760', '0', 'Floating Eye', null, '2', '50', '0', '0', '-3', '0', '0', '3', '0', '0', '60', '12002', '0', '18', '0', '0', '0', '0');
INSERT INTO `mobskill` VALUES ('45068', '0', 'Floating Eye', null, '2', '50', '0', '0', '-3', '0', '0', '3', '0', '0', '60', '12002', '0', '18', '0', '0', '0', '0');
INSERT INTO `mobskill` VALUES ('45349', '0', 'Beholder', null, '2', '50', '0', '0', '-3', '0', '0', '3', '0', '0', '60', '12003', '0', '18', '0', '0', '0', '0');
INSERT INTO `mobskill` VALUES ('45406', '0', 'Wicked Beholder', null, '2', '50', '0', '0', '-3', '0', '0', '3', '0', '0', '60', '12003', '0', '18', '0', '0', '0', '0');
INSERT INTO `mobskill` VALUES ('45423', '0', 'Subterranean Beholder', null, '2', '50', '0', '0', '-3', '0', '0', '3', '0', '0', '60', '12003', '0', '18', '0', '0', '0', '0');
INSERT INTO `mobskill` VALUES ('45086', '0', 'Degenerated Beholder', null, '2', '50', '0', '0', '-3', '0', '0', '3', '0', '0', '60', '12003', '0', '18', '0', '0', '0', '0');

INSERT INTO `skills` VALUES ('12002', 'Floating Eye Attack', '0', '0', '10', '0', '0', '0', '0', '0', 'attack', '3', '50', '5', '5', '0', '0', '0', '64', '0', '2', '0', '0', '0', '0', '19', '0', '0', '0', '0', '0');
INSERT INTO `skills` VALUES ('12003', 'Beholder Attack', '0', '0', '10', '0', '0', '0', '0', '0', 'attack', '3', '50', '5', '5', '0', '0', '0', '64', '0', '2', '0', '0', '0', '0', '19', '0', '0', '0', '0', '0');

-- pvp deathmatch fix for not using skills and items.
INSERT INTO `mapids` VALUES ('5153', 'Death Match', '32576', '32703', '32832', '32959', '0', '0', '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', '1');

-- npc Jode at gypsy town fix.
INSERT INTO `shop` VALUES ('70056', null, '37', null, '1', '80000', '0', '-1', null);
INSERT INTO `shop` VALUES ('70056', null, '148', null, '2', '88000', '0', '-1', null);
INSERT INTO `shop` VALUES ('70056', null, '100041', null, '3', '95000', '0', '-1', null);
INSERT INTO `shop` VALUES ('70056', null, '100102', null, '4', '85000', '0', '-1', null);
INSERT INTO `shop` VALUES ('70056', null, '142', null, '5', '83000', '0', '-1', null);
INSERT INTO `shop` VALUES ('70056', null, '100025', null, '6', '77000', '0', '-1', null);
INSERT INTO `shop` VALUES ('70056', null, '20101', null, '7', '84000', '0', '-1', null);
INSERT INTO `shop` VALUES ('70056', null, '20154', null, '8', '98000', '0', '-1', null);
INSERT INTO `shop` VALUES ('70056', null, '20229', null, '9', '78000', '0', '-1', null);
INSERT INTO `shop` VALUES ('70056', null, '20036', null, '10', '69000', '0', '-1', null);

-- mp hpr interval fixes

-- standard hp mp interval.
update npc set hprinterval = 3000;
update npc set hpr = 12;
update npc set mprinterval = 2000;
update npc set mpr = 8;

-- normal monsters --
update npc set hprinterval = 2000 where npcid = 45005;
update npc set hpr = 2 where npcid = 45005;
update npc set hprinterval = 2000 where npcid = 45006;
update npc set hpr = 2 where npcid = 45006;
update npc set hprinterval = 2000 where npcid = 45008;
update npc set hpr = 2 where npcid = 45008;
update npc set hprinterval = 2000 where npcid = 45009;
update npc set hpr = 2 where npcid = 45009;
update npc set hprinterval = 2000 where npcid = 45010;
update npc set hpr = 2 where npcid = 45010;
update npc set hprinterval = 2000 where npcid = 45011;
update npc set hpr = 2 where npcid = 45011;
update npc set hprinterval = 2000 where npcid = 45012;
update npc set hpr = 2 where npcid = 45012;
update npc set hprinterval = 2000 where npcid = 45013;
update npc set hpr = 2 where npcid = 45013;
update npc set hprinterval = 2000 where npcid = 45015;
update npc set hpr = 2 where npcid = 45015;
update npc set hprinterval = 2000 where npcid = 45016;
update npc set hpr = 3 where npcid = 45016;
update npc set hprinterval = 2000 where npcid = 45017;
update npc set hpr = 2 where npcid = 45017;
update npc set hprinterval = 2000 where npcid = 45019;
update npc set hpr = 3 where npcid = 45019;
update npc set hprinterval = 2000 where npcid = 45020;
update npc set hpr = 3 where npcid = 45020;
update npc set hprinterval = 2000 where npcid = 45021;
update npc set hpr = 3 where npcid = 45021;
update npc set hprinterval = 2000 where npcid = 45022;
update npc set hpr = 3 where npcid = 45022;
update npc set hprinterval = 2000 where npcid = 45023;
update npc set hpr = 4 where npcid = 45023;
update npc set hprinterval = 2000 where npcid = 45024;
update npc set hpr = 6 where npcid = 45024;
update npc set hprinterval = 2000 where npcid = 45025;
update npc set hpr = 10 where npcid = 45025;
update npc set hprinterval = 2000 where npcid = 45026;
update npc set hpr = 8 where npcid = 45026;
update npc set hprinterval = 2000 where npcid = 45027;
update npc set hpr = 5 where npcid = 45027;
update npc set hprinterval = 2000 where npcid = 45028;
update npc set hpr = 8 where npcid = 45028;
update npc set hprinterval = 2000 where npcid = 45029;
update npc set hpr = 5 where npcid = 45029;
update npc set hprinterval = 2000 where npcid = 45030;
update npc set hpr = 6 where npcid = 45030;
update npc set hprinterval = 2000 where npcid = 45031;
update npc set hpr = 5 where npcid = 45031;
update npc set hprinterval = 2000 where npcid = 45032;
update npc set hpr = 5 where npcid = 45032;
update npc set hprinterval = 2000 where npcid = 45033;
update npc set hpr = 10 where npcid = 45033;
update npc set hprinterval = 2000 where npcid = 45034;
update npc set hpr = 10 where npcid = 45034;
update npc set hprinterval = 2000 where npcid = 45035;
update npc set hpr = 10 where npcid = 45035;
update npc set hprinterval = 2000 where npcid = 45036;
update npc set hpr = 12 where npcid = 45036;
update npc set hprinterval = 2000 where npcid = 45037;
update npc set hpr = 8 where npcid = 45037;
update npc set hprinterval = 2000 where npcid = 45038;
update npc set hpr = 8 where npcid = 45038;
update npc set hprinterval = 2000 where npcid = 45039;
update npc set hpr = 8 where npcid = 45039;
update npc set hprinterval = 2000 where npcid = 45041;
update npc set hpr = 10 where npcid = 45041;
update npc set hprinterval = 2000 where npcid = 45042;
update npc set hpr = 6 where npcid = 45042;
update npc set hprinterval = 2000 where npcid = 45043;
update npc set hpr = 8 where npcid = 45043;
update npc set hprinterval = 2000 where npcid = 45044;
update npc set hpr = 8 where npcid = 45044;
update npc set hprinterval = 2000 where npcid = 45045;
update npc set hpr = 12 where npcid = 45045;
update npc set hprinterval = 2000 where npcid = 45046;
update npc set hpr = 8 where npcid = 45046;
update npc set hprinterval = 2000 where npcid = 45047;
update npc set hpr = 8 where npcid = 45047;
update npc set hprinterval = 2000 where npcid = 45048;
update npc set hpr = 8 where npcid = 45048;
update npc set hprinterval = 2000 where npcid = 45049;
update npc set hpr = 8 where npcid = 45049;
update npc set hprinterval = 2000 where npcid = 45050;
update npc set hpr = 4 where npcid = 45050;
update npc set hprinterval = 2000 where npcid = 45051;
update npc set hpr = 6 where npcid = 45051;
update npc set hprinterval = 2000 where npcid = 45052;
update npc set hpr = 7 where npcid = 45052;
update npc set hprinterval = 2000 where npcid = 45053;
update npc set hpr = 8 where npcid = 45053;
update npc set hprinterval = 2000 where npcid = 45054;
update npc set hpr = 8 where npcid = 45054;
update npc set hprinterval = 2000 where npcid = 45055;
update npc set hpr = 5 where npcid = 45055;
update npc set hprinterval = 2000 where npcid = 45056;
update npc set hpr = 10 where npcid = 45056;
update npc set hprinterval = 2000 where npcid = 45057;
update npc set hpr = 9 where npcid = 45057;
update npc set hprinterval = 2000 where npcid = 45058;
update npc set hpr = 8 where npcid = 45058;
update npc set hprinterval = 2000 where npcid = 45059;
update npc set hpr = 12 where npcid = 45059;
update npc set hprinterval = 2000 where npcid = 45060;
update npc set hpr = 14 where npcid = 45060;
update npc set hprinterval = 2000 where npcid = 45061;
update npc set hpr = 12 where npcid = 45061;
update npc set hprinterval = 2000 where npcid = 45062;
update npc set hpr = 10 where npcid = 45062;
update npc set hprinterval = 2000 where npcid = 45063;
update npc set hpr = 10 where npcid = 45063;
update npc set hprinterval = 2000 where npcid = 45064;
update npc set hpr = 15 where npcid = 45064;
update npc set hprinterval = 2000 where npcid = 45065;
update npc set hpr = 9 where npcid = 45065;
update npc set hprinterval = 2000 where npcid = 45066;
update npc set hpr = 9 where npcid = 45066;
update npc set hprinterval = 2000 where npcid = 45067;
update npc set hpr = 7 where npcid = 45067;
update npc set hprinterval = 2000 where npcid = 45068;
update npc set hpr = 7 where npcid = 45068;
update npc set hprinterval = 2000 where npcid = 45069;
update npc set hpr = 8 where npcid = 45069;
update npc set hprinterval = 2000 where npcid = 45070;
update npc set hpr = 9 where npcid = 45070;
update npc set hprinterval = 2000 where npcid = 45071;
update npc set hpr = 8 where npcid = 45071;
update npc set hprinterval = 2000 where npcid = 45072;
update npc set hpr = 15 where npcid = 45072;
update npc set hprinterval = 2000 where npcid = 45073;
update npc set hpr = 10 where npcid = 45073;
update npc set hprinterval = 2000 where npcid = 45074;
update npc set hpr = 10 where npcid = 45074;
update npc set hprinterval = 2000 where npcid = 45075;
update npc set hpr = 10 where npcid = 45075;
update npc set hprinterval = 2000 where npcid = 45076;
update npc set hpr = 15 where npcid = 45076;
update npc set hprinterval = 2000 where npcid = 45077;
update npc set hpr = 8 where npcid = 45077;
update npc set hprinterval = 2000 where npcid = 45078;
update npc set hpr = 12 where npcid = 45078;
update npc set hprinterval = 2000 where npcid = 45079;
update npc set hpr = 12 where npcid = 45079;
update npc set hprinterval = 2000 where npcid = 45080;
update npc set hpr = 14 where npcid = 45080;
update npc set hprinterval = 2000 where npcid = 45081;
update npc set hpr = 9 where npcid = 45081;
update npc set hprinterval = 2000 where npcid = 45082;
update npc set hpr = 8 where npcid = 45082;
update npc set hprinterval = 2000 where npcid = 45083;
update npc set hpr = 6 where npcid = 45083;
update npc set hprinterval = 2000 where npcid = 45084;
update npc set hpr = 6 where npcid = 45084;
update npc set hprinterval = 2000 where npcid = 45085;
update npc set hpr = 14 where npcid = 45085;
update npc set hprinterval = 2000 where npcid = 45086;
update npc set hpr = 12 where npcid = 45086;
update npc set hprinterval = 2000 where npcid = 45087;
update npc set hpr = 10 where npcid = 45087;
update npc set hprinterval = 2000 where npcid = 45088;
update npc set hpr = 6 where npcid = 45088;
update npc set hprinterval = 2000 where npcid = 45089;
update npc set hpr = 12 where npcid = 45089;
update npc set hprinterval = 2000 where npcid = 45090;
update npc set hpr = 14 where npcid = 45090;
update npc set hprinterval = 2000 where npcid = 45091;
update npc set hpr = 12 where npcid = 45091;
update npc set hprinterval = 2000 where npcid = 45092;
update npc set hpr = 8 where npcid = 45092;
update npc set hprinterval = 2000 where npcid = 45093;
update npc set hpr = 10 where npcid = 45093;
update npc set hprinterval = 2000 where npcid = 45094;
update npc set hpr = 12 where npcid = 45094;
update npc set hprinterval = 2000 where npcid = 45095;
update npc set hpr = 12 where npcid = 45095;
update npc set hprinterval = 2000 where npcid = 45096;
update npc set hpr = 12 where npcid = 45096;
update npc set hprinterval = 3000 where npcid = 45097;
update npc set hpr = 25 where npcid = 45097;
update npc set hprinterval = 3000 where npcid = 45098;
update npc set hpr = 14 where npcid = 45098;
update npc set hprinterval = 3000 where npcid = 45099;
update npc set hpr = 20 where npcid = 45099;
update npc set hprinterval = 3000 where npcid = 45100;
update npc set hpr = 20 where npcid = 45100;
update npc set hprinterval = 3000 where npcid = 45101;
update npc set hpr = 15 where npcid = 45101;
update npc set hprinterval = 5000 where npcid = 45102;
update npc set hpr = 80 where npcid = 45102;
update npc set Mprinterval = 3000 where npcid = 45102;
update npc set mpr = 50 where npcid = 45102;
update npc set hprinterval = 3000 where npcid = 45103;
update npc set hpr = 10 where npcid = 45103;
update npc set hprinterval = 3000 where npcid = 45104;
update npc set hpr = 50 where npcid = 45104;
update npc set hprinterval = 3000 where npcid = 45105;
update npc set hpr = 20 where npcid = 45105;
update npc set hprinterval = 3000 where npcid = 45106;
update npc set hpr = 20 where npcid = 45106;
update npc set hprinterval = 3000 where npcid = 45107;
update npc set hpr = 20 where npcid = 45107;
update npc set hprinterval = 3000 where npcid = 45108;
update npc set hpr = 50 where npcid = 45108;
update npc set hprinterval = 3000 where npcid = 45109;
update npc set hpr = 50 where npcid = 45109;
update npc set hprinterval = 3000 where npcid = 45110;
update npc set Mprinterval = 2000 where npcid = 45110;
update npc set hpr = 16 where npcid = 45110;
update npc set mpr = 12 where npcid = 45110;
update npc set hprinterval = 3000 where npcid = 45111;
update npc set Mprinterval = 2000 where npcid = 45111;
update npc set hpr = 14 where npcid = 45111;
update npc set mpr = 6 where npcid = 45111;
update npc set hprinterval = 3000 where npcid = 45112;
update npc set Mprinterval = 2000 where npcid = 45112;
update npc set hpr = 15 where npcid = 45112;
update npc set mpr = 7 where npcid = 45112;
update npc set hprinterval = 3000 where npcid = 45113;
update npc set hpr = 14 where npcid = 45113;
update npc set hprinterval = 3000 where npcid = 45114;
update npc set hpr = 12 where npcid = 45114;
update npc set hprinterval = 3000 where npcid = 45115;
update npc set hpr = 12 where npcid = 45115;
update npc set hprinterval = 3000 where npcid = 45116;
update npc set hpr = 14 where npcid = 45116;
update npc set hprinterval = 3000 where npcid = 45117;
update npc set hpr = 12 where npcid = 45117;
update npc set hprinterval = 3000 where npcid = 45118;
update npc set hpr = 12 where npcid = 45118;
update npc set hprinterval = 3000 where npcid = 45119;
update npc set hpr = 13 where npcid = 45119;
update npc set Mprinterval = 2000 where npcid = 45119;
update npc set mpr = 7 where npcid = 45119;
update npc set hprinterval = 3000 where npcid = 45121;
update npc set hpr = 13 where npcid = 45121;
update npc set Mprinterval = 2000 where npcid = 45121;
update npc set mpr = 7 where npcid = 45121;
update npc set hprinterval = 3000 where npcid = 45122;
update npc set hpr = 14 where npcid = 45122;
update npc set hprinterval = 3000 where npcid = 45123;
update npc set hpr = 14 where npcid = 45123;
update npc set hprinterval = 3000 where npcid = 45124;
update npc set hpr = 14 where npcid = 45124;
update npc set hprinterval = 3000 where npcid = 45125;
update npc set hpr = 12 where npcid = 45125;
update npc set hprinterval = 3000 where npcid = 45126;
update npc set hpr = 18 where npcid = 45126;
update npc set hprinterval = 3000 where npcid = 45127;
update npc set hpr = 12 where npcid = 45127;
update npc set hprinterval = 3000 where npcid = 45128;
update npc set hpr = 10 where npcid = 45128;
update npc set hprinterval = 3000 where npcid = 45129;
update npc set hpr = 14 where npcid = 45129;
update npc set hprinterval = 3000 where npcid = 45130;
update npc set hpr = 13 where npcid = 45130;
update npc set hprinterval = 3000 where npcid = 45131;
update npc set hpr = 13 where npcid = 45131;
update npc set hprinterval = 3000 where npcid = 45133;
update npc set hpr = 13 where npcid = 45133;
update npc set hprinterval = 3000 where npcid = 45134;
update npc set hpr = 18 where npcid = 45134;
update npc set hprinterval = 3000 where npcid = 45135;
update npc set hpr = 13 where npcid = 45135;
update npc set hprinterval = 3000 where npcid = 45136;
update npc set hpr = 16 where npcid = 45136;
update npc set hprinterval = 3000 where npcid = 45137;
update npc set hpr = 16 where npcid = 45137;
update npc set hprinterval = 3000 where npcid = 45138;
update npc set hpr = 15 where npcid = 45138;
update npc set hprinterval = 3000 where npcid = 45139;
update npc set hpr = 20 where npcid = 45139;
update npc set hprinterval = 3000 where npcid = 45140;
update npc set hpr = 12 where npcid = 45140;
update npc set hprinterval = 3000 where npcid = 45141;
update npc set hpr = 16 where npcid = 45141;
update npc set Mprinterval = 2000 where npcid = 45141;
update npc set mpr = 8 where npcid = 45141;
update npc set hprinterval = 3000 where npcid = 45142;
update npc set hpr = 15 where npcid = 45142;
update npc set hprinterval = 3000 where npcid = 45143;
update npc set hpr = 14 where npcid = 45143;
update npc set hprinterval = 3000 where npcid = 45144;
update npc set hpr = 13 where npcid = 45144;
update npc set hprinterval = 3000 where npcid = 45145;
update npc set hpr = 13 where npcid = 45145;
update npc set hprinterval = 3000 where npcid = 45147;
update npc set hpr = 24 where npcid = 45147;
update npc set hprinterval = 3000 where npcid = 45148;
update npc set hpr = 24 where npcid = 45148;
update npc set hprinterval = 3000 where npcid = 45149;
update npc set hpr = 17 where npcid = 45149;
update npc set hprinterval = 3000 where npcid = 45150;
update npc set hpr = 12 where npcid = 45150;
update npc set hprinterval = 3000 where npcid = 45151;
update npc set hpr = 13 where npcid = 45151;
update npc set hprinterval = 3000 where npcid = 45152;
update npc set hpr = 13 where npcid = 45152;
update npc set hprinterval = 3000 where npcid = 45153;
update npc set hpr = 13 where npcid = 45153;
update npc set hprinterval = 3000 where npcid = 45154;
update npc set hpr = 10 where npcid = 45154;
update npc set hprinterval = 3000 where npcid = 45155;
update npc set hpr = 10 where npcid = 45155;
update npc set hprinterval = 3000 where npcid = 45156;
update npc set hpr = 19 where npcid = 45156;
update npc set hprinterval = 3000 where npcid = 45157;
update npc set hpr = 17 where npcid = 45157;
update npc set hprinterval = 3000 where npcid = 45158;
update npc set hpr = 22 where npcid = 45158;
update npc set hprinterval = 3000 where npcid = 45159;
update npc set hpr = 14 where npcid = 45159;
update npc set hprinterval = 3000 where npcid = 45160;
update npc set hpr = 20 where npcid = 45160;
update npc set hprinterval = 3000 where npcid = 45161;
update npc set hpr = 17 where npcid = 45161;
update npc set hprinterval = 3000 where npcid = 45162;
update npc set hpr = 16 where npcid = 45162;
update npc set hprinterval = 3000 where npcid = 45163;
update npc set hpr = 19 where npcid = 45163;
update npc set hprinterval = 3000 where npcid = 45164;
update npc set hpr = 22 where npcid = 45164;
update npc set hprinterval = 3000 where npcid = 45165;
update npc set hpr = 18 where npcid = 45165;
update npc set hprinterval = 3000 where npcid = 45166;
update npc set hpr = 28 where npcid = 45166;
update npc set hprinterval = 3000 where npcid = 45167;
update npc set hpr = 30 where npcid = 45167;
update npc set hprinterval = 3000 where npcid = 45168;
update npc set hpr = 12 where npcid = 45168;
update npc set Mprinterval = 2000 where npcid = 45168;
update npc set mpr = 8 where npcid = 45168;
update npc set hprinterval = 3000 where npcid = 45169;
update npc set hpr = 16 where npcid = 45169;
update npc set hprinterval = 3000 where npcid = 45170;
update npc set hpr = 17 where npcid = 45170;
update npc set hprinterval = 3000 where npcid = 45171;
update npc set hpr = 16 where npcid = 45171;
update npc set hprinterval = 3000 where npcid = 45172;
update npc set hpr = 18 where npcid = 45172;
update npc set hprinterval = 3000 where npcid = 45173;
update npc set hpr = 15 where npcid = 45173;
update npc set hprinterval = 3000 where npcid = 45174;
update npc set hpr = 14 where npcid = 45174;
update npc set hprinterval = 3000 where npcid = 45175;
update npc set hpr = 35 where npcid = 45175;
update npc set hprinterval = 3000 where npcid = 45179;
update npc set hpr = 22 where npcid = 45179;
update npc set hprinterval = 3000 where npcid = 45181;
update npc set hpr = 12 where npcid = 45181;
update npc set hprinterval = 3000 where npcid = 45182;
update npc set hpr = 20 where npcid = 45182;
update npc set hprinterval = 3000 where npcid = 45183;
update npc set hpr = 18 where npcid = 45183;
update npc set hprinterval = 3000 where npcid = 45184;
update npc set hpr = 18 where npcid = 45184;
update npc set hprinterval = 3000 where npcid = 45186;
update npc set hpr = 22 where npcid = 45186;
update npc set hprinterval = 3000 where npcid = 45187;
update npc set hpr = 16 where npcid = 45187;
update npc set hprinterval = 3000 where npcid = 45188;
update npc set hpr = 14 where npcid = 45188;
update npc set hprinterval = 3000 where npcid = 45189;
update npc set hpr = 21 where npcid = 45189;
update npc set mprinterval = 2000 where npcid = 45189;
update npc set mpr = 8 where npcid = 45189;
update npc set hprinterval = 3000 where npcid = 45190;
update npc set hpr = 12 where npcid = 45190;
update npc set hprinterval = 3000 where npcid = 45191;
update npc set hpr = 13 where npcid = 45191;
update npc set hprinterval = 3000 where npcid = 45192;
update npc set hpr = 12 where npcid = 45192;
update npc set hprinterval = 3000 where npcid = 45194;
update npc set hpr = 35 where npcid = 45194;
update npc set hprinterval = 3000 where npcid = 45195;
update npc set hpr = 14 where npcid = 45195;
update npc set hprinterval = 3000 where npcid = 45196;
update npc set hpr = 12 where npcid = 45196;
update npc set hprinterval = 3000 where npcid = 45197;
update npc set hpr = 18 where npcid = 45197;
update npc set mprinterval = 2000 where npcid = 45197;
update npc set mpr = 8 where npcid = 45197;
update npc set hprinterval = 3000 where npcid = 45198;
update npc set hpr = 10 where npcid = 45198;
update npc set hprinterval = 3000 where npcid = 45199;
update npc set hpr = 14 where npcid = 45199;
update npc set hprinterval = 3000 where npcid = 45203;
update npc set hpr = 28 where npcid = 45203;
update npc set hprinterval = 3000 where npcid = 45206;
update npc set hpr = 16 where npcid = 45206;
update npc set hprinterval = 3000 where npcid = 45207;
update npc set hpr = 18 where npcid = 45207;
update npc set hprinterval = 3000 where npcid = 45208;
update npc set hpr = 18 where npcid = 45208;
update npc set hprinterval = 3000 where npcid = 45215;
update npc set hpr = 20 where npcid = 45215;
update npc set mprinterval = 2000 where npcid = 45215;
update npc set mpr = 12 where npcid = 45215;
update npc set hprinterval = 3000 where npcid = 45216;
update npc set hpr = 12 where npcid = 45216;
update npc set hprinterval = 3000 where npcid = 45217;
update npc set hpr = 13 where npcid = 45217;
update npc set hprinterval = 3000 where npcid = 60562;
update npc set hpr = 60 where npcid = 60562;
update npc set mprinterval = 2000 where npcid = 60562;
update npc set mpr = 15 where npcid = 60562;
update npc set hprinterval = 3000 where npcid = 45220;
update npc set hpr = 28 where npcid = 45220;
update npc set hprinterval = 3000 where npcid = 45221;
update npc set hpr = 12 where npcid = 45221;
update npc set hprinterval = 3000 where npcid = 45222;
update npc set hpr = 18 where npcid = 45222;
update npc set hprinterval = 3000 where npcid = 45223;
update npc set hpr = 20 where npcid = 45223;
update npc set hprinterval = 3000 where npcid = 45224;
update npc set hpr = 12 where npcid = 45224;
update npc set mprinterval = 2000 where npcid = 45224;
update npc set mpr = 10 where npcid = 45224;


-- Bosses --

-- 4 dragons --
update npc set hprinterval = 30000 where npcid = 45681;
update npc set Mprinterval = 25000 where npcid = 45681;
update npc set hpr = 500 where npcid = 45681;
update npc set mpr = 400 where npcid = 45681;
update npc set hprinterval = 35000 where npcid = 45682;
update npc set Mprinterval = 25000 where npcid = 45682;
update npc set hpr = 600 where npcid = 45682;
update npc set mpr = 500 where npcid = 45682;
update npc set hprinterval = 25000 where npcid = 45683;
update npc set Mprinterval = 20000 where npcid = 45683;
update npc set hpr = 500 where npcid = 45683;
update npc set mpr = 400 where npcid = 45683;
update npc set hprinterval = 20000 where npcid = 45684;
update npc set Mprinterval = 15000 where npcid = 45684;
update npc set hpr = 400 where npcid = 45684;
update npc set mpr = 300 where npcid = 45684;

-- Demon of Varlok --
update npc set hprinterval = 6000 where npcid = 45647;
update npc set hpr = 180 where npcid = 45647;
update npc set Mprinterval = 4000 where npcid = 45647;
update npc set mpr = 150 where npcid = 45647;

-- Slave of Assassin King --
update npc set hprinterval = 6000 where npcid = 45648;
update npc set hpr = 120 where npcid = 45648;

-- Demon --
update npc set hprinterval = 6000 where npcid = 45649;
update npc set hpr = 280 where npcid = 45649;
update npc set Mprinterval = 4000 where npcid = 45649;
update npc set mpr = 220 where npcid = 45649;

-- Zombie Lord --
update npc set hprinterval = 6000 where npcid = 45650;
update npc set hpr = 250 where npcid = 45650;
update npc set Mprinterval = 4000 where npcid = 45650;
update npc set mpr = 200 where npcid = 45650;


-- Dread King Baranka --
update npc set hprinterval = 6000 where npcid = 45651;
update npc set hpr = 150 where npcid = 45651;
update npc set Mprinterval = 4000 where npcid = 45651;
update npc set mpr = 130 where npcid = 45651;

-- Mummy Lord --
update npc set hprinterval = 6000 where npcid = 45653;
update npc set hpr = 250 where npcid = 45653;
update npc set Mprinterval = 4000 where npcid = 45653;
update npc set mpr = 200 where npcid = 45653;

-- Iris --
update npc set hprinterval = 6000 where npcid = 45654;
update npc set hpr = 270 where npcid = 45654;
update npc set Mprinterval = 4000 where npcid = 45654;
update npc set mpr = 220 where npcid = 45654;

-- Knight Vald --
update npc set hprinterval = 6000 where npcid = 45664;
update npc set hpr = 300 where npcid = 45664;

-- Baras --
update npc set hprinterval = 6000 where npcid = 45665;
update npc set hpr = 300 where npcid = 45665;

-- Teranus --
update npc set hprinterval = 6000 where npcid = 45666;
update npc set hpr = 300 where npcid = 45666;

-- Kunos --
update npc set hprinterval = 6000 where npcid = 45667;
update npc set hpr = 300 where npcid = 45667;

-- Zyrus --
update npc set hprinterval = 6000 where npcid = 45668;
update npc set hpr = 300 where npcid = 45668;

-- Ariorc --
update npc set hprinterval = 6000 where npcid = 45671;
update npc set Mprinterval = 4000 where npcid = 45671;
update npc set hpr = 250 where npcid = 45671;
update npc set mpr = 200 where npcid = 45671;

-- Lich --
update npc set hprinterval = 8000 where npcid = 45672;
update npc set Mprinterval = 5000 where npcid = 45672;
update npc set hpr = 350 where npcid = 45672;
update npc set mpr = 280 where npcid = 45672;

-- GrimReaper --
update npc set hprinterval = 6000 where npcid = 45673;
update npc set Mprinterval = 3000 where npcid = 45673;
update npc set hpr = 350 where npcid = 45673;
update npc set mpr = 280 where npcid = 45673;

-- Death --
update npc set hprinterval = 5000 where npcid = 45674;
update npc set Mprinterval = 3000 where npcid = 45674;
update npc set hpr = 250 where npcid = 45674;
update npc set mpr = 220 where npcid = 45674;

-- Yahee --
update npc set hprinterval = 8000 where npcid = 45675;
update npc set Mprinterval = 6000 where npcid = 45675;
update npc set hpr = 200 where npcid = 45675;
update npc set mpr = 160 where npcid = 45675;

-- Bright Magic King Hellvine --
update npc set hprinterval = 7000 where npcid = 45676;
update npc set hpr = 150 where npcid = 45676;

-- Dread Queen Laia --
update npc set hprinterval = 8000 where npcid = 45677;
update npc set Mprinterval = 4000 where npcid = 45677;
update npc set hpr = 150 where npcid = 45677;
update npc set mpr = 110 where npcid = 45677;

-- Cerenis --
update npc set hprinterval = 8000 where npcid = 45678;
update npc set Mprinterval = 5000 where npcid = 45678;
update npc set hpr = 180 where npcid = 45678;
update npc set mpr = 150 where npcid = 45678;

-- Ken Rahaul --
update npc set hprinterval = 10000 where npcid = 45680;
update npc set Mprinterval = 8000 where npcid = 45680;
update npc set hpr = 350 where npcid = 45680;
update npc set mpr = 250 where npcid = 45680;

-- Tarak --
update npc set hprinterval = 15000 where npcid = 45685;
update npc set Mprinterval = 10000 where npcid = 45685;
update npc set hpr = 350 where npcid = 45685;
update npc set mpr = 200 where npcid = 45685;

-- giants and imp elder rock throwing skill fix.
DELETE FROM mobskill WHERE mobid = 45295;
INSERT INTO `mobskill` VALUES ('45295', '0', 'Giant', null, '2', '50', '0', '0', '-3', '0', '0', '30', '0', '0', '60', '12004', '0', '18', '2507', '0', '0', '0');
INSERT INTO `mobskill` VALUES ('45318', '0', 'Giant', null, '2', '50', '0', '0', '-3', '0', '0', '30', '0', '0', '60', '12004', '0', '18', '2507', '0', '0', '0');
INSERT INTO `mobskill` VALUES ('45337', '0', 'Giant', null, '2', '50', '0', '0', '-3', '0', '0', '30', '0', '0', '60', '12004', '0', '18', '2507', '0', '0', '0');
INSERT INTO `mobskill` VALUES ('45064', '0', 'Imp Elder', null, '2', '50', '0', '0', '-3', '0', '0', '30', '0', '0', '60', '12005', '0', '18', '2507', '0', '0', '0');
INSERT INTO `mobskill` VALUES ('45099', '0', 'Imp Elder', null, '2', '50', '0', '0', '-3', '0', '0', '30', '0', '0', '60', '12005', '0', '18', '2507', '0', '0', '0');
INSERT INTO `mobskill` VALUES ('45168', '0', 'Imp Elder', null, '2', '50', '0', '0', '-3', '0', '0', '30', '0', '0', '60', '12005', '0', '18', '2507', '0', '0', '0');
INSERT INTO `skills` VALUES ('12004', 'Gaint Rock Throw', '0', '0', '10', '0', '0', '0', '0', '0', 'attack', '3', '30', '5', '5', '0', '0', '0', '64', '0', '30', '0', '0', '0', '0', '18', '2510', '2507', '0', '0', '0');
INSERT INTO `skills` VALUES ('12005', 'Imp Rock Throw', '0', '0', '10', '0', '0', '0', '0', '0', 'attack', '3', '12', '5', '5', '0', '0', '0', '64', '0', '30', '0', '0', '0', '0', '18', '2510', '2507', '0', '0', '0');

-- magicdolls fixed.
DROP TABLE IF EXISTS `MagicDoll`;
CREATE TABLE `MagicDoll` (
  `item_id` int(10) unsigned NOT NULL,
  `note` varchar(45) CHARACTER SET utf8 DEFAULT '',
  `doll_id` int(10) NOT NULL,
  `ac` tinyint(2) NOT NULL DEFAULT '0',
  `hpr` tinyint(2) NOT NULL DEFAULT '0',
  `hpr_time` tinyint(2) NOT NULL DEFAULT '0',
  `mpr` tinyint(2) NOT NULL DEFAULT '0',
  `mpr_time` tinyint(2) NOT NULL DEFAULT '0',
  `hit` tinyint(2) NOT NULL DEFAULT '0',
  `dmg` tinyint(2) NOT NULL DEFAULT '0',
  `dmg_chance` tinyint(2) NOT NULL DEFAULT '0',
  `bow_hit` tinyint(2) NOT NULL DEFAULT '0',
  `bow_dmg` tinyint(2) NOT NULL DEFAULT '0',
  `dmg_reduction` tinyint(2) NOT NULL DEFAULT '0',
  `dmg_reduction_chance` tinyint(2) NOT NULL DEFAULT '0',
  `dmg_evasion_chance` tinyint(2) NOT NULL DEFAULT '0',
  `weight_reduction` tinyint(2) NOT NULL DEFAULT '0',
  `regist_stun` tinyint(2) NOT NULL DEFAULT '0',
  `regist_stone` tinyint(2) NOT NULL DEFAULT '0',
  `regist_sleep` tinyint(2) NOT NULL DEFAULT '0',
  `regist_freeze` tinyint(2) NOT NULL DEFAULT '0',
  `regist_sustain` tinyint(2) NOT NULL DEFAULT '0',
  `regist_blind` tinyint(2) NOT NULL DEFAULT '0',
  `make_itemid` int(10) NOT NULL DEFAULT '0',
  `effect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of MagicDoll
-- ----------------------------
INSERT INTO `MagicDoll` VALUES ('41248', 'bugbear', '80106', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '20', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `MagicDoll` VALUES ('41249', 'Succubus', '80107', '0', '0', '0', '15', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `MagicDoll` VALUES ('41250', 'Werewolf', '80108', '0', '0', '0', '0', '0', '0', '15', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `MagicDoll` VALUES ('47105', 'Sea Dancer', '92109', '0', '40', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `MagicDoll` VALUES ('47106', 'Ramia', '92103', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `MagicDoll` VALUES ('47107', 'Yeti', '92102', '-3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0');
INSERT INTO `MagicDoll` VALUES ('47108', 'Spartoi', '92104', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `MagicDoll` VALUES ('47109', 'Cockatrice', '92106', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `MagicDoll` VALUES ('49037', 'Elder', '80129', '0', '0', '0', '15', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `MagicDoll` VALUES ('49038', 'Crustancean', '80130', '0', '0', '0', '0', '0', '0', '15', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `MagicDoll` VALUES ('49039', 'StoneGolem', '80131', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

DELETE FROM npc where npcid = 41248;
DELETE FROM npc where npcid = 41249;
DELETE FROM npc where npcid = 41250;
DELETE FROM npc where npcid = 49037;
DELETE FROM npc where npcid = 49038;
DELETE FROM npc where npcid = 49039;
DELETE FROM npc where npcid = 47105;
DELETE FROM npc where npcid = 47106;
DELETE FROM npc where npcid = 47107;
DELETE FROM npc where npcid = 47108;
DELETE FROM npc where npcid = 47109;

INSERT INTO `npc` VALUES ('92109', 'Sea Dancer Magic Doll', '$5886', '', 'L1Doll', '6477', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', 'small', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '-1', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '0', '0', '0', '0');
INSERT INTO `npc` VALUES ('92102', 'Yeti Magic Doll', '$6416', '', 'L1Doll', '6480', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', 'small', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '-1', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '0', '0', '0', '0');
INSERT INTO `npc` VALUES ('92103', 'Ramia Magic Doll', '$7450', '', 'L1Doll', '6483', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', 'small', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '-1', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '0', '0', '0', '0');
INSERT INTO `npc` VALUES ('92104', 'Spartoi Magic Doll', '$7510', '', 'L1Doll', '7047', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', 'small', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '-1', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '0', '0', '0', '0');
INSERT INTO `npc` VALUES ('92106', 'Cockatrice Magic Doll', '$5886', '', 'L1Doll', '7257', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', 'small', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '-1', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '0', '0', '0', '0');
INSERT INTO `npc` VALUES ('80129', 'Elder Magic Doll', '$5886', '', 'L1Doll', '6443', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', 'small', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '-1', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '0', '0', '0', '0');
INSERT INTO `npc` VALUES ('80130', 'Crustancean Magic Doll', '$5886', '', 'L1Doll', '6449', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', 'small', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '-1', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '0', '0', '0', '0');
INSERT INTO `npc` VALUES ('80131', 'StoneGolem Magic Doll', '$5886', '', 'L1Doll', '6452', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', 'small', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '-1', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '0', '0', '0', '0');

DELETE FROM etcitem where item_id = 41248;
DELETE FROM etcitem where item_id = 41249;
DELETE FROM etcitem where item_id = 41250;
DELETE FROM etcitem where item_id = 49037;
DELETE FROM etcitem where item_id = 49038;
DELETE FROM etcitem where item_id = 49039;
DELETE FROM etcitem where item_id = 47105;
DELETE FROM etcitem where item_id = 47106;
DELETE FROM etcitem where item_id = 47107;
DELETE FROM etcitem where item_id = 47108;
DELETE FROM etcitem where item_id = 47109;

INSERT INTO `etcitem` VALUES ('41248', 'Magic Doll: Bugbear', '$5226', '$5226', 'magic_doll', 'normal', 'wood', '12000', '2589', '6174', '2545', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '2000', '0', '0', '1');
INSERT INTO `etcitem` VALUES ('41249', 'Magic Doll: Succubus', '$5227', '$5227', 'magic_doll', 'normal', 'wood', '12000', '2590', '6174', '2546', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '2000', '0', '0', '1');
INSERT INTO `etcitem` VALUES ('41250', 'Magic Doll: Werewolf', '$5225', '$5225', 'magic_doll', 'normal', 'wood', '12000', '2591', '6174', '2772', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '2000', '0', '0', '1');
INSERT INTO `etcitem` VALUES ('49037', 'Magic Doll: Elder', '$5417', '$5417', 'magic_doll', 'normal', 'wood', '12000', '2703', '3963', '2545', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '1', '1', '0', '2000', '0', '0', '1');
INSERT INTO `etcitem` VALUES ('49038', 'Magic Doll: Crustancean', '$5418', '$5418', 'magic_doll', 'normal', 'wood', '12000', '2705', '3963', '2546', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '1', '1', '0', '2000', '0', '0', '1');
INSERT INTO `etcitem` VALUES ('49039', 'Magic Doll: Stone Golem', '$5419', '$5419', 'magic_doll', 'normal', 'wood', '12000', '2704', '3963', '2772', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '1', '1', '0', '2000', '0', '0', '1');
INSERT INTO `etcitem` VALUES ('47105', 'Magic Doll: Sea Dancer', '$5826', '$5826', 'magic_doll', 'normal', 'wood', '1000', '3070', '6174', '2929', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '1', '8', '2000', '0', '0', '1');
INSERT INTO `etcitem` VALUES ('47106', 'Magic Doll: Ramia', '$7449', '$7449', 'magic_doll', 'normal', 'wood', '1000', '3217', '6174', '2930', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '1', '1', '8', '2000', '0', '0', '1');
INSERT INTO `etcitem` VALUES ('47107', 'Magic Doll: Yeti', '$7448', '$7448', 'magic_doll', 'normal', 'wood', '1000', '3218', '6174', '2931', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '1', '1', '8', '2000', '0', '0', '1');
INSERT INTO `etcitem` VALUES ('47108', 'Magic Doll: Spartoi', '$7511', '$7511', 'magic_doll', 'normal', 'wood', '1000', '3337', '6174', '3333', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '1', '1', '8', '2000', '0', '0', '1');
INSERT INTO `etcitem` VALUES ('47109', 'Magic Doll: Cockatrice', '$7400', '$7400', 'magic_doll', 'normal', 'wood', '1000', '3496', '6174', '4049', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '1', '1', '8', '2000', '0', '0', '1');
INSERT INTO `etcitem` VALUES ('47110', 'Magic Doll: Male Hatchling', '$8410', '$8410', 'magic_doll', 'normal', 'glass', '1000', '3636', '6174', '4133', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '1', '8', '2000', '0', '0', '1');
INSERT INTO `etcitem` VALUES ('47111', 'Magic Doll: FeMale Hatchling', '$8411', '$8411', 'magic_doll', 'normal', 'glass', '1000', '3669', '6174', '4134', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '1', '8', '2000', '0', '0', '1');
INSERT INTO `etcitem` VALUES ('47112', 'Magic Doll: Evolved Male Hatchling', '$8412', '$8412', 'magic_doll', 'normal', 'glass', '1000', '3636', '6174', '4135', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '1', '8', '2000', '0', '0', '1');
INSERT INTO `etcitem` VALUES ('47113', 'Magic Doll: Evolved FeMale Hatchling', '$8413', '$8413', 'magic_doll', 'normal', 'glass', '1000', '3669', '6174', '4136', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '1', '8', '2000', '0', '0', '1');

-- hatchling need to fix the egg icon.
INSERT INTO `npc` VALUES ('92110', 'Male Hatchling Magic Doll', '$7901', '', 'L1Monster', '7662', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', 'small', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '-1', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '0', '0', '0', '0');
INSERT INTO `npc` VALUES ('92111', 'FeMale Hatchling Magic Doll', '$7901', '', 'L1Monster', '7661', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', 'small', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '-1', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '0', '0', '0', '0');
INSERT INTO `npc` VALUES ('92112', 'Evolved Male Hatchling Magic Doll', '$7902', '', 'L1Monster', '7659', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', 'small', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '-1', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '0', '0', '0', '0');
INSERT INTO `npc` VALUES ('92113', 'Evolved FeMale Hatchling Magic Doll', '$7902', '', 'L1Monster', '7660', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', 'small', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '-1', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '0', '0', '0', '0');

-- wrong name on npctable---
update npc set name = Lakuki where npcid = 80090;
update npc set hp = 9000 where npcid = 80090;
update npc set lvl = 65 where npcid = 80090;

-- these castle doors had no hp.
update spawnlist_door set hp = 10000 where id = 2000;
update spawnlist_door set hp = 10000 where id = 2001;
update spawnlist_door set hp = 10000 where id = 2002;
update spawnlist_door set hp = 10000 where id = 2010;
update spawnlist_door set hp = 10000 where id = 2020;
update spawnlist_door set hp = 10000 where id = 2021;
update spawnlist_door set hp = 10000 where id = 2022;
update spawnlist_door set hp = 10000 where id = 2030;
update spawnlist_door set hp = 10000 where id = 2031;
update spawnlist_door set hp = 10000 where id = 2032;
update spawnlist_door set hp = 10000 where id = 2033;
update spawnlist_door set hp = 10000 where id = 2034;
update spawnlist_door set hp = 10000 where id = 2035;
update spawnlist_door set hp = 10000 where id = 2040;
update spawnlist_door set hp = 10000 where id = 2041;
update spawnlist_door set hp = 10000 where id = 2042;
update spawnlist_door set hp = 10000 where id = 2050;
update spawnlist_door set hp = 10000 where id = 2051;
update spawnlist_door set hp = 10000 where id = 2052;
update spawnlist_door set hp = 10000 where id = 2060;

--1835 light green santa orc
--7061 santa dark green
--2271 aden walking guard sword
--2289 aden wlking guard spear
--2295 walking aden guard bow.
--2314 walking aden lady pink with amberella
--2429 aden walking npc man whiteblue trouser
--955 - 965 skeleton trainingdummy dragonknight town ?
--4749 spell gfx eyes or poison.
-- 1914 antharas poison cloud ?
-- 7762 red dwarf with axe 3.2 version / thebes spawn?
7596 blue dragon 3.2 version / thebes spawn?
7590 brown dragon 3.2 version / thebes spawn?
7587 red dragon 3.2 version / thebes spawn?
7580 kind of strider blue dragon 3.2 version / thebes spawn?
7573 kind of strider brown dragon 3.2 version / thebes spawn?
7566 kind of strider red dragon 3.2 version / thebes spawn?
7559 kind of strider purple dragon 3.2 version / thebes spawn?
7539 new antharas look. 3.2 version
7481 golem with blue crystals on hes back a small guy 3.2 version
7489 golem with purple crystals on hes back a small guy 3.2 version
7509 kuma kum(3) 3.2 boss. antharas dungeon spawn
7496 kuma kum(2) 3.2 boss. antharas dungeon spawn
7348 proberly a npc it has a red coat with yellow marks onit and a kind of gold thing on hes head.
7285 monkey with a golden stick thebes spawn
7220 a little monkey thebes spawn
7192 little snake that crawls in the dessert thebes spawn
7196 blue shaman with a gold blue hammer thebes spawn
7193 gold shaman with a gold hammer thebes spawn
7186 totem pole monster blue color thebes spawn
7184 totem pole monster gold color thebes spawn
7176 thebes brain monkey
7170 big ent tree this is a monster
7167 big ent tree this is a monster
7113 big white black yellow flying bat
7111 big white black green flying bat
7099 brown python spawn thebes map
7098 blue python spawn thebes map
7097 blue little bee guy. thebes spawn ?
7078 little gold shell guy thebes spawn ?
7050 a small little guy that has a stick as feets and a little pumkin face
6997 gold treasure chest like the same on that spawns at aden castle.
6894 purple devilsh guy with gold red legs.
6806 panda thebes spawn?
6790 blue spirit guy this is a new boss or quest npc.
6788 blue spirit guy this is a new boss or quest npc.
6776 knight guard in gold black armor with a big dragon sword thebes spawn?
6764 guy with a black coat and a blue faces and 2 swords. boss?
6759 guard same like the one in heine only it has a redwhite coat instead of the whiteblue coat.
6749 female swimming npc. is this the swimming event gear?
6750 female swimming npc. is this the swimming event gear?
6747 male swimming npc. is this the swimming event gear?
6743 male swimming npc. is this the swimming event gear?
6699 thebes half men half horse with wings.
6665 thebes gold blue bird.
6654 egypt hell dog with a sword this is a thebes spawn
6649 sand brown golem with a pillar. thebes spawn?
6645 sand light golem with a pillar. thebes spawn?
6638 weird dark golem with a very small head.
6603 red scorpion thebes spawn
6603 goldblack scorpion thebes spawn
6595 thebes anubis boss.
6593 thebes scarab goldblack
6592 thebes scarab goldblue
6581 new ice queen gfx 3.2ver
6569 thebes horus boss
6566 crystal blue purple devil
6563 thebes npc bluegold
6562 thebes npc gold
6558 white big golem guy with grey armor and a golden bow thebes spawn.
6557 little brown mole with a flower on hes head this is a monster that popsup from the ground. this is thebes i think too
6555 little light mole with a flower on hes head this is a monster that popsup from the ground. this is thebes i think too
6396 goldyellow flying dragon thebes
6310 baby panda 
6314 panda