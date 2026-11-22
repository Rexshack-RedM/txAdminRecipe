-- database structure for rsg-framework

SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `weight` int(11) DEFAULT 35000,
  `slots` int(11) DEFAULT 25,
  `outlawstatus` int(11) NOT NULL DEFAULT 0,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'Unknown',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `multijob_jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(100) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `default_duty` tinyint(1) NOT NULL DEFAULT 1,
  `off_duty_pay` tinyint(1) NOT NULL DEFAULT 0,
  `grades` longtext NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT IGNORE INTO `multijob_jobs` (`name`, `label`, `type`, `icon`, `default_duty`, `off_duty_pay`, `grades`, `updated_at`) VALUES
	('blklaw', 'Blackwater Law Enforcement', 'leo', 'fa-solid fa-shield', 0, 0, '{"1":{"payment":25,"name":"Deputy"},"2":{"payment":50,"isboss":true,"name":"Sheriff"},"0":{"payment":10,"name":"Recruit"}}', '2026-10-14 13:26:58'),
	('downesranch', 'Downes Rancher', 'rancher', NULL, 1, 0, '{"1":{"payment":5,"name":"Ranch Hand"},"2":{"payment":0,"isboss":true,"name":"Ranch Manager"},"0":{"payment":3,"name":"Trainee Rancher"}}', '2026-10-14 13:26:58'),
	('emeraldranch', 'Emerald Rancher', 'rancher', NULL, 1, 0, '{"1":{"payment":5,"name":"Ranch Hand"},"2":{"payment":0,"isboss":true,"name":"Ranch Manager"},"0":{"payment":3,"name":"Trainee Rancher"}}', '2026-10-14 13:26:58'),
	('hangingdogranch', 'Hanging Dog Rancher', 'rancher', NULL, 1, 0, '{"1":{"payment":5,"name":"Ranch Hand"},"2":{"payment":0,"isboss":true,"name":"Ranch Manager"},"0":{"payment":3,"name":"Trainee Rancher"}}', '2026-10-14 13:26:58'),
	('herbalist', 'Herbalist', NULL, NULL, 1, 0, '{"1":{"payment":0,"isboss":true,"name":"Master"},"0":{"payment":0,"name":"Apprentice"}}', '2026-10-14 13:26:58'),
	('hillhavenranch', 'Hill Haven Rancher', 'rancher', NULL, 1, 0, '{"1":{"payment":5,"name":"Ranch Hand"},"2":{"payment":0,"isboss":true,"name":"Ranch Manager"},"0":{"payment":3,"name":"Trainee Rancher"}}', '2026-10-14 13:26:58'),
	('macfarranch', 'Macfarlane Rancher', 'rancher', NULL, 1, 0, '{"1":{"payment":5,"name":"Ranch Hand"},"2":{"payment":0,"isboss":true,"name":"Ranch Manager"},"0":{"payment":3,"name":"Trainee Rancher"}}', '2026-10-14 13:26:58'),
	('medic', 'Medic', 'medic', 'fa-solid fa-user-nurse', 0, 0, '{"1":{"payment":25,"name":"Trainee"},"2":{"payment":50,"name":"Doctor"},"0":{"payment":5,"name":"Recruit"},"3":{"payment":75,"name":"Surgeon"},"4":{"payment":100,"isboss":true,"name":"Manager"}}', '2026-10-14 13:26:58'),
	('pronghornranch', 'Pronghorn Rancher', 'rancher', NULL, 1, 0, '{"1":{"payment":5,"name":"Ranch Hand"},"2":{"payment":0,"isboss":true,"name":"Ranch Manager"},"0":{"payment":3,"name":"Trainee Rancher"}}', '2026-10-14 13:26:58'),
	('rholaw', 'Rhodes Law Enforcement', 'leo', 'fa-solid fa-shield', 0, 0, '{"1":{"payment":25,"name":"Deputy"},"2":{"payment":50,"isboss":true,"name":"Sheriff"},"0":{"payment":10,"name":"Recruit"}}', '2026-10-14 13:26:58'),
	('stdenlaw', 'Saint Denis Law Enforcement', 'leo', 'fa-solid fa-shield', 0, 0, '{"1":{"payment":25,"name":"Deputy"},"2":{"payment":50,"isboss":true,"name":"Sheriff"},"0":{"payment":10,"name":"Recruit"}}', '2026-10-14 13:26:58'),
	('strlaw', 'Strawberry Law Enforcement', 'leo', 'fa-solid fa-shield', 0, 0, '{"1":{"payment":25,"name":"Deputy"},"2":{"payment":50,"isboss":true,"name":"Sheriff"},"0":{"payment":10,"name":"Recruit"}}', '2026-10-14 13:26:58'),
	('unemployed', 'Civilian', NULL, NULL, 1, 0, '{"0":{"payment":3,"name":"Freelancer"}}', '2026-10-14 13:26:58'),
	('vallaw', 'Valentine Law Enforcement', 'leo', 'fa-solid fa-shield', 0, 0, '{"1":{"payment":25,"name":"Deputy"},"2":{"payment":50,"isboss":true,"name":"Sheriff"},"0":{"payment":10,"name":"Recruit"}}', '2026-10-14 13:26:58');

CREATE TABLE IF NOT EXISTS `player_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `job` varchar(50) NOT NULL,
  `grade` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_player_job` (`citizenid`,`job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `inventories` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `identifier` VARCHAR(100) NOT NULL,
    `items` LONGTEXT NULL,
    PRIMARY KEY (`identifier`),
    KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `shop_stock` (
    `shop_name` VARCHAR(100) NOT NULL,
    `item_name` VARCHAR(100) NOT NULL,
    `stock` INT NOT NULL DEFAULT 0,
    PRIMARY KEY (`shop_name`, `item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `inventory_stash_log` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `stash` VARCHAR(100) NOT NULL,
    `citizenid` VARCHAR(50) NOT NULL DEFAULT '',
    `name` VARCHAR(100) NOT NULL DEFAULT '',
    `action` VARCHAR(8) NOT NULL,
    `item` VARCHAR(100) NOT NULL,
    `amount` INT NOT NULL DEFAULT 1,
    `time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `stash_idx` (`stash`, `id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `inventory_drops` (
    `id` VARCHAR(64) NOT NULL,
    `coords` VARCHAR(120) NOT NULL,
    `items` LONGTEXT NULL,
    `touched` INT NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `admin_activity_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sample_time` timestamp NULL DEFAULT current_timestamp(),
  `online_count` int(11) NOT NULL DEFAULT 0,
  `total_money` decimal(15,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `admin_chat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_citizenid` varchar(50) DEFAULT NULL,
  `sender_name` varchar(255) NOT NULL,
  `sender_role` varchar(20) DEFAULT NULL,
  `sender_discord_name` varchar(255) DEFAULT NULL,
  `sender_discord_avatar_url` varchar(500) DEFAULT NULL,
  `message` varchar(500) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `admin_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(20) NOT NULL,
  `severity` varchar(10) NOT NULL DEFAULT 'low',
  `admin_citizenid` varchar(50) DEFAULT NULL,
  `admin_name` varchar(255) DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `details` varchar(500) DEFAULT NULL,
  `target_name` varchar(255) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  KEY `admin_citizenid` (`admin_citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `admin_player_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `action` varchar(20) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `admin_name` varchar(255) DEFAULT NULL,
  `duration_seconds` int(11) DEFAULT NULL,
  `severity` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `admin_report_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `sender_type` varchar(50) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `report_id` (`report_id`),
  CONSTRAINT `admin_report_messages_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `admin_reports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `admin_report_nearby_players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `player_license` varchar(255) NOT NULL,
  `distance` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_id` (`report_id`),
  CONSTRAINT `admin_report_nearby_players_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `admin_reports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `admin_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_type` varchar(50) NOT NULL,
  `reporter_id` int(11) NOT NULL,
  `reporter_name` varchar(255) NOT NULL,
  `reporter_license` varchar(255) NOT NULL,
  `reporter_discord` varchar(255) DEFAULT NULL,
  `reporter_coords` varchar(255) NOT NULL,
  `reported_player_id` int(11) DEFAULT NULL,
  `reported_player_name` varchar(255) DEFAULT NULL,
  `reported_player_license` varchar(255) DEFAULT NULL,
  `reported_player_discord` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'open',
  `assigned_admin_id` int(11) DEFAULT NULL,
  `assigned_admin_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reporter_steam` varchar(50) DEFAULT NULL,
  `severity` varchar(20) DEFAULT 'medium',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `admin_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `license` varchar(100) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `granted_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `admin_whitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'active',
  `reason` varchar(255) DEFAULT NULL,
  `added_by_name` varchar(255) DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `adminmenu_blips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sprite` varchar(50) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `scale` float NOT NULL DEFAULT 1,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `adminmenu_custom_items` (
  `name` varchar(64) NOT NULL,
  `label` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `type` varchar(20) NOT NULL DEFAULT 'item',
  `image` varchar(150) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `adminmenu_settings` (
  `setting_key` varchar(64) NOT NULL,
  `setting_value` text DEFAULT NULL,
  PRIMARY KEY (`setting_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `adminmenu_teleports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `category` varchar(30) NOT NULL DEFAULT 'special',
  `description` varchar(255) DEFAULT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `heading` float NOT NULL DEFAULT 0,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `favorites_animations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `favorites` longtext NOT NULL DEFAULT '[]',
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `hunting_weekly` (
  `citizenid` varchar(50) NOT NULL,
  `week` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `xp` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`citizenid`,`week`),
  KEY `week_xp` (`week`,`xp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `hunting_weekly_rewards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `week` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `cash` decimal(10,2) NOT NULL DEFAULT 0.00,
  `claimed` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cid_week` (`citizenid`,`week`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `hunting_weekly_state` (
  `key` varchar(50) NOT NULL,
  `value` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `management_funds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL,
  `type` enum('boss','gang') NOT NULL DEFAULT 'boss',
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_name` (`job_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO `management_funds` (`id`, `job_name`, `amount`, `type`) VALUES
	(1, 'vallaw', 0, 'boss'),
	(2, 'rholaw', 0, 'boss'),
	(3, 'blklaw', 0, 'boss'),
	(4, 'strlaw', 0, 'boss'),
	(5, 'stdenlaw', 0, 'boss'),
	(6, 'medic', 0, 'boss');

CREATE TABLE IF NOT EXISTS `mdt_audit_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(50) NOT NULL,
  `target_type` varchar(50) DEFAULT NULL,
  `target_id` varchar(100) DEFAULT NULL,
  `target_name` varchar(100) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `performed_by` varchar(50) NOT NULL,
  `performed_by_name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_action` (`action`),
  KEY `idx_performed_by` (`performed_by`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_bolos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `last_seen` varchar(255) DEFAULT NULL,
  `officer` varchar(100) NOT NULL,
  `officer_cid` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_charge_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charge_id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `attached_by` varchar(50) NOT NULL,
  `attached_by_name` varchar(100) NOT NULL,
  `attached_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_charge_report` (`charge_id`,`report_id`),
  KEY `idx_charge_id` (`charge_id`),
  KEY `idx_report_id` (`report_id`),
  CONSTRAINT `mdt_charge_attachments_ibfk_1` FOREIGN KEY (`charge_id`) REFERENCES `mdt_issued_charges` (`id`) ON DELETE CASCADE,
  CONSTRAINT `mdt_charge_attachments_ibfk_2` FOREIGN KEY (`report_id`) REFERENCES `mdt_reports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_charge_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `fine` int(11) DEFAULT 0,
  `jailtime` int(11) DEFAULT 0,
  `category` varchar(50) DEFAULT 'misdemeanor',
  `created_by` varchar(50) DEFAULT NULL,
  `created_by_name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_category` (`category`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO `mdt_charge_templates` (`id`, `name`, `description`, `fine`, `jailtime`, `category`, `created_by`, `created_by_name`, `created_at`, `updated_at`) VALUES
	(1, 'Assault', 'Physical assault on another person', 50, 2, 'felony', NULL, NULL, '2026-10-10 18:26:58', '2026-10-10 18:26:58'),
	(2, 'Battery', 'Unlawful physical force against another', 75, 3, 'felony', NULL, NULL, '2026-10-10 18:26:58', '2026-10-10 18:26:58'),
	(3, 'Theft', 'Stealing property valued under $50', 25, 0, 'misdemeanor', NULL, NULL, '2026-10-10 18:26:58', '2026-10-10 18:26:58'),
	(4, 'Grand Theft', 'Stealing property valued $50 or more', 100, 6, 'felony', NULL, NULL, '2026-10-10 18:26:58', '2026-10-10 18:26:58'),
	(5, 'Trespassing', 'Unauthorized entry onto private property', 15, 0, 'misdemeanor', NULL, NULL, '2026-10-10 18:26:58', '2026-10-10 18:26:58'),
	(6, 'Public Intoxication', 'Being drunk in public', 10, 0, 'infraction', NULL, NULL, '2026-10-10 18:26:58', '2026-10-10 18:26:58'),
	(7, 'Disorderly Conduct', 'Disturbing the peace', 20, 0, 'misdemeanor', NULL, NULL, '2026-10-10 18:26:58', '2026-10-10 18:26:58'),
	(8, 'Vandalism', 'Willful destruction of property', 30, 0, 'misdemeanor', NULL, NULL, '2026-10-10 18:26:58', '2026-10-10 18:26:58'),
	(9, 'Fraud', 'Deception for personal gain', 150, 12, 'felony', NULL, NULL, '2026-10-10 18:26:58', '2026-10-10 18:26:58'),
	(10, 'Murder', 'Unlawful killing of another person', 0, 60, 'felony', NULL, NULL, '2026-10-10 18:26:58', '2026-10-10 18:26:58'),
	(11, 'Horse Theft', 'Stealing a horse or other mount', 200, 24, 'felony', NULL, NULL, '2026-10-10 18:26:58', '2026-10-10 18:26:58'),
	(12, 'Bank Robbery', 'Robbery of a banking institution', 500, 48, 'felony', NULL, NULL, '2026-10-10 18:26:58', '2026-10-10 18:26:58'),
	(13, 'Resisting Arrest', 'Resisting or fleeing from law enforcement', 50, 1, 'misdemeanor', NULL, NULL, '2026-10-10 18:26:58', '2026-10-10 18:26:58'),
	(14, 'Obstruction of Justice', 'Interfering with law enforcement duties', 40, 0, 'misdemeanor', NULL, NULL, '2026-10-10 18:26:58', '2026-10-10 18:26:58');

CREATE TABLE IF NOT EXISTS `mdt_citizen_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `profile_picture` varchar(512) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_fines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `citizen_name` varchar(100) NOT NULL,
  `issued_charge_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`issued_charge_ids`)),
  `total_amount` int(11) NOT NULL DEFAULT 0,
  `due_date` timestamp NULL DEFAULT NULL,
  `status` enum('unpaid','paid','overdue') DEFAULT 'unpaid',
  `issued_at` timestamp NULL DEFAULT current_timestamp(),
  `paid_at` timestamp NULL DEFAULT NULL,
  `officer_name` varchar(100) DEFAULT NULL,
  `officer_cid` varchar(50) DEFAULT NULL,
  `paid_to_officer` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`),
  KEY `idx_status` (`status`),
  KEY `idx_due_date` (`due_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_issued_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `citizen_name` varchar(100) NOT NULL,
  `charge_template_id` int(11) DEFAULT NULL,
  `charge_name` varchar(255) NOT NULL,
  `charge_description` text DEFAULT NULL,
  `fine` int(11) DEFAULT 0,
  `jailtime` int(11) DEFAULT 0,
  `time_served` int(11) DEFAULT 0,
  `is_served` tinyint(1) DEFAULT 0,
  `officer` varchar(100) NOT NULL,
  `officer_cid` varchar(50) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `served_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`),
  KEY `idx_officer` (`officer`),
  KEY `idx_is_served` (`is_served`),
  KEY `charge_template_id` (`charge_template_id`),
  CONSTRAINT `mdt_issued_charges_ibfk_1` FOREIGN KEY (`charge_template_id`) REFERENCES `mdt_charge_templates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `crime` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `fine` int(11) DEFAULT 0,
  `jailtime` int(11) DEFAULT 0,
  `officer` varchar(100) NOT NULL,
  `officer_cid` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_report_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `author` varchar(100) NOT NULL,
  `author_cid` varchar(50) DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_report_id` (`report_id`),
  CONSTRAINT `mdt_report_comments_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `mdt_reports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `type` varchar(50) DEFAULT 'incident',
  `description` text DEFAULT NULL,
  `officers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`officers`)),
  `suspects` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`suspects`)),
  `evidence` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`evidence`)),
  `officer` varchar(100) NOT NULL,
  `officer_cid` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_type` (`type`),
  KEY `idx_officer` (`officer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `label` varchar(100) NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO `mdt_roles` (`id`, `name`, `label`, `permissions`, `created_at`) VALUES
	(1, 'admin', 'Administrator', '{"canCreateRecords": true, "canDeleteRecords": true, "canManageWarrants": true, "isAdmin": true}', '2026-10-10 18:26:58'),
	(2, 'supervisor', 'Supervisor', '{"canCreateRecords": true, "canDeleteRecords": true, "canManageWarrants": true, "isAdmin": false}', '2026-10-10 18:26:58'),
	(3, 'officer', 'Officer', '{"canCreateRecords": true, "canDeleteRecords": false, "canManageWarrants": false, "isAdmin": false}', '2026-10-10 18:26:58');

CREATE TABLE IF NOT EXISTS `mdt_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `role` varchar(50) DEFAULT 'officer',
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_warrants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `reason` text NOT NULL,
  `status` enum('active','served','expired') DEFAULT 'active',
  `officer` varchar(100) NOT NULL,
  `officer_cid` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `player_ammo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `ammo_revolver` int(3) NOT NULL DEFAULT 0,
  `ammo_revolver_express` int(3) NOT NULL DEFAULT 0,
  `ammo_revolver_express_explosive` int(3) NOT NULL DEFAULT 0,
  `ammo_revolver_high_velocity` int(3) NOT NULL DEFAULT 0,
  `ammo_revolver_split_point` int(3) NOT NULL DEFAULT 0,
  `ammo_pistol` int(3) NOT NULL DEFAULT 0,
  `ammo_pistol_express` int(3) NOT NULL DEFAULT 0,
  `ammo_pistol_express_explosive` int(3) NOT NULL DEFAULT 0,
  `ammo_pistol_high_velocity` int(3) NOT NULL DEFAULT 0,
  `ammo_pistol_split_point` int(3) NOT NULL DEFAULT 0,
  `ammo_repeater` int(3) NOT NULL DEFAULT 0,
  `ammo_repeater_express` int(3) NOT NULL DEFAULT 0,
  `ammo_repeater_express_explosive` int(3) NOT NULL DEFAULT 0,
  `ammo_repeater_high_velocity` int(3) NOT NULL DEFAULT 0,
  `ammo_repeater_split_point` int(3) NOT NULL DEFAULT 0,
  `ammo_rifle` int(3) NOT NULL DEFAULT 0,
  `ammo_rifle_express` int(3) NOT NULL DEFAULT 0,
  `ammo_rifle_express_explosive` int(3) NOT NULL DEFAULT 0,
  `ammo_rifle_high_velocity` int(3) NOT NULL DEFAULT 0,
  `ammo_rifle_split_point` int(3) NOT NULL DEFAULT 0,
  `ammo_shotgun` int(3) NOT NULL DEFAULT 0,
  `ammo_shotgun_buckshot_incendiary` int(3) NOT NULL DEFAULT 0,
  `ammo_shotgun_slug` int(3) NOT NULL DEFAULT 0,
  `ammo_shotgun_slug_explosive` int(3) NOT NULL DEFAULT 0,
  `ammo_rifle_elephant` int(3) NOT NULL DEFAULT 0,
  `ammo_22` int(3) NOT NULL DEFAULT 0,
  `ammo_22_tranquilizer` int(3) NOT NULL DEFAULT 0,
  `ammo_arrow` int(3) NOT NULL DEFAULT 0,
  `ammo_arrow_small_game` int(3) NOT NULL DEFAULT 0,
  `ammo_arrow_fire` int(3) NOT NULL DEFAULT 0,
  `ammo_arrow_poison` int(3) NOT NULL DEFAULT 0,
  `ammo_arrow_dynamite` int(3) NOT NULL DEFAULT 0,
  `ammo_molotov` int(3) NOT NULL DEFAULT 0,
  `ammo_tomahawk` int(3) NOT NULL DEFAULT 0,
  `ammo_tomahawk_ancient` int(3) NOT NULL DEFAULT 0,
  `ammo_dynamite` int(3) NOT NULL DEFAULT 0,
  `ammo_poisonbottle` int(3) NOT NULL DEFAULT 0,
  `ammo_throwing_knives` int(3) NOT NULL DEFAULT 0,
  `ammo_throwing_knives_drain` int(3) NOT NULL DEFAULT 0,
  `ammo_throwing_knives_poison` int(3) NOT NULL DEFAULT 0,
  `ammo_bolas` int(3) NOT NULL DEFAULT 0,
  `ammo_bolas_hawkmoth` int(3) NOT NULL DEFAULT 0,
  `ammo_bolas_intertwined` int(3) NOT NULL DEFAULT 0,
  `ammo_bolas_ironspiked` int(3) NOT NULL DEFAULT 0,
  `ammo_hatchet` int(3) NOT NULL DEFAULT 0,
  `ammo_hatchet_hunter` int(3) NOT NULL DEFAULT 0,
  `ammo_hatchet_cleaver` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `citizenid` (`citizenid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `player_backpack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(32) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `backpackitem` varchar(50) NOT NULL,
  `model` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial` (`serial`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `player_birds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `charid` int(11) NOT NULL,
  `model` varchar(255) NOT NULL,
  `preset` int(11) NOT NULL DEFAULT 0,
  `xp` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `player_dogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `charid` int(11) NOT NULL,
  `model` varchar(255) NOT NULL,
  `preset` int(11) NOT NULL DEFAULT 0,
  `xp` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `player_goldrockers` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `player_playtime` (
  `citizenid` varchar(50) NOT NULL,
  `minutes` int(11) NOT NULL DEFAULT 0,
  `last_seen` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `player_samples` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `sample_id` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_citizenid_sampleid` (`citizenid`,`sample_id`),
  KEY `idx_citizenid` (`citizenid`),
  KEY `idx_sample_id` (`sample_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `player_selected_pets` (
  `identifier` varchar(50) NOT NULL,
  `charid` int(11) NOT NULL,
  `selected_dog` int(11) DEFAULT NULL,
  `selected_bird` int(11) DEFAULT NULL,
  UNIQUE KEY `uc_player` (`identifier`,`charid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `player_wagons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `name` varchar(40) NOT NULL,
  `wagon_condition` int(11) NOT NULL DEFAULT 100,
  `store` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `livery` int(11) NOT NULL DEFAULT -1,
  `tint` int(11) NOT NULL DEFAULT -1,
  `propset` varchar(64) DEFAULT NULL,
  `lantern` varchar(64) DEFAULT NULL,
  `cargo` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `player_weapons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(16) NOT NULL,
  `citizenid` varchar(9) NOT NULL,
  `components` varchar(4096) NOT NULL DEFAULT '{}',
  `components_before` varchar(4096) NOT NULL DEFAULT '{}',
  `price` decimal(5,2) NOT NULL DEFAULT 0.00,
  `town` int(11) NOT NULL DEFAULT 0,
  `customname` varchar(32) NULL DEFAULT NULL,
  `engraving` varchar(64) NULL DEFAULT NULL,
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

CREATE TABLE IF NOT EXISTS `player_weapons_presets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `weapon` varchar(64) NOT NULL,
  `name` varchar(32) NOT NULL,
  `components` varchar(4096) NOT NULL DEFAULT '{}',
  PRIMARY KEY (`id`),
  KEY `idx_citizen_weapon` (`citizenid`, `weapon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `playeroutfit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `clothes` longtext DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `skin` longtext NOT NULL,
  `clothes` longtext NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `citizenid` (`citizenid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
    `wage_percent` TINYINT UNSIGNED NOT NULL DEFAULT 0,
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

CREATE TABLE IF NOT EXISTS `rsg_auction_bids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auction_id` varchar(50) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `player_name` varchar(100) NOT NULL,
  `amount` bigint(20) NOT NULL,
  `is_buyout` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_auction` (`auction_id`),
  CONSTRAINT `fk_auction_bids_auction` FOREIGN KEY (`auction_id`) REFERENCES `rsg_auctions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_auction_collections` (
  `id` varchar(100) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `auction_id` varchar(50) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_label` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `metadata` longtext DEFAULT NULL,
  `sold_for` bigint(20) NOT NULL DEFAULT 0,
  `seller_name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_auction_payouts` (
  `citizenid` varchar(50) NOT NULL,
  `amount` bigint(20) NOT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_auctions` (
  `id` varchar(50) NOT NULL,
  `owner_citizenid` varchar(50) NOT NULL,
  `owner_name` varchar(100) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_label` varchar(100) NOT NULL,
  `item_count` int(11) NOT NULL,
  `item_metadata` longtext DEFAULT NULL,
  `category` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `location_label` varchar(100) NOT NULL,
  `starting_bid` bigint(20) NOT NULL,
  `current_bid` bigint(20) NOT NULL DEFAULT 0,
  `buyout_price` bigint(20) DEFAULT NULL,
  `highest_bidder_citizenid` varchar(50) DEFAULT NULL,
  `highest_bidder_name` varchar(100) DEFAULT NULL,
  `winner_citizenid` varchar(50) DEFAULT NULL,
  `winner_name` varchar(100) DEFAULT NULL,
  `sold_for` bigint(20) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'active',
  `total_bids` int(11) NOT NULL DEFAULT 0,
  `creation_fee` bigint(20) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `escrow_item` tinyint(1) NOT NULL DEFAULT 0,
  `escrow_amount` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`),
  KEY `idx_owner` (`owner_citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_bank_accounts` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `citizenid` VARCHAR(50) NOT NULL,
    `bank` VARCHAR(50) NOT NULL,
    `balance` DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `citizen_bank` (`citizenid`, `bank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_bank_transactions` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `citizenid` VARCHAR(50) NOT NULL,
    `bank` VARCHAR(50) NOT NULL,
    `type` VARCHAR(20) NOT NULL,
    `amount` DECIMAL(12,2) NOT NULL,
    `note` VARCHAR(255) DEFAULT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `citizen_bank_idx` (`citizenid`, `bank`),
    KEY `created_idx` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_bank_home` (
    `citizenid` VARCHAR(50) NOT NULL,
    `bank` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_bank_meta` (
    `k` VARCHAR(50) NOT NULL,
    `v` VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (`k`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_bank_loans` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `citizenid` VARCHAR(50) NOT NULL,
    `bank` VARCHAR(50) NOT NULL,
    `principal` DECIMAL(12,2) NOT NULL,
    `owed` DECIMAL(12,2) NOT NULL,
    `due_at` TIMESTAMP NOT NULL,
    `late` TINYINT(1) NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `citizen_bank` (`citizenid`, `bank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_bank_lockboxes` (
    `citizenid` VARCHAR(50) NOT NULL,
    `bank` VARCHAR(50) NOT NULL,
    `size` VARCHAR(20) NOT NULL,
    `upgrades` INT(11) NOT NULL DEFAULT 0,
    `rent_until` TIMESTAMP NULL DEFAULT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`citizenid`, `bank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_bank_lockbox_items` (
    `citizenid` VARCHAR(50) NOT NULL,
    `bank` VARCHAR(50) NOT NULL,
    `item` VARCHAR(100) NOT NULL,
    `amount` INT(11) NOT NULL DEFAULT 0,
    PRIMARY KEY (`citizenid`, `bank`, `item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_bank_credit` (
    `citizenid` VARCHAR(50) NOT NULL,
    `score` INT(11) NOT NULL,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_bank_business_members` (
    `org` VARCHAR(80) NOT NULL,
    `citizenid` VARCHAR(50) NOT NULL,
    `name` VARCHAR(100) DEFAULT NULL,
    `added_by` VARCHAR(50) DEFAULT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`org`, `citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_beehives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `heading` float NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `activated_at` int(10) unsigned DEFAULT NULL,
  `food` tinyint(3) unsigned NOT NULL DEFAULT 100,
  `water` tinyint(3) unsigned NOT NULL DEFAULT 100,
  `health` tinyint(3) unsigned NOT NULL DEFAULT 100,
  `honey` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `smoked_until` int(10) unsigned DEFAULT NULL,
  `prop` varchar(50) NOT NULL DEFAULT 'bee_house_gk_1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_boats_models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `label` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `price` int(11) NOT NULL DEFAULT 0,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `slots` int(11) NOT NULL DEFAULT 10,
  `weight` int(11) NOT NULL DEFAULT 50000,
  PRIMARY KEY (`id`),
  UNIQUE KEY `model` (`model`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO `rsg_boats_models` (`id`, `model`, `label`, `description`, `price`, `enabled`, `slots`, `weight`) VALUES
	(1, 'rowboat', 'Rowboat', 'A sturdy wooden rowboat for rivers and bayous.', 75, 1, 10, 50000);

CREATE TABLE IF NOT EXISTS `rsg_boats_owned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `model` varchar(64) NOT NULL,
  `label` varchar(64) NOT NULL,
  `purchased` timestamp NOT NULL DEFAULT current_timestamp(),
  `yard` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_boats_settings` (
  `k` varchar(64) NOT NULL,
  `v` longtext NOT NULL,
  PRIMARY KEY (`k`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_boats_yards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `coords` varchar(255) NOT NULL,
  `spawn` varchar(255) DEFAULT NULL,
  `dock` varchar(255) DEFAULT NULL,
  `models` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO `rsg_boats_yards` (`id`, `name`, `coords`, `spawn`, `dock`, `models`) VALUES
	(1, 'Saint Denis Boat Yard', '{"y":-1778.010009765625,"x":886.6599731445313,"w":283.2699890136719,"z":42.13999938964844}', NULL, NULL, NULL);

CREATE TABLE IF NOT EXISTS `rsg_bountyhunter` (
  `citizenid` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `completed` int(11) NOT NULL DEFAULT 0,
  `alive` int(11) NOT NULL DEFAULT 0,
  `dead` int(11) NOT NULL DEFAULT 0,
  `earned` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_chat_channels` (
  `id` varchar(32) NOT NULL,
  `data` longtext NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO `rsg_chat_channels` (`id`, `data`, `sort`) VALUES
	('local', '{"gangs":[],"enabled":true,"permission":"","requireDuty":false,"distance":20,"maxLength":256,"color":"#ffffff","id":"local","command":"l","jobs":[],"label":"Local","range":"local","showPrefix":false,"prefix":"Local"}', 2),
	('ooc', '{"gangs":[],"enabled":true,"permission":"","requireDuty":false,"distance":0,"maxLength":256,"color":"#bfbfbf","id":"ooc","command":"ooc","jobs":[],"label":"OOC","range":"global","showPrefix":true,"prefix":"OOC"}', 1),
	('staff', '{"gangs":[],"enabled":true,"permission":"helper","requireDuty":false,"distance":0,"maxLength":512,"color":"#e0554f","id":"staff","command":"staff","jobs":[],"label":"Staff","range":"group","showPrefix":true,"prefix":"Staff"}', 4),
	('trade', '{"gangs":[],"enabled":true,"permission":"","requireDuty":false,"distance":750,"maxLength":200,"color":"#d9a441","id":"trade","command":"trade","jobs":[],"label":"Trade","range":"regional","showPrefix":true,"prefix":"Trade"}', 3);

CREATE TABLE IF NOT EXISTS `rsg_cooking_campfires` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `heading` float NOT NULL DEFAULT 0,
  `expires` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_cooking_stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `world` tinyint(1) NOT NULL DEFAULT 0,
  `stype` varchar(20) NOT NULL DEFAULT 'campfire',
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `heading` float NOT NULL DEFAULT 0,
  `recipe` varchar(50) DEFAULT NULL,
  `hopper` longtext DEFAULT NULL,
  `output` int(11) NOT NULL DEFAULT 0,
  `fuel` int(11) NOT NULL DEFAULT 0,
  `batch_left` int(11) DEFAULT NULL,
  `last_tick` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_doorlocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `doors` longtext NOT NULL,
  `text_coords` longtext NOT NULL,
  `jobs` longtext NOT NULL,
  `distance` float NOT NULL DEFAULT 1.25,
  `locked` tinyint(1) NOT NULL DEFAULT 1,
  `lockpick` varchar(16) DEFAULT NULL,
  `region` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_drugs_labs` (
  `citizenid` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_drugs_state` (
  `key` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_farming_plants` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `citizenid` VARCHAR(50) NOT NULL,
    `crop` VARCHAR(50) NOT NULL,
    `x` FLOAT NOT NULL, `y` FLOAT NOT NULL, `z` FLOAT NOT NULL, `h` FLOAT NOT NULL DEFAULT 0,
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

CREATE TABLE IF NOT EXISTS `rsg_housing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region` varchar(30) NOT NULL,
  `houseid` varchar(20) NOT NULL,
  `citizenid` varchar(50) NOT NULL DEFAULT '0',
  `fullname` varchar(255) NOT NULL DEFAULT '0',
  `rented` tinyint(1) NOT NULL DEFAULT 0,
  `rent` int(11) NOT NULL DEFAULT 0,
  `rent_due` datetime DEFAULT NULL,
  `reminder_sent` tinyint(1) NOT NULL DEFAULT 0,
  `custom_name` varchar(30) DEFAULT NULL,
  `storage_tier` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_houseid` (`houseid`),
  KEY `idx_rented` (`rented`),
  KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- `rent` is the monthly rent in $
INSERT IGNORE INTO `rsg_housing` (`id`, `region`, `houseid`, `rent`) VALUES
(1, 'newhanover', 'house1', 50),
(2, 'westelizabeth', 'house2', 50),
(3, 'newhanover', 'house3', 50),
(4, 'lemoyne', 'house4', 50),
(5, 'lemoyne', 'house5', 50),
(6, 'lemoyne', 'house6', 50),
(7, 'newaustin', 'house7', 50),
(8, 'newhanover', 'house8', 50),
(9, 'newhanover', 'house9', 50),
(10, 'newhanover', 'house10', 50),
(11, 'lemoyne', 'house11', 50),
(12, 'lemoyne', 'house12', 50),
(13, 'lemoyne', 'house13', 50),
(14, 'lemoyne', 'house14', 50),
(15, 'lemoyne', 'house15', 50),
(16, 'lemoyne', 'house16', 50),
(17, 'newhanover', 'house17', 50),
(18, 'newhanover', 'house18', 50),
(19, 'newhanover', 'house19', 50),
(20, 'ambarino', 'house20', 50),
(21, 'newhanover', 'house21', 50),
(22, 'ambarino', 'house22', 50),
(23, 'ambarino', 'house23', 50),
(24, 'ambarino', 'house24', 50),
(25, 'westelizabeth', 'house25', 50),
(26, 'westelizabeth', 'house26', 50),
(27, 'westelizabeth', 'house27', 50),
(28, 'westelizabeth', 'house28', 50),
(29, 'newaustin', 'house29', 50),
(30, 'newaustin', 'house30', 50),
(31, 'newaustin', 'house31', 50),
(32, 'newaustin', 'house32', 50),
(33, 'newaustin', 'house33', 50),
(34, 'ambarino', 'house34', 50),
(35, 'ambarino', 'house35', 50),
(36, 'newhanover', 'house36', 50),
(37, 'ambarino', 'house37', 50),
(38, 'newhanover', 'house38', 50),
(39, 'newhanover', 'house39', 50),
(40, 'lemoyne', 'house40', 50),
(41, 'lemoyne', 'house41', 50),
(42, 'ambarino', 'house42', 50),
(43, 'newaustin', 'house43', 50),
(44, 'newhanover', 'house44', 50),
(45, 'lemoyne', 'house45', 50),
(46, 'westelizabeth', 'house46', 50),
(47, 'newhanover', 'house47', 50),
(48, 'westelizabeth', 'house48', 50);

CREATE TABLE IF NOT EXISTS `rsg_housekeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `houseid` varchar(20) NOT NULL DEFAULT '0',
  `citizenid` varchar(50) NOT NULL DEFAULT '0',
  `guest` int(1) NOT NULL DEFAULT 0,
  `perm_doors` tinyint(1) NOT NULL DEFAULT 1,
  `perm_storage` tinyint(1) NOT NULL DEFAULT 1,
  `perm_wardrobe` tinyint(1) NOT NULL DEFAULT 1,
  `perm_mailbox` tinyint(1) NOT NULL DEFAULT 1,
  `expires` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`),
  KEY `idx_houseid` (`houseid`),
  KEY `idx_house_citizen` (`houseid`,`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_housing_props` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `houseid` varchar(20) NOT NULL,
  `model_key` varchar(32) NOT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  `rx` double NOT NULL DEFAULT 0,
  `ry` double NOT NULL DEFAULT 0,
  `rz` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_houseid` (`houseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_housing_retrieval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `houseid` varchar(20) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_house_citizen` (`houseid`,`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_imaps` (
  `hash` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  `updated_by` varchar(64) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_legendary_cooldowns` (
  `citizenid` varchar(50) NOT NULL,
  `animal` varchar(50) NOT NULL,
  `last_hunt` timestamp NOT NULL DEFAULT current_timestamp(),
  `notified` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`citizenid`,`animal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_legendary_hunts` (
  `citizenid` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  `expires` int(11) NOT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_legendary_trophies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `animal` varchar(50) NOT NULL,
  `seconds` int(11) NOT NULL,
  `quality` varchar(20) NOT NULL DEFAULT 'good',
  `killed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_animal` (`animal`),
  KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_lottery_config` (
  `setting` varchar(64) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`setting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO `rsg_lottery_config` (`setting`, `value`) VALUES
	('current_jackpot', '100');

CREATE TABLE IF NOT EXISTS `rsg_lottery_draws` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `draw_date` date NOT NULL,
  `jackpot` int(11) NOT NULL,
  `winning_number` text DEFAULT NULL,
  `drawn_at` datetime DEFAULT NULL,
  `status` varchar(32) DEFAULT 'pending',
  `winner_citizenid` varchar(64) DEFAULT NULL,
  `winner_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `draw_date` (`draw_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_lottery_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(64) NOT NULL,
  `ticket_number` varchar(16) NOT NULL,
  `numbers` text NOT NULL,
  `draw_date` date NOT NULL,
  `purchased_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_citizen_draw` (`citizenid`,`draw_date`),
  KEY `idx_draw` (`draw_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_lottery_winners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `draw_date` date NOT NULL,
  `citizenid` varchar(64) NOT NULL,
  `winner_name` varchar(128) NOT NULL,
  `prize` int(11) NOT NULL,
  `match_count` int(11) NOT NULL,
  `win_type` varchar(32) NOT NULL DEFAULT 'regular',
  `collected` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_citizen_collected` (`citizenid`,`collected`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_loyalty` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `charname` VARCHAR(50) NOT NULL,
  `loyalty_points` INT NOT NULL DEFAULT 0,
  `lifetime_points` INT NOT NULL DEFAULT 0,
  `daily_streak` INT NOT NULL DEFAULT 0,
  `last_daily` DATE NULL,
  `last_update` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid` (`citizenid`),
  KEY `loyalty_points_idx` (`loyalty_points`),
  KEY `lifetime_points_idx` (`lifetime_points`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_loyalty_history` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `amount` INT NOT NULL,
  `reason` VARCHAR(32) NOT NULL,
  `detail` VARCHAR(100) NULL,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `citizen_idx` (`citizenid`, `id`),
  KEY `created_idx` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_loyalty_redemptions` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `reward_id` VARCHAR(64) NOT NULL,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `reward_idx` (`reward_id`, `created`),
  KEY `citizen_reward_idx` (`citizenid`, `reward_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_lumberjack_trees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(64) NOT NULL,
  `owner_citizenid` varchar(50) NOT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  `heading` float NOT NULL DEFAULT 0,
  `model` varchar(64) NOT NULL DEFAULT 'p_tree_birch_01_sapling',
  `stage` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `state` enum('planted','growing','ready','chopped') NOT NULL DEFAULT 'planted',
  `watered` tinyint(1) NOT NULL DEFAULT 0,
  `fertilized` tinyint(1) NOT NULL DEFAULT 0,
  `planted_at` datetime NOT NULL DEFAULT current_timestamp(),
  `next_stage_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_stage` (`stage`),
  KEY `idx_state` (`state`),
  KEY `idx_owner` (`owner_citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_mining` (
  `mine` varchar(50) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `expires` int(11) NOT NULL DEFAULT 0,
  `wages` int(11) NOT NULL DEFAULT 0,
  `supplies` longtext DEFAULT NULL,
  `storage` longtext DEFAULT NULL,
  PRIMARY KEY (`mine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_mining_workers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mine` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `skill` float NOT NULL DEFAULT 1,
  `food` int(11) NOT NULL DEFAULT 100,
  `water` int(11) NOT NULL DEFAULT 100,
  `pickaxe` int(11) NOT NULL DEFAULT 0,
  `status` varchar(50) NOT NULL DEFAULT 'idle',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_moonshine_stills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `heading` float NOT NULL DEFAULT 0,
  `recipe` varchar(50) DEFAULT NULL,
  `hopper` longtext DEFAULT NULL,
  `output` int(11) NOT NULL DEFAULT 0,
  `fuel` int(11) NOT NULL DEFAULT 0,
  `batch_left` int(11) DEFAULT NULL,
  `last_tick` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_noticeboard_boards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(64) NOT NULL DEFAULT 'Notice Board',
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  `heading` double NOT NULL DEFAULT 0,
  `created_by` varchar(64) DEFAULT NULL,
  `created_at` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_noticeboard_notices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(64) NOT NULL,
  `author` varchar(128) NOT NULL,
  `title` varchar(128) NOT NULL,
  `body` text NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `category` varchar(32) NOT NULL,
  `town` varchar(32) DEFAULT NULL,
  `duration` varchar(16) NOT NULL,
  `created_at` int(11) NOT NULL,
  `expires_at` int(11) NOT NULL,
  `warned` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`),
  KEY `idx_expires` (`expires_at`),
  KEY `idx_town` (`town`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_radio_private` (
  `freq` varchar(16) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `code` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_used` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`freq`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_ranch_animals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ranchid` varchar(50) DEFAULT NULL,
  `animalid` varchar(50) DEFAULT NULL,
  `model` varchar(50) NOT NULL,
  `pos_x` float NOT NULL,
  `pos_y` float NOT NULL,
  `pos_z` float NOT NULL,
  `pos_w` float NOT NULL,
  `age` smallint(5) unsigned DEFAULT 0,
  `health` tinyint(3) unsigned DEFAULT 100,
  `thirst` tinyint(3) unsigned DEFAULT 100,
  `hunger` tinyint(3) unsigned DEFAULT 100,
  `born` int(10) unsigned NOT NULL,
  `scale` decimal(4,2) DEFAULT 0.50,
  `last_production` int(10) unsigned DEFAULT 0,
  `product_ready` tinyint(1) DEFAULT 0,
  `gender` enum('male','female') DEFAULT 'female',
  `pregnant` tinyint(1) DEFAULT 0,
  `gestation_end_time` int(10) unsigned DEFAULT NULL,
  `breeding_ready_time` int(10) unsigned DEFAULT 0,
  `breeding_attempts` int(10) unsigned DEFAULT 0,
  `mother_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_animalid` (`animalid`),
  KEY `idx_ranchid` (`ranchid`),
  KEY `idx_product_ready` (`product_ready`),
  KEY `idx_ranchid_product` (`ranchid`,`product_ready`),
  KEY `idx_pregnant` (`pregnant`),
  KEY `idx_gender` (`gender`),
  KEY `idx_breeding_ready` (`breeding_ready_time`),
  KEY `idx_mother_id` (`mother_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_ranch_chickencoops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coopid` varchar(50) DEFAULT NULL,
  `ranchid` varchar(50) DEFAULT NULL,
  `pos_x` float NOT NULL,
  `pos_y` float NOT NULL,
  `pos_z` float NOT NULL,
  `pos_w` float NOT NULL,
  `chickens` smallint(5) unsigned DEFAULT 0,
  `eggs_stored` smallint(5) unsigned DEFAULT 0,
  `feed_level` tinyint(3) unsigned DEFAULT 100,
  `last_feed_update` int(10) unsigned DEFAULT 0,
  `last_production` int(10) unsigned DEFAULT 0,
  `placed_by` varchar(50) DEFAULT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_coopid` (`coopid`),
  KEY `idx_ranchid` (`ranchid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_ranch_custom` (
  `ranchid` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) unsigned NOT NULL DEFAULT 5000,
  `npcmodel` varchar(60) NOT NULL DEFAULT 'g_m_m_uniranchers_01',
  `npc_x` float NOT NULL,
  `npc_y` float NOT NULL,
  `npc_z` float NOT NULL,
  `npc_w` float NOT NULL DEFAULT 0,
  `spawn_x` float NOT NULL,
  `spawn_y` float NOT NULL,
  `spawn_z` float NOT NULL,
  `spawn_w` float NOT NULL DEFAULT 0,
  `blipsprite` varchar(60) NOT NULL DEFAULT 'blip_ambient_herd',
  `blipscale` float NOT NULL DEFAULT 0.2,
  `created_by` varchar(50) DEFAULT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ranchid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_ranch_feedtroughs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedtroughid` varchar(50) DEFAULT NULL,
  `ranchid` varchar(50) DEFAULT NULL,
  `pos_x` float NOT NULL,
  `pos_y` float NOT NULL,
  `pos_z` float NOT NULL,
  `pos_w` float NOT NULL,
  `uses` tinyint(3) unsigned DEFAULT 10,
  `placed_by` varchar(50) DEFAULT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_feedtroughid` (`feedtroughid`),
  KEY `idx_ranchid` (`ranchid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_ranch_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(50) DEFAULT NULL,
  `ranchid` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `item` varchar(50) NOT NULL,
  `amount` smallint(5) unsigned DEFAULT 1,
  `price` int(10) unsigned DEFAULT 0,
  `ordered_at` int(10) unsigned DEFAULT NULL,
  `ready_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_orderid` (`orderid`),
  KEY `idx_ranchid` (`ranchid`),
  KEY `idx_ready_at` (`ready_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_ranch_owners` (
  `ranchid` varchar(50) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `purchased_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ranchid`),
  KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_ranch_settings` (
  `ranchid` varchar(50) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `blipname` varchar(100) DEFAULT NULL,
  `price` int(10) unsigned DEFAULT NULL,
  `showblip` tinyint(1) DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ranchid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_ranch_storages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storageid` varchar(50) NOT NULL,
  `ranchid` varchar(50) NOT NULL,
  `size` varchar(20) NOT NULL DEFAULT 'general',
  `label` varchar(50) NOT NULL DEFAULT 'General Storage',
  `maxweight` int(10) unsigned NOT NULL DEFAULT 10000000,
  `slots` smallint(5) unsigned NOT NULL DEFAULT 100,
  `min_grade` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `purchased_by` varchar(50) DEFAULT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_storageid` (`storageid`),
  KEY `idx_ranchid` (`ranchid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_ranch_watertroughs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `watertroughid` varchar(50) DEFAULT NULL,
  `ranchid` varchar(50) DEFAULT NULL,
  `pos_x` float NOT NULL,
  `pos_y` float NOT NULL,
  `pos_z` float NOT NULL,
  `pos_w` float NOT NULL,
  `uses` tinyint(3) unsigned DEFAULT 10,
  `placed_by` varchar(50) DEFAULT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_watertroughid` (`watertroughid`),
  KEY `idx_ranchid` (`ranchid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_roulette_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `heading` float NOT NULL DEFAULT 0,
  `room` bigint(20) NOT NULL DEFAULT 0,
  `placed_by` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_shops_ledger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `npc_id` int(11) NOT NULL,
  `ts` int(11) NOT NULL,
  `kind` varchar(16) NOT NULL,
  `item` varchar(100) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `who` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ledger_npc` (`npc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `store_kind` varchar(10) NOT NULL DEFAULT 'npc',
  `owner_citizenid` varchar(50) DEFAULT NULL,
  `owner_name` varchar(100) DEFAULT NULL,
  `balance` decimal(12,2) NOT NULL DEFAULT 0.00,
  `prop_model` varchar(100) DEFAULT NULL,
  `upkeep_owed` decimal(10,2) NOT NULL DEFAULT 0.00,
  `upkeep_next` int(11) DEFAULT NULL,
  `packed_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_shop_name` (`shop_name`),
  KEY `idx_owner` (`owner_citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_shops_presets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind` varchar(10) NOT NULL,
  `label` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_kind_value` (`kind`,`value`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO `rsg_shops_presets` (`id`, `kind`, `label`, `value`) VALUES
	(1, 'model', 'cfg_model_tumbleweed_store', 'u_f_m_tumgeneralstoreowner_01'),
	(2, 'model', 'cfg_model_armadillo_store', 'u_m_m_armgeneralstoreowner_01'),
	(3, 'model', 'cfg_model_saintdenis_store', 'u_m_m_nbxgeneralstoreowner_01'),
	(4, 'model', 'cfg_model_rhodes_store_1', 'u_m_m_rhdgenstoreowner_01'),
	(5, 'model', 'cfg_model_rhodes_store_2', 'u_m_m_rhdgenstoreowner_02'),
	(6, 'model', 'cfg_model_strawberry_store', 'u_m_m_strgenstoreowner_01'),
	(7, 'model', 'cfg_model_valentine_store', 'u_m_m_valgenstoreowner_01'),
	(8, 'model', 'cfg_model_wallace_store', 'u_m_m_walgeneralstoreowner_01'),
	(9, 'model', 'cfg_model_annesburg_gunsmith', 'u_m_m_asbgunsmith_01'),
	(10, 'model', 'cfg_model_saintdenis_gunsmith', 'u_m_m_nbxgunsmith_01'),
	(11, 'model', 'cfg_model_rhodes_gunsmith', 'u_m_m_rhdgunsmith_01'),
	(12, 'model', 'cfg_model_tumbleweed_gunsmith', 'u_m_m_tumgunsmith_01'),
	(13, 'model', 'cfg_model_valentine_gunsmith', 'u_m_m_valgunsmith_01'),
	(14, 'model', 'cfg_model_generic_butcher', 's_m_m_unibutchers_01'),
	(15, 'model', 'cfg_model_tumbleweed_butcher', 'u_m_m_tumbutcher_01'),
	(16, 'model', 'cfg_model_valentine_butcher', 'u_m_m_valbutcher_01'),
	(17, 'model', 'cfg_model_saintdenis_trapper', 'u_m_m_sdtrapper_01'),
	(18, 'model', 'cfg_model_thieveslanding_bartender', 'u_f_m_tljbartender_01'),
	(19, 'model', 'cfg_model_vanhorn_bartender', 'u_f_m_vhtbartender_01'),
	(20, 'model', 'cfg_model_saintdenis_bartender_1', 'u_m_m_nbxbartender_01'),
	(21, 'model', 'cfg_model_saintdenis_bartender_2', 'u_m_m_nbxbartender_02'),
	(22, 'model', 'cfg_model_rhodes_bartender', 'u_m_m_rhdbartender_01'),
	(23, 'model', 'cfg_model_armadillo_bartender', 'u_m_o_armbartender_01'),
	(24, 'model', 'cfg_model_blackwater_bartender', 'u_m_o_blwbartender_01'),
	(25, 'model', 'cfg_model_valentine_bartender', 'u_m_o_valbartender_01'),
	(26, 'blip', 'cfg_blip_general_store', '1475879922'),
	(27, 'blip', 'cfg_blip_gunsmith', '-145868367'),
	(28, 'blip', 'cfg_blip_butcher', '-1665418949'),
	(29, 'blip', 'cfg_blip_saloon', '1879260108');

CREATE TABLE IF NOT EXISTS `rsg_shops_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `npc_id` int(11) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `staff_rank` varchar(32) NOT NULL DEFAULT 'custom',
  `perms` varchar(255) NOT NULL DEFAULT '',
  `withdrawn` decimal(12,2) NOT NULL DEFAULT 0.00,
  `withdraw_day` int(11) NOT NULL DEFAULT 0,
  `hired_at` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_store_staff` (`npc_id`,`citizenid`),
  KEY `idx_staff_cid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_smelting_state` (
  `id` tinyint(3) unsigned NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO `rsg_smelting_state` (`id`, `data`) VALUES
	(1, '{"live":[],"owed":[]}');

CREATE TABLE IF NOT EXISTS `rsg_stables_horses` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `stable` VARCHAR(50) DEFAULT NULL,
  `model` VARCHAR(100) NOT NULL,
  `breed_label` VARCHAR(100) NOT NULL,
  `gender` VARCHAR(6) DEFAULT NULL,
  `breed_cooldown` BIGINT(20) NOT NULL DEFAULT 0,
  `died_of_age` TINYINT(1) NOT NULL DEFAULT 0,
  `name` VARCHAR(50) NOT NULL DEFAULT 'Unnamed Horse',
  `outfit` INT(11) NOT NULL DEFAULT 0,
  `tack` TEXT DEFAULT NULL,
  `shoe_wear` FLOAT NOT NULL DEFAULT 0,
  `coat` TEXT DEFAULT NULL,
  `health` FLOAT NOT NULL DEFAULT 100,
  `stamina` FLOAT NOT NULL DEFAULT 100,
  `hunger` FLOAT NOT NULL DEFAULT 100,
  `thirst` FLOAT NOT NULL DEFAULT 100,
  `bonding` FLOAT NOT NULL DEFAULT 0,
  `training` TEXT DEFAULT NULL,
  `speed` INT(11) NOT NULL DEFAULT 50,
  `accel` INT(11) NOT NULL DEFAULT 50,
  `handling` INT(11) NOT NULL DEFAULT 50,
  `maxhealth` INT(11) NOT NULL DEFAULT 50,
  `alive` TINYINT(1) NOT NULL DEFAULT 1,
  `insured` TINYINT(1) NOT NULL DEFAULT 0,
  `active` TINYINT(1) NOT NULL DEFAULT 0,
  `born` TINYINT(1) NOT NULL DEFAULT 0,
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

CREATE TABLE IF NOT EXISTS `rsg_stables_races` (
  `citizenid` VARCHAR(50) NOT NULL,
  `race` VARCHAR(50) NOT NULL,
  `rider` VARCHAR(100) NOT NULL DEFAULT '',
  `horse` VARCHAR(50) NOT NULL DEFAULT '',
  `best_ms` INT(11) NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`citizenid`, `race`),
  KEY `race_best` (`race`, `best_ms`)
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
    `batch` VARCHAR(40) NULL DEFAULT NULL,
    `has_attachment` TINYINT(1) NOT NULL DEFAULT 0,
    `attachment` TEXT NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    INDEX `idx_citizenid` (`citizenid`),
    INDEX `idx_sender` (`sender_citizenid`)
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

CREATE TABLE IF NOT EXISTS `rsg_telegram_blocks` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `citizenid` VARCHAR(50) NOT NULL,
    `blocked_citizenid` VARCHAR(50) NOT NULL,
    `blocked_name` VARCHAR(100) NOT NULL,
    `added_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uniq_block` (`citizenid`, `blocked_citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_telephones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(16) NOT NULL,
  `label` varchar(64) NOT NULL DEFAULT 'Telephone',
  `model` varchar(64) NOT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  `heading` double NOT NULL DEFAULT 0,
  `listed` tinyint(1) NOT NULL DEFAULT 1,
  `room` bigint(20) NOT NULL DEFAULT 0,
  `job` varchar(64) DEFAULT NULL,
  `owner` varchar(64) DEFAULT NULL,
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` varchar(64) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_trader` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `traderid` varchar(50) NOT NULL,
  `item` varchar(50) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `lowstock` int(11) NOT NULL DEFAULT 0,
  `highstock` int(11) NOT NULL DEFAULT 0,
  `baseprice` decimal(11,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trader_item` (`traderid`,`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_trapdoors` (
  `door_id` varchar(64) NOT NULL,
  `passcode` char(4) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`door_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_trapdoors_schema` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `version` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO `rsg_trapdoors_schema` (`id`, `version`) VALUES
	(1, 1);

CREATE TABLE IF NOT EXISTS `rsg_voice_mutes` (
  `license` varchar(64) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `muted_by` varchar(100) DEFAULT NULL,
  `expires_at` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_weather_state` (
  `key` varchar(50) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_trams_state` (
  `key` varchar(60) NOT NULL,
  `value` varchar(10) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_fishmonger_stock` (
  `location` varchar(50) NOT NULL,
  `day` varchar(10) NOT NULL,
  `sold` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `zonenotify_discoveries` (
  `citizenid` varchar(50) NOT NULL,
  `zone` varchar(64) NOT NULL,
  `discovered_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`citizenid`,`zone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_queue_vip` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `identifier` VARCHAR(80) NOT NULL,
    `name` VARCHAR(100) DEFAULT NULL,
    `tier` VARCHAR(30) NOT NULL,
    `expires_at` DATETIME DEFAULT NULL,
    `added_by` VARCHAR(100) DEFAULT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_queue_rewards` (
    `license` VARCHAR(80) NOT NULL,
    `last_claim` DATETIME NOT NULL,
    PRIMARY KEY (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_queue_state` (
  `key` varchar(50) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_rocks_zones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `x` DOUBLE NOT NULL,
  `y` DOUBLE NOT NULL,
  `z` DOUBLE NOT NULL,
  `radius` FLOAT NOT NULL DEFAULT 2.0,
  `heading` FLOAT NOT NULL DEFAULT 0.0,
  `ore_type` VARCHAR(32) NOT NULL DEFAULT 'rock',
  `label` VARCHAR(64) DEFAULT NULL,
  `enabled` TINYINT(1) NOT NULL DEFAULT 1,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_enabled` (`enabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `rsg_rocks_zones` (`x`, `y`, `z`, `radius`, `ore_type`, `label`) VALUES
(2791.4697265625, 1345.1380615234375, 71.91378021240234, 2.0, 'rock', NULL),
(2793.626708984375, 1336.0570068359375, 71.92117309570312, 2.0, 'rock', NULL),
(2780.24169921875, 1335.8101806640625, 71.5442886352539, 2.0, 'rock', NULL),
(2767.23388671875, 1337.0699462890625, 70.95378112792969, 2.0, 'saltrock', NULL),
(2765.5029296875, 1335.658447265625, 70.78048706054688, 2.0, 'rock', NULL),
(2761.82861328125, 1331.6224365234375, 70.52594757080078, 2.0, 'rock', NULL),
(2752.021484375, 1332.12109375, 70.63470458984375, 2.0, 'rock', NULL),
(2741.38134765625, 1319.45458984375, 70.48382568359375, 2.0, 'saltrock', NULL),
(2745.58837890625, 1325.2091064453125, 70.48372650146484, 2.0, 'rock', NULL),
(2761.119384765625, 1310.7445068359375, 70.49114227294922, 2.0, 'rock', NULL),
(2760.796142578125, 1304.12744140625, 70.49578857421875, 2.0, 'rock', NULL),
(2755.88916015625, 1301.888427734375, 70.4975811819336, 2.0, 'saltrock', NULL),
(2738.291748046875, 1309.3807373046875, 70.39374542236328, 2.0, 'rock', NULL),
(2735.927978515625, 1309.5782470703125, 70.37593078613281, 2.0, 'rock', NULL),
(2718.755859375, 1307.8685302734375, 70.2322006225586, 2.0, 'rock', NULL),
(2713.54052734375, 1308.1812744140625, 70.25575256347656, 2.0, 'saltrock', NULL),
(2711.83154296875, 1314.4696044921875, 70.2629165649414, 2.0, 'rock', NULL),
(2716.714599609375, 1314.705810546875, 70.26507568359375, 2.0, 'rock', NULL),
(2727.734375, 1319.8328857421875, 70.22930908203125, 2.0, 'rock', NULL),
(2731.578369140625, 1318.081298828125, 70.22589111328125, 2.0, 'saltrock', NULL),
(2736.048583984375, 1322.33984375, 70.19818878173828, 2.0, 'rock', NULL),
(2733.84033203125, 1328.4901123046875, 70.18203735351562, 2.0, 'rock', NULL),
(2728.3525390625, 1329.7330322265625, 70.15768432617188, 2.0, 'rock', NULL),
(2731.616455078125, 1332.7449951171875, 70.17938232421875, 2.0, 'saltrock', NULL),
(2739.888427734375, 1339.1622314453125, 69.70467376708984, 2.0, 'rock', NULL),
(2742.882568359375, 1347.59521484375, 68.63679504394531, 2.0, 'rock', NULL),
(2749.873779296875, 1347.125244140625, 69.15619659423828, 2.0, 'rock', NULL),
(2765.419921875, 1351.198974609375, 71.07604217529297, 2.0, 'saltrock', NULL),
(2761.34619140625, 1358.7442626953125, 70.99369049072266, 2.0, 'rock', NULL),
(2765.982177734375, 1366.232177734375, 71.02310943603516, 2.0, 'rock', NULL),
(2763.967529296875, 1364.6925048828125, 71.0881118774414, 2.0, 'rock', NULL),
(2779.3095703125, 1371.5987548828125, 68.38038635253906, 2.0, 'saltrock', NULL),
(2778.156005859375, 1381.4931640625, 68.48554992675781, 2.0, 'rock', NULL),
(2779.03076171875, 1377.4268798828125, 68.3793716430664, 2.0, 'rock', NULL),
(2772.770751953125, 1368.3590087890625, 68.31623840332031, 2.0, 'rock', NULL),
(2753.31103515625, 1368.2064208984375, 68.40861511230469, 2.0, 'saltrock', NULL),
(2746.0869140625, 1366.9554443359375, 68.78707122802734, 2.0, 'rock', NULL),
(2740.212158203125, 1369.9141845703125, 69.02835083007812, 2.0, 'rock', NULL),
(2737.818115234375, 1356.1986083984375, 68.78072357177734, 2.0, 'rock', NULL),
(2740.609130859375, 1377.5894775390625, 69.14989471435547, 2.0, 'saltrock', NULL),
(2743.1064453125, 1384.3988037109375, 69.06208038330078, 2.0, 'rock', NULL),
(2742.830810546875, 1396.9949951171875, 69.29539489746094, 2.0, 'rock', NULL),
(2724.53515625, 1391.2403564453125, 69.29977416992188, 2.0, 'rock', NULL),
(2724.401611328125, 1397.712890625, 69.2967300415039, 2.0, 'saltrock', NULL),
(-5962.111328125, -3218.07666015625, -21.03051567077636, 2.0, 'rock', NULL),
(-5961.6826171875, -3211.577392578125, -21.02172470092773, 2.0, 'rock', NULL),
(-5967.36083984375, -3204.54345703125, -20.88662719726562, 2.0, 'rock', NULL),
(-5960.54248046875, -3192.346923828125, -21.10622787475586, 2.0, 'saltrock', NULL),
(-5958.52783203125, -3188.994873046875, -21.13970375061035, 2.0, 'rock', NULL),
(-5955.8564453125, -3180.30517578125, -21.84871482849121, 2.0, 'rock', NULL),
(-5961.78515625, -3173.27001953125, -22.58561706542968, 2.0, 'rock', NULL),
(-5966.97900390625, -3172.76513671875, -23.5033893585205, 2.0, 'saltrock', NULL),
(-5969.8837890625, -3170.76806640625, -24.24051094055175, 2.0, 'rock', NULL),
(-5975.6240234375, -3167.875732421875, -25.00465202331543, 2.0, 'rock', NULL),
(-5979.07958984375, -3165.752685546875, -25.97180366516113, 2.0, 'rock', NULL),
(-5981.2080078125, -3161.576904296875, -26.08867454528808, 2.0, 'saltrock', NULL),
(-5976.26123046875, -3219.142822265625, -21.04885864257812, 2.0, 'rock', NULL),
(-5969.7919921875, -3214.953369140625, -21.09965133666992, 2.0, 'rock', NULL),
(-5972.939453125, -3205.176025390625, -18.96175765991211, 2.0, 'rock', NULL),
(-5962.1748046875, -3222.4931640625, -21.0845890045166, 2.0, 'saltrock', NULL),
(-5962.7822265625, -3224.797607421875, -21.09444236755371, 2.0, 'rock', NULL),
(-5957.90869140625, -3234.35009765625, -19.95751953125, 2.0, 'rock', NULL),
(-5955.3564453125, -3243.451904296875, -21.04887962341308, 2.0, 'rock', NULL),
(-5964.81689453125, -3195.2392578125, -21.07339096069336, 2.0, 'rock', NULL),
(-1433.65, 1177.55, 226.37, 2.0, 'rock', NULL),
(-1447.15, 1196.31, 226.36, 2.0, 'rock', NULL),
(-1442.54, 1209.02, 226.37, 2.0, 'rock', NULL),
(-1426.14, 1217.07, 223.32, 2.0, 'saltrock', NULL),
(-1413.81, 1214.39, 222.43, 2.0, 'rock', NULL),
(-1409.68, 1202.37, 223.66, 2.0, 'rock', NULL),
(-1428.74, 1202.25, 225.5, 2.0, 'rock', NULL),
(-1419.31, 1187.75, 225.48, 2.0, 'rock', NULL),
(-1410.18, 1189.06, 225.49, 2.0, 'saltrock', NULL),
(-1403.09, 1176.55, 222.13, 2.0, 'rock', NULL),
(-1391.44, 1172.18, 222.17, 2.0, 'rock', NULL),
(-1393.17, 1185.74, 221.96, 2.0, 'rock', NULL),
(-1387.19, 1182.66, 222.09, 2.0, 'saltrock', NULL),
(-1412.58, 1182.56, 225.53, 2.0, 'rock', NULL);

CREATE TABLE IF NOT EXISTS `rsg_cards_boxes` (
    `serial`  VARCHAR(20) NOT NULL,
    `creator` VARCHAR(50) NOT NULL,
    `owner`   VARCHAR(50) NOT NULL,
    PRIMARY KEY (`serial`),
    INDEX `idx_creator` (`creator`),
    INDEX `idx_owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_cards_collection` (
    `citizenid`   VARCHAR(50) NOT NULL,
    `card`        VARCHAR(50) NOT NULL,
    `obtained_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`citizenid`, `card`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_cards_pickups` (
    `citizenid` VARCHAR(50) NOT NULL,
    `card`      VARCHAR(50) NOT NULL,
    `picked_at` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`citizenid`, `card`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_cards_unclaimed` (
    `id`         INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `citizenid`  VARCHAR(50) NOT NULL,
    `card`       VARCHAR(50) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_cards_bonuses` (
    `id`           INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `citizenid`    VARCHAR(50) NOT NULL,
    `set_id`       VARCHAR(20) NOT NULL,
    `completed_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uniq_set` (`citizenid`, `set_id`),
    INDEX `idx_set` (`set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_cards_profiles` (
    `citizenid` VARCHAR(50) NOT NULL,
    `name`      VARCHAR(100) NOT NULL,
    PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_cards_points` (
    `id`         INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `item`       VARCHAR(50) NOT NULL,
    `x`          DOUBLE NOT NULL,
    `y`          DOUBLE NOT NULL,
    `z`          DOUBLE NOT NULL,
    `heading`    DOUBLE NOT NULL DEFAULT 0,
    `exact`      TINYINT(1) NOT NULL DEFAULT 0,
    `created_by` VARCHAR(50) NOT NULL DEFAULT 'config',
    PRIMARY KEY (`id`),
    INDEX `idx_item` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `townhall_locations` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `label` VARCHAR(60) NOT NULL,
    `x` DOUBLE NOT NULL,
    `y` DOUBLE NOT NULL,
    `z` DOUBLE NOT NULL,
    `h` DOUBLE NOT NULL DEFAULT 0,
    `created_by` VARCHAR(50) NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `townhall_managers` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `citizenid` VARCHAR(50) NOT NULL,
    `name` VARCHAR(100) NULL,
    `job` VARCHAR(50) NOT NULL DEFAULT '*',
    `added_by` VARCHAR(50) NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uniq_manager` (`citizenid`, `job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `townhall_postings` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `job` VARCHAR(50) NOT NULL,
    `grade` VARCHAR(10) NOT NULL,
    `title` VARCHAR(100) NOT NULL,
    `description` TEXT NOT NULL,
    `requirements` TEXT NOT NULL,
    `questions` LONGTEXT NULL,
    `slots` INT NOT NULL DEFAULT 1,
    `filled_count` INT NOT NULL DEFAULT 0,
    `expires_at` TIMESTAMP NULL DEFAULT NULL,
    `location_id` INT NOT NULL DEFAULT 0,
    `req_items` TEXT NULL,
    `req_job` VARCHAR(50) NOT NULL DEFAULT '',
    `req_job_grade` INT NOT NULL DEFAULT 0,
    `status` VARCHAR(16) NOT NULL DEFAULT 'open',
    `posted_by` VARCHAR(50) NOT NULL,
    `posted_by_name` VARCHAR(100) NULL,
    `filled_by` VARCHAR(50) NULL,
    `filled_by_name` VARCHAR(100) NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `closed_at` TIMESTAMP NULL DEFAULT NULL,
    `warned` TINYINT(1) NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `idx_status` (`status`),
    KEY `idx_job` (`job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `townhall_applications` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `posting_id` INT NOT NULL,
    `citizenid` VARCHAR(50) NOT NULL,
    `applicant_name` VARCHAR(100) NULL,
    `answers` LONGTEXT NOT NULL,
    `status` VARCHAR(16) NOT NULL DEFAULT 'pending',
    `interview_note` TEXT NULL,
    `feedback` TEXT NULL,
    `granted` TINYINT(1) NOT NULL DEFAULT 1,
    `reviewed_by` VARCHAR(50) NULL,
    `reviewed_by_name` VARCHAR(100) NULL,
    `reviewed_at` TIMESTAMP NULL DEFAULT NULL,
    `seen` TINYINT(1) NOT NULL DEFAULT 1,
    `notified` TINYINT(1) NOT NULL DEFAULT 1,
    `fee` INT NOT NULL DEFAULT 0,
    `refund` INT NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `idx_posting` (`posting_id`),
    KEY `idx_citizen` (`citizenid`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `townhall_resignations` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `citizenid` VARCHAR(50) NOT NULL,
    `job` VARCHAR(50) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `idx_citizen_job` (`citizenid`, `job`)
);

CREATE TABLE IF NOT EXISTS `townhall_messages` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `application_id` INT NOT NULL,
    `sender_cid` VARCHAR(50) NOT NULL,
    `sender_name` VARCHAR(100) NULL,
    `from_reviewer` TINYINT(1) NOT NULL DEFAULT 0,
    `body` TEXT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `idx_application` (`application_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `townhall_templates` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `citizenid` VARCHAR(50) NOT NULL,
    `name` VARCHAR(60) NOT NULL,
    `data` LONGTEXT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `idx_citizen` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `townhall_blacklist` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `citizenid` VARCHAR(50) NOT NULL,
    `name` VARCHAR(100) NULL,
    `job` VARCHAR(50) NOT NULL DEFAULT '*',
    `reason` TEXT NULL,
    `added_by` VARCHAR(50) NULL,
    `added_by_name` VARCHAR(100) NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uniq_block` (`citizenid`, `job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_factories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL,
  `ped_model` VARCHAR(64) NOT NULL,
  `x` DOUBLE NOT NULL,
  `y` DOUBLE NOT NULL,
  `z` DOUBLE NOT NULL,
  `h` DOUBLE NOT NULL DEFAULT 0,
  `recipes` LONGTEXT NOT NULL,
  `created_by` VARCHAR(50) DEFAULT NULL,
  `owner` VARCHAR(50) DEFAULT NULL,
  `owner_name` VARCHAR(64) DEFAULT NULL,
  `price` INT NOT NULL DEFAULT 5000,
  `fuel` INT NOT NULL DEFAULT 0,
  `water` INT NOT NULL DEFAULT 0,
  `bank` INT NOT NULL DEFAULT 0,
  `settings` LONGTEXT DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_factory_queue` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `factory_id` INT NOT NULL,
  `citizenid` VARCHAR(50) NOT NULL,
  `label` VARCHAR(64) NOT NULL,
  `outputs` LONGTEXT NOT NULL,
  `finish_at` BIGINT NOT NULL,
  `stages` LONGTEXT DEFAULT NULL,
  `notified` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_factory_citizen` (`factory_id`, `citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_economy_treasury` (
    `region` VARCHAR(50) NOT NULL,
    `balance` DECIMAL(14,2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (`region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_economy_tax` (
    `region` VARCHAR(50) NOT NULL,
    `category` VARCHAR(50) NOT NULL,
    `rate` DECIMAL(6,4) NOT NULL DEFAULT 0.0000,
    PRIMARY KEY (`region`, `category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_economy_ledger` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `region` VARCHAR(50) NOT NULL,
    `amount` DECIMAL(14,2) NOT NULL DEFAULT 0.00,
    `balance_after` DECIMAL(14,2) NOT NULL DEFAULT 0.00,
    `kind` VARCHAR(20) NOT NULL,
    `reason` VARCHAR(120) NOT NULL DEFAULT '',
    `actor` VARCHAR(80) NOT NULL DEFAULT '',
    `created` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`),
    KEY `idx_region_created` (`region`, `created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_economy_market` (
    `item` VARCHAR(50) NOT NULL,
    `region` VARCHAR(50) NOT NULL,
    `pressure` DOUBLE NOT NULL DEFAULT 0,
    `updated` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`item`, `region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_economy_project` (
    `region` VARCHAR(50) NOT NULL,
    `project` VARCHAR(50) NOT NULL,
    `expires` INT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (`region`, `project`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_reputation` (
    `citizenid` VARCHAR(50) NOT NULL,
    `honor` INT NOT NULL DEFAULT 0,
    `decayed` INT UNSIGNED NOT NULL DEFAULT 0,
    `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_reputation_standing` (
    `citizenid` VARCHAR(50) NOT NULL,
    `region` VARCHAR(50) NOT NULL,
    `standing` INT NOT NULL DEFAULT 0,
    PRIMARY KEY (`citizenid`, `region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_skills` (
    `citizenid` VARCHAR(50) NOT NULL,
    `skill` VARCHAR(50) NOT NULL,
    `xp` INT UNSIGNED NOT NULL DEFAULT 0,
    `name` VARCHAR(100) NOT NULL DEFAULT '',
    `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`citizenid`, `skill`),
    KEY `skill_xp` (`skill`, `xp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_skills_weekly` (
    `citizenid` VARCHAR(50) NOT NULL,
    `skill` VARCHAR(50) NOT NULL,
    `week` INT NOT NULL,
    `xp` INT UNSIGNED NOT NULL DEFAULT 0,
    `name` VARCHAR(100) NOT NULL DEFAULT '',
    PRIMARY KEY (`citizenid`, `skill`, `week`),
    KEY `week_skill_xp` (`week`, `skill`, `xp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_gangs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `color` varchar(10) NOT NULL DEFAULT '#e63946',
  `bank` int(11) NOT NULL DEFAULT 0,
  `owner` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `wagon_x` float DEFAULT NULL,
  `wagon_y` float DEFAULT NULL,
  `wagon_z` float DEFAULT NULL,
  `wagon_heading` float DEFAULT NULL,
  `stash_tier` varchar(20) NOT NULL DEFAULT 'small',
  `stash_id` varchar(36) DEFAULT NULL,
  `upkeep_due` int(11) DEFAULT NULL,
  `upkeep_missed` int(11) NOT NULL DEFAULT 0,
  `tag` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_gang_members` (
  `citizenid` varchar(50) NOT NULL,
  `gang_name` varchar(50) NOT NULL,
  `rank` varchar(50) NOT NULL DEFAULT 'recruit',
  `name` varchar(100) DEFAULT NULL,
  `joined_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`citizenid`),
  KEY `gang_name` (`gang_name`),
  CONSTRAINT `fk_gang_member_gang` FOREIGN KEY (`gang_name`) REFERENCES `rsg_gangs` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_gang_equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gang_name` varchar(50) NOT NULL,
  `item_id` varchar(50) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `heading` float NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `gang_item` (`gang_name`, `item_id`),
  CONSTRAINT `fk_gang_equipment_gang` FOREIGN KEY (`gang_name`) REFERENCES `rsg_gangs` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_gang_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gang_name` varchar(50) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `actor` varchar(100) DEFAULT NULL,
  `action` varchar(40) NOT NULL,
  `detail` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `gang_id` (`gang_name`, `id`),
  CONSTRAINT `fk_gang_log_gang` FOREIGN KEY (`gang_name`) REFERENCES `rsg_gangs` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_gang_territories` (
  `territory_id` varchar(50) NOT NULL,
  `gang_name` varchar(50) NOT NULL,
  `claimed_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`territory_id`),
  KEY `gang_name` (`gang_name`),
  CONSTRAINT `fk_gang_territory_gang` FOREIGN KEY (`gang_name`) REFERENCES `rsg_gangs` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_gang_bounties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gang_name` varchar(50) NOT NULL,
  `reward` int(11) NOT NULL,
  `target_type` varchar(10) NOT NULL DEFAULT 'player',
  `target_id` varchar(50) DEFAULT NULL,
  `target_name` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `gang_name` (`gang_name`),
  CONSTRAINT `fk_gang_bounty_gang` FOREIGN KEY (`gang_name`) REFERENCES `rsg_gangs` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_gang_rivals` (
  `gang_name` varchar(50) NOT NULL,
  `rival_name` varchar(50) NOT NULL,
  `kills` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`gang_name`, `rival_name`),
  CONSTRAINT `fk_gang_rival_gang` FOREIGN KEY (`gang_name`) REFERENCES `rsg_gangs` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_gang_rival_other` FOREIGN KEY (`rival_name`) REFERENCES `rsg_gangs` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_gang_state` (
  `key` varchar(50) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_wellpumps` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `citizenid` VARCHAR(50) NOT NULL,
    `x` FLOAT NOT NULL, `y` FLOAT NOT NULL, `z` FLOAT NOT NULL, `h` FLOAT NOT NULL DEFAULT 0,
    `placed_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_wellpump_migrations` (
    `source` VARCHAR(64) NOT NULL,
    `migrated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;
