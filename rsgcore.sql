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
  `weight` int(11) NOT NULL DEFAULT 0,
  `slots` int(11) NOT NULL DEFAULT 0,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `player_weapons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(16) NOT NULL,
  `citizenid` varchar(9) NOT NULL,
  `components` varchar(4096) NOT NULL DEFAULT '{}',
  `components_before` varchar(4096) NOT NULL DEFAULT '{}',
  `price` decimal(5,2) NOT NULL DEFAULT 0.00,
  `town` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `player_weapons_custom` (
  `gunsiteid` varchar(20) NOT NULL,
  `propid` varchar(20) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `item` varchar(50) NOT NULL,
  `propdata` longtext NOT NULL,
  PRIMARY KEY (`gunsiteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `management_funds` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `job_name` VARCHAR(50) NOT NULL,
  `amount`  INT(100) NOT NULL,
  `type` ENUM('boss','gang') NOT NULL DEFAULT 'boss',
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_name` (`job_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `shop_stock` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `shop_name` VARCHAR(50) NOT NULL,
  `item_name` VARCHAR(50) NOT NULL,
  `stock` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `shop_name_item_name` (`shop_name`, `item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `admin_reports` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `report_type` VARCHAR(50) NOT NULL,
  `reporter_id` INT(11) NOT NULL,
  `reporter_name` VARCHAR(255) NOT NULL,
  `reporter_license` VARCHAR(255) NOT NULL,
  `reporter_discord` VARCHAR(255) DEFAULT NULL,
  `reporter_coords` VARCHAR(255) NOT NULL,
  `reported_player_id` INT(11) DEFAULT NULL,
  `reported_player_name` VARCHAR(255) DEFAULT NULL,
  `reported_player_license` VARCHAR(255) DEFAULT NULL,
  `reported_player_discord` VARCHAR(255) DEFAULT NULL,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `image_url` VARCHAR(500) DEFAULT NULL,
  `status` VARCHAR(50) DEFAULT 'open',
  `assigned_admin_id` INT(11) DEFAULT NULL,
  `assigned_admin_name` VARCHAR(255) DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `admin_report_messages` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `report_id` INT(11) NOT NULL,
  `sender_type` VARCHAR(50) NOT NULL,
  `sender_id` INT(11) NOT NULL,
  `sender_name` VARCHAR(255) NOT NULL,
  `message` TEXT NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`report_id`) REFERENCES `admin_reports`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `admin_report_nearby_players` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `report_id` INT(11) NOT NULL,
  `player_id` INT(11) NOT NULL,
  `player_name` VARCHAR(255) NOT NULL,
  `player_license` VARCHAR(255) NOT NULL,
  `distance` FLOAT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`report_id`) REFERENCES `admin_reports`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- RSG MDT Database Schema
-- Criminal Records Table
CREATE TABLE IF NOT EXISTS `mdt_records` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `citizenid` VARCHAR(50) NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `crime` VARCHAR(255) NOT NULL,
    `description` TEXT,
    `fine` INT DEFAULT 0,
    `jailtime` INT DEFAULT 0,
    `officer` VARCHAR(100) NOT NULL,
    `officer_cid` VARCHAR(50),
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    INDEX `idx_citizenid` (`citizenid`),
    INDEX `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Warrants Table
CREATE TABLE IF NOT EXISTS `mdt_warrants` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `citizenid` VARCHAR(50) NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `reason` TEXT NOT NULL,
    `status` ENUM('active', 'served', 'expired') DEFAULT 'active',
    `officer` VARCHAR(100) NOT NULL,
    `officer_cid` VARCHAR(50),
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX `idx_citizenid` (`citizenid`),
    INDEX `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- BOLOs (Be On Lookout) Table
CREATE TABLE IF NOT EXISTS `mdt_bolos` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) NOT NULL,
    `description` TEXT,
    `last_seen` VARCHAR(255),
    `officer` VARCHAR(100) NOT NULL,
    `officer_cid` VARCHAR(50),
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    INDEX `idx_title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Reports Table
CREATE TABLE IF NOT EXISTS `mdt_reports` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) NOT NULL,
    `type` VARCHAR(50) DEFAULT 'incident',
    `description` TEXT,
    `officers` JSON,
    `suspects` JSON,
    `evidence` JSON,
    `officer` VARCHAR(100) NOT NULL,
    `officer_cid` VARCHAR(50),
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    INDEX `idx_type` (`type`),
    INDEX `idx_officer` (`officer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Report Comments (case building)
CREATE TABLE IF NOT EXISTS `mdt_report_comments` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `report_id` INT NOT NULL,
    `author` VARCHAR(100) NOT NULL,
    `author_cid` VARCHAR(50),
    `content` TEXT NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    INDEX `idx_report_id` (`report_id`),
    FOREIGN KEY (`report_id`) REFERENCES `mdt_reports`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Citizen Profiles (MDT-specific data like profile pictures)
CREATE TABLE IF NOT EXISTS `mdt_citizen_profiles` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `citizenid` VARCHAR(50) NOT NULL UNIQUE,
    `profile_picture` VARCHAR(512),
    `notes` TEXT,
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Staff Members Table
CREATE TABLE IF NOT EXISTS `mdt_staff` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `citizenid` VARCHAR(50) NOT NULL UNIQUE,
    `name` VARCHAR(100) NOT NULL,
    `role` VARCHAR(50) DEFAULT 'officer',
    `permissions` JSON,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Roles Table
CREATE TABLE IF NOT EXISTS `mdt_roles` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL UNIQUE,
    `label` VARCHAR(100) NOT NULL,
    `permissions` JSON,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Audit Logs Table
CREATE TABLE IF NOT EXISTS `mdt_audit_logs` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `action` VARCHAR(50) NOT NULL,
    `target_type` VARCHAR(50),
    `target_id` VARCHAR(100),
    `target_name` VARCHAR(100),
    `details` TEXT,
    `performed_by` VARCHAR(50) NOT NULL,
    `performed_by_name` VARCHAR(100) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX `idx_action` (`action`),
    INDEX `idx_performed_by` (`performed_by`),
    INDEX `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Charge Templates Table
CREATE TABLE IF NOT EXISTS `mdt_charge_templates` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT,
    `fine` INT DEFAULT 0,
    `jailtime` INT DEFAULT 0,
    `category` VARCHAR(50) DEFAULT 'misdemeanor',
    `created_by` VARCHAR(50),
    `created_by_name` VARCHAR(100),
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX `idx_category` (`category`),
    INDEX `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Issued Charges Table (tracks charges applied to citizens)
CREATE TABLE IF NOT EXISTS `mdt_issued_charges` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `citizenid` VARCHAR(50) NOT NULL,
    `citizen_name` VARCHAR(100) NOT NULL,
    `charge_template_id` INT,
    `charge_name` VARCHAR(255) NOT NULL,
    `charge_description` TEXT,
    `fine` INT DEFAULT 0,
    `jailtime` INT DEFAULT 0,
    `time_served` INT DEFAULT 0,
    `is_served` TINYINT(1) DEFAULT 0,
    `officer` VARCHAR(100) NOT NULL,
    `officer_cid` VARCHAR(50),
    `report_id` INT,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `served_at` TIMESTAMP NULL,
    INDEX `idx_citizenid` (`citizenid`),
    INDEX `idx_officer` (`officer`),
    INDEX `idx_is_served` (`is_served`),
    FOREIGN KEY (`charge_template_id`) REFERENCES `mdt_charge_templates`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Charge-Report Attachments Table (many-to-many relationship)
CREATE TABLE IF NOT EXISTS `mdt_charge_attachments` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `charge_id` INT NOT NULL,
    `report_id` INT NOT NULL,
    `attached_by` VARCHAR(50) NOT NULL,
    `attached_by_name` VARCHAR(100) NOT NULL,
    `attached_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY `unique_charge_report` (`charge_id`, `report_id`),
    INDEX `idx_charge_id` (`charge_id`),
    INDEX `idx_report_id` (`report_id`),
    FOREIGN KEY (`charge_id`) REFERENCES `mdt_issued_charges`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`report_id`) REFERENCES `mdt_reports`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Fines Table
