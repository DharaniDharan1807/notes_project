-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: notesdb
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add category',7,'add_category'),(26,'Can change category',7,'change_category'),(27,'Can delete category',7,'delete_category'),(28,'Can view category',7,'view_category'),(29,'Can add note',8,'add_note'),(30,'Can change note',8,'change_note'),(31,'Can delete note',8,'delete_note'),(32,'Can view note',8,'view_note'),(33,'Can add comment',9,'add_comment'),(34,'Can change comment',9,'change_comment'),(35,'Can delete comment',9,'delete_comment'),(36,'Can view comment',9,'view_comment'),(37,'Can add Token',10,'add_token'),(38,'Can change Token',10,'change_token'),(39,'Can delete Token',10,'delete_token'),(40,'Can view Token',10,'view_token'),(41,'Can add Token',11,'add_tokenproxy'),(42,'Can change Token',11,'change_tokenproxy'),(43,'Can delete Token',11,'delete_tokenproxy'),(44,'Can view Token',11,'view_tokenproxy');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$fQYJocdd0HgOtMA4xcwt7U$QDPcj5ykuL/7P3m+9wUm9lz1owjkedgKbS9Lmb3hWFc=','2025-06-06 09:20:53.596802',1,'dharanidharan.n','','','',1,1,'2025-06-06 07:11:52.559620'),(2,'pbkdf2_sha256$600000$qXxwiLBmRpN7Oso4vkRsNN$5Oaw7vlfKaVmSW5j7VR+y8oALUJBRZ49GDmuGprzN5A=','2025-06-06 07:28:48.556650',0,'user1','','','user1@gmail.com',0,1,'2025-06-06 07:26:57.312283'),(3,'pbkdf2_sha256$600000$WFKngbIsh6eb54CWcag2q7$YeIsT2m/JS1qPysXChTTEG5NPigC0Q9Yhv8C2mbMxzU=','2025-06-06 11:11:10.347808',0,'dharani1','','','dharani1@gmail.com',0,1,'2025-06-06 11:09:34.079642'),(4,'',NULL,0,'dharani@','dharani','n','saturogojo1607@gmail.com',1,1,'2025-06-10 20:39:32.301196'),(5,'',NULL,0,'efefe@','dharani','n','dharaninatarajan187@gmail.com',1,1,'2025-06-10 20:49:38.545792'),(6,'pbkdf2_sha256$1000000$7GblH9fJ4R32oQh8JFSZLw$TYwTgmM1QedVDogewBq/HDNQ9MVzi9pJsyxI/ZyBY/w=',NULL,0,'wfefe@','','','',0,1,'2025-06-10 20:52:37.666764'),(7,'pbkdf2_sha256$1000000$WjLRk4TjyQdiLCcl6zqMpt$jc5PqglS0dDE86Dt2y7DzMhxdodZLe+vAprUWAUCX1c=',NULL,0,'dharani','','','',0,1,'2025-06-11 11:52:15.134189'),(8,'pbkdf2_sha256$1000000$3PlTA1bpqUBQUmLX9YfOwf$B4yn0ex7KfJ9XONll7Dph54T83NjuW47JXPWj7/RAQs=',NULL,0,'dharanidharan74','','','',0,1,'2025-06-11 11:53:40.471025'),(9,'pbkdf2_sha256$1000000$bCr45yK9eG2SZX8NC1li0E$TXm8c0LszcpxnMl9VhUeAZyhEBSOFRCjZr71g+YyIq0=',NULL,0,'dharani@123','','','',0,1,'2025-06-11 11:57:24.758046'),(10,'pbkdf2_sha256$1000000$h51XBYaQKxzOSCWQdMNTeZ$s377JraSvic9dT24YVJQ1Mv174+J8oVU49lY0IkeSW4=',NULL,0,'dharani@1237676','','','',0,1,'2025-06-11 11:57:30.765160'),(12,'pbkdf2_sha256$1000000$ZF21U3swAarpw8Q9m25o28$CPbHpIpmNzGpzWwuEVcejiqSu1rhGIQzOfIJf1GyPfA=',NULL,0,'imran@','','','',0,1,'2025-06-11 12:16:28.251832'),(13,'pbkdf2_sha256$1000000$ZeIcZc8TZm55PPq7CXPXfv$nUt5X2j9KxZb7fP6X8P0RX4arbgyCbaiBWiZjErePDY=',NULL,0,'imran@12','','','',0,1,'2025-06-11 12:16:36.527695'),(14,'pbkdf2_sha256$1000000$tfttRU4Ngz54oFrWXxd91V$/jr0HdWMAxVdZXRj1y8mA4dZoZqKzn62A2iOSxOn1mc=',NULL,0,'leodass@12','','','',0,1,'2025-06-11 12:18:31.165690'),(15,'pbkdf2_sha256$1000000$5b3K1iuOdWRAPs8WZ2Kvyz$tLe0Lb2Cb/twWWAtuql4v6eyCRp3Kn1/yXC5/egolYo=',NULL,0,'leo@123','','','',0,1,'2025-06-11 12:19:47.073594'),(16,'pbkdf2_sha256$1000000$DUBcekS38YWF7Eolcffjr1$mVw+puQc0aCCk6I55hQiSCPGBVeQKzmlYfRbl0AFj34=',NULL,0,'postmans@12','','','',0,1,'2025-06-11 18:31:02.433897'),(17,'pbkdf2_sha256$1000000$rFBSBoVyXrKDElzcQuXYWf$XCpjLJeCh4MAKOEC7aQBPczxMWp2hkh2HwjFWp3Umnw=',NULL,0,'dharani@12','','','',0,1,'2025-06-12 08:21:08.550758'),(18,'pbkdf2_sha256$1000000$yKKtwORTz4pCpDOeFdwUBP$L9UGpB6XEmtQxKFghak16+fy0qdTvId6KzhoGVIvoZM=','2025-06-12 10:00:44.862598',0,'mass@14','','','',0,1,'2025-06-12 09:59:49.849970'),(19,'pbkdf2_sha256$1000000$ZK2kBKkKSXQmdFfn1el4aT$0JAyKyycjrkbSsRlNZBU8KieQDJOFhzfFd60BKHLIvs=','2025-06-12 10:06:29.260993',0,'dharanid@12','','','',0,1,'2025-06-12 10:05:52.398645'),(20,'pbkdf2_sha256$1000000$Fs0wsNoipIlBiaYBYpZvLv$fB2H6QM8dCBXrYdtGHXx7zxyR84Zr1yQLOABKFkhQuU=','2025-06-12 10:13:31.087612',0,'dharani@13','','','',0,1,'2025-06-12 10:13:29.979877'),(21,'pbkdf2_sha256$1000000$ql5CRwbCVeTBIXFmZErfIe$gFlSfm6gIQg9em3J+GCF1yIAkLkl2Cgy4wRTLuLtpWI=','2025-06-12 10:19:10.615115',0,'imaran@11','','','',0,1,'2025-06-12 10:18:06.375869'),(22,'pbkdf2_sha256$600000$Y87HL5gUuNrIQx3WJ7o6oz$l4izuJ5Qdj0ZRT1+4TYPscC3aeEELeZenLov+rrKkHI=','2025-06-16 09:06:10.253933',0,'imran@9','','','',0,1,'2025-06-12 10:23:08.487734'),(23,'pbkdf2_sha256$600000$08JJTmYtcOtgwc0HZ3Eg73$O7Q3MoabuHghGwiXSLX08Hl3Kk4VoM/GutIAr9a0LfA=','2025-06-12 13:01:04.100249',0,'vicky@12','','','',0,1,'2025-06-12 13:01:03.527421'),(24,'pbkdf2_sha256$600000$zodOFKr7PQtzXPTW7bPvdp$Vx3HBcr8TeqcMV5KMRxYrbj9ZSMiX8KLJ3WV8g8wCmI=','2025-06-12 13:47:29.763091',0,'mass8@','','','',0,1,'2025-06-12 13:47:29.227349'),(25,'pbkdf2_sha256$600000$n4dkrSfE5LA76bwFOHSrgH$8utveS3NW/sjzyo7WzPYD6vJGWAb9rgXP8Jpjgop+jk=','2025-06-15 07:44:16.976248',0,'Lalitha@12','','','',0,1,'2025-06-15 07:44:16.373929'),(26,'pbkdf2_sha256$600000$IJrkXZ0ji4LvElTOzS1hJx$zjvYqaNi+C8jk/rMu7J9TZkmvpjUkHkxL7WTjObygbY=','2025-06-16 10:05:18.823687',0,'rahul@12','','','',0,1,'2025-06-16 10:05:00.778270');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('0e84310fc6c3681b7952c5f2bd6ae5426b7291fc','2025-06-12 13:47:29.751839',24),('14b505de0ab558b2526500a447844764034665e2','2025-06-16 10:05:01.444274',26),('2032a34b5c0613959f3175f8195c5743beb62401','2025-06-16 09:06:10.235721',22),('3b840f8addabf92554fdd3bcaecb561edb0a5c35','2025-06-10 20:49:38.554456',5),('461bd60fd59145dc294fcf551939ece2548fd5d3','2025-06-11 18:31:03.033366',16),('47ba982dee9f619716c19407ba4a00eb015f7de3','2025-06-10 20:52:38.578535',6),('578a38441e08362a2018bcb9a6350998a3290a9f','2025-06-11 11:53:41.049648',8),('583b94a7e4c06a321a16b56962e12c69fac427e5','2025-06-12 10:18:07.488045',21),('6d30340f3a00bb315638321f2fe9f3d2043d1b47','2025-06-11 11:52:15.726575',7),('94272ed0e88ce7e3c2c499a1f4ea733b102a8567','2025-06-11 12:18:31.726246',14),('9e6f77ea62d310809b9a3763c092a66e435de3b8','2025-06-11 12:19:47.643204',15),('af1f542f41560fd02bb14585a9915c1411d38b04','2025-06-12 09:59:50.976727',18),('b0e8d31e613b7e47b189d37db812f56e9feaafd4','2025-06-11 12:16:37.095507',13),('b67d5e1c7eb97558f1ff09f13a36e665ab7b51d4','2025-06-12 13:01:04.089074',23),('b8b5b34caa12e57b5786a2a56d979d289bc93918','2025-06-11 12:16:28.831234',12),('c260b47170416c329566c95c8d76877bde0131bc','2025-06-11 11:57:25.312307',9),('d88244b0770040c8a266bd9ce293b09118e221fc','2025-06-12 08:21:09.637754',17),('ef7194c02c4782aba2b584a6691bccb5e0735e2d','2025-06-15 07:44:16.962222',25),('f252c87123c85a3a2948252b012308af3829cdcf','2025-06-11 11:57:31.381754',10);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(10,'authtoken','token'),(11,'authtoken','tokenproxy'),(5,'contenttypes','contenttype'),(7,'notes_app','category'),(9,'notes_app','comment'),(8,'notes_app','note'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-06-06 07:10:31.243699'),(2,'auth','0001_initial','2025-06-06 07:10:31.769513'),(3,'admin','0001_initial','2025-06-06 07:10:31.903122'),(4,'admin','0002_logentry_remove_auto_add','2025-06-06 07:10:31.910806'),(5,'admin','0003_logentry_add_action_flag_choices','2025-06-06 07:10:31.918236'),(6,'contenttypes','0002_remove_content_type_name','2025-06-06 07:10:32.023508'),(7,'auth','0002_alter_permission_name_max_length','2025-06-06 07:10:32.083268'),(8,'auth','0003_alter_user_email_max_length','2025-06-06 07:10:32.104644'),(9,'auth','0004_alter_user_username_opts','2025-06-06 07:10:32.112568'),(10,'auth','0005_alter_user_last_login_null','2025-06-06 07:10:32.171550'),(11,'auth','0006_require_contenttypes_0002','2025-06-06 07:10:32.175040'),(12,'auth','0007_alter_validators_add_error_messages','2025-06-06 07:10:32.182496'),(13,'auth','0008_alter_user_username_max_length','2025-06-06 07:10:32.249958'),(14,'auth','0009_alter_user_last_name_max_length','2025-06-06 07:10:32.312063'),(15,'auth','0010_alter_group_name_max_length','2025-06-06 07:10:32.329120'),(16,'auth','0011_update_proxy_permissions','2025-06-06 07:10:32.337754'),(17,'auth','0012_alter_user_first_name_max_length','2025-06-06 07:10:32.400753'),(18,'notes_app','0001_initial','2025-06-06 07:10:32.711048'),(19,'sessions','0001_initial','2025-06-06 07:10:32.741791'),(20,'notes_app','0002_remove_note_category_delete_category','2025-06-06 09:19:10.880984'),(21,'authtoken','0001_initial','2025-06-10 20:48:52.374387'),(22,'authtoken','0002_auto_20160226_1747','2025-06-10 20:48:52.416323'),(23,'authtoken','0003_tokenproxy','2025-06-10 20:48:52.421365'),(24,'authtoken','0004_alter_tokenproxy_options','2025-06-10 20:48:52.428833'),(25,'notes_app','0003_alter_note_options_and_more','2025-06-12 09:59:06.286341'),(26,'notes_app','0002_alter_note_options_alter_note_content_and_more','2025-06-16 06:51:43.755727'),(27,'notes_app','0003_note_is_page_alter_note_content','2025-06-16 09:56:58.846612');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('14xwcrl3x3zla5veklbbe38x7kaqr4m3','.eJxVjDsOwjAQBe_iGln-YpuSPmewdr0bHECOFCcV4u4QKQW0b2beS2TY1pq3zkueSFyEMeL0OyKUB7ed0B3abZZlbusyodwVedAuh5n4eT3cv4MKvX7roNipYJP13p8dhwQaCyBSGR2xLkwYUEer0Hk0rIJTPkYbg4Zo7JjE-wMGLTfS:1uQhv9:z5hP5yuIBHSEHsc7rYpIiqMgzXSkUAyZ6FKVnDL-sAY','2025-06-16 07:36:51.507783'),('19sgryc5t48bfrfifa75d0ep7c3594dw','.eJxVjMsOwiAQAP-FsyFAy0OP3vsNZHdZpGpoUtqT8d-VpAe9zkzmJSLsW4l74zXOSVyEceL0CxHowbWbdId6WyQtdVtnlD2Rh21yWhI_r0f7NyjQSv-CsYSsFQxW-cwqW8MeFQckfx4yBathdF6brL-ZzTYBocdRuwBMJN4fGWE44Q:1uR6iZ:8Y-4zRxtrUNVFK_tr3wLW3v4rreTOxb9BxHJe5TN3yo','2025-06-17 10:05:31.044833'),('50i5a1pm58b2xbuxuwoxtdn3b90m8gul','.eJxVjLsOgkAUBf9la7O5-wQs7f0Gcl8rqIGEhcr470pCoe2ZmfMyPW7r0G9Vl34UczbenH43Qn7otAO543SbLc_Tuoxkd8UetNrrLPq8HO7fwYB1-NZA4oBUUsMamTIQQmmz75Bd11FwPgQpXgsTx8QeNElLOcQMWJrozPsDBdg4dQ:1uNTEx:CzcFqBymAfEAOT06gKM6SBIPQ6nSv1YF4StgEsPqlzk','2025-06-07 09:19:55.630648'),('6i6aekxf58hfp2p54f1emntqx5hm3u95','.eJxVjEEOgjAQRe_StWmYzlA7Lt1zBjJtB0FNSSisjHdXEha6_e-9_zK9bOvYb1WXfsrmYtCcfrco6aFlB_ku5TbbNJd1maLdFXvQars56_N6uH8Ho9TxWwM3DmJDvm2c80MmZmRoAyVFOHsiVdcOiJiBkjCDSxBFQuAYEiua9wegKTa3:1uNWzE:pZDFDJltaPUYiCIIf67ERTqhbVy7fUThhyd5_2kiu8k','2025-06-07 13:19:56.765041'),('7z83rdhemwaeysnk05shlrroguw3ewbn','.eJxVjMsOwiAQRf-FtSG8woBL934DYYapVA0kpV0Z_12bdKHbe865L5Hytta0DV7SXMRZGC1OvyNmenDbSbnnduuSeluXGeWuyIMOee2Fn5fD_TuoedRvTcTBmykCOKUYPBSHKioI4HyIVpMGS5MJGjEoq4vjAkFFT5gBmaJ4fwDnJjeN:1uPhqQ:8a1h7AxFLuL_q0jho5zqd9r2nzmkwShDTpSAPdyCk8w','2025-06-13 13:19:50.878215'),('a2zblxwf7boj0ne15kqgx33rzhwjg4v5','.eJxVjDsOwjAQBe_iGln-YpuSPmewdr0bHECOFCcV4u4QKQW0b2beS2TY1pq3zkueSFyEMeL0OyKUB7ed0B3abZZlbusyodwVedAuh5n4eT3cv4MKvX7roNipYJP13p8dhwQaCyBSGR2xLkwYUEer0Hk0rIJTPkYbg4Zo7JjE-wMGLTfS:1uR5n8:_8FflF4RI5FMRiJ4xaDY8ggVBr7QlQ7NRbtu-XjVtws','2025-06-17 09:06:10.261944'),('c33edtjkehr912emq7c4c1xpgt6oe8ry','.eJxVjDsOwjAQBe_iGlnedfyjpOcM0a7XwQGUSHFSIe4OkVJA-2bmvVRP21r7rZWlH0WdFaI6_Y5M-VGmncidptus8zyty8h6V_RBm77OUp6Xw_07qNTqt06RwHkILIXRcwKTSjDRWxsRuUMO5IKHATOERFEM4GCdFIHOGuu8en8A4io23g:1uPgkp:FUkOCIIrFzmsF9qzzxm0GEGkeIv2owICElFCP7d1hOI','2025-06-13 12:09:59.219624'),('c9p9v3enrf6j08h1v58n509e68psd1yk','.eJxVjDsOwjAQBe_iGlnedfyjpOcM0a7XwQGUSHFSIe4OkVJA-2bmvVRP21r7rZWlH0WdFaI6_Y5M-VGmncidptus8zyty8h6V_RBm77OUp6Xw_07qNTqt06RwHkILIXRcwKTSjDRWxsRuUMO5IKHATOERFEM4GCdFIHOGuu8en8A4io23g:1uPf5R:fN7wDEUhrArEYn6XwDgZ4LoSPKj1yTRu6zZQFdGC218','2025-06-13 10:23:09.638064'),('d6gsvd6ruqb8q7qbhcg9ppdhhrb2n3y7','.eJxVjDsOwjAQBe_iGln-YpuSPmewdr0bHECOFCcV4u4QKQW0b2beS2TY1pq3zkueSFyEMeL0OyKUB7ed0B3abZZlbusyodwVedAuh5n4eT3cv4MKvX7roNipYJP13p8dhwQaCyBSGR2xLkwYUEer0Hk0rIJTPkYbg4Zo7JjE-wMGLTfS:1uR3ke:e5iXXJB4JOLtAvef3D1zTvgwJThEqMtTE7TSz6vjD9U','2025-06-17 06:55:28.316604'),('e6z1tnq4rogu0kb717zsteisrgopbydl','.eJxVjDsOwjAQBe_iGln-xcSU9DmDtetd4wCypTipEHeHSCmgfTPzXiLCtpa4dV7iTOIijBOn3xEhPbjuhO5Qb02mVtdlRrkr8qBdTo34eT3cv4MCvXxrDhYVwZBzQAtMGoIn44IyGsENmgNkT6NxwHxG67PLwD6gGpNNmZR4fwAzQDlT:1uPioS:C2OHcDvJoXX2lpl3rtCeXpRn4Tk6_ynfzoIi9ogM27A','2025-06-13 14:21:52.849123'),('fp4bgemrd4hrjdxp39lixz28zghkhviz','e30:1uNUu2:Ex37irAIyLTu_EQKd7B14tV-RucQMXgvDnHGgSrPKj0','2025-06-07 11:06:26.368147'),('fvfc5d065pfnjsuokmiqht4pc7xu81ao','.eJxVjEEOwiAUBe_C2pCAQMGle89AHv-DVA1NSrsy3t026UK3b2beW0SsS41rz3McWVyEtuL0OybQM7ed8APtPkma2jKPSe6KPGiXt4nz63q4fwcVvW41uVTAAdDaQ3kLXUpRxrBOFggqDH4ge2YLBzYlszOJsiNHW5DhxecLOEc5WA:1uQi2K:PguRNI1ja1PW9ZHvI5rl4c8gpIgaFHuzKD9kNDCaVj4','2025-06-16 07:44:16.980969'),('hewhf71foipa17lm4gt4lcckgmck1q12','.eJxVjEEOwiAQRe_C2hBmKCAu3XsGwsAgVUOT0q6Md7dNutDtf-_9twhxXWpYO89hzOIiwIvT70gxPbntJD9iu08yTW2ZR5K7Ig_a5W3K_Loe7t9Bjb1udSSwnkBlr8-2-IJWZ49gsFhtuAyctTGwocLsSBE5LDx4VKgUuBTF5wsCLDfd:1uPepJ:_g8Z8fQBgBHzebnlTn7EucinTpNuY2F3vZs0RZLgGQA','2025-06-13 10:06:29.266727'),('n4mqitq3mp9ia3k65ply45iyxlean55w','.eJxVjsEOwiAQRP-FsyG7UIR69N5vILssStXQpLQn47_bJj3odd6bybxVpHUpcW15jqOoi8KgTr8hU3rmuhN5UL1POk11mUfWu6IP2vQwSX5dD_dvoFArW9shYkhgrWHpE_gAAiaD5-AkYDAGb5k7EovWeEQ4S-d97ziZRADbq88X2Ug2wg:1uPejk:YDiGWSdfgBGy9nTHMZoBeOtV6ZzvXbZ3Og83Stc-0U4','2025-06-13 10:00:44.871834'),('nf0nyxjjmp6gbv85cqzctukpypnvl0uf','.eJxVjDsOwjAQBe_iGln-YpuSPmewdr0bHECOFCcV4u4QKQW0b2beS2TY1pq3zkueSFyEMeL0OyKUB7ed0B3abZZlbusyodwVedAuh5n4eT3cv4MKvX7roNipYJP13p8dhwQaCyBSGR2xLkwYUEer0Hk0rIJTPkYbg4Zo7JjE-wMGLTfS:1uPha9:PFe4w4QMZSwmVSSoYTTbSSM7WtXqWxfkozMl7jdARQM','2025-06-13 13:03:01.830936'),('pig1jw8kqprk4diynhtetg7egtatb5cm','.eJxVjDsOwjAQBe_iGln-YpuSPmewdr0bHECOFCcV4u4QKQW0b2beS2TY1pq3zkueSFyEMeL0OyKUB7ed0B3abZZlbusyodwVedAuh5n4eT3cv4MKvX7roNipYJP13p8dhwQaCyBSGR2xLkwYUEer0Hk0rIJTPkYbg4Zo7JjE-wMGLTfS:1uPxoH:ZqxXpwasHwy5eoKUCrOGeVlxNS-oFMaR10we0AQNG58','2025-06-14 06:22:41.115187'),('uaflxuhx9cu9zh72isn2lq0wgd9is2y5','.eJxVjEEOwiAQRe_C2hAgwIBL956BDMMgVUOT0q6Md9cmXej2v_f-SyTc1pa2wUuaijgLo8Tpd8xID-47KXfst1nS3NdlynJX5EGHvM6Fn5fD_TtoONq3BqygEYgpuBys1RZUrOyV8eQoGmKoxQQPpnqdQ9UawAJk52NmQhLvDwXLOB8:1uPew7:x5DhsCEITdavFeMwUVFzPrl5Cv0rSMW6On7OhlTh5Xs','2025-06-13 10:13:31.092792'),('ugp2bh2reomlh25kygz7oljnb64l9coh','.eJxVjDsOwjAQBe_iGlnedfyjpOcM0a7XwQGUSHFSIe4OkVJA-2bmvVRP21r7rZWlH0WdFaI6_Y5M-VGmncidptus8zyty8h6V_RBm77OUp6Xw_07qNTqt06RwHkILIXRcwKTSjDRWxsRuUMO5IKHATOERFEM4GCdFIHOGuu8en8A4io23g:1uPf5p:0CHUb-6ZSOE3OXmBmZrVdLiK7K2E75Xwj7Gl79ctr60','2025-06-13 10:23:33.572562'),('uvtsdljqxfl9rbsl0g8uf6ed93sqydup','.eJxVjDsOwjAQBe_iGln-YpuSPmewdr0bHECOFCcV4u4QKQW0b2beS2TY1pq3zkueSFyEMeL0OyKUB7ed0B3abZZlbusyodwVedAuh5n4eT3cv4MKvX7roNipYJP13p8dhwQaCyBSGR2xLkwYUEer0Hk0rIJTPkYbg4Zo7JjE-wMGLTfS:1uQi4J:jdpp-6x4meq-IJQQ1ISqWBllexULuhGwMeyWLfXlT14','2025-06-16 07:46:19.139706'),('xlr4howidwe3tx05w53apt3q6p504oel','.eJxVjDsOwjAQBe_iGln-YpuSPmewdr0bHECOFCcV4u4QKQW0b2beS2TY1pq3zkueSFyEMeL0OyKUB7ed0B3abZZlbusyodwVedAuh5n4eT3cv4MKvX7roNipYJP13p8dhwQaCyBSGR2xLkwYUEer0Hk0rIJTPkYbg4Zo7JjE-wMGLTfS:1uPhrD:hQEPvGb8HQu8dDLhdAhmhAcTC4npXvMB8yLN0xmIJrM','2025-06-13 13:20:39.891260');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes_app_comment`
--

DROP TABLE IF EXISTS `notes_app_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes_app_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `note_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notes_app_comment_note_id_b756d2bf_fk_notes_app_note_id` (`note_id`),
  KEY `notes_app_comment_user_id_7f7bd705_fk_auth_user_id` (`user_id`),
  CONSTRAINT `notes_app_comment_note_id_b756d2bf_fk_notes_app_note_id` FOREIGN KEY (`note_id`) REFERENCES `notes_app_note` (`id`),
  CONSTRAINT `notes_app_comment_user_id_7f7bd705_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes_app_comment`
--

LOCK TABLES `notes_app_comment` WRITE;
/*!40000 ALTER TABLE `notes_app_comment` DISABLE KEYS */;
INSERT INTO `notes_app_comment` VALUES (1,'hii ia m','2025-06-06 11:44:50.689821',4,3);
/*!40000 ALTER TABLE `notes_app_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes_app_note`
--

DROP TABLE IF EXISTS `notes_app_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes_app_note` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `last_modified` datetime(6) NOT NULL,
  `is_shared` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  `category` varchar(100) NOT NULL,
  `is_page` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notes_app_note_user_id_1ee05aec_fk_auth_user_id` (`user_id`),
  CONSTRAINT `notes_app_note_user_id_1ee05aec_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes_app_note`
--

LOCK TABLES `notes_app_note` WRITE;
/*!40000 ALTER TABLE `notes_app_note` DISABLE KEYS */;
INSERT INTO `notes_app_note` VALUES (1,'i am dharani','i am from salem','2025-06-06 07:34:47.817904','2025-06-06 07:34:47.817923',1,2,'Documents',0),(3,'Drink water my boy','Drink as much as water you need my boy','2025-06-06 11:18:30.933955','2025-06-06 11:18:30.934008',1,3,'Documents',0),(4,'Drink water my boy','Drink as much as water you need my boy','2025-06-06 11:18:37.260977','2025-06-06 11:22:03.109187',0,3,'Documents',0),(5,'dhrani','na tha bro leo','2025-06-11 18:40:16.749468','2025-06-11 18:40:16.749485',0,16,'Documents',0),(6,'dharani','drint w3ahvdghafewfbrenvfganeruivbakjr f','2025-06-12 10:20:51.895250','2025-06-12 10:20:51.895282',0,21,'Documents',0);
/*!40000 ALTER TABLE `notes_app_note` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-16 15:37:26
