DROP TABLE IF EXISTS `walking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE open.`walking` (
  `course_idx` int NOT NULL AUTO_INCREMENT,
  `course_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `loc_km` float NOT NULL,
  `about_time` bigint NOT NULL,
  `start_point` varchar(255) NOT NULL,
  `end_point` varchar(255) NOT NULL,
  `walking_time` time NOT NULL,
  PRIMARY KEY (`course_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `walking`
--

LOCK TABLES open.`walking` WRITE;
/*!40000 ALTER TABLE `walking` DISABLE KEYS */;
INSERT INTO open.`walking` VALUES (1,NULL,12,22,'집','test','11:22:33'),(2,NULL,0.1,2,'서울특별시 종로구  종로 69 (종로2가, 서울YMCA) ','서울특별시 종로구 종로 69 서울YMCA ','00:00:06'),(3,'2021-02-25 04:06:49',0.1,2,'서울특별시 종로구  종로 69 (종로2가, 서울YMCA) ','서울특별시 종로구 종로 69 서울YMCA ','00:00:05');
/*!40000 ALTER TABLE `walking` ENABLE KEYS */;
UNLOCK TABLES;