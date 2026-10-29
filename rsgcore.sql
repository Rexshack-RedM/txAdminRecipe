-- Optimized RSG Core SQL File[cite: 1]

SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE IF NOT EXISTS `admin_activity_log` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `sample_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  `online_count` INT(11) NOT NULL DEFAULT 0,
  `total_money` DECIMAL(15,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `admin_chat_messages` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `sender_citizenid` VARCHAR(50) DEFAULT NULL,
  `sender_name` VARCHAR(255) NOT NULL,
  `sender_role` VARCHAR(20) DEFAULT NULL,
  `sender_discord_name` VARCHAR(255) DEFAULT NULL,
  `sender_discord_avatar_url` VARCHAR(500) DEFAULT NULL,
  `message` VARCHAR(500) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  KEY `admin_citizenid` (`admin_citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `admin_player_history` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `action` VARCHAR(20) NOT NULL,
  `reason` VARCHAR(255) DEFAULT NULL,
  `admin_name` VARCHAR(255) DEFAULT NULL,
  `duration_seconds` INT(11) DEFAULT NULL,
  `severity` VARCHAR(20) DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  `reporter_steam` VARCHAR(50) DEFAULT NULL,
  `severity` VARCHAR(20) DEFAULT 'medium',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `admin_report_messages` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `report_id` INT(11) NOT NULL,
  `sender_type` VARCHAR(50) NOT NULL,
  `sender_id` INT(11) NOT NULL,
  `sender_name` VARCHAR(255) NOT NULL,
  `message` TEXT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  KEY `report_id` (`report_id`),
  CONSTRAINT `admin_report_messages_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `admin_reports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `admin_report_nearby_players` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `report_id` INT(11) NOT NULL,
  `player_id` INT(11) NOT NULL,
  `player_name` VARCHAR(255) NOT NULL,
  `player_license` VARCHAR(255) NOT NULL,
  `distance` FLOAT NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_id` (`report_id`),
  CONSTRAINT `admin_report_nearby_players_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `admin_reports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `admin_roles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `license` VARCHAR(100) DEFAULT NULL,
  `discord` VARCHAR(50) DEFAULT NULL,
  `name` VARCHAR(255) DEFAULT NULL,
  `role` VARCHAR(20) NOT NULL,
  `granted_by` VARCHAR(255) DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `admin_whitelist` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `player_name` VARCHAR(255) NOT NULL,
  `account_name` VARCHAR(255) DEFAULT NULL,
  `status` VARCHAR(20) NOT NULL DEFAULT 'active',
  `reason` VARCHAR(255) DEFAULT NULL,
  `added_by_name` VARCHAR(255) DEFAULT NULL,
  `expires_at` TIMESTAMP NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `adminmenu_blips` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `sprite` VARCHAR(50) NOT NULL,
  `x` FLOAT NOT NULL,
  `y` FLOAT NOT NULL,
  `z` FLOAT NOT NULL,
  `scale` FLOAT NOT NULL DEFAULT 1,
  `created_by` VARCHAR(255) DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `adminmenu_custom_items` (
  `name` VARCHAR(64) NOT NULL,
  `label` VARCHAR(100) NOT NULL,
  `description` VARCHAR(255) DEFAULT NULL,
  `weight` INT(11) NOT NULL DEFAULT 0,
  `type` VARCHAR(20) NOT NULL DEFAULT 'item',
  `image` VARCHAR(150) NOT NULL,
  `created_by` VARCHAR(255) DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `adminmenu_settings` (
  `setting_key` VARCHAR(64) NOT NULL,
  `setting_value` TEXT DEFAULT NULL,
  PRIMARY KEY (`setting_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `bans` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) DEFAULT NULL,
  `license` VARCHAR(50) DEFAULT NULL,
  `discord` VARCHAR(50) DEFAULT NULL,
  `ip` VARCHAR(50) DEFAULT NULL,
  `reason` TEXT DEFAULT NULL,
  `expire` INT(11) DEFAULT NULL,
  `bannedby` VARCHAR(255) NOT NULL DEFAULT 'Anticheat',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `favorites_animations` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `favorites` LONGTEXT NOT NULL DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `horse_race_tracks` (
  `track_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `points` LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`points`)),
  `timestamp` DATETIME DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`track_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `inventories` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `identifier` VARCHAR(255) NOT NULL,
  `items` LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`items`)),
  PRIMARY KEY (`identifier`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `management_funds` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `job_name` VARCHAR(50) NOT NULL,
  `amount` INT(100) NOT NULL,
  `type` ENUM('boss','gang') NOT NULL DEFAULT 'boss',
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_name` (`job_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `management_funds` (`id`, `job_name`, `amount`, `type`) VALUES
	(1, 'vallaw', 0, 'boss'),
	(2, 'rholaw', 0, 'boss'),
	(3, 'blklaw', 0, 'boss'),
	(4, 'strlaw', 0, 'boss'),
	(5, 'stdenlaw', 0, 'boss'),
	(6, 'medic', 0, 'boss');

CREATE TABLE IF NOT EXISTS `mdt_audit_logs` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `action` VARCHAR(50) NOT NULL,
  `target_type` VARCHAR(50) DEFAULT NULL,
  `target_id` VARCHAR(100) DEFAULT NULL,
  `target_name` VARCHAR(100) DEFAULT NULL,
  `details` TEXT DEFAULT NULL,
  `performed_by` VARCHAR(50) NOT NULL,
  `performed_by_name` VARCHAR(100) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  KEY `idx_action` (`action`),
  KEY `idx_performed_by` (`performed_by`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_bolos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT DEFAULT NULL,
  `last_seen` VARCHAR(255) DEFAULT NULL,
  `officer` VARCHAR(100) NOT NULL,
  `officer_cid` VARCHAR(50) DEFAULT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  KEY `idx_title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_charge_templates` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT DEFAULT NULL,
  `fine` INT(11) DEFAULT 0,
  `jailtime` INT(11) DEFAULT 0,
  `category` VARCHAR(50) DEFAULT 'misdemeanor',
  `created_by` VARCHAR(50) DEFAULT NULL,
  `created_by_name` VARCHAR(100) DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  KEY `idx_category` (`category`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `mdt_charge_templates` (`id`, `name`, `description`, `fine`, `jailtime`, `category`, `created_by`, `created_by_name`, `created_at`, `updated_at`) VALUES
	(1, 'Assault', 'Physical assault on another person', 50, 2, 'felony', NULL, NULL, '2026-10-10 19:26:58', '2026-10-10 19:26:58'),
	(2, 'Battery', 'Unlawful physical force against another', 75, 3, 'felony', NULL, NULL, '2026-10-10 19:26:58', '2026-10-10 19:26:58'),
	(3, 'Theft', 'Stealing property valued under $50', 25, 0, 'misdemeanor', NULL, NULL, '2026-10-10 19:26:58', '2026-10-10 19:26:58'),
	(4, 'Grand Theft', 'Stealing property valued $50 or more', 100, 6, 'felony', NULL, NULL, '2026-10-10 19:26:58', '2026-10-10 19:26:58'),
	(5, 'Trespassing', 'Unauthorized entry onto private property', 15, 0, 'misdemeanor', NULL, NULL, '2026-10-10 19:26:58', '2026-10-10 19:26:58'),
	(6, 'Public Intoxication', 'Being drunk in public', 10, 0, 'infraction', NULL, NULL, '2026-10-10 19:26:58', '2026-10-10 19:26:58'),
	(7, 'Disorderly Conduct', 'Disturbing the peace', 20, 0, 'misdemeanor', NULL, NULL, '2026-10-10 19:26:58', '2026-10-10 19:26:58'),
	(8, 'Vandalism', 'Willful destruction of property', 30, 0, 'misdemeanor', NULL, NULL, '2026-10-10 19:26:58', '2026-10-10 19:26:58'),
	(9, 'Fraud', 'Deception for personal gain', 150, 12, 'felony', NULL, NULL, '2026-10-10 19:26:58', '2026-10-10 19:26:58'),
	(10, 'Murder', 'Unlawful killing of another person', 0, 60, 'felony', NULL, NULL, '2026-10-10 19:26:58', '2026-10-10 19:26:58'),
	(11, 'Horse Theft', 'Stealing a horse or other mount', 200, 24, 'felony', NULL, NULL, '2026-10-10 19:26:58', '2026-10-10 19:26:58'),
	(12, 'Bank Robbery', 'Robbery of a banking institution', 500, 48, 'felony', NULL, NULL, '2026-10-10 19:26:58', '2026-10-10 19:26:58'),
	(13, 'Resisting Arrest', 'Resisting or fleeing from law enforcement', 50, 1, 'misdemeanor', NULL, NULL, '2026-10-10 19:26:58', '2026-10-10 19:26:58'),
	(14, 'Obstruction of Justice', 'Interfering with law enforcement duties', 40, 0, 'misdemeanor', NULL, NULL, '2026-10-10 19:26:58', '2026-10-10 19:26:58');

CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `type` VARCHAR(50) DEFAULT 'incident',
  `description` TEXT DEFAULT NULL,
  `officers` LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`officers`)),
  `suspects` LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`suspects`)),
  `evidence` LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`evidence`)),
  `officer` VARCHAR(100) NOT NULL,
  `officer_cid` VARCHAR(50) DEFAULT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  KEY `idx_type` (`type`),
  KEY `idx_officer` (`officer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_citizen_profiles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `profile_picture` VARCHAR(512) DEFAULT NULL,
  `notes` TEXT DEFAULT NULL,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid` (`citizenid`),
  KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_fines` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `citizen_name` VARCHAR(100) NOT NULL,
  `issued_charge_ids` LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`issued_charge_ids`)),
  `total_amount` INT(11) NOT NULL DEFAULT 0,
  `due_date` TIMESTAMP NULL DEFAULT NULL,
  `status` ENUM('unpaid','paid','overdue') DEFAULT 'unpaid',
  `issued_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  `paid_at` TIMESTAMP NULL DEFAULT NULL,
  `officer_name` VARCHAR(100) DEFAULT NULL,
  `officer_cid` VARCHAR(50) DEFAULT NULL,
  `paid_to_officer` VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`),
  KEY `idx_status` (`status`),
  KEY `idx_due_date` (`due_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_issued_charges` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `citizen_name` VARCHAR(100) NOT NULL,
  `charge_template_id` INT(11) DEFAULT NULL,
  `charge_name` VARCHAR(255) NOT NULL,
  `charge_description` TEXT DEFAULT NULL,
  `fine` INT(11) DEFAULT 0,
  `jailtime` INT(11) DEFAULT 0,
  `time_served` INT(11) DEFAULT 0,
  `is_served` TINYINT(1) DEFAULT 0,
  `officer` VARCHAR(100) NOT NULL,
  `officer_cid` VARCHAR(50) DEFAULT NULL,
  `report_id` INT(11) DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  `served_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`),
  KEY `idx_officer` (`officer`),
  KEY `idx_is_served` (`is_served`),
  KEY `charge_template_id` (`charge_template_id`),
  CONSTRAINT `mdt_issued_charges_ibfk_1` FOREIGN KEY (`charge_template_id`) REFERENCES `mdt_charge_templates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_charge_attachments` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `charge_id` INT(11) NOT NULL,
  `report_id` INT(11) NOT NULL,
  `attached_by` VARCHAR(50) NOT NULL,
  `attached_by_name` VARCHAR(100) NOT NULL,
  `attached_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_charge_report` (`charge_id`,`report_id`),
  KEY `idx_charge_id` (`charge_id`),
  KEY `idx_report_id` (`report_id`),
  CONSTRAINT `mdt_charge_attachments_ibfk_1` FOREIGN KEY (`charge_id`) REFERENCES `mdt_issued_charges` (`id`) ON DELETE CASCADE,
  CONSTRAINT `mdt_charge_attachments_ibfk_2` FOREIGN KEY (`report_id`) REFERENCES `mdt_reports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_records` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `crime` VARCHAR(255) NOT NULL,
  `description` TEXT DEFAULT NULL,
  `fine` INT(11) DEFAULT 0,
  `jailtime` INT(11) DEFAULT 0,
  `officer` VARCHAR(100) NOT NULL,
  `officer_cid` VARCHAR(50) DEFAULT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_report_comments` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `report_id` INT(11) NOT NULL,
  `author` VARCHAR(100) NOT NULL,
  `author_cid` VARCHAR(50) DEFAULT NULL,
  `content` TEXT NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  KEY `idx_report_id` (`report_id`),
  CONSTRAINT `mdt_report_comments_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `mdt_reports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_roles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `label` VARCHAR(100) NOT NULL,
  `permissions` LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `mdt_roles` (`id`, `name`, `label`, `permissions`, `created_at`) VALUES
	(1, 'admin', 'Administrator', '{"canCreateRecords": true, "canDeleteRecords": true, "canManageWarrants": true, "isAdmin": true}', '2026-10-10 19:26:58'),
	(2, 'supervisor', 'Supervisor', '{"canCreateRecords": true, "canDeleteRecords": true, "canManageWarrants": true, "isAdmin": false}', '2026-10-10 19:26:58'),
	(3, 'officer', 'Officer', '{"canCreateRecords": true, "canDeleteRecords": false, "canManageWarrants": false, "isAdmin": false}', '2026-10-10 19:26:58');

CREATE TABLE IF NOT EXISTS `mdt_staff` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `role` VARCHAR(50) DEFAULT 'officer',
  `permissions` LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid` (`citizenid`),
  KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mdt_warrants` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `reason` TEXT NOT NULL,
  `status` ENUM('active','served','expired') DEFAULT 'active',
  `officer` VARCHAR(100) NOT NULL,
  `officer_cid` VARCHAR(50) DEFAULT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP(),
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `player_ammo` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(255) NOT NULL,
  `ammo_revolver` INT(3) NOT NULL DEFAULT 0,
  `ammo_revolver_express` INT(3) NOT NULL DEFAULT 0,
  `ammo_revolver_express_explosive` INT(3) NOT NULL DEFAULT 0,
  `ammo_revolver_high_velocity` INT(3) NOT NULL DEFAULT 0,
  `ammo_revolver_split_point` INT(3) NOT NULL DEFAULT 0,
  `ammo_pistol` INT(3) NOT NULL DEFAULT 0,
  `ammo_pistol_express` INT(3) NOT NULL DEFAULT 0,
  `ammo_pistol_express_explosive` INT(3) NOT NULL DEFAULT 0,
  `ammo_pistol_high_velocity` INT(3) NOT NULL DEFAULT 0,
  `ammo_pistol_split_point` INT(3) NOT NULL DEFAULT 0,
  `ammo_repeater` INT(3) NOT NULL DEFAULT 0,
  `ammo_repeater_express` INT(3) NOT NULL DEFAULT 0,
  `ammo_repeater_express_explosive` INT(3) NOT NULL DEFAULT 0,
  `ammo_repeater_high_velocity` INT(3) NOT NULL DEFAULT 0,
  `ammo_repeater_split_point` INT(3) NOT NULL DEFAULT 0,
  `ammo_rifle` INT(3) NOT NULL DEFAULT 0,
  `ammo_rifle_express` INT(3) NOT NULL DEFAULT 0,
  `ammo_rifle_express_explosive` INT(3) NOT NULL DEFAULT 0,
  `ammo_rifle_high_velocity` INT(3) NOT NULL DEFAULT 0,
  `ammo_rifle_split_point` INT(3) NOT NULL DEFAULT 0,
  `ammo_shotgun` INT(3) NOT NULL DEFAULT 0,
  `ammo_shotgun_buckshot_incendiary` INT(3) NOT NULL DEFAULT 0,
  `ammo_shotgun_slug` INT(3) NOT NULL DEFAULT 0,
  `ammo_shotgun_slug_explosive` INT(3) NOT NULL DEFAULT 0,
  `ammo_rifle_elephant` INT(3) NOT NULL DEFAULT 0,
  `ammo_22` INT(3) NOT NULL DEFAULT 0,
  `ammo_22_tranquilizer` INT(3) NOT NULL DEFAULT 0,
  `ammo_arrow` INT(3) NOT NULL DEFAULT 0,
  `ammo_arrow_small_game` INT(3) NOT NULL DEFAULT 0,
  `ammo_arrow_fire` INT(3) NOT NULL DEFAULT 0,
  `ammo_arrow_poison` INT(3) NOT NULL DEFAULT 0,
  `ammo_arrow_dynamite` INT(3) NOT NULL DEFAULT 0,
  `ammo_molotov` INT(3) NOT NULL DEFAULT 0,
  `ammo_tomahawk` INT(3) NOT NULL DEFAULT 0,
  `ammo_tomahawk_ancient` INT(3) NOT NULL DEFAULT 0,
  `ammo_dynamite` INT(3) NOT NULL DEFAULT 0,
  `ammo_poisonbottle` INT(3) NOT NULL DEFAULT 0,
  `ammo_throwing_knives` INT(3) NOT NULL DEFAULT 0,
  `ammo_throwing_knives_drain` INT(3) NOT NULL DEFAULT 0,
  `ammo_throwing_knives_poison` INT(3) NOT NULL DEFAULT 0,
  `ammo_bolas` INT(3) NOT NULL DEFAULT 0,
  `ammo_bolas_hawkmoth` INT(3) NOT NULL DEFAULT 0,
  `ammo_bolas_intertwined` INT(3) NOT NULL DEFAULT 0,
  `ammo_bolas_ironspiked` INT(3) NOT NULL DEFAULT 0,
  `ammo_hatchet` INT(3) NOT NULL DEFAULT 0,
  `ammo_hatchet_hunter` INT(3) NOT NULL DEFAULT 0,
  `ammo_hatchet_cleaver` INT(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `citizenid` (`citizenid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `player_backpack` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `serial` VARCHAR(32) NOT NULL,
  `citizenid` VARCHAR(50) DEFAULT NULL,
  `owner` VARCHAR(50) DEFAULT NULL,
  `backpackitem` VARCHAR(50) NOT NULL,
  `model` VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial` (`serial`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `player_birds` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `identifier` VARCHAR(50) NOT NULL,
  `charid` INT(11) NOT NULL,
  `model` VARCHAR(255) NOT NULL,
  `preset` INT(11) NOT NULL DEFAULT 0,
  `xp` INT(11) NOT NULL DEFAULT 0,
  `price` INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `player_dogs` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `identifier` VARCHAR(50) NOT NULL,
  `charid` INT(11) NOT NULL,
  `model` VARCHAR(255) NOT NULL,
  `preset` INT(11) NOT NULL DEFAULT 0,
  `xp` INT(11) NOT NULL DEFAULT 0,
  `price` INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `player_goldrockers` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) DEFAULT NULL,
  `owner` VARCHAR(50) DEFAULT NULL,
  `properties` TEXT NOT NULL,
  `propid` INT(11) NOT NULL,
  `proptype` VARCHAR(50) DEFAULT NULL,
  `licensed` TINYINT(1) NOT NULL DEFAULT 0,
  `claimname` VARCHAR(100) DEFAULT NULL,
  `paydirt` INT(3) NOT NULL DEFAULT 0,
  `water` INT(3) NOT NULL DEFAULT 0,
  `quality` INT(3) NOT NULL DEFAULT 100,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `player_jobs` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) DEFAULT NULL,
  `job` VARCHAR(50) DEFAULT NULL,
  `grade` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `multijob_jobs` (
    `name` VARCHAR(50) NOT NULL,
    `label` VARCHAR(100) NOT NULL,
    `type` VARCHAR(50) NULL DEFAULT NULL,
    `icon` VARCHAR(100) NULL DEFAULT NULL,
    `default_duty` TINYINT(1) NOT NULL DEFAULT 1,
    `off_duty_pay` TINYINT(1) NOT NULL DEFAULT 0,
    `grades` LONGTEXT NOT NULL,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `multijob_jobs` (`name`, `label`, `type`, `icon`, `default_duty`, `off_duty_pay`, `grades`, `updated_at`) VALUES
	('blklaw', 'Blackwater Law Enforcement', 'leo', 'fa-solid fa-shield', 0, 0, '{"1":{"payment":25,"name":"Deputy"},"2":{"payment":50,"isboss":true,"name":"Sheriff"},"0":{"payment":10,"name":"Recruit"}}', '2026-10-14 14:26:58'),
	('downesranch', 'Downes Rancher', 'rancher', NULL, 1, 0, '{"1":{"payment":5,"name":"Ranch Hand"},"2":{"payment":0,"isboss":true,"name":"Ranch Manager"},"0":{"payment":3,"name":"Trainee Rancher"}}', '2026-10-14 14:26:58'),
	('emeraldranch', 'Emerald Rancher', 'rancher', NULL, 1, 0, '{"1":{"payment":5,"name":"Ranch Hand"},"2":{"payment":0,"isboss":true,"name":"Ranch Manager"},"0":{"payment":3,"name":"Trainee Rancher"}}', '2026-10-14 14:26:58'),
	('hangingdogranch', 'Hanging Dog Rancher', 'rancher', NULL, 1, 0, '{"1":{"payment":5,"name":"Ranch Hand"},"2":{"payment":0,"isboss":true,"name":"Ranch Manager"},"0":{"payment":3,"name":"Trainee Rancher"}}', '2026-10-14 14:26:58'),
	('herbalist', 'Herbalist', NULL, NULL, 1, 0, '{"1":{"payment":0,"isboss":true,"name":"Master"},"0":{"payment":0,"name":"Apprentice"}}', '2026-10-14 14:26:58'),
	('hillhavenranch', 'Hill Haven Rancher', 'rancher', NULL, 1, 0, '{"1":{"payment":5,"name":"Ranch Hand"},"2":{"payment":0,"isboss":true,"name":"Ranch Manager"},"0":{"payment":3,"name":"Trainee Rancher"}}', '2026-10-14 14:26:58'),
	('macfarranch', 'Macfarlane Rancher', 'rancher', NULL, 1, 0, '{"1":{"payment":5,"name":"Ranch Hand"},"2":{"payment":0,"isboss":true,"name":"Ranch Manager"},"0":{"payment":3,"name":"Trainee Rancher"}}', '2026-10-14 14:26:58'),
	('medic', 'Medic', 'medic', 'fa-solid fa-user-nurse', 0, 0, '{"1":{"payment":25,"name":"Trainee"},"2":{"payment":50,"name":"Doctor"},"0":{"payment":5,"name":"Recruit"},"3":{"payment":75,"name":"Surgeon"},"4":{"payment":100,"isboss":true,"name":"Manager"}}', '2026-10-14 14:26:58'),
	('pronghornranch', 'Pronghorn Rancher', 'rancher', NULL, 1, 0, '{"1":{"payment":5,"name":"Ranch Hand"},"2":{"payment":0,"isboss":true,"name":"Ranch Manager"},"0":{"payment":3,"name":"Trainee Rancher"}}', '2026-10-14 14:26:58'),
	('rholaw', 'Rhodes Law Enforcement', 'leo', 'fa-solid fa-shield', 0, 0, '{"1":{"payment":25,"name":"Deputy"},"2":{"payment":50,"isboss":true,"name":"Sheriff"},"0":{"payment":10,"name":"Recruit"}}', '2026-10-14 14:26:58'),
	('stdenlaw', 'Saint Denis Law Enforcement', 'leo', 'fa-solid fa-shield', 0, 0, '{"1":{"payment":25,"name":"Deputy"},"2":{"payment":50,"isboss":true,"name":"Sheriff"},"0":{"payment":10,"name":"Recruit"}}', '2026-10-14 14:26:58'),
	('strlaw', 'Strawberry Law Enforcement', 'leo', 'fa-solid fa-shield', 0, 0, '{"1":{"payment":25,"name":"Deputy"},"2":{"payment":50,"isboss":true,"name":"Sheriff"},"0":{"payment":10,"name":"Recruit"}}', '2026-10-14 14:26:58'),
	('unemployed', 'Civilian', NULL, NULL, 1, 0, '{"0":{"payment":3,"name":"Freelancer"}}', '2026-10-14 14:26:58'),
	('vallaw', 'Valentine Law Enforcement', 'leo', 'fa-solid fa-shield', 0, 0, '{"1":{"payment":25,"name":"Deputy"},"2":{"payment":50,"isboss":true,"name":"Sheriff"},"0":{"payment":10,"name":"Recruit"}}', '2026-10-14 14:26:58');

CREATE TABLE IF NOT EXISTS `player_playtime` (
  `citizenid` VARCHAR(50) NOT NULL,
  `minutes` INT(11) NOT NULL DEFAULT 0,
  `last_seen` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `player_samples` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `sample_id` VARCHAR(50) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_citizenid_sampleid` (`citizenid`,`sample_id`),
  KEY `idx_citizenid` (`citizenid`),
  KEY `idx_sample_id` (`sample_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `player_selected_pets` (
  `identifier` VARCHAR(50) NOT NULL,
  `charid` INT(11) NOT NULL,
  `selected_dog` INT(11) DEFAULT NULL,
  `selected_bird` INT(11) DEFAULT NULL,
  UNIQUE KEY `uc_player` (`identifier`,`charid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `player_smelter` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) DEFAULT NULL,
  `properties` TEXT NOT NULL,
  `propid` INT(11) NOT NULL,
  `proptype` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `player_weapons` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `serial` VARCHAR(16) NOT NULL,
  `citizenid` VARCHAR(9) NOT NULL,
  `components` VARCHAR(4096) NOT NULL DEFAULT '{}',
  `components_before` VARCHAR(4096) NOT NULL DEFAULT '{}',
  `price` DECIMAL(5,2) NOT NULL DEFAULT 0.00,
  `town` INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `player_weapons_custom` (
  `gunsiteid` VARCHAR(20) NOT NULL,
  `propid` VARCHAR(20) NOT NULL,
  `citizenid` VARCHAR(50) NOT NULL,
  `item` VARCHAR(50) NOT NULL,
  `propdata` LONGTEXT NOT NULL,
  PRIMARY KEY (`gunsiteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `playeroutfit` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `clothes` LONGTEXT DEFAULT NULL,
  `is_default` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `players` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(255) NOT NULL,
  `cid` INT(11) DEFAULT NULL,
  `license` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `outlawstatus` INT(11) NOT NULL DEFAULT 0,
  `money` TEXT NOT NULL,
  `charinfo` TEXT DEFAULT NULL,
  `job` TEXT NOT NULL,
  `gang` TEXT DEFAULT NULL,
  `position` TEXT NOT NULL,
  `metadata` TEXT NOT NULL,
  `inventory` LONGTEXT DEFAULT NULL,
  `weight` INT(11) NOT NULL DEFAULT 0,
  `slots` INT(11) NOT NULL DEFAULT 0,
  `last_updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(255) NOT NULL,
  `skin` VARCHAR(8000) NOT NULL,
  `clothes` VARCHAR(8000) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `citizenid` (`citizenid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `railroad_companies` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL DEFAULT '',
  `company_id` VARCHAR(50) NOT NULL DEFAULT '',
  `rank` INT(11) NOT NULL DEFAULT 1,
  `xp` INT(11) NOT NULL DEFAULT 0,
  `missions_completed` INT(11) NOT NULL DEFAULT 0,
  `total_earnings` FLOAT NOT NULL DEFAULT 0,
  `joined_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_citizen_company` (`citizenid`,`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `railroad_companies_owned` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `company_id` VARCHAR(50) NOT NULL,
  `owner_citizenid` VARCHAR(50) NOT NULL,
  `owner_name` VARCHAR(100) NOT NULL DEFAULT '',
  `company_name` VARCHAR(100) DEFAULT NULL,
  `cash_register` FLOAT NOT NULL DEFAULT 0,
  `purchased_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_company` (`company_id`),
  KEY `idx_owner` (`owner_citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `railroad_company_supplies` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `company_id` VARCHAR(50) NOT NULL,
  `item_name` VARCHAR(50) NOT NULL,
  `quantity` INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_company_item` (`company_id`,`item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `railroad_company_upgrades` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `company_id` VARCHAR(50) NOT NULL,
  `train_model` VARCHAR(50) NOT NULL,
  `upgrade_speed` INT(11) NOT NULL DEFAULT 0,
  `upgrade_fuel_cap` INT(11) NOT NULL DEFAULT 0,
  `upgrade_water_cap` INT(11) NOT NULL DEFAULT 0,
  `upgrade_durability` INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_company_model` (`company_id`,`train_model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `applied_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  `approved_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_company_citizen` (`company_id`,`citizenid`),
  KEY `idx_citizenid` (`citizenid`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `railroad_rewards` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL DEFAULT '',
  `reward_id` VARCHAR(50) NOT NULL DEFAULT '',
  `claimed_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_citizen_reward` (`citizenid`,`reward_id`)
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
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_bank_accounts` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `bank` VARCHAR(50) NOT NULL,
  `balance` DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizen_bank` (`citizenid`,`bank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_bank_home` (
  `citizenid` VARCHAR(50) NOT NULL,
  `bank` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_bank_loans` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `bank` VARCHAR(50) NOT NULL,
  `principal` DECIMAL(12,2) NOT NULL,
  `owed` DECIMAL(12,2) NOT NULL,
  `due_at` TIMESTAMP NOT NULL,
  `late` TINYINT(1) NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizen_bank` (`citizenid`,`bank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_bank_lockbox_items` (
  `citizenid` VARCHAR(50) NOT NULL,
  `bank` VARCHAR(50) NOT NULL,
  `item` VARCHAR(100) NOT NULL,
  `amount` INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`citizenid`,`bank`,`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_bank_lockboxes` (
  `citizenid` VARCHAR(50) NOT NULL,
  `bank` VARCHAR(50) NOT NULL,
  `size` VARCHAR(20) NOT NULL,
  `upgrades` INT(11) NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`citizenid`,`bank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_bank_meta` (
  `k` VARCHAR(50) NOT NULL,
  `v` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`k`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_bank_transactions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `bank` VARCHAR(50) NOT NULL,
  `type` VARCHAR(20) NOT NULL,
  `amount` DECIMAL(12,2) NOT NULL,
  `note` VARCHAR(255) DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  KEY `citizen_bank_idx` (`citizenid`,`bank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_cooking_campfires` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `x` FLOAT NOT NULL,
  `y` FLOAT NOT NULL,
  `z` FLOAT NOT NULL,
  `heading` FLOAT NOT NULL DEFAULT 0,
  `expires` INT(10) UNSIGNED DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `planted_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_farming_wellpumps` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `x` FLOAT NOT NULL,
  `y` FLOAT NOT NULL,
  `z` FLOAT NOT NULL,
  `h` FLOAT NOT NULL DEFAULT 0,
  `placed_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_imaps` (
  `hash` INT(11) NOT NULL,
  `name` VARCHAR(128) DEFAULT NULL,
  `label` VARCHAR(100) DEFAULT NULL,
  `state` TINYINT(1) DEFAULT NULL,
  `updated_by` VARCHAR(64) DEFAULT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_lumberjack_trees` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `identifier` VARCHAR(64) NOT NULL,
  `owner_citizenid` VARCHAR(50) NOT NULL,
  `x` DOUBLE NOT NULL,
  `y` DOUBLE NOT NULL,
  `z` DOUBLE NOT NULL,
  `heading` FLOAT NOT NULL DEFAULT 0,
  `model` VARCHAR(64) NOT NULL DEFAULT 'p_tree_birch_01_sapling',
  `stage` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1,
  `state` ENUM('planted','growing','ready','chopped') NOT NULL DEFAULT 'planted',
  `watered` TINYINT(1) NOT NULL DEFAULT 0,
  `fertilized` TINYINT(1) NOT NULL DEFAULT 0,
  `planted_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `next_stage_at` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_stage` (`stage`),
  KEY `idx_state` (`state`),
  KEY `idx_owner` (`owner_citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_mining` (
  `mine` VARCHAR(50) NOT NULL,
  `citizenid` VARCHAR(50) DEFAULT NULL,
  `expires` INT(11) NOT NULL DEFAULT 0,
  `wages` INT(11) NOT NULL DEFAULT 0,
  `supplies` LONGTEXT DEFAULT NULL,
  `storage` LONGTEXT DEFAULT NULL,
  PRIMARY KEY (`mine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_mining_workers` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `mine` VARCHAR(50) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `skill` FLOAT NOT NULL DEFAULT 1,
  `food` INT(11) NOT NULL DEFAULT 100,
  `water` INT(11) NOT NULL DEFAULT 100,
  `pickaxe` INT(11) NOT NULL DEFAULT 0,
  `status` VARCHAR(50) NOT NULL DEFAULT 'idle',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_shops_blips` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `sprite` BIGINT(20) NOT NULL,
  `color` VARCHAR(64) DEFAULT NULL,
  `x` DOUBLE NOT NULL,
  `y` DOUBLE NOT NULL,
  `z` DOUBLE NOT NULL,
  `associated_npc_id` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_assoc_npc` (`associated_npc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_shops_items` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `npc_id` INT(11) NOT NULL,
  `item_name` VARCHAR(100) NOT NULL,
  `label` VARCHAR(100) DEFAULT NULL,
  `price` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  `stock` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_npc_id` (`npc_id`),
  KEY `idx_item_name` (`item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_shops_npcs` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) DEFAULT NULL,
  `model` VARCHAR(100) NOT NULL,
  `x` DOUBLE NOT NULL,
  `y` DOUBLE NOT NULL,
  `z` DOUBLE NOT NULL,
  `h` DOUBLE NOT NULL,
  `shop_name` VARCHAR(100) DEFAULT NULL,
  `shop_label` VARCHAR(100) DEFAULT NULL,
  `shop_type` VARCHAR(10) NOT NULL DEFAULT 'both',
  PRIMARY KEY (`id`),
  KEY `idx_shop_name` (`shop_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_shops_presets` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `kind` VARCHAR(10) NOT NULL,
  `label` VARCHAR(100) NOT NULL,
  `value` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_kind_value` (`kind`,`value`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `rsg_shops_presets` (`id`, `kind`, `label`, `value`) VALUES
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
  `id` TINYINT(3) UNSIGNED NOT NULL,
  `data` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE IF NOT EXISTS `rsg_telegram_contacts` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `contact_citizenid` VARCHAR(50) NOT NULL,
  `contact_name` VARCHAR(100) NOT NULL,
  `nickname` VARCHAR(50) DEFAULT NULL,
  `added_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_contact` (`citizenid`,`contact_citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_telegrams` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `recipient_name` VARCHAR(100) NOT NULL,
  `sender_citizenid` VARCHAR(50) NOT NULL,
  `sender_name` VARCHAR(100) NOT NULL,
  `subject` VARCHAR(100) NOT NULL,
  `message` TEXT NOT NULL,
  `is_read` TINYINT(1) NOT NULL DEFAULT 0,
  `sent_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_trader` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `traderid` VARCHAR(50) NOT NULL,
  `item` VARCHAR(50) NOT NULL,
  `stock` INT(11) NOT NULL DEFAULT 0,
  `lowstock` INT(11) NOT NULL DEFAULT 0,
  `highstock` INT(11) NOT NULL DEFAULT 0,
  `baseprice` DECIMAL(11,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trader_item` (`traderid`,`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_trader_npcs` (
  `traderid` VARCHAR(50) NOT NULL,
  `tradername` VARCHAR(50) NOT NULL,
  `npcmodel` VARCHAR(60) NOT NULL,
  `x` FLOAT NOT NULL,
  `y` FLOAT NOT NULL,
  `z` FLOAT NOT NULL,
  `heading` FLOAT NOT NULL DEFAULT 0,
  `showblip` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`traderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_trapdoors` (
  `door_id` VARCHAR(64) NOT NULL,
  `passcode` CHAR(4) NOT NULL,
  `owner` VARCHAR(50) NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`door_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_trapdoors_schema` (
  `id` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1,
  `version` INT(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_wagons` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL DEFAULT '0',
  `wagon` VARCHAR(50) NOT NULL DEFAULT '0',
  `custom` LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom`)),
  `animals` LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`animals`)),
  `active` INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_weather_state` (
  `key` VARCHAR(50) NOT NULL,
  `value` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `shop_stock` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `shop_name` VARCHAR(50) NOT NULL,
  `item_name` VARCHAR(50) NOT NULL,
  `stock` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_name_item_name` (`shop_name`,`item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_loyalty` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `charname` VARCHAR(50) NOT NULL,
  `loyalty_points` INT(11) NOT NULL DEFAULT 0,
  `lifetime_points` INT(11) NOT NULL DEFAULT 0,
  `last_update` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid` (`citizenid`),
  KEY `loyalty_points_idx` (`loyalty_points`),
  KEY `lifetime_points_idx` (`lifetime_points`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_auctions` (
    `id` VARCHAR(50) NOT NULL,
    `owner_citizenid` VARCHAR(50) NOT NULL,
    `owner_name` VARCHAR(100) NOT NULL,
    `item_name` VARCHAR(100) NOT NULL,
    `item_label` VARCHAR(100) NOT NULL,
    `item_count` INT NOT NULL,
    `item_metadata` LONGTEXT NULL,
    `category` VARCHAR(50) NOT NULL,
    `location` VARCHAR(50) NOT NULL,
    `location_label` VARCHAR(100) NOT NULL,
    `starting_bid` BIGINT NOT NULL,
    `current_bid` BIGINT NOT NULL DEFAULT 0,
    `buyout_price` BIGINT NULL,
    `highest_bidder_citizenid` VARCHAR(50) NULL,
    `highest_bidder_name` VARCHAR(100) NULL,
    `winner_citizenid` VARCHAR(50) NULL,
    `winner_name` VARCHAR(100) NULL,
    `sold_for` BIGINT NULL,
    `status` VARCHAR(20) NOT NULL DEFAULT 'active',
    `total_bids` INT NOT NULL DEFAULT 0,
    `creation_fee` BIGINT NOT NULL DEFAULT 0,
    `created_at` INT NOT NULL,
    `end_time` INT NOT NULL,
    `escrow_item` TINYINT(1) NOT NULL DEFAULT 0,
    `escrow_amount` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `idx_status` (`status`),
    KEY `idx_owner` (`owner_citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_auction_bids` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `auction_id` VARCHAR(50) NOT NULL,
    `citizenid` VARCHAR(50) NOT NULL,
    `player_name` VARCHAR(100) NOT NULL,
    `amount` BIGINT NOT NULL,
    `is_buyout` TINYINT(1) NOT NULL DEFAULT 0,
    `created_at` INT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `idx_auction` (`auction_id`),
    CONSTRAINT `fk_auction_bids_auction` FOREIGN KEY (`auction_id`) REFERENCES `rsg_auctions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_auction_collections` (
    `id` VARCHAR(100) NOT NULL,
    `citizenid` VARCHAR(50) NOT NULL,
    `auction_id` VARCHAR(50) NOT NULL,
    `item_name` VARCHAR(100) NOT NULL,
    `item_label` VARCHAR(100) NOT NULL,
    `count` INT NOT NULL,
    `metadata` LONGTEXT NULL,
    `sold_for` BIGINT NOT NULL DEFAULT 0,
    `seller_name` VARCHAR(100) NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_auction_payouts` (
    `citizenid` VARCHAR(50) NOT NULL,
    `amount` BIGINT NOT NULL,
    `reason` VARCHAR(100) NULL,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_moonshine_stills` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `citizenid` VARCHAR(50) NOT NULL,
    `x` FLOAT NOT NULL, 
    `y` FLOAT NOT NULL, 
    `z` FLOAT NOT NULL,
    `heading` FLOAT NOT NULL DEFAULT 0,
    `recipe` VARCHAR(50) DEFAULT NULL,
    `hopper` LONGTEXT DEFAULT NULL,
    `output` INT NOT NULL DEFAULT 0,
    `fuel` INT NOT NULL DEFAULT 0,
    `batch_left` INT DEFAULT NULL,
    `last_tick` INT DEFAULT NULL,
    PRIMARY KEY (`id`)
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
  KEY `idx_animalid` (`animalid`),
  KEY `idx_product_ready` (`product_ready`),
  KEY `idx_ranchid_product` (`ranchid`,`product_ready`),
  KEY `idx_pregnant` (`pregnant`),
  KEY `idx_gender` (`gender`),
  KEY `idx_breeding_ready` (`breeding_ready_time`),
  KEY `idx_mother_id` (`mother_id`)
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

CREATE TABLE IF NOT EXISTS `rsg_ranch_owners` (
  `ranchid` varchar(50) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `purchased_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ranchid`),
  KEY `idx_citizenid` (`citizenid`)
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

CREATE TABLE IF NOT EXISTS `rsg_lottery_config` (
   `setting` VARCHAR(64) PRIMARY KEY,
   `value` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_lottery_draws` (
   `id` INT AUTO_INCREMENT PRIMARY KEY,
   `draw_date` DATE NOT NULL,
   `jackpot` INT NOT NULL,
   `winning_number` TEXT,
   `drawn_at` DATETIME,
   `status` VARCHAR(32) DEFAULT 'pending',
   `winner_citizenid` VARCHAR(64),
   `winner_name` VARCHAR(128),
   UNIQUE KEY `draw_date` (`draw_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_lottery_tickets` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `citizenid` VARCHAR(64) NOT NULL,
    `ticket_number` VARCHAR(16) NOT NULL,
    `numbers` TEXT NOT NULL,
    `draw_date` DATE NOT NULL,
    `purchased_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    KEY `idx_citizen_draw` (`citizenid`, `draw_date`),
    KEY `idx_draw` (`draw_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_lottery_winners` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `draw_date` DATE NOT NULL,
    `citizenid` VARCHAR(64) NOT NULL,
    `winner_name` VARCHAR(128) NOT NULL,
    `prize` INT NOT NULL,
    `match_count` INT NOT NULL,
    `win_type` VARCHAR(32) NOT NULL DEFAULT 'regular',
    `collected` TINYINT NOT NULL DEFAULT 0,
    KEY `idx_citizen_collected` (`citizenid`, `collected`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO `rsg_lottery_config` (`setting`, `value`) VALUES ('current_jackpot', '100');

CREATE TABLE IF NOT EXISTS `rsg_beehives` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) DEFAULT NULL,
  `x` FLOAT NOT NULL,
  `y` FLOAT NOT NULL,
  `z` FLOAT NOT NULL,
  `heading` FLOAT NOT NULL DEFAULT 0,
  `active` TINYINT(1) NOT NULL DEFAULT 0,
  `activated_at` INT UNSIGNED DEFAULT NULL,
  `food` TINYINT UNSIGNED NOT NULL DEFAULT 100,
  `water` TINYINT UNSIGNED NOT NULL DEFAULT 100,
  `health` TINYINT UNSIGNED NOT NULL DEFAULT 100,
  `honey` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `smoked_until` INT UNSIGNED DEFAULT NULL,
  `prop` VARCHAR(50) NOT NULL DEFAULT 'bee_house_gk_1',
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_roulette_tables` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `x` FLOAT NOT NULL,
    `y` FLOAT NOT NULL,
    `z` FLOAT NOT NULL,
    `heading` FLOAT NOT NULL DEFAULT 0,
    `room` BIGINT NOT NULL DEFAULT 0,
    `placed_by` VARCHAR(50) DEFAULT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_doorlocks` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    `doors` LONGTEXT NOT NULL,
    `text_coords` LONGTEXT NOT NULL,
    `jobs` LONGTEXT NOT NULL,
    `distance` FLOAT NOT NULL DEFAULT 1.25,
    `locked` TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rsg_housing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region` varchar(30) NOT NULL,
  `houseid` varchar(7) NOT NULL,
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

INSERT INTO `rsg_housing` (`id`, `region`, `houseid`, `rent`) VALUES
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
  `houseid` varchar(7) NOT NULL DEFAULT '0',
  `citizenid` varchar(50) NOT NULL DEFAULT '0',
  `guest` int(1) NOT NULL DEFAULT 0,
  `perm_doors` tinyint(1) NOT NULL DEFAULT 1,
  `perm_storage` tinyint(1) NOT NULL DEFAULT 1,
  `perm_wardrobe` tinyint(1) NOT NULL DEFAULT 1,
  `perm_mailbox` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`),
  KEY `idx_houseid` (`houseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_noticeboard_boards` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `label` VARCHAR(64) NOT NULL DEFAULT 'Notice Board',
    `x` DOUBLE NOT NULL,
    `y` DOUBLE NOT NULL,
    `z` DOUBLE NOT NULL,
    `heading` DOUBLE NOT NULL DEFAULT 0,
    `created_by` VARCHAR(64) DEFAULT NULL,
    `created_at` INT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_noticeboard_notices` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `citizenid` VARCHAR(64) NOT NULL,
    `author` VARCHAR(128) NOT NULL,
    `title` VARCHAR(128) NOT NULL,
    `body` TEXT NOT NULL,
    `image` VARCHAR(512) DEFAULT NULL,
    `category` VARCHAR(32) NOT NULL,
    `town` VARCHAR(32) DEFAULT NULL,
    `duration` VARCHAR(16) NOT NULL,
    `created_at` INT NOT NULL,
    `expires_at` INT NOT NULL,
    `warned` TINYINT(1) NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `idx_citizenid` (`citizenid`),
    KEY `idx_expires` (`expires_at`),
    KEY `idx_town` (`town`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_telephones` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `number` VARCHAR(16) NOT NULL,
    `label` VARCHAR(64) NOT NULL DEFAULT 'Telephone',
    `model` VARCHAR(64) NOT NULL,
    `x` DOUBLE NOT NULL,
    `y` DOUBLE NOT NULL,
    `z` DOUBLE NOT NULL,
    `heading` DOUBLE NOT NULL DEFAULT 0,
    `listed` TINYINT(1) NOT NULL DEFAULT 1,
    `room` BIGINT NOT NULL DEFAULT 0,
    `job` VARCHAR(64) DEFAULT NULL,
    `owner` VARCHAR(64) DEFAULT NULL,
    `stored` TINYINT(1) NOT NULL DEFAULT 0,
    `created_by` VARCHAR(64) DEFAULT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_drugs_labs` (
  `citizenid` VARCHAR(50) NOT NULL,
  `data` LONGTEXT NOT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_bountyhunter` (
    `citizenid` VARCHAR(50) NOT NULL,
    `name` VARCHAR(100) NOT NULL DEFAULT '',
    `completed` INT NOT NULL DEFAULT 0,
    `alive` INT NOT NULL DEFAULT 0,
    `dead` INT NOT NULL DEFAULT 0,
    `earned` INT NOT NULL DEFAULT 0,
    PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rsg_legendary_cooldowns` (
    `citizenid` VARCHAR(50) NOT NULL,
    `animal` VARCHAR(50) NOT NULL,
    `last_hunt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`citizenid`, `animal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;