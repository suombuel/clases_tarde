-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.1.50-community - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2012-12-05 18:30:29
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping structure for table mydb.cities
DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `idcities` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idcities`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table mydb.cities: ~4 rows (approximately)
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` (`idcities`, `city`) VALUES
	(1, 'Zaragoza'),
	(2, 'Barcelona'),
	(3, 'Bilbao'),
	(4, 'Ourense');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;


-- Dumping structure for table mydb.coders
DROP TABLE IF EXISTS `coders`;
CREATE TABLE IF NOT EXISTS `coders` (
  `idcoders` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idcoders`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table mydb.coders: ~2 rows (approximately)
/*!40000 ALTER TABLE `coders` DISABLE KEYS */;
INSERT INTO `coders` (`idcoders`, `code`) VALUES
	(1, 'php'),
	(2, 'java');
/*!40000 ALTER TABLE `coders` ENABLE KEYS */;


-- Dumping structure for table mydb.languages
DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
  `idlanguages` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idlanguages`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table mydb.languages: ~2 rows (approximately)
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` (`idlanguages`, `language`) VALUES
	(1, 'Castellano'),
	(2, 'English');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;


-- Dumping structure for table mydb.pets
DROP TABLE IF EXISTS `pets`;
CREATE TABLE IF NOT EXISTS `pets` (
  `idpets` int(11) NOT NULL AUTO_INCREMENT,
  `pet` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idpets`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table mydb.pets: ~3 rows (approximately)
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
INSERT INTO `pets` (`idpets`, `pet`) VALUES
	(1, 'Perro'),
	(2, 'Gato'),
	(3, 'Tigre');
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;


-- Dumping structure for table mydb.projects
DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `idprojects` int(11) NOT NULL AUTO_INCREMENT,
  `project` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idprojects`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table mydb.projects: ~1 rows (approximately)
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` (`idprojects`, `project`, `timestamp`) VALUES
	(1, 'proyecto en php', NULL);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;


-- Dumping structure for table mydb.resources
DROP TABLE IF EXISTS `resources`;
CREATE TABLE IF NOT EXISTS `resources` (
  `idresources` int(11) NOT NULL AUTO_INCREMENT,
  `resource` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idresources`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Dumping data for table mydb.resources: ~11 rows (approximately)
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` (`idresources`, `resource`) VALUES
	(1, '/users/insert'),
	(2, '/users/update'),
	(3, '/users/delete'),
	(4, '/users/select'),
	(5, '/users'),
	(6, '/users/index'),
	(7, '/login'),
	(8, '/login/index'),
	(9, '/loging/logout'),
	(10, '/index'),
	(11, '/index/index');
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;


-- Dumping structure for table mydb.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `idroles` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idroles`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table mydb.roles: ~4 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`idroles`, `rol`) VALUES
	(1, 'Implementor'),
	(2, 'Admin'),
	(3, 'User'),
	(4, 'Guest');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


-- Dumping structure for table mydb.roles_has_resources
DROP TABLE IF EXISTS `roles_has_resources`;
CREATE TABLE IF NOT EXISTS `roles_has_resources` (
  `roles_idroles` int(11) NOT NULL,
  `resources_idresources` int(11) NOT NULL,
  PRIMARY KEY (`roles_idroles`,`resources_idresources`),
  KEY `fk_roles_has_resources_resources1_idx` (`resources_idresources`),
  KEY `fk_roles_has_resources_roles1_idx` (`roles_idroles`),
  CONSTRAINT `fk_roles_has_resources_resources1` FOREIGN KEY (`resources_idresources`) REFERENCES `resources` (`idresources`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_roles_has_resources_roles1` FOREIGN KEY (`roles_idroles`) REFERENCES `roles` (`idroles`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table mydb.roles_has_resources: ~13 rows (approximately)
/*!40000 ALTER TABLE `roles_has_resources` DISABLE KEYS */;
INSERT INTO `roles_has_resources` (`roles_idroles`, `resources_idresources`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(1, 6),
	(1, 7),
	(4, 7),
	(1, 8),
	(1, 9),
	(1, 10),
	(4, 10),
	(1, 11);
/*!40000 ALTER TABLE `roles_has_resources` ENABLE KEYS */;


-- Dumping structure for table mydb.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `idusers` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `description` text,
  `photo` varchar(255) DEFAULT NULL,
  `coders` varchar(255) DEFAULT NULL,
  `cities_idcities` int(11) NOT NULL,
  `roles_idroles` int(11) NOT NULL,
  PRIMARY KEY (`idusers`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_users_cities_idx` (`cities_idcities`),
  KEY `fk_users_roles1_idx` (`roles_idroles`),
  CONSTRAINT `fk_users_cities` FOREIGN KEY (`cities_idcities`) REFERENCES `cities` (`idcities`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_roles1` FOREIGN KEY (`roles_idroles`) REFERENCES `roles` (`idroles`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

-- Dumping data for table mydb.users: ~6 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`idusers`, `name`, `email`, `password`, `description`, `photo`, `coders`, `cities_idcities`, `roles_idroles`) VALUES
	(1, 'Agustin', 'agustincl@gmail.com', '1234', 'Descripción', 'photo.jpg', 'php,java', 1, 1),
	(40, 'k', 'kk', 'kk', 'k', 'threadless-125x125_1.gif', '2', 1, 1),
	(41, 'o', 'o', 'o', 'o', '', '1', 4, 2),
	(43, 'mmm', 'mmm', 'mmm', 'mmm', 'threadless-125x125.gif', '1', 3, 2),
	(45, '', '', '', '', '', '', 1, 3),
	(46, 'gggg', 'gggg', 'ggggg', 'ggggg', 'Dibujo.JPG', '1', 3, 3);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Dumping structure for table mydb.users_has_languages
DROP TABLE IF EXISTS `users_has_languages`;
CREATE TABLE IF NOT EXISTS `users_has_languages` (
  `users_idusers` int(11) NOT NULL,
  `languages_idlanguages` int(11) NOT NULL,
  PRIMARY KEY (`users_idusers`,`languages_idlanguages`),
  KEY `fk_users_has_languages_languages1_idx` (`languages_idlanguages`),
  KEY `fk_users_has_languages_users1_idx` (`users_idusers`),
  CONSTRAINT `fk_users_has_languages_languages1` FOREIGN KEY (`languages_idlanguages`) REFERENCES `languages` (`idlanguages`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_languages_users1` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table mydb.users_has_languages: ~7 rows (approximately)
/*!40000 ALTER TABLE `users_has_languages` DISABLE KEYS */;
INSERT INTO `users_has_languages` (`users_idusers`, `languages_idlanguages`) VALUES
	(1, 1),
	(40, 1),
	(41, 1),
	(43, 1),
	(46, 1),
	(40, 2),
	(43, 2);
/*!40000 ALTER TABLE `users_has_languages` ENABLE KEYS */;


-- Dumping structure for table mydb.users_has_pets
DROP TABLE IF EXISTS `users_has_pets`;
CREATE TABLE IF NOT EXISTS `users_has_pets` (
  `users_idusers` int(11) NOT NULL,
  `pets_idpets` int(11) NOT NULL,
  PRIMARY KEY (`users_idusers`,`pets_idpets`),
  KEY `fk_users_has_pets_pets1_idx` (`pets_idpets`),
  KEY `fk_users_has_pets_users1_idx` (`users_idusers`),
  CONSTRAINT `fk_users_has_pets_pets1` FOREIGN KEY (`pets_idpets`) REFERENCES `pets` (`idpets`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_pets_users1` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table mydb.users_has_pets: ~10 rows (approximately)
/*!40000 ALTER TABLE `users_has_pets` DISABLE KEYS */;
INSERT INTO `users_has_pets` (`users_idusers`, `pets_idpets`) VALUES
	(1, 1),
	(40, 1),
	(41, 1),
	(43, 1),
	(46, 1),
	(1, 2),
	(40, 2),
	(43, 2),
	(40, 3),
	(46, 3);
/*!40000 ALTER TABLE `users_has_pets` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
