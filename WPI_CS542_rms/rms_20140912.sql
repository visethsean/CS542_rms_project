# MySQL-Front 5.1  (Build 3.18)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;


# Host: localhost    Database: rms
# ------------------------------------------------------
# Server version 5.6.22-log

DROP DATABASE IF EXISTS `rms`;
CREATE DATABASE `rms` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `rms`;

#
# Source for table building
#

DROP TABLE IF EXISTS `building`;
CREATE TABLE `building` (
  `building_id` int(3) NOT NULL AUTO_INCREMENT,
  `building_name` varchar(100) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`building_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Dumping data for table building
#

INSERT INTO `building` VALUES (3,'Atwater-Kent Laboratories','Main Campus');
INSERT INTO `building` VALUES (4,'Fuller Laboratories','Main Campus');
INSERT INTO `building` VALUES (5,'Gateway Park','Gateway');
INSERT INTO `building` VALUES (6,'Goddard Hall','Main Campus');
INSERT INTO `building` VALUES (7,'Higgins Labs','Main Campus');
INSERT INTO `building` VALUES (8,'Kaven Hall','Main Campus');
INSERT INTO `building` VALUES (9,'Olin Hall','Main Campus');
INSERT INTO `building` VALUES (10,'Salisbury Laboratories','Main Campus');
INSERT INTO `building` VALUES (11,'Stratton Hall','Main Campus');
INSERT INTO `building` VALUES (12,'Washburn Shops','Main Campus');

#
# Source for table building_adm
#

DROP TABLE IF EXISTS `building_adm`;
CREATE TABLE `building_adm` (
  `building_id` int(3) NOT NULL,
  `user_id` int(5) NOT NULL,
  PRIMARY KEY (`building_id`,`user_id`),
  KEY `FK_user_building` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table building_adm
#


#
# Source for table equipment
#

DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment` (
  `equipment_id` int(3) NOT NULL AUTO_INCREMENT,
  `equipment_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`equipment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Dumping data for table equipment
#

INSERT INTO `equipment` VALUES (1,'LCD Projector');
INSERT INTO `equipment` VALUES (2,'Whiteboard');
INSERT INTO `equipment` VALUES (3,'Laptop');
INSERT INTO `equipment` VALUES (4,'PC');
INSERT INTO `equipment` VALUES (5,'LCD Monitor');
INSERT INTO `equipment` VALUES (6,'Plasma Monitor');
INSERT INTO `equipment` VALUES (7,'Sound System');

#
# Source for table event_detail
#

DROP TABLE IF EXISTS `event_detail`;
CREATE TABLE `event_detail` (
  `idevent` int(11) NOT NULL AUTO_INCREMENT,
  `event_date` date NOT NULL,
  `event_time` time NOT NULL,
  `event` varchar(200) NOT NULL,
  PRIMARY KEY (`idevent`),
  KEY `event_date` (`event_date`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

#
# Dumping data for table event_detail
#

INSERT INTO `event_detail` VALUES (1,'2013-05-28','20:18:13','Japan Class');
INSERT INTO `event_detail` VALUES (2,'2013-05-28','20:18:13','Japan Class 2');
INSERT INTO `event_detail` VALUES (5,'2014-11-13','02:00:00','really?');
INSERT INTO `event_detail` VALUES (6,'2014-11-14','05:00:00','treasfasdf');
INSERT INTO `event_detail` VALUES (7,'2014-11-14','03:00:00','another eveeenttt');
INSERT INTO `event_detail` VALUES (8,'2014-11-14','03:00:00','jjhjh');
INSERT INTO `event_detail` VALUES (9,'2014-11-22','06:00:00','jhjhj');

#
# Source for table events
#

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `event_date` date NOT NULL,
  `total_events` int(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`event_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table events
#

INSERT INTO `events` VALUES ('2013-05-28',3);
INSERT INTO `events` VALUES ('2014-11-13',1);
INSERT INTO `events` VALUES ('2014-11-14',3);
INSERT INTO `events` VALUES ('2014-11-22',1);

#
# Source for table reservation
#

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation` (
  `reservation_id` int(10) NOT NULL AUTO_INCREMENT,
  `reserver_id` int(5) DEFAULT NULL,
  `room_id` int(5) DEFAULT NULL,
  `num_people` int(10) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `activity` text,
  `status` int(1) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `building_id` int(3) DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `FK_reserver` (`reserver_id`),
  KEY `FK_room_res` (`room_id`),
  KEY `FK_reservation_status` (`status`),
  KEY `FK_building_res` (`building_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

#
# Dumping data for table reservation
#

INSERT INTO `reservation` VALUES (64,1,12,4,'2014-12-14 07:30:00','2014-12-14 09:30:00','DS502 Project Discussion',1,NULL,4);
INSERT INTO `reservation` VALUES (65,1,12,3,'2014-12-14 10:30:00','2014-12-14 13:00:00','CS542 Project Discussion',1,NULL,4);
INSERT INTO `reservation` VALUES (66,1,14,10,'2014-12-21 09:00:00','2014-12-21 10:30:00','CRC Meeting ',1,NULL,4);
INSERT INTO `reservation` VALUES (67,1,39,10,'2015-01-04 07:30:00','2015-01-04 11:00:00','MSA Meeting',1,NULL,10);

#
# Source for table reservation_status
#

DROP TABLE IF EXISTS `reservation_status`;
CREATE TABLE `reservation_status` (
  `status_id` int(2) NOT NULL AUTO_INCREMENT,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Dumping data for table reservation_status
#

INSERT INTO `reservation_status` VALUES (1,'Waiting');
INSERT INTO `reservation_status` VALUES (2,'Approved');
INSERT INTO `reservation_status` VALUES (3,'Rejected');

#
# Source for table role
#

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `Id` int(3) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Dumping data for table role
#

INSERT INTO `role` VALUES (1,'Reserver');
INSERT INTO `role` VALUES (2,'Approver');
INSERT INTO `role` VALUES (3,'Admin');

#
# Source for table room
#

DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `room_id` int(5) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(50) DEFAULT NULL,
  `floor` int(2) DEFAULT NULL,
  `size` int(5) DEFAULT NULL,
  `building_id` int(3) DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  KEY `fk_room_building` (`building_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Dumping data for table room
#

INSERT INTO `room` VALUES (5,'AK116',1,206,3);
INSERT INTO `room` VALUES (6,'AK219',2,86,3);
INSERT INTO `room` VALUES (7,'AK232',2,34,3);
INSERT INTO `room` VALUES (8,'AK233',2,70,3);
INSERT INTO `room` VALUES (9,'AK227',2,25,3);
INSERT INTO `room` VALUES (10,'Upper Perreault Hall',1,196,4);
INSERT INTO `room` VALUES (11,'Lower Perreault Hall',0,100,4);
INSERT INTO `room` VALUES (12,'FL311',3,38,4);
INSERT INTO `room` VALUES (13,'FL320',3,65,4);
INSERT INTO `room` VALUES (14,'FL222',2,27,4);
INSERT INTO `room` VALUES (15,'Gateway Park 1002',1,89,5);
INSERT INTO `room` VALUES (16,'GH012',0,30,6);
INSERT INTO `room` VALUES (17,'GH227',2,80,6);
INSERT INTO `room` VALUES (18,'HL114',1,35,7);
INSERT INTO `room` VALUES (19,'HL116',1,90,7);
INSERT INTO `room` VALUES (20,'HL154',1,35,7);
INSERT INTO `room` VALUES (21,'HL202',2,35,7);
INSERT INTO `room` VALUES (22,'HL218',2,90,7);
INSERT INTO `room` VALUES (23,'HL230',2,40,7);
INSERT INTO `room` VALUES (24,'KH115',1,26,8);
INSERT INTO `room` VALUES (25,'KH116',1,70,8);
INSERT INTO `room` VALUES (26,'KH202',2,25,8);
INSERT INTO `room` VALUES (27,'KH204',2,25,8);
INSERT INTO `room` VALUES (28,'KH207',2,30,8);
INSERT INTO `room` VALUES (29,'OL107',1,205,9);
INSERT INTO `room` VALUES (30,'OL109',1,37,9);
INSERT INTO `room` VALUES (31,'OL126',1,35,9);
INSERT INTO `room` VALUES (32,'OL218',2,35,9);
INSERT INTO `room` VALUES (33,'OL223',2,42,9);
INSERT INTO `room` VALUES (34,'SL011',0,45,10);
INSERT INTO `room` VALUES (35,'SL104',1,76,10);
INSERT INTO `room` VALUES (36,'SL105',1,54,10);
INSERT INTO `room` VALUES (37,'SL115',1,220,10);
INSERT INTO `room` VALUES (38,'SL123',1,28,10);
INSERT INTO `room` VALUES (39,'SL305',3,60,10);
INSERT INTO `room` VALUES (40,'SL402',4,60,10);
INSERT INTO `room` VALUES (41,'SL406',4,48,10);
INSERT INTO `room` VALUES (42,'SL407',4,36,10);
INSERT INTO `room` VALUES (43,'SL411',4,60,10);
INSERT INTO `room` VALUES (44,'SH003',0,45,11);
INSERT INTO `room` VALUES (45,'SH106',1,35,11);
INSERT INTO `room` VALUES (46,'SH202',2,45,11);
INSERT INTO `room` VALUES (47,'SH203',2,30,11);
INSERT INTO `room` VALUES (48,'SH304',3,35,11);
INSERT INTO `room` VALUES (49,'SH306',3,52,11);
INSERT INTO `room` VALUES (50,'SH308',3,54,11);
INSERT INTO `room` VALUES (51,'SH309',3,48,11);
INSERT INTO `room` VALUES (52,'WS228',2,36,12);
INSERT INTO `room` VALUES (53,'WS229',2,85,12);
INSERT INTO `room` VALUES (54,'WS323',3,36,12);

#
# Source for table room_equipment
#

DROP TABLE IF EXISTS `room_equipment`;
CREATE TABLE `room_equipment` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `equipment_id` int(3) DEFAULT NULL,
  `room_id` int(5) DEFAULT NULL,
  `no_item` int(3) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_room_equip` (`room_id`),
  KEY `FK_equip_room` (`equipment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Dumping data for table room_equipment
#


#
# Source for table user
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(5) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `usertype` int(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FK_user_role` (`usertype`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Dumping data for table user
#

INSERT INTO `user` VALUES (1,'admin','81dc9bdb52d04dc20036dbd8313ed055','Administrator','RMS',3);
INSERT INTO `user` VALUES (2,'approver','81dc9bdb52d04dc20036dbd8313ed055','hey','hey',2);
INSERT INTO `user` VALUES (3,'reserver','81dc9bdb52d04dc20036dbd8313ed055','111','111',1);
INSERT INTO `user` VALUES (4,'yuhu','b7f68bb19bde0d7787e67053b4acd3b9','Yuhu','huyu',3);

#
# Source for procedure raise_application_error
#

DROP PROCEDURE IF EXISTS `raise_application_error`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `raise_application_error`(IN CODE INTEGER, IN MESSAGE VARCHAR(255))
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
  CREATE TEMPORARY TABLE IF NOT EXISTS RAISE_ERROR(F1 INT NOT NULL, F2 VARCHAR(255));

  SELECT CODE, MESSAGE INTO @error_code, @error_message;
  INSERT INTO RAISE_ERROR VALUES(@error_code, @error_message);
END;


#
# Source for procedure get_last_custom_error
#

DROP PROCEDURE IF EXISTS `get_last_custom_error`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_last_custom_error`()
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
  SELECT @error_code, @error_message;
END;


#
# Source for trigger ck_BackDateBeforeUpdate
#

DROP TRIGGER IF EXISTS `rms`.`ck_BackDateBeforeUpdate`;
CREATE DEFINER='root'@'localhost' TRIGGER `rms`.`ck_BackDateBeforeUpdate` BEFORE UPDATE ON `rms`.`reservation`
  FOR EACH ROW BEGIN
	DECLARE RoomSize INTEGER;
	SELECT size INTO RoomSize FROM room WHERE room_id = NEW.room_id;
	IF NEW.num_people > RoomSize THEN
       SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Overload! Choose different Room';

    END IF;
	IF NEW.start_date < NOW() OR NEW.end_date < NOW() THEN
       SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Date cannot be in the past!';
	END IF;
END;


#
# Source for trigger ck_BackDateBeforeInsert
#

DROP TRIGGER IF EXISTS `rms`.`ck_BackDateBeforeInsert`;
CREATE DEFINER='root'@'localhost' TRIGGER `rms`.`ck_BackDateBeforeInsert` BEFORE INSERT ON `rms`.`reservation`
  FOR EACH ROW BEGIN
	DECLARE RoomSize INTEGER;
	SELECT size INTO RoomSize FROM room WHERE room_id = NEW.room_id;
	IF NEW.num_people > RoomSize THEN
       SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Overload! Choose different Room';

    END IF;
	IF NEW.start_date < NOW() OR NEW.end_date < NOW() THEN
       SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Date cannot be in the past!';
	END IF;
    
END;


#
#  Foreign keys for table building_adm
#

ALTER TABLE `building_adm`
ADD CONSTRAINT `FK_building_user` FOREIGN KEY (`building_id`) REFERENCES `building` (`building_id`),
ADD CONSTRAINT `FK_user_building` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

#
#  Foreign keys for table event_detail
#

ALTER TABLE `event_detail`
ADD CONSTRAINT `event_detail_ibfk_1` FOREIGN KEY (`event_date`) REFERENCES `events` (`event_date`);

#
#  Foreign keys for table reservation
#

ALTER TABLE `reservation`
ADD CONSTRAINT `FK_building_res` FOREIGN KEY (`building_id`) REFERENCES `building` (`building_id`),
ADD CONSTRAINT `FK_reservation_status` FOREIGN KEY (`status`) REFERENCES `reservation_status` (`status_id`),
ADD CONSTRAINT `FK_reserver` FOREIGN KEY (`reserver_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION,
ADD CONSTRAINT `FK_room_res` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE NO ACTION;

#
#  Foreign keys for table room
#

ALTER TABLE `room`
ADD CONSTRAINT `fk_room_building` FOREIGN KEY (`building_id`) REFERENCES `building` (`building_id`) ON DELETE CASCADE;

#
#  Foreign keys for table room_equipment
#

ALTER TABLE `room_equipment`
ADD CONSTRAINT `FK_equip_room` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`equipment_id`) ON DELETE NO ACTION,
ADD CONSTRAINT `FK_room_equip` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE NO ACTION;

#
#  Foreign keys for table user
#

ALTER TABLE `user`
ADD CONSTRAINT `FK_user_role` FOREIGN KEY (`usertype`) REFERENCES `role` (`Id`) ON DELETE NO ACTION;


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