CREATE TABLE IF NOT EXISTS `mdt_fines` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `citizenid` VARCHAR(50) NOT NULL,
    `citizen_name` VARCHAR(100) NOT NULL,
    `issued_charge_ids` JSON,
    `total_amount` INT NOT NULL DEFAULT 0,
    `due_date` TIMESTAMP NULL,
    `status` ENUM('unpaid', 'paid', 'overdue') DEFAULT 'unpaid',
    `issued_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `paid_at` TIMESTAMP NULL,
    `officer_name` VARCHAR(100),
    `officer_cid` VARCHAR(50),
    `paid_to_officer` VARCHAR(100),
    INDEX `idx_citizenid` (`citizenid`),
    INDEX `idx_status` (`status`),
    INDEX `idx_due_date` (`due_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Default Charge Templates
INSERT IGNORE INTO `mdt_charge_templates` (`name`, `description`, `fine`, `jailtime`, `category`) VALUES
    ('Assault', 'Physical assault on another person', 50, 2, 'felony'),
    ('Battery', 'Unlawful physical force against another', 75, 3, 'felony'),
    ('Theft', 'Stealing property valued under $50', 25, 0, 'misdemeanor'),
    ('Grand Theft', 'Stealing property valued $50 or more', 100, 6, 'felony'),
    ('Trespassing', 'Unauthorized entry onto private property', 15, 0, 'misdemeanor'),
    ('Public Intoxication', 'Being drunk in public', 10, 0, 'infraction'),
    ('Disorderly Conduct', 'Disturbing the peace', 20, 0, 'misdemeanor'),
    ('Vandalism', 'Willful destruction of property', 30, 0, 'misdemeanor'),
    ('Fraud', 'Deception for personal gain', 150, 12, 'felony'),
    ('Murder', 'Unlawful killing of another person', 0, 60, 'felony'),
    ('Horse Theft', 'Stealing a horse or other mount', 200, 24, 'felony'),
    ('Bank Robbery', 'Robbery of a banking institution', 500, 48, 'felony'),
    ('Resisting Arrest', 'Resisting or fleeing from law enforcement', 50, 1, 'misdemeanor'),
    ('Obstruction of Justice', 'Interfering with law enforcement duties', 40, 0, 'misdemeanor');

