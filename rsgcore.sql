-- database structure for rsg-framework

SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `favorites_animations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `favorites` longtext NOT NULL DEFAULT '[]',
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `horse_race_tracks` (
  `track_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `points` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`points`)),
  `timestamp` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`track_id`)
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

CREATE TABLE IF NOT EXISTS `inventories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`items`)),
  PRIMARY KEY (`identifier`),
  KEY `id` (`id`)
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE IF NOT EXISTS `player_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `job` varchar(50) NOT NULL,
  `grade` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizen_job` (`citizenid`,`job`)
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

CREATE TABLE IF NOT EXISTS `player_smelter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `properties` text NOT NULL,
  `propid` int(11) NOT NULL,
  `proptype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
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
  `citizenid` varchar(50) NOT NULL,
  `components` varchar(4096) NOT NULL DEFAULT '{}',
  `components_before` varchar(4096) NOT NULL DEFAULT '{}',
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `town` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `player_weapons_custom` (
  `gunsiteid` varchar(20) NOT NULL,
  `propid` varchar(20) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `item` varchar(50) NOT NULL,
  `propdata` longtext NOT NULL,
  PRIMARY KEY (`gunsiteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `playeroutfit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `clothes` longtext DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `skin` longtext NOT NULL,
  `clothes` longtext NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `citizenid` (`citizenid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `railroad_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL DEFAULT '',
  `company_id` varchar(50) NOT NULL DEFAULT '',
  `rank` int(11) NOT NULL DEFAULT 1,
  `xp` int(11) NOT NULL DEFAULT 0,
  `missions_completed` int(11) NOT NULL DEFAULT 0,
  `total_earnings` float NOT NULL DEFAULT 0,
  `joined_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_citizen_company` (`citizenid`,`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `railroad_companies_owned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(50) NOT NULL,
  `owner_citizenid` varchar(50) NOT NULL,
  `owner_name` varchar(100) NOT NULL DEFAULT '',
  `company_name` varchar(100) DEFAULT NULL,
  `cash_register` float NOT NULL DEFAULT 0,
  `purchased_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_company` (`company_id`),
  KEY `idx_owner` (`owner_citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `railroad_company_supplies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(50) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_company_item` (`company_id`,`item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `railroad_company_upgrades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(50) NOT NULL,
  `train_model` varchar(50) NOT NULL,
  `upgrade_speed` int(11) NOT NULL DEFAULT 0,
  `upgrade_fuel_cap` int(11) NOT NULL DEFAULT 0,
  `upgrade_water_cap` int(11) NOT NULL DEFAULT 0,
  `upgrade_durability` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_company_model` (`company_id`,`train_model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `railroad_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(50) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `firstname` varchar(50) DEFAULT '',
  `lastname` varchar(50) DEFAULT '',
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `xp` int(11) NOT NULL DEFAULT 0,
  `rank` int(11) NOT NULL DEFAULT 1,
  `missions_completed` int(11) NOT NULL DEFAULT 0,
  `total_earnings` float NOT NULL DEFAULT 0,
  `applied_at` timestamp NULL DEFAULT current_timestamp(),
  `approved_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_company_citizen` (`company_id`,`citizenid`),
  KEY `idx_citizenid` (`citizenid`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `railroad_rewards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL DEFAULT '',
  `reward_id` varchar(50) NOT NULL DEFAULT '',
  `claimed_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_citizen_reward` (`citizenid`,`reward_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `railroad_trains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL DEFAULT '',
  `company_id` varchar(50) NOT NULL DEFAULT '',
  `train_model` varchar(50) NOT NULL,
  `label` varchar(100) NOT NULL DEFAULT '',
  `fuel` int(11) NOT NULL DEFAULT 100,
  `water` int(11) NOT NULL DEFAULT 100,
  `condition` int(11) NOT NULL DEFAULT 100,
  `upgrade_speed` int(11) NOT NULL DEFAULT 0,
  `upgrade_fuel_cap` int(11) NOT NULL DEFAULT 0,
  `upgrade_water_cap` int(11) NOT NULL DEFAULT 0,
  `upgrade_durability` int(11) NOT NULL DEFAULT 0,
  `total_miles` float NOT NULL DEFAULT 0,
  `is_parked` tinyint(1) NOT NULL DEFAULT 1,
  `parked_station` varchar(50) DEFAULT NULL,
  `parked_direction` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `bank` varchar(50) NOT NULL,
  `balance` decimal(12,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizen_bank` (`citizenid`,`bank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_bank_home` (
  `citizenid` varchar(50) NOT NULL,
  `bank` varchar(50) NOT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_bank_loans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `bank` varchar(50) NOT NULL,
  `principal` decimal(12,2) NOT NULL,
  `owed` decimal(12,2) NOT NULL,
  `due_at` timestamp NOT NULL,
  `late` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizen_bank` (`citizenid`,`bank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_bank_lockbox_items` (
  `citizenid` varchar(50) NOT NULL,
  `bank` varchar(50) NOT NULL,
  `item` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`citizenid`,`bank`,`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_bank_lockboxes` (
  `citizenid` varchar(50) NOT NULL,
  `bank` varchar(50) NOT NULL,
  `size` varchar(20) NOT NULL,
  `upgrades` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`citizenid`,`bank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_bank_meta` (
  `k` varchar(50) NOT NULL,
  `v` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`k`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_bank_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `bank` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizen_bank_idx` (`citizenid`,`bank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_drugs_labs` (
  `citizenid` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_farming_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `crop` varchar(50) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `h` float NOT NULL DEFAULT 0,
  `growth` float NOT NULL DEFAULT 0,
  `water` float NOT NULL DEFAULT 0,
  `fertilizer` float NOT NULL DEFAULT 0,
  `health` float NOT NULL DEFAULT 100,
  `dead` tinyint(1) NOT NULL DEFAULT 0,
  `dead_time` int(11) NOT NULL DEFAULT 0,
  `planted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_farming_wellpumps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `h` float NOT NULL DEFAULT 0,
  `placed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_housekeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `houseid` varchar(20) NOT NULL DEFAULT '0',
  `citizenid` varchar(50) NOT NULL DEFAULT '0',
  `guest` int(1) NOT NULL DEFAULT 0,
  `perm_doors` tinyint(1) NOT NULL DEFAULT 1,
  `perm_storage` tinyint(1) NOT NULL DEFAULT 1,
  `perm_wardrobe` tinyint(1) NOT NULL DEFAULT 1,
  `perm_mailbox` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`),
  KEY `idx_houseid` (`houseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO `rsg_housing` (`id`, `region`, `houseid`, `citizenid`, `fullname`, `rented`, `rent`, `rent_due`, `reminder_sent`, `custom_name`, `storage_tier`) VALUES
	(1, 'newhanover', 'house1', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(2, 'westelizabeth', 'house2', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(3, 'newhanover', 'house3', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(4, 'lemoyne', 'house4', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(5, 'lemoyne', 'house5', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(6, 'lemoyne', 'house6', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(7, 'newaustin', 'house7', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(8, 'newhanover', 'house8', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(9, 'newhanover', 'house9', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(10, 'newhanover', 'house10', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(11, 'lemoyne', 'house11', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(12, 'lemoyne', 'house12', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(13, 'lemoyne', 'house13', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(14, 'lemoyne', 'house14', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(15, 'lemoyne', 'house15', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(16, 'lemoyne', 'house16', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(17, 'newhanover', 'house17', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(18, 'newhanover', 'house18', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(19, 'newhanover', 'house19', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(20, 'ambarino', 'house20', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(21, 'newhanover', 'house21', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(22, 'ambarino', 'house22', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(23, 'ambarino', 'house23', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(24, 'ambarino', 'house24', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(25, 'westelizabeth', 'house25', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(26, 'westelizabeth', 'house26', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(27, 'westelizabeth', 'house27', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(28, 'westelizabeth', 'house28', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(29, 'newaustin', 'house29', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(30, 'newaustin', 'house30', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(31, 'newaustin', 'house31', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(32, 'newaustin', 'house32', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(33, 'newaustin', 'house33', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(34, 'ambarino', 'house34', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(35, 'ambarino', 'house35', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(36, 'newhanover', 'house36', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(37, 'ambarino', 'house37', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(38, 'newhanover', 'house38', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(39, 'newhanover', 'house39', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(40, 'lemoyne', 'house40', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(41, 'lemoyne', 'house41', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(42, 'ambarino', 'house42', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(43, 'newaustin', 'house43', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(44, 'newhanover', 'house44', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(45, 'lemoyne', 'house45', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(46, 'westelizabeth', 'house46', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(47, 'newhanover', 'house47', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(48, 'westelizabeth', 'house48', '0', '0', 0, 50, NULL, 0, NULL, 1);

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `charname` varchar(50) NOT NULL,
  `loyalty_points` int(11) NOT NULL DEFAULT 0,
  `lifetime_points` int(11) NOT NULL DEFAULT 0,
  `last_update` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid` (`citizenid`),
  KEY `loyalty_points_idx` (`loyalty_points`),
  KEY `lifetime_points_idx` (`lifetime_points`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE IF NOT EXISTS `rsg_ranch_wellpumps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `h` float NOT NULL DEFAULT 0,
  `placed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
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

CREATE TABLE IF NOT EXISTS `rsg_smelting_state` (
  `id` tinyint(3) unsigned NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO `rsg_smelting_state` (`id`, `data`) VALUES
	(1, '{"live":[],"owed":[]}');

CREATE TABLE IF NOT EXISTS `rsg_stables_breeding` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `stable` varchar(50) NOT NULL,
  `parent_a` int(11) NOT NULL,
  `parent_b` int(11) NOT NULL,
  `ready_at` bigint(20) NOT NULL,
  `collected` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `stable` (`stable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_stables_horses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `stable` varchar(50) DEFAULT NULL,
  `model` varchar(100) NOT NULL,
  `breed_label` varchar(100) NOT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `breed_cooldown` bigint(20) NOT NULL DEFAULT 0,
  `died_of_age` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT 'Unnamed Horse',
  `outfit` int(11) NOT NULL DEFAULT 0,
  `tack` text DEFAULT NULL,
  `shoe_wear` float NOT NULL DEFAULT 0,
  `coat` text DEFAULT NULL,
  `health` float NOT NULL DEFAULT 100,
  `stamina` float NOT NULL DEFAULT 100,
  `hunger` float NOT NULL DEFAULT 100,
  `thirst` float NOT NULL DEFAULT 100,
  `bonding` float NOT NULL DEFAULT 0,
  `training` text DEFAULT NULL,
  `speed` int(11) NOT NULL DEFAULT 50,
  `accel` int(11) NOT NULL DEFAULT 50,
  `handling` int(11) NOT NULL DEFAULT 50,
  `maxhealth` int(11) NOT NULL DEFAULT 50,
  `alive` tinyint(1) NOT NULL DEFAULT 1,
  `insured` tinyint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `pos_x` float DEFAULT NULL,
  `pos_y` float DEFAULT NULL,
  `pos_z` float DEFAULT NULL,
  `pos_h` float DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `stable` (`stable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_stables_races` (
  `citizenid` varchar(50) NOT NULL,
  `race` varchar(50) NOT NULL,
  `rider` varchar(100) NOT NULL DEFAULT '',
  `horse` varchar(50) NOT NULL DEFAULT '',
  `best_ms` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`,`race`),
  KEY `race_best` (`race`,`best_ms`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_telegram_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `contact_citizenid` varchar(50) NOT NULL,
  `contact_name` varchar(100) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_contact` (`citizenid`,`contact_citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_telegrams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `recipient_name` varchar(100) NOT NULL,
  `sender_citizenid` varchar(50) NOT NULL,
  `sender_name` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE IF NOT EXISTS `shop_stock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(50) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `stock` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_name_item_name` (`shop_name`,`item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `zonenotify_discoveries` (
  `citizenid` varchar(50) NOT NULL,
  `zone` varchar(64) NOT NULL,
  `discovered_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`citizenid`,`zone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;
