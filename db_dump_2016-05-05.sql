-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: short_ad
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `urls`
--

DROP TABLE IF EXISTS `urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_url` varchar(4000) NOT NULL,
  `original_url_hash` varchar(32) NOT NULL,
  `short_url` varchar(50) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `short_url` (`short_url`),
  KEY `ouhash` (`original_url_hash`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urls`
--

LOCK TABLES `urls` WRITE;
/*!40000 ALTER TABLE `urls` DISABLE KEYS */;
INSERT INTO `urls` VALUES (1,'mysite.com/very-nice','ad967acef750daadb6e33758fb9e1fab','XWEeehAs',1,'2016-05-05 12:34:10',NULL),(2,'mysite.com/very-nice?uu','0daae22ad7faadbf7859cb4a0b00e68e','fMgRezeF',1,'2016-05-05 12:34:33',NULL),(3,'mysite.com/very-nice?uu=4','4ae0e841e7d3c9c31a5778546bdd6df2','hSVYAPtx',1,'2016-05-05 12:34:44',NULL),(4,'mysite.com/very-nice?uu=6','23077d636314075369cd501ff39ea509','XOmrseRl',1,'2016-05-05 12:40:48',NULL),(5,'mysite.com/very-nice?uu=8','a59c446524deb5f24c1080b43cdef2e0','oypfQbBZ',1,'2016-05-05 12:40:55',NULL),(6,'mysite.com/very-nice?uu=9','9ebf2ca55144c661356cb37a2e3c67e7','xuAIQDJr',1,'2016-05-05 12:41:37',NULL),(7,'very-nice-site.com/cat/prod/84584','072b97eb5c0c45393bdb7c32694d6e5f','CTywfGuO',1,'2016-05-05 12:42:22',NULL),(8,'some.site.it/one/path/or/another?req=1243','c10eccc3e23042fc03fc1221d103506a','zJlBeFrA',1,'2016-05-05 13:02:48',NULL),(9,'some-site.cn/some/long/path?fllff=3&asdf=657','a6916219d5da1d21fd49be557115b90e','WxruqKPd',1,'2016-05-05 13:22:56',NULL),(10,'devops.com/they/all/right/there','dfab4bb171e5519138e6fce3b916297a','NKsOGlSN',1,'2016-05-05 13:32:16',NULL),(11,'https://devops.com/they/all/right/there?so=far','b7dbe7eb4f339c797abc0617bafda298','OrEfHxcB',1,'2016-05-05 13:34:39',NULL),(12,'https://devops.com/they/all/right/there?so=faraway','6c3e0be53ab3d3d521abe3797c205ce6','xsfMZDKs',1,'2016-05-05 13:34:50',NULL),(13,'https://devops.com/they/all/right/there?so=faraway&gg=11','f00339db9915b22dfd8b09b844d7767d','XigLbCVs',1,'2016-05-05 13:36:13',NULL),(14,'one-site.gr/?asdfadsf=dsf134','5e025e40798ed9aefd3f8cc8c2fe40b9','lZMFIfci',1,'2016-05-05 13:40:08',NULL),(15,'one-site.gr/?asdfadsf=dsf1345','f151ce0f1d9965ac72497ca34fbb9d27','VfrmDWXK',1,'2016-05-05 13:42:03',NULL),(16,'dfd.df','6f5664c9041c8ba57beed660a09edc90','TIwOkBVO',1,'2016-05-05 13:44:38',NULL),(17,'dfd.dfd','17df127d16b522dcb9a4b9e70dc1d358','iMxsrwaP',1,'2016-05-05 13:44:52',NULL),(18,'asdf.fd','1ff818ba0e1dea127fbe57bbbaaeb950','HpngBzBF',1,'2016-05-05 13:45:09',NULL),(19,'fdas.dfd.wf','f882d69e4445814a535fbaeebeb54085','ZCkrqqnw',1,'2016-05-05 13:46:40',NULL),(20,'https://google.com','99999ebcfdb78df077ad2727fd00969f','MNjXNxpN',1,'2016-05-05 14:06:24',NULL);
/*!40000 ALTER TABLE `urls` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-05 20:37:39