-- Default Roles
INSERT IGNORE INTO `mdt_roles` (`name`, `label`, `permissions`) VALUES
    ('admin', 'Administrator', '{"canCreateRecords": true, "canDeleteRecords": true, "canManageWarrants": true, "isAdmin": true}'),
    ('supervisor', 'Supervisor', '{"canCreateRecords": true, "canDeleteRecords": true, "canManageWarrants": true, "isAdmin": false}'),
    ('officer', 'Officer', '{"canCreateRecords": true, "canDeleteRecords": false, "canManageWarrants": false, "isAdmin": false}');

CREATE TABLE IF NOT EXISTS `player_samples` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `citizenid` varchar(50) NOT NULL,
    `sample_id` varchar(50) NOT NULL,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_citizenid_sampleid` (`citizenid`,`sample_id`),
    KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `player_goldrockers` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `citizenid` varchar(50) DEFAULT NULL,
    `owner` varchar(50) DEFAULT NULL,
    `properties` text NOT NULL,
    `propid` int(11) NOT NULL,
    `proptype` varchar(50) DEFAULT NULL,
    `licensed` tinyint(1) NOT NULL DEFAULT 0,
    `claimname` varchar(100) DEFAULT NULL,
    `paydirt` int(3) NOT NULL DEFAULT 0,
    `water` int(3) NOT NULL DEFAULT 0,
    `quality` int(3) NOT NULL DEFAULT 100,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `player_smelter` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `citizenid` varchar(50) DEFAULT NULL,
    `properties` text NOT NULL,
    `propid` int(11) NOT NULL,
    `proptype` varchar(50) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_shops_npcs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `model` varchar(100) NOT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  `h` double NOT NULL,
  `shop_name` varchar(100) DEFAULT NULL,
  `shop_label` varchar(100) DEFAULT NULL,
  `shop_type` varchar(10) NOT NULL DEFAULT 'both',
  PRIMARY KEY (`id`),
  KEY `idx_shop_name` (`shop_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_shops_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `npc_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `label` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_npc_id` (`npc_id`),
  KEY `idx_item_name` (`item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_shops_blips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sprite` bigint(20) NOT NULL,
  `color` varchar(64) DEFAULT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  `associated_npc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_assoc_npc` (`associated_npc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_wagons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL DEFAULT '0',
  `wagon` varchar(50) NOT NULL DEFAULT '0',
  `custom` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom`)),
  `animals` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`animals`)),
  `active` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `railroad_trains` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `citizenid` VARCHAR(50) NOT NULL DEFAULT '',
    `company_id` VARCHAR(50) NOT NULL DEFAULT '',
    `train_model` VARCHAR(50) NOT NULL,
    `label` VARCHAR(100) NOT NULL DEFAULT '',
    `fuel` INT(11) NOT NULL DEFAULT 100,
    `water` INT(11) NOT NULL DEFAULT 100,
    `condition` INT(11) NOT NULL DEFAULT 100,
    `upgrade_speed` INT(11) NOT NULL DEFAULT 0,
    `upgrade_fuel_cap` INT(11) NOT NULL DEFAULT 0,
    `upgrade_water_cap` INT(11) NOT NULL DEFAULT 0,
    `upgrade_durability` INT(11) NOT NULL DEFAULT 0,
    `total_miles` FLOAT NOT NULL DEFAULT 0,
    `is_parked` TINYINT(1) NOT NULL DEFAULT 1,
    `parked_station` VARCHAR(50) DEFAULT NULL,
    `parked_direction` TINYINT(1) NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Legacy company membership (from v1)
