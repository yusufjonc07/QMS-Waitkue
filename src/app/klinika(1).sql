-- Adminer 4.8.1 MySQL 8.0.31-0ubuntu0.22.04.1 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `casher`;
CREATE TABLE `casher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `cashreg_id` int NOT NULL,
  `disabled` tinyint(1) NOT NULL,
  `upt` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `casher` (`id`, `user_id`, `cashreg_id`, `disabled`, `upt`) VALUES
(1,	24,	1,	0,	1);

DROP TABLE IF EXISTS `cashreg`;
CREATE TABLE `cashreg` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `upt` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `cashreg` (`id`, `name`, `upt`) VALUES
(1,	'Bosh Kassa',	1);

DROP TABLE IF EXISTS `deleteds`;
CREATE TABLE `deleteds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `table` varchar(255) NOT NULL,
  `item_id` int NOT NULL,
  `upt` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `diagnosis`;
CREATE TABLE `diagnosis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `illness` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `queue_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `upt` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_id` int NOT NULL,
  `room` varchar(100) NOT NULL,
  `user_id` int NOT NULL,
  `flat` int NOT NULL,
  `cost` double NOT NULL,
  `upt` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `doctor` (`id`, `service_id`, `room`, `user_id`, `flat`, `cost`, `upt`) VALUES
(1,	1,	'2',	25,	1,	100000,	1),
(2,	3,	'11',	26,	1,	80000,	1),
(3,	1,	'90',	26,	1,	100000,	1);

DROP TABLE IF EXISTS `drug`;
CREATE TABLE `drug` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `upt` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `drug` (`id`, `name`, `upt`) VALUES
(1,	'L- Виава р-р внутр.1г 10мл №10',	0),
(2,	'L- Виава р-р д/иньек.1г/5мл №5',	0),
(3,	'L-лизина эсцинат 5мл №10',	0);

DROP TABLE IF EXISTS `expence`;
CREATE TABLE `expence` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) NOT NULL,
  `value` double NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int NOT NULL,
  `upt` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `expence` (`id`, `comment`, `value`, `created_at`, `user_id`, `upt`) VALUES
(1,	'wifi',	10000,	'2023-01-09 17:05:41',	1,	1),
(2,	'test',	10000,	'2023-01-11 11:02:41',	1,	1),
(3,	'svet uchun',	200000,	'2023-01-11 11:02:41',	1,	1);

DROP TABLE IF EXISTS `illness`;
CREATE TABLE `illness` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `service_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `illness_comment`;
CREATE TABLE `illness_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `illness_id` int NOT NULL,
  `comment` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `income`;
CREATE TABLE `income` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` double NOT NULL,
  `patient_id` int NOT NULL,
  `queue_id` int NOT NULL,
  `user_id` int NOT NULL,
  `cashreg_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `taken` tinyint(1) NOT NULL,
  `method` varchar(255) NOT NULL,
  `upt` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `surename` varchar(255) NOT NULL,
  `fathername` varchar(255) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `age` date NOT NULL,
  `address` varchar(100) NOT NULL,
  `state_id` int NOT NULL,
  `region_id` int NOT NULL,
  `source_id` int NOT NULL,
  `phone` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int NOT NULL,
  `upt` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `queue`;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `service_id` int NOT NULL,
  `number` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `completed_at` datetime NOT NULL,
  `complaint` varchar(255) DEFAULT NULL,
  `step` int NOT NULL,
  `user_id` int NOT NULL,
  `room` int NOT NULL,
  `doctor_id` int NOT NULL,
  `cancel_user_id` int NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `in_room` tinyint(1) NOT NULL,
  `upt` tinyint(1) NOT NULL,
  `responsible` varchar(255) NOT NULL,
  `treatment` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `recall`;
CREATE TABLE `recall` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `plan_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `user_id` int NOT NULL,
  `operator_id` int NOT NULL,
  `talk_type` varchar(10) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `queue_id` int NOT NULL,
  `upt` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `recipe`;
CREATE TABLE `recipe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `day` int NOT NULL,
  `time` int NOT NULL,
  `drug_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `queue_id` int NOT NULL,
  `diagnosis_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `meal` int NOT NULL,
  `method` varchar(100) NOT NULL,
  `duration` double NOT NULL,
  `unit` double NOT NULL,
  `upt` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `region`;
CREATE TABLE `region` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `upt` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `request`;
CREATE TABLE `request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `method` varchar(10) NOT NULL,
  `url` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `upt` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `service`;
CREATE TABLE `service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `disabled` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  `upt` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recall_hour` double NOT NULL,
  `upt` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `setting` (`id`, `recall_hour`, `upt`) VALUES
(1,	3,	1);

DROP TABLE IF EXISTS `source`;
CREATE TABLE `source` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `upt` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `state`;
CREATE TABLE `state` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `region_id` int NOT NULL,
  `upt` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL,
  `phone` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `username` varchar(100) NOT NULL,
  `password_hash` varchar(100) NOT NULL,
  `disabled` tinyint(1) NOT NULL,
  `upt` tinyint(1) NOT NULL,
  `queue_time` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `user` (`id`, `name`, `role`, `phone`, `created_at`, `updated_at`, `username`, `password_hash`, `disabled`, `upt`, `queue_time`) VALUES
(1,	'Super User',	'admin',	913253395,	'2022-12-14 17:44:48',	'2022-12-14 17:44:48',	'admin1111',	'$2y$13$ewjBm.ZxMuLDjgxEPQre1Oi5SJ5vttnIsmbJpxFrdIfdsHQ6QdqcC',	0,	0,	0);

-- 2023-01-13 12:36:50
