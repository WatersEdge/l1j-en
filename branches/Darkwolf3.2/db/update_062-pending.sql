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
