--
-- Table structure for table `cms_author`
--

DROP TABLE IF EXISTS `cms_author`;
CREATE TABLE `cms_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `uid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `cms_category`
--

DROP TABLE IF EXISTS `cms_category`;
CREATE TABLE `cms_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `seo_title` (`seo_title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `cms_post`
--

DROP TABLE IF EXISTS `cms_post`;
CREATE TABLE `cms_post` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `intro` text NOT NULL,
  `body` text NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `date_insert` datetime NOT NULL,
  `date_update` datetime DEFAULT NULL,
  `visible` tinyint(1) NOT NULL,
  `commentable` tinyint(1) NOT NULL,
  `note` text DEFAULT NULL,
  `flags` int(11) unsigned DEFAULT 0,
  `language` varchar(32) NOT NULL DEFAULT 'en',
  `image` varchar(255) DEFAULT NULL,
  `id_author` int(11) unsigned NOT NULL,
  `id_post_group` int(11) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `seo_title` (`seo_title`),
  KEY `id_post_group` (`id_post_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `cms_post_group`
--

DROP TABLE IF EXISTS `cms_post_group`;
CREATE TABLE `cms_post_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `seo_title` (`seo_title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `cms_post_category`
--

DROP TABLE IF EXISTS `cms_post_category`;
CREATE TABLE `cms_post_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_post` int(11) unsigned NOT NULL,
  `id_category` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `cms_post_tag`
--

DROP TABLE IF EXISTS `cms_post_tag`;
CREATE TABLE `cms_post_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_post` int(11) unsigned NOT NULL,
  `id_tag` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `cms_tag`
--

DROP TABLE IF EXISTS `cms_tag`;
CREATE TABLE `cms_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `seo_title` (`seo_title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `cms_comment`
--

DROP TABLE IF EXISTS `cms_comment`;
CREATE TABLE `cms_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `author` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `date` datetime NOT NULL,
  `moderated` tinyint(1) NOT NULL DEFAULT 0,
  `id_post` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;