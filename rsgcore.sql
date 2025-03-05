CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'Anticheat',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `outlawstatus` int(11) NOT NULL DEFAULT 0,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(255) NOT NULL COLLATE 'utf8mb3_general_ci',
  `skin` VARCHAR(8000) NOT NULL COLLATE 'utf8mb3_general_ci',
  `clothes` VARCHAR(8000) NOT NULL COLLATE 'utf8mb4_general_ci',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `citizenid` (`citizenid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `playeroutfit` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL COLLATE 'utf8mb3_general_ci',
  `name` VARCHAR(255) NOT NULL COLLATE 'utf8mb3_general_ci',
  `clothes` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `inventories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`items`)),
  PRIMARY KEY (`identifier`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `telegrams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `recipient` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `sendername` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `sentDate` varchar(25) NOT NULL,
  `message` varchar(455) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '0',
  `birdstatus` TINYINT(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `player_horses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stable` varchar(50) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `horseid` varchar(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `horse` varchar(50) DEFAULT NULL,
  `dirt` int(11) DEFAULT 0,
  `horsexp` int(11) DEFAULT 0,
  `components` LONGTEXT NOT NULL DEFAULT '{}',
  `gender` varchar(11) NOT NULL,
  `wild` varchar(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT 0,
  `born` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `player_ammo` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(255) NOT NULL,
  `ammo_revolver` INT(3) NOT NULL DEFAULT '0',
  `ammo_revolver_express` INT(3) NOT NULL DEFAULT '0',
  `ammo_revolver_express_explosive` INT(3) NOT NULL DEFAULT '0',
  `ammo_revolver_high_velocity` INT(3) NOT NULL DEFAULT '0',
  `ammo_revolver_split_point` INT(3) NOT NULL DEFAULT '0',
  `ammo_pistol` INT(3) NOT NULL DEFAULT '0',
  `ammo_pistol_express` INT(3) NOT NULL DEFAULT '0',
  `ammo_pistol_express_explosive` INT(3) NOT NULL DEFAULT '0',
  `ammo_pistol_high_velocity` INT(3) NOT NULL DEFAULT '0',
  `ammo_pistol_split_point` INT(3) NOT NULL DEFAULT '0',
  `ammo_repeater` INT(3) NOT NULL DEFAULT '0',
  `ammo_repeater_express` INT(3) NOT NULL DEFAULT '0',
  `ammo_repeater_express_explosive` INT(3) NOT NULL DEFAULT '0',
  `ammo_repeater_high_velocity` INT(3) NOT NULL DEFAULT '0',
  `ammo_repeater_split_point` INT(3) NOT NULL DEFAULT '0',
  `ammo_rifle` INT(3) NOT NULL DEFAULT '0',
  `ammo_rifle_express` INT(3) NOT NULL DEFAULT '0',
  `ammo_rifle_express_explosive` INT(3) NOT NULL DEFAULT '0',
  `ammo_rifle_high_velocity` INT(3) NOT NULL DEFAULT '0',
  `ammo_rifle_split_point` INT(3) NOT NULL DEFAULT '0',
  `ammo_shotgun` INT(3) NOT NULL DEFAULT '0',
  `ammo_shotgun_buckshot_incendiary` INT(3) NOT NULL DEFAULT '0',
  `ammo_shotgun_slug` INT(3) NOT NULL DEFAULT '0',
  `ammo_shotgun_slug_explosive` INT(3) NOT NULL DEFAULT '0',
  `ammo_rifle_elephant` INT(3) NOT NULL DEFAULT '0',
  `ammo_22` INT(3) NOT NULL DEFAULT '0',
  `ammo_22_tranquilizer` INT(3) NOT NULL DEFAULT '0',
  `ammo_arrow` INT(3) NOT NULL DEFAULT '0',
  `ammo_arrow_small_game` INT(3) NOT NULL DEFAULT '0',
  `ammo_arrow_fire` INT(3) NOT NULL DEFAULT '0',
  `ammo_arrow_poison` INT(3) NOT NULL DEFAULT '0',
  `ammo_arrow_dynamite` INT(3) NOT NULL DEFAULT '0',
  `ammo_molotov` INT(3) NOT NULL DEFAULT '0',
  `ammo_tomahawk` INT(3) NOT NULL DEFAULT '0',
  `ammo_tomahawk_ancient` INT(3) NOT NULL DEFAULT '0',
  `ammo_dynamite` INT(3) NOT NULL DEFAULT '0',
  `ammo_poisonbottle` INT(3) NOT NULL DEFAULT '0',
  `ammo_throwing_knives` INT(3) NOT NULL DEFAULT '0',
  `ammo_throwing_knives_drain` INT(3) NOT NULL DEFAULT '0',
  `ammo_throwing_knives_poison` INT(3) NOT NULL DEFAULT '0',
  `ammo_bolas` INT(3) NOT NULL DEFAULT '0',
  `ammo_bolas_hawkmoth` INT(3) NOT NULL DEFAULT '0',
  `ammo_bolas_intertwined` INT(3) NOT NULL DEFAULT '0',
  `ammo_bolas_ironspiked` INT(3) NOT NULL DEFAULT '0',
  `ammo_hatchet` INT(3) NOT NULL DEFAULT '0',
  `ammo_hatchet_hunter` INT(3) NOT NULL DEFAULT '0',
  `ammo_hatchet_cleaver` INT(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `citizenid` (`citizenid`) USING BTREE
)
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `player_weapons` (
    `id` int NOT NULL AUTO_INCREMENT,
    `serial` varchar(16) NOT NULL,
    `citizenid` varchar(9) NOT NULL,
    `components` varchar(4096) NOT NULL DEFAULT '{}',
    `components_before` varchar(4096) NOT NULL DEFAULT '{}',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `address_book` (
`id` INT(11) NOT NULL AUTO_INCREMENT,
`citizenid` VARCHAR(50) NOT NULL,
`name`  VARCHAR(50) NOT NULL,
`owner`  VARCHAR(50) NOT NULL,
PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `management_funds` (
`id` INT(11) NOT NULL AUTO_INCREMENT,
`job_name` VARCHAR(50) NOT NULL,
`amount`  INT(100) NOT NULL,
`type` ENUM('boss','gang') NOT NULL DEFAULT 'boss',
PRIMARY KEY (`id`),
UNIQUE KEY `job_name` (`job_name`),
KEY `type` (`type`)
);

INSERT INTO `management_funds` (`job_name`, `amount`, `type`) VALUES
('vallaw', 0, 'boss'),
('rholaw', 0, 'boss'),
('blklaw', 0, 'boss'),
('strlaw', 0, 'boss'),
('stdenlaw', 0, 'boss'),
('medic', 0, 'boss');

CREATE TABLE IF NOT EXISTS `favorites_animations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `favorites` longtext DEFAULT ('[]') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `player_jobs` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `citizenid` varchar(50) DEFAULT NULL,
    `job` varchar(50) DEFAULT NULL,
    `grade` INT(11) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ox_doorlock` (
  `id` int (11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `shop_stock` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	`shop_name` VARCHAR(50) NOT NULL,
	`item_name` VARCHAR(50) NOT NULL,
	`stock` INT(11) UNSIGNED NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE INDEX `shop_name_item_name` (`shop_name`, `item_name`)
) ENGINE=InnoDB;
