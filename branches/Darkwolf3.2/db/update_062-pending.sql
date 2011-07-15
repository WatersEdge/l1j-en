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

INSERT INTO `dungeon` VALUES ('32683', '32924', '1005', '32670', '32670', '1005', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´A çµ‚é»ž1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1');
INSERT INTO `dungeon` VALUES ('32683', '32925', '1005', '32670', '32670', '1005', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´A çµ‚é»ž2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2');
INSERT INTO `dungeon` VALUES ('32811', '32924', '1005', '32670', '32670', '1005', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´B çµ‚é»ž1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1');
INSERT INTO `dungeon` VALUES ('32811', '32925', '1005', '32670', '32670', '1005', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´B çµ‚é»ž2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2');
INSERT INTO `dungeon` VALUES ('32939', '32924', '1005', '32670', '32670', '1005', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´C çµ‚é»ž1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1');
INSERT INTO `dungeon` VALUES ('32939', '32925', '1005', '32670', '32670', '1005', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´C çµ‚é»ž2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2');
INSERT INTO `dungeon` VALUES ('32939', '32732', '1005', '32670', '32670', '1005', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´D çµ‚é»ž1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1');
INSERT INTO `dungeon` VALUES ('32939', '32733', '1005', '32670', '32670', '1005', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´D çµ‚é»ž2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2');
INSERT INTO `dungeon` VALUES ('32624', '32724', '1005', '32670', '32670', '1005', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´ å…¥å£(ç›´æŽ¥åž‹)1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£');
INSERT INTO `dungeon` VALUES ('32624', '32725', '1005', '32670', '32670', '1005', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´ å…¥å£(ç›´æŽ¥åž‹)2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£');
INSERT INTO `dungeon` VALUES ('32671', '32666', '1005', '32621', '32726', '1005', '6', 'å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ å…¥å£(ç›´æŽ¥åž‹)');
INSERT INTO `dungeon` VALUES ('32672', '32666', '1005', '32621', '32726', '1005', '6', 'å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ å…¥å£(ç›´æŽ¥åž‹)');
INSERT INTO `dungeon` VALUES ('32683', '32924', '1006', '32670', '32670', '1006', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´A çµ‚é»ž1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1');
INSERT INTO `dungeon` VALUES ('32683', '32925', '1006', '32670', '32670', '1006', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´A çµ‚é»ž2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2');
INSERT INTO `dungeon` VALUES ('32811', '32924', '1006', '32670', '32670', '1006', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´B çµ‚é»ž1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1');
INSERT INTO `dungeon` VALUES ('32811', '32925', '1006', '32670', '32670', '1006', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´B çµ‚é»ž2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2');
INSERT INTO `dungeon` VALUES ('32939', '32924', '1006', '32670', '32670', '1006', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´C çµ‚é»ž1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1');
INSERT INTO `dungeon` VALUES ('32939', '32925', '1006', '32670', '32670', '1006', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´C çµ‚é»ž2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2');
INSERT INTO `dungeon` VALUES ('32939', '32732', '1006', '32670', '32670', '1006', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´D çµ‚é»ž1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1');
INSERT INTO `dungeon` VALUES ('32939', '32733', '1006', '32670', '32670', '1006', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´D çµ‚é»ž2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2');
INSERT INTO `dungeon` VALUES ('32624', '32724', '1006', '32670', '32670', '1006', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´ å…¥å£(ç›´æŽ¥åž‹)1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£');
INSERT INTO `dungeon` VALUES ('32624', '32725', '1006', '32670', '32670', '1006', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´ å…¥å£(ç›´æŽ¥åž‹)2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£');
INSERT INTO `dungeon` VALUES ('32671', '32666', '1006', '32621', '32726', '1006', '6', 'å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ å…¥å£(ç›´æŽ¥åž‹)');
INSERT INTO `dungeon` VALUES ('32672', '32666', '1006', '32621', '32726', '1006', '6', 'å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ å…¥å£(ç›´æŽ¥åž‹)');
INSERT INTO `dungeon` VALUES ('32683', '32924', '1007', '32670', '32670', '1007', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´A çµ‚é»ž1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1');
INSERT INTO `dungeon` VALUES ('32683', '32925', '1007', '32670', '32670', '1007', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´A çµ‚é»ž2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2');
INSERT INTO `dungeon` VALUES ('32811', '32924', '1007', '32670', '32670', '1007', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´B çµ‚é»ž1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1');
INSERT INTO `dungeon` VALUES ('32811', '32925', '1007', '32670', '32670', '1007', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´B çµ‚é»ž2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2');
INSERT INTO `dungeon` VALUES ('32939', '32924', '1007', '32670', '32670', '1007', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´C çµ‚é»ž1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1');
INSERT INTO `dungeon` VALUES ('32939', '32925', '1007', '32670', '32670', '1007', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´C çµ‚é»ž2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2');
INSERT INTO `dungeon` VALUES ('32939', '32732', '1007', '32670', '32670', '1007', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´D çµ‚é»ž1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1');
INSERT INTO `dungeon` VALUES ('32939', '32733', '1007', '32670', '32670', '1007', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´D çµ‚é»ž2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2');
INSERT INTO `dungeon` VALUES ('32624', '32724', '1007', '32670', '32670', '1007', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´ å…¥å£(ç›´æŽ¥åž‹)1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£');
INSERT INTO `dungeon` VALUES ('32624', '32725', '1007', '32670', '32670', '1007', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´ å…¥å£(ç›´æŽ¥åž‹)2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£');
INSERT INTO `dungeon` VALUES ('32671', '32666', '1007', '32621', '32726', '1007', '6', 'å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ å…¥å£(ç›´æŽ¥åž‹)');
INSERT INTO `dungeon` VALUES ('32672', '32666', '1007', '32621', '32726', '1007', '6', 'å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ å…¥å£(ç›´æŽ¥åž‹)');
INSERT INTO `dungeon` VALUES ('32683', '32924', '1008', '32670', '32670', '1008', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´A çµ‚é»ž1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1');
INSERT INTO `dungeon` VALUES ('32683', '32925', '1008', '32670', '32670', '1008', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´A çµ‚é»ž2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2');
INSERT INTO `dungeon` VALUES ('32811', '32924', '1008', '32670', '32670', '1008', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´B çµ‚é»ž1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1');
INSERT INTO `dungeon` VALUES ('32811', '32925', '1008', '32670', '32670', '1008', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´B çµ‚é»ž2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2');
INSERT INTO `dungeon` VALUES ('32939', '32924', '1008', '32670', '32670', '1008', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´C çµ‚é»ž1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1');
INSERT INTO `dungeon` VALUES ('32939', '32925', '1008', '32670', '32670', '1008', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´C çµ‚é»ž2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2');
INSERT INTO `dungeon` VALUES ('32939', '32732', '1008', '32670', '32670', '1008', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´D çµ‚é»ž1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1');
INSERT INTO `dungeon` VALUES ('32939', '32733', '1008', '32670', '32670', '1008', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´D çµ‚é»ž2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2');
INSERT INTO `dungeon` VALUES ('32624', '32724', '1008', '32670', '32670', '1008', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´ å…¥å£(ç›´æŽ¥åž‹)1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£');
INSERT INTO `dungeon` VALUES ('32624', '32725', '1008', '32670', '32670', '1008', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´ å…¥å£(ç›´æŽ¥åž‹)2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£');
INSERT INTO `dungeon` VALUES ('32671', '32666', '1008', '32621', '32726', '1008', '6', 'å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ å…¥å£(ç›´æŽ¥åž‹)');
INSERT INTO `dungeon` VALUES ('32672', '32666', '1008', '32621', '32726', '1008', '6', 'å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ å…¥å£(ç›´æŽ¥åž‹)');
INSERT INTO `dungeon` VALUES ('32683', '32924', '1009', '32670', '32670', '1009', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´A çµ‚é»ž1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1');
INSERT INTO `dungeon` VALUES ('32683', '32925', '1009', '32670', '32670', '1009', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´A çµ‚é»ž2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2');
INSERT INTO `dungeon` VALUES ('32811', '32924', '1009', '32670', '32670', '1009', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´B çµ‚é»ž1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1');
INSERT INTO `dungeon` VALUES ('32811', '32925', '1009', '32670', '32670', '1009', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´B çµ‚é»ž2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2');
INSERT INTO `dungeon` VALUES ('32939', '32924', '1009', '32670', '32670', '1009', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´C çµ‚é»ž1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1');
INSERT INTO `dungeon` VALUES ('32939', '32925', '1009', '32670', '32670', '1009', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´C çµ‚é»ž2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2');
INSERT INTO `dungeon` VALUES ('32939', '32732', '1009', '32670', '32670', '1009', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´D çµ‚é»ž1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1');
INSERT INTO `dungeon` VALUES ('32939', '32733', '1009', '32670', '32670', '1009', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´D çµ‚é»ž2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2');
INSERT INTO `dungeon` VALUES ('32624', '32724', '1009', '32670', '32670', '1009', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´ å…¥å£(ç›´æŽ¥åž‹)1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£');
INSERT INTO `dungeon` VALUES ('32624', '32725', '1009', '32670', '32670', '1009', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´ å…¥å£(ç›´æŽ¥åž‹)2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£');
INSERT INTO `dungeon` VALUES ('32671', '32666', '1009', '32621', '32726', '1009', '6', 'å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ å…¥å£(ç›´æŽ¥åž‹)');
INSERT INTO `dungeon` VALUES ('32672', '32666', '1009', '32621', '32726', '1009', '6', 'å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ å…¥å£(ç›´æŽ¥åž‹)');
INSERT INTO `dungeon` VALUES ('32683', '32924', '1010', '32670', '32670', '1010', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´A çµ‚é»ž1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1');
INSERT INTO `dungeon` VALUES ('32683', '32925', '1010', '32670', '32670', '1010', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´A çµ‚é»ž2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2');
INSERT INTO `dungeon` VALUES ('32811', '32924', '1010', '32670', '32670', '1010', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´B çµ‚é»ž1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1');
INSERT INTO `dungeon` VALUES ('32811', '32925', '1010', '32670', '32670', '1010', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´B çµ‚é»ž2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2');
INSERT INTO `dungeon` VALUES ('32939', '32924', '1010', '32670', '32670', '1010', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´C çµ‚é»ž1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1');
INSERT INTO `dungeon` VALUES ('32939', '32925', '1010', '32670', '32670', '1010', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´C çµ‚é»ž2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2');
INSERT INTO `dungeon` VALUES ('32939', '32732', '1010', '32670', '32670', '1010', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´D çµ‚é»ž1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1');
INSERT INTO `dungeon` VALUES ('32939', '32733', '1010', '32670', '32670', '1010', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´D çµ‚é»ž2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2');
INSERT INTO `dungeon` VALUES ('32624', '32724', '1010', '32670', '32670', '1010', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´ å…¥å£(ç›´æŽ¥åž‹)1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£');
INSERT INTO `dungeon` VALUES ('32624', '32725', '1010', '32670', '32670', '1010', '4', 'å®‰å¡”ç‘žæ–¯æ´žç©´ å…¥å£(ç›´æŽ¥åž‹)2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£');
INSERT INTO `dungeon` VALUES ('32671', '32666', '1010', '32621', '32726', '1010', '6', 'å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£1 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ å…¥å£(ç›´æŽ¥åž‹)');
INSERT INTO `dungeon` VALUES ('32672', '32666', '1010', '32621', '32726', '1010', '6', 'å®‰å¡”ç‘žæ–¯æ´žç©´ æ£²æ¯åœ°å…¥å£2 â†’ å®‰å¡”ç‘žæ–¯æ´žç©´ å…¥å£(ç›´æŽ¥åž‹)');
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