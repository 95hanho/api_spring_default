-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: api_spring_default
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `api_spring_default_file`
--

DROP TABLE IF EXISTS `api_spring_default_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_spring_default_file` (
  `file_id` int NOT NULL AUTO_INCREMENT,
  `fileName` varchar(300) DEFAULT NULL,
  `storeName` varchar(300) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`file_id`),
  KEY `file_user_idx` (`user`),
  CONSTRAINT `file_user` FOREIGN KEY (`user`) REFERENCES `api_spring_default_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_spring_default_file`
--

LOCK TABLES `api_spring_default_file` WRITE;
/*!40000 ALTER TABLE `api_spring_default_file` DISABLE KEYS */;
INSERT INTO `api_spring_default_file` VALUES (1,'웨이드_빅.jpg','1733882436146_웨이드_빅.jpg','2024-12-11 10:52:55','test');
/*!40000 ALTER TABLE `api_spring_default_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_spring_default_token`
--

DROP TABLE IF EXISTS `api_spring_default_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_spring_default_token` (
  `token_id` int NOT NULL AUTO_INCREMENT,
  `connect_ip` varchar(45) DEFAULT NULL,
  `connect_agent` varchar(300) DEFAULT NULL,
  `refresh_token` varchar(300) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`token_id`),
  KEY `token_user_idx` (`id`),
  CONSTRAINT `token_user` FOREIGN KEY (`id`) REFERENCES `api_spring_default_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_spring_default_token`
--

LOCK TABLES `api_spring_default_token` WRITE;
/*!40000 ALTER TABLE `api_spring_default_token` DISABLE KEYS */;
INSERT INTO `api_spring_default_token` VALUES (1,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM4MTIzMDksImV4cCI6MTczMzgyMzI4OX0.S2UZktPbhdpjbHur0vOQoERKVqWTSvKYKwRzBUT9qm8','2024-12-10 15:31:49','test'),(2,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM4MTM4MTEsImV4cCI6MTczMzgyNDc5MX0.3qqk97MPx_FcK2mt5b7w8bfFGyD0JwMM5QEBVH0-VxA','2024-12-10 15:56:51','test'),(3,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM4MTQyMzQsImV4cCI6MTczMzgyNTIxNH0.5PHbXiZsJXW2K7F1KlqpCvQRxQENwJipA1wo-lPlzHw','2024-12-10 16:03:54','test'),(4,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM4MTQzNDUsImV4cCI6MTczMzgxNTMwNX0.jzWOKfJl8Ewg2N2lUPD6_U3aTfUZ_wJkTAMJAl9wc7E','2024-12-10 16:05:45','test'),(5,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM4MTcwOTcsImV4cCI6MTczMzgxODA1N30.j-EX0oEsdNMn2X47Sv5KdtdsIymlPP0l3g9yVWVi00k','2024-12-10 16:51:37','test'),(6,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM4MTc2MzYsImV4cCI6MTczMzgxODU5Nn0.yFiq96IBCHm1Rm5bYwIQPlUIm0eK-PCigQc2oL-dJDg','2024-12-10 17:00:36','test'),(7,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM4MTgzNjUsImV4cCI6MTczMzgxOTMyNX0.I3IPNc-h_Qpju1qIWa-5aaZp4RDrmpsLRfxfoO8td08','2024-12-10 17:12:45','test'),(8,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM4MTk1NDEsImV4cCI6MTczMzgyMDUwMX0.36tfEBVqUtxeG-RzKOEuNqlIZ_ruXG6hANhNaqmmQ-I','2024-12-10 17:31:00','test'),(9,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM4MTk2NzcsImV4cCI6MTczMzgyMDYzN30.BvyaX8CF2gRITb1WJ_8evBxAxBgTjmp3kp3AAUz9Tug','2024-12-10 17:34:37','test'),(10,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM4NzYxNzUsImV4cCI6MTczMzg3NzEzNX0.mqOCCN0FWjzXgJX5axwlZ5rWRPUz6moxhT74sRre65Q','2024-12-11 08:55:12','test'),(11,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM4NzY3MzQsImV4cCI6MTczMzg3NzY5NH0.qUkb1R4E8WiFhbB5Bi2v27fXr-uJJgYhNi5tskLgHrk','2024-12-11 09:25:34','test'),(12,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM4NzgxMzYsImV4cCI6MTczMzg3OTA5Nn0.u3U6TSPwo8Tvf6TonIRSaLwGgoanKU6covJml-QaxxI','2024-12-11 09:27:59','test'),(13,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM4Nzk0MzQsImV4cCI6MTczMzg4MDM5NH0.dS0jDFnHopQlfDkLfsMwOl2uHlRSK80F6BW4K59v0tk','2024-12-11 10:10:34','test'),(14,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM4ODE4NzEsImV4cCI6MTczMzg4MjgzMX0.BUp6XdSpbm0OlK8cF0leyo-npxWYmyj3MlZX5CZaTv4','2024-12-11 10:51:11','test'),(15,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM4ODIyOTIsImV4cCI6MTczMzg4MzI1Mn0.PE8dwt5gxq--M1aettPQPcql_5Q1K0N6V7Y9Bh4MANA','2024-12-11 10:58:12','test'),(16,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM4ODMyODIsImV4cCI6MTczMzg4NDI0Mn0.n06Auvb7ML0y9OXfetsNjvLkHYX05n39FyRUdGL-NuA','2024-12-11 11:14:42','test'),(17,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM4OTQ1MTMsImV4cCI6MTczMzg5NTQ3M30.uG4pakvRksrhhzvyauWbenDM1E61BaImTyOpJnh95No','2024-12-11 13:18:54','test'),(18,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM4OTczNjAsImV4cCI6MTczMzg5ODMyMH0.vwwtIMJQheBHfiuP-XsyvXkt24twyTrC1Pa4xCWgiYE','2024-12-11 14:41:18','test'),(19,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM5MDAwODQsImV4cCI6MTczMzkwMTA0NH0.DSmHdObU3hJ7bpnTbIxzFiRJSKNl0wOGzAj59nk9QVk','2024-12-11 15:31:12','test'),(20,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM5MDI3MjIsImV4cCI6MTczMzkwMzY4Mn0.ELQP-xOLLHrwoi95tQdFwTgFNq6cB8WCv76IP40eR_w','2024-12-11 16:38:42','test'),(21,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM5NjM2MjksImV4cCI6MTczMzk2NDU4OX0.bwiUCjpXbuHgVCPPAtO7KFu36pEVHkOEz5XkDlxhP_c','2024-12-12 09:33:49','test'),(22,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM5NjQxODYsImV4cCI6MTczMzk2NTE0Nn0.JQY1wcGuLj4MSahdRd3S_WqzL4owBM5JBL6bZMn9yS4','2024-12-12 09:37:21','test'),(23,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM5NjQ0MTcsImV4cCI6MTczMzk2NTM3N30.WLJQe0rI85ABTjxTZANSplshh9KnSGxhHNdYXPfmuf8','2024-12-12 09:46:57','test'),(24,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM5NjQ0MjAsImV4cCI6MTczMzk2NTM4MH0.8uTs38O5k4lkjAQyQar19gnv4XtlMZEzwSmAD4rfYrc','2024-12-12 09:47:00','test'),(25,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM5NjQ0NTcsImV4cCI6MTczMzk2NTQxN30.cCC3ncVgO3w4zJehCcAFc2FwfTsGYoHZjmPqCa9Bc0U','2024-12-12 09:47:37','test'),(26,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM5NjQ3MDgsImV4cCI6MTczMzk2NTY2OH0.3mTjHcjmckK_cgFmtbaXj-zw1f8E2gAD5_9gbu4jnrw','2024-12-12 09:51:48','test'),(27,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM5NjQ3NjQsImV4cCI6MTczMzk2NTcyNH0.KeI_hURVINyCWkOCW_PzXmotTa9epEE5F5ZOhc3stEc','2024-12-12 09:52:44','test'),(28,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM5NjQ3ODAsImV4cCI6MTczMzk2NTc0MH0.UpmeKytA2UZzwkA9q-ZpitL6PnZw32D0je03jmGgGw4','2024-12-12 09:53:00','test'),(29,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM5NjQ3OTMsImV4cCI6MTczMzk2NTc1M30.LTRrfKnUh6dKxJL3Fi1lJzk5Lu6DgzflM__cb9vpWGI','2024-12-12 09:53:13','test'),(30,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM5NjQ4MDQsImV4cCI6MTczMzk2NTc2NH0.IsoI6g_vhbxgY0xDE1FGFwCCuh4RbddnhwVLRLKdmf4','2024-12-12 09:53:24','test'),(31,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM5NjUzMTQsImV4cCI6MTczMzk2NjI3NH0.r0u8v7iUEdmZp1xI5EwFA3b6mWelJW-BF2FsDE8PkH4','2024-12-12 09:53:46','test'),(32,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM5Njc5MDgsImV4cCI6MTczMzk2ODg2OH0.aGNIAjRCFL_DzbgycoiIGVP8XJfN9CAixitzi7GSrOM','2024-12-12 10:45:08','test'),(33,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM5NzcxMTEsImV4cCI6MTczMzk3ODA3MX0.vEBC2AmhpeXGqOzIIYwqkJk7LNhfZLtFskbr8KaF_-I','2024-12-12 13:18:31','test'),(34,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM5NzkxMTEsImV4cCI6MTczMzk4MDA3MX0.0Db6VpRQT9PTgfgLdrvGvwXBKM4eVSNcWKqoi3KRgNs','2024-12-12 13:51:51','test'),(35,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM5ODA0NzksImV4cCI6MTczMzk4MTQzOX0.7yaIDmuRfu8F2TbaPgkOTxSCw-3sT-M9zezNhxSP9g8','2024-12-12 14:14:39','test'),(36,'0:0:0:0:0:0:0:1','Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM5ODMwOTEsImV4cCI6MTczMzk4NDA1MX0.4JRUg_ydXPufBW2QUVcuHzUbdWo2jrwK-aYkevauNsU','2024-12-12 14:52:42','test'),(37,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzU2MDE4ODUsImV4cCI6MTczNTYwMjg0NX0.6zieCnyYECu7x-6WrD4Am1j9JNUuiYYJOCTf94fh9sM','2024-12-31 08:38:05','test');
/*!40000 ALTER TABLE `api_spring_default_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_spring_default_user`
--

DROP TABLE IF EXISTS `api_spring_default_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_spring_default_user` (
  `id` varchar(50) NOT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_spring_default_user`
--

LOCK TABLES `api_spring_default_user` WRITE;
/*!40000 ALTER TABLE `api_spring_default_user` DISABLE KEYS */;
INSERT INTO `api_spring_default_user` VALUES ('test','1234','테스트','2024-12-10 13:40:40');
/*!40000 ALTER TABLE `api_spring_default_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-03 14:11:24
