#-- creates all tables for the project.

CREATE TABLE `urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_url` varchar(4000) NOT NULL,
  `original_url_hash` varchar(32) NOT NULL,
  `short_url` varchar(50) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ouhash` (`original_url_hash`),
  UNIQUE KEY `short_url` (`short_url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;