CREATE TABLE IF NOT EXISTS `railroad_companies` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `citizenid` VARCHAR(50) NOT NULL DEFAULT '',
    `company_id` VARCHAR(50) NOT NULL DEFAULT '',
    `rank` INT(11) NOT NULL DEFAULT 1,
    `xp` INT(11) NOT NULL DEFAULT 0,
    `missions_completed` INT(11) NOT NULL DEFAULT 0,
    `total_earnings` FLOAT NOT NULL DEFAULT 0,
    `joined_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `idx_citizen_company` (`citizenid`, `company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `railroad_rewards` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `citizenid` VARCHAR(50) NOT NULL DEFAULT '',
    `reward_id` VARCHAR(50) NOT NULL DEFAULT '',
    `claimed_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `idx_citizen_reward` (`citizenid`, `reward_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `railroad_companies_owned` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `company_id` VARCHAR(50) NOT NULL,
    `owner_citizenid` VARCHAR(50) NOT NULL,
    `owner_name` VARCHAR(100) NOT NULL DEFAULT '',
    `company_name` VARCHAR(100) DEFAULT NULL,
    `cash_register` FLOAT NOT NULL DEFAULT 0,
    `purchased_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `idx_company` (`company_id`),
    INDEX `idx_owner` (`owner_citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `railroad_employees` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `company_id` VARCHAR(50) NOT NULL,
    `citizenid` VARCHAR(50) NOT NULL,
    `firstname` VARCHAR(50) DEFAULT '',
    `lastname` VARCHAR(50) DEFAULT '',
    `status` VARCHAR(20) NOT NULL DEFAULT 'pending',
    `xp` INT(11) NOT NULL DEFAULT 0,
    `rank` INT(11) NOT NULL DEFAULT 1,
    `missions_completed` INT(11) NOT NULL DEFAULT 0,
    `total_earnings` FLOAT NOT NULL DEFAULT 0,
    `applied_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `approved_at` TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `idx_company_citizen` (`company_id`, `citizenid`),
    INDEX `idx_citizenid` (`citizenid`),
    INDEX `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `railroad_company_upgrades` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `company_id` VARCHAR(50) NOT NULL,
    `train_model` VARCHAR(50) NOT NULL,
    `upgrade_speed` INT(11) NOT NULL DEFAULT 0,
    `upgrade_fuel_cap` INT(11) NOT NULL DEFAULT 0,
    `upgrade_water_cap` INT(11) NOT NULL DEFAULT 0,
    `upgrade_durability` INT(11) NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `idx_company_model` (`company_id`, `train_model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `railroad_company_supplies` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `company_id` VARCHAR(50) NOT NULL,
    `item_name` VARCHAR(50) NOT NULL,
    `quantity` INT(11) NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `idx_company_item` (`company_id`, `item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `player_dogs` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `identifier` VARCHAR(50) NOT NULL,
    `charid` INT(11) NOT NULL,
    `model` VARCHAR(255) NOT NULL,
    `preset` INT(11) NOT NULL DEFAULT '0',
    `xp` INT(11) NOT NULL DEFAULT '0',
    `price` INT(11) NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `player_birds` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `identifier` VARCHAR(50) NOT NULL,
    `charid` INT(11) NOT NULL,
    `model` VARCHAR(255) NOT NULL,
    `preset` INT(11) NOT NULL DEFAULT '0',
    `xp` INT(11) NOT NULL DEFAULT '0',
    `price` INT(11) NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `player_selected_pets`;

CREATE TABLE `player_selected_pets` (
    `identifier` VARCHAR(50) NOT NULL,
    `charid` INT(11) NOT NULL,
    `selected_dog` INT(11) DEFAULT NULL,
    `selected_bird` INT(11) DEFAULT NULL,
    UNIQUE KEY `uc_player` (`identifier`, `charid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_trapdoors` (
    `door_id`    VARCHAR(64) NOT NULL,
    `passcode`   CHAR(4)     NOT NULL,
    `owner`      VARCHAR(50) NOT NULL,
    `updated_at` TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`door_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_cooking_campfires` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `citizenid` VARCHAR(50) NOT NULL,
    `x` FLOAT NOT NULL,
    `y` FLOAT NOT NULL,
    `z` FLOAT NOT NULL,
    `heading` FLOAT NOT NULL DEFAULT 0,
    `expires` INT UNSIGNED NULL DEFAULT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `idx_citizenid` (`citizenid`)
);

CREATE TABLE IF NOT EXISTS `player_backpack` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `serial` VARCHAR(32) NOT NULL,
    `citizenid` VARCHAR(50) DEFAULT NULL,
    `owner` VARCHAR(50) DEFAULT NULL,
    `backpackitem` VARCHAR(50) NOT NULL,
    `model` VARCHAR(100) DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `serial` (`serial`),
    KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_lumberjack_trees` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `identifier` VARCHAR(64) NOT NULL,
    `owner_citizenid` VARCHAR(50) NOT NULL,
    `x` DOUBLE NOT NULL,
    `y` DOUBLE NOT NULL,
    `z` DOUBLE NOT NULL,
    `heading` FLOAT NOT NULL DEFAULT 0,
    `model` VARCHAR(64) NOT NULL DEFAULT 'p_tree_birch_01_sapling',
    `stage` TINYINT UNSIGNED NOT NULL DEFAULT 1,
    `state` ENUM('planted','growing','ready','chopped') NOT NULL DEFAULT 'planted',
    `watered` TINYINT(1) NOT NULL DEFAULT 0,
    `fertilized` TINYINT(1) NOT NULL DEFAULT 0,
    `planted_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `next_stage_at` DATETIME NULL,
    PRIMARY KEY (`id`),
    INDEX `idx_stage` (`stage`),
    INDEX `idx_state` (`state`),
    INDEX `idx_owner` (`owner_citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `admin_roles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `license` VARCHAR(100) DEFAULT NULL,
  `discord` VARCHAR(50) DEFAULT NULL,
  `name` VARCHAR(255) DEFAULT NULL,
  `role` VARCHAR(20) NOT NULL,
  `granted_by` VARCHAR(255) DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `admin_logs` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(20) NOT NULL,
  `severity` VARCHAR(10) NOT NULL DEFAULT 'low',
  `admin_citizenid` VARCHAR(50) DEFAULT NULL,
  `admin_name` VARCHAR(255) DEFAULT NULL,
  `action` VARCHAR(255) NOT NULL,
  `details` VARCHAR(500) DEFAULT NULL,
  `target_name` VARCHAR(255) DEFAULT NULL,
  `ip` VARCHAR(50) DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  KEY `admin_citizenid` (`admin_citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `admin_player_history` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `action` VARCHAR(20) NOT NULL,
  `reason` VARCHAR(255) DEFAULT NULL,
  `admin_name` VARCHAR(255) DEFAULT NULL,
  `duration_seconds` INT(11) DEFAULT NULL,
  `severity` VARCHAR(20) DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `admin_chat_messages` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `sender_citizenid` VARCHAR(50) DEFAULT NULL,
  `sender_name` VARCHAR(255) NOT NULL,
  `sender_role` VARCHAR(20) DEFAULT NULL,
  `sender_discord_name` VARCHAR(255) DEFAULT NULL,
  `sender_discord_avatar_url` VARCHAR(500) DEFAULT NULL,
  `message` VARCHAR(500) NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `admin_reports` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `report_type` VARCHAR(50) NOT NULL,
  `severity` VARCHAR(20) DEFAULT 'medium',
  `reporter_id` INT(11) NOT NULL,
  `reporter_name` VARCHAR(255) NOT NULL,
  `reporter_license` VARCHAR(255) NOT NULL,
  `reporter_steam` VARCHAR(50) DEFAULT NULL,
  `reporter_discord` VARCHAR(255) DEFAULT NULL,
  `reporter_coords` VARCHAR(255) NOT NULL,
  `reported_player_id` INT(11) DEFAULT NULL,
  `reported_player_name` VARCHAR(255) DEFAULT NULL,
  `reported_player_license` VARCHAR(255) DEFAULT NULL,
  `reported_player_discord` VARCHAR(255) DEFAULT NULL,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `image_url` VARCHAR(500) DEFAULT NULL,
  `status` VARCHAR(50) DEFAULT 'open',
  `assigned_admin_id` INT(11) DEFAULT NULL,
  `assigned_admin_name` VARCHAR(255) DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `admin_report_messages` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `report_id` INT(11) NOT NULL,
  `sender_type` VARCHAR(50) NOT NULL,
  `sender_id` INT(11) NOT NULL,
  `sender_name` VARCHAR(255) NOT NULL,
  `message` TEXT NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`report_id`) REFERENCES `admin_reports`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `admin_report_nearby_players` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `report_id` INT(11) NOT NULL,
  `player_id` INT(11) NOT NULL,
  `player_name` VARCHAR(255) NOT NULL,
  `player_license` VARCHAR(255) NOT NULL,
  `distance` FLOAT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`report_id`) REFERENCES `admin_reports`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `admin_whitelist` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `player_name` VARCHAR(255) NOT NULL,
  `account_name` VARCHAR(255) DEFAULT NULL,
  `status` VARCHAR(20) NOT NULL DEFAULT 'active',
  `reason` VARCHAR(255) DEFAULT NULL,
  `added_by_name` VARCHAR(255) DEFAULT NULL,
  `expires_at` TIMESTAMP NULL DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `player_playtime` (
  `citizenid` VARCHAR(50) NOT NULL,
  `minutes` INT(11) NOT NULL DEFAULT 0,
  `last_seen` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `admin_activity_log` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `sample_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `online_count` INT(11) NOT NULL DEFAULT 0,
  `total_money` DECIMAL(15,2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `adminmenu_teleports` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `category` VARCHAR(30) NOT NULL DEFAULT 'special',
  `description` VARCHAR(255) DEFAULT NULL,
  `x` FLOAT NOT NULL,
  `y` FLOAT NOT NULL,
  `z` FLOAT NOT NULL,
  `heading` FLOAT NOT NULL DEFAULT 0,
  `created_by` VARCHAR(255) DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `adminmenu_blips` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `sprite` VARCHAR(50) NOT NULL,
  `x` FLOAT NOT NULL,
  `y` FLOAT NOT NULL,
  `z` FLOAT NOT NULL,
  `scale` FLOAT NOT NULL DEFAULT 1,
  `created_by` VARCHAR(255) DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `adminmenu_settings` (
  `setting_key` VARCHAR(64) NOT NULL,
  `setting_value` TEXT,
  PRIMARY KEY (`setting_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `adminmenu_custom_items` (
  `name` VARCHAR(64) NOT NULL,
  `label` VARCHAR(100) NOT NULL,
  `description` VARCHAR(255) DEFAULT NULL,
  `weight` INT(11) NOT NULL DEFAULT 0,
  `type` VARCHAR(20) NOT NULL DEFAULT 'item',
  `image` VARCHAR(150) NOT NULL,
  `created_by` VARCHAR(255) DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_mining` (
    `mine`      VARCHAR(50) NOT NULL,
    `citizenid` VARCHAR(50) NULL DEFAULT NULL,
    `expires`   INT NOT NULL DEFAULT 0,
    `wages`     INT NOT NULL DEFAULT 0,
    `supplies`  LONGTEXT NULL,
    `storage`   LONGTEXT NULL,
    PRIMARY KEY (`mine`)
);

CREATE TABLE IF NOT EXISTS `rsg_mining_workers` (
    `id`      INT NOT NULL AUTO_INCREMENT,
    `mine`    VARCHAR(50) NOT NULL,
    `name`    VARCHAR(100) NOT NULL,
    `skill`   FLOAT NOT NULL DEFAULT 1,
    `food`    INT NOT NULL DEFAULT 100,
    `water`   INT NOT NULL DEFAULT 100,
    `pickaxe` INT NOT NULL DEFAULT 0,
    `status`  VARCHAR(50) NOT NULL DEFAULT 'idle',
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `rsg_trader` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `traderid` varchar(50) NOT NULL,
  `item` varchar(50) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `lowstock` int(11) NOT NULL DEFAULT 0,
  `highstock` int(11) NOT NULL DEFAULT 0,
  `baseprice` decimal(11,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trader_item` (`traderid`, `item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_trader_npcs` (
  `traderid` varchar(50) NOT NULL,
  `tradername` varchar(50) NOT NULL,
  `npcmodel` varchar(60) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `heading` float NOT NULL DEFAULT 0,
  `showblip` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`traderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_stables_horses` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `stable` VARCHAR(50) DEFAULT NULL,
  `model` VARCHAR(100) NOT NULL,
  `breed_label` VARCHAR(100) NOT NULL,
  `name` VARCHAR(50) NOT NULL DEFAULT 'Unnamed Horse',
  `outfit` INT(11) NOT NULL DEFAULT 0,
  `tack` TEXT DEFAULT NULL,
  `coat` TEXT DEFAULT NULL,
  `health` FLOAT NOT NULL DEFAULT 100,
  `stamina` FLOAT NOT NULL DEFAULT 100,
  `hunger` FLOAT NOT NULL DEFAULT 100,
  `thirst` FLOAT NOT NULL DEFAULT 100,
  `bonding` FLOAT NOT NULL DEFAULT 0,
  `speed` INT(11) NOT NULL DEFAULT 50,
  `accel` INT(11) NOT NULL DEFAULT 50,
  `handling` INT(11) NOT NULL DEFAULT 50,
  `maxhealth` INT(11) NOT NULL DEFAULT 50,
  `alive` TINYINT(1) NOT NULL DEFAULT 1,
  `insured` TINYINT(1) NOT NULL DEFAULT 0,
  `active` TINYINT(1) NOT NULL DEFAULT 0,
  `pos_x` FLOAT DEFAULT NULL,
  `pos_y` FLOAT DEFAULT NULL,
  `pos_z` FLOAT DEFAULT NULL,
  `pos_h` FLOAT DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `stable` (`stable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_stables_breeding` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `stable` VARCHAR(50) NOT NULL,
  `parent_a` INT(11) NOT NULL,
  `parent_b` INT(11) NOT NULL,
  `ready_at` BIGINT(20) NOT NULL,
  `collected` TINYINT(1) NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `stable` (`stable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_telegrams` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `citizenid` VARCHAR(50) NOT NULL,
    `recipient_name` VARCHAR(100) NOT NULL,
    `sender_citizenid` VARCHAR(50) NOT NULL,
    `sender_name` VARCHAR(100) NOT NULL,
    `subject` VARCHAR(100) NOT NULL,
    `message` TEXT NOT NULL,
    `is_read` TINYINT(1) NOT NULL DEFAULT 0,
    `sent_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_telegram_contacts` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `citizenid` VARCHAR(50) NOT NULL,
    `contact_citizenid` VARCHAR(50) NOT NULL,
    `contact_name` VARCHAR(100) NOT NULL,
    `nickname` VARCHAR(50) NULL DEFAULT NULL,
    `added_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uniq_contact` (`citizenid`, `contact_citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_farming_plants` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `citizenid` VARCHAR(50) NOT NULL,
    `crop` VARCHAR(50) NOT NULL,
    `x` FLOAT NOT NULL,
    `y` FLOAT NOT NULL,
    `z` FLOAT NOT NULL,
    `h` FLOAT NOT NULL DEFAULT 0,
    `growth` FLOAT NOT NULL DEFAULT 0,
    `water` FLOAT NOT NULL DEFAULT 0,
    `fertilizer` FLOAT NOT NULL DEFAULT 0,
    `health` FLOAT NOT NULL DEFAULT 100,
    `dead` TINYINT(1) NOT NULL DEFAULT 0,
    `dead_time` INT(11) NOT NULL DEFAULT 0,
    `planted_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_farming_wellpumps` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `citizenid` VARCHAR(50) NOT NULL,
    `x` FLOAT NOT NULL,
    `y` FLOAT NOT NULL,
    `z` FLOAT NOT NULL,
    `h` FLOAT NOT NULL DEFAULT 0,
    `placed_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
