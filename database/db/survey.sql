-- MySQL dump 10.13  Distrib 9.3.0, for macos14.7 (x86_64)
--
-- Host: localhost    Database: survey
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2022_11_08_103658_create_surveys_table',1),(6,'2022_11_08_103820_create_survey_answers_table',1),(7,'2022_11_08_103840_create_survey_questions_table',1),(8,'2022_11_08_103903_create_survey_question_answers_table',1),(9,'2022_11_17_075810_add_image_column_to_surveys_table',1),(10,'2025_08_22_052629_create_roles_table',1),(11,'2025_08_22_052939_create_role_user_table',1),(12,'2025_08_24_195603_add_user_id_to_table_survey_answers',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (5,'App\\Models\\User',1,'main','2d41fa87d296595f9aac842d88029503a0f15b95722a4247f4a00ed018ae77e3','[\"*\"]','2025-08-26 15:43:58',NULL,'2025-08-26 15:42:56','2025-08-26 15:43:58');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  KEY `role_user_user_id_foreign` (`user_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (1,1,1,NULL,NULL),(2,2,2,NULL,NULL),(3,2,3,NULL,NULL);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','2025-08-26 12:56:57','2025-08-26 12:56:57'),(2,'guest','2025-08-26 12:56:57','2025-08-26 12:56:57');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_answers`
--

DROP TABLE IF EXISTS `survey_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_answers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `survey_id` bigint unsigned NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_answers_user_id_foreign` (`user_id`),
  CONSTRAINT `survey_answers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_answers`
--

LOCK TABLES `survey_answers` WRITE;
/*!40000 ALTER TABLE `survey_answers` DISABLE KEYS */;
INSERT INTO `survey_answers` VALUES (1,1,1,'2025-08-26 15:37:34','2025-08-26 15:37:34'),(2,2,1,'2025-08-26 15:40:22','2025-08-26 15:40:22'),(3,3,1,'2025-08-26 15:42:14','2025-08-26 15:42:14');
/*!40000 ALTER TABLE `survey_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_question_answers`
--

DROP TABLE IF EXISTS `survey_question_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_question_answers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `survey_question_id` bigint unsigned NOT NULL,
  `survey_answer_id` bigint unsigned NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_question_answers`
--

LOCK TABLES `survey_question_answers` WRITE;
/*!40000 ALTER TABLE `survey_question_answers` DISABLE KEYS */;
INSERT INTO `survey_question_answers` VALUES (1,1,1,'Increased remote work','2025-08-26 15:37:34','2025-08-26 15:37:34'),(2,2,1,'Economic instability','2025-08-26 15:37:34','2025-08-26 15:37:34'),(3,3,1,'Somewhat effective','2025-08-26 15:37:34','2025-08-26 15:37:34'),(4,4,1,'Unsure','2025-08-26 15:37:34','2025-08-26 15:37:34'),(5,5,1,'Very likely','2025-08-26 15:37:34','2025-08-26 15:37:34'),(6,6,1,'Better preparedness','2025-08-26 15:37:34','2025-08-26 15:37:34'),(7,7,1,'Not at all','2025-08-26 15:37:34','2025-08-26 15:37:34'),(8,8,1,'Environmental recovery','2025-08-26 15:37:34','2025-08-26 15:37:34'),(9,9,1,'More isolation','2025-08-26 15:37:34','2025-08-26 15:37:34'),(10,10,1,'No','2025-08-26 15:37:34','2025-08-26 15:37:34'),(11,11,1,'Promoted awareness','2025-08-26 15:37:34','2025-08-26 15:37:34'),(12,12,1,'Decreased performance','2025-08-26 15:37:34','2025-08-26 15:37:34'),(13,13,1,'Somewhat helpful','2025-08-26 15:37:34','2025-08-26 15:37:34'),(14,14,1,'No impact','2025-08-26 15:37:34','2025-08-26 15:37:34'),(15,15,1,'Hospitality','2025-08-26 15:37:34','2025-08-26 15:37:34'),(16,1,2,'Increased remote work','2025-08-26 15:40:22','2025-08-26 15:40:22'),(17,2,2,'Economic instability','2025-08-26 15:40:22','2025-08-26 15:40:22'),(18,3,2,'Moderately effective','2025-08-26 15:40:22','2025-08-26 15:40:22'),(19,4,2,'No, not at all','2025-08-26 15:40:22','2025-08-26 15:40:22'),(20,5,2,'Somewhat likely','2025-08-26 15:40:22','2025-08-26 15:40:22'),(21,6,2,'No lasting change','2025-08-26 15:40:22','2025-08-26 15:40:22'),(22,7,2,'Not at all','2025-08-26 15:40:22','2025-08-26 15:40:22'),(23,8,2,'Advances in medicine','2025-08-26 15:40:22','2025-08-26 15:40:22'),(24,9,2,'More isolation','2025-08-26 15:40:22','2025-08-26 15:40:22'),(25,10,2,'Yes, in e-commerce','2025-08-26 15:40:22','2025-08-26 15:40:22'),(26,11,2,'Promoted awareness','2025-08-26 15:40:22','2025-08-26 15:40:22'),(27,12,2,'No change','2025-08-26 15:40:22','2025-08-26 15:40:22'),(28,13,2,'Very helpful','2025-08-26 15:40:22','2025-08-26 15:40:22'),(29,14,2,'Shifted manufacturing','2025-08-26 15:40:22','2025-08-26 15:40:22'),(30,15,2,'Hospitality','2025-08-26 15:40:22','2025-08-26 15:40:22'),(31,1,3,'Limited social interactions','2025-08-26 15:42:14','2025-08-26 15:42:14'),(32,2,3,'Access to education','2025-08-26 15:42:14','2025-08-26 15:42:14'),(33,3,3,'Not effective','2025-08-26 15:42:14','2025-08-26 15:42:14'),(34,4,3,'Yes, but minimally','2025-08-26 15:42:14','2025-08-26 15:42:14'),(35,5,3,'Unlikely','2025-08-26 15:42:14','2025-08-26 15:42:14'),(36,6,3,'More telemedicine','2025-08-26 15:42:14','2025-08-26 15:42:14'),(37,7,3,'Not at all','2025-08-26 15:42:14','2025-08-26 15:42:14'),(38,8,3,'Community support','2025-08-26 15:42:14','2025-08-26 15:42:14'),(39,9,3,'More isolation','2025-08-26 15:42:14','2025-08-26 15:42:14'),(40,10,3,'Yes, in healthcare','2025-08-26 15:42:14','2025-08-26 15:42:14'),(41,11,3,'Promoted awareness','2025-08-26 15:42:14','2025-08-26 15:42:14'),(42,12,3,'Decreased performance','2025-08-26 15:42:14','2025-08-26 15:42:14'),(43,13,3,'Harmful in the long run','2025-08-26 15:42:14','2025-08-26 15:42:14'),(44,14,3,'Increased prices','2025-08-26 15:42:14','2025-08-26 15:42:14'),(45,15,3,'Travel and tourism','2025-08-26 15:42:14','2025-08-26 15:42:14');
/*!40000 ALTER TABLE `survey_question_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_questions`
--

DROP TABLE IF EXISTS `survey_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_questions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `data` longtext COLLATE utf8mb4_unicode_ci,
  `survey_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_questions`
--

LOCK TABLES `survey_questions` WRITE;
/*!40000 ALTER TABLE `survey_questions` DISABLE KEYS */;
INSERT INTO `survey_questions` VALUES (1,'radio','How did the COVID-19 pandemic primarily affect your daily routine?',NULL,'{\"options\":[{\"uuid\":\"13afd1be-e355-4225-ba22-87090e77871b\",\"text\":\"Increased remote work\"},{\"uuid\":\"74eb737c-64c8-40f0-9805-e2ec2021cb59\",\"text\":\"Limited social interactions\"},{\"uuid\":\"412264cb-f6ab-4719-8739-22c51e509f65\",\"text\":\"Limited social interactions\"},{\"uuid\":\"636ef828-d398-447e-a03c-ee6c736e5982\",\"text\":\"No significant change\"}]}',1,'2025-08-26 13:07:11','2025-08-26 13:07:11'),(2,'radio','What was the biggest challenge during lockdowns?',NULL,'{\"options\":[{\"uuid\":\"efeb4d95-fbc7-4d1c-9dfa-3e867b742a81\",\"text\":\"Mental health issues\"},{\"uuid\":\"d5e7dedb-ca3a-4bb6-9f0f-5058bc5900f8\",\"text\":\"Economic instability\"},{\"uuid\":\"e2244cf9-1f03-4592-a176-3b629c5481ff\",\"text\":\"Access to education\"},{\"uuid\":\"4004eb99-6a97-445b-8543-b051b008ece1\",\"text\":\"Healthcare shortages\"}]}',1,'2025-08-26 13:09:14','2025-08-26 13:09:14'),(3,'radio','How effective were vaccines in controlling the spread?',NULL,'{\"options\":[{\"uuid\":\"560a0ac7-4af8-4531-bf68-4f30236dd232\",\"text\":\"Highly effective\"},{\"uuid\":\"3d1e2e1c-02ec-4de5-aada-f02ce163fa0a\",\"text\":\"Moderately effective\"},{\"uuid\":\"9e78343e-0785-4f02-8e4d-8660180170e1\",\"text\":\"Somewhat effective\"},{\"uuid\":\"137696ea-f039-4fe5-b79c-34e999a54ddb\",\"text\":\"Not effective\"}]}',1,'2025-08-26 13:14:15','2025-08-26 13:14:15'),(4,'radio','Did mask mandates help reduce transmission?',NULL,'{\"options\":[{\"uuid\":\"7b52b985-9134-42df-aa06-ab229c0f27e7\",\"text\":\"Yes, significantly\"},{\"uuid\":\"a52f9827-7366-4838-b243-89e1988587a3\",\"text\":\"Yes, but minimally\"},{\"uuid\":\"2b456aca-03c5-40a0-99fd-3219bd359843\",\"text\":\"No, not at all\"},{\"uuid\":\"b2b062fe-04cd-4e95-9d71-54f297eefcf6\",\"text\":\"Unsure\"}]}',1,'2025-08-26 13:16:09','2025-08-26 13:16:09'),(5,'radio','Do you think another pandemic is likely soon?',NULL,'{\"options\":[{\"uuid\":\"325303b8-5858-4db1-a102-66d83ef5e458\",\"text\":\"Very likely\"},{\"uuid\":\"eb4c2336-3586-43e3-9e1a-9de5af478aa6\",\"text\":\"Somewhat likely\"},{\"uuid\":\"74515113-09b5-4f52-9dc5-882a4b1dcb82\",\"text\":\"Unlikely\"},{\"uuid\":\"06b844f5-29ea-49c8-bbc9-2df6a1851a40\",\"text\":\"Impossible\"}]}',1,'2025-08-26 13:32:42','2025-08-26 13:32:42'),(6,'radio','How has it changed healthcare systems?',NULL,'{\"options\":[{\"uuid\":\"154d81fc-4668-4beb-91f0-e570dffce3e2\",\"text\":\"More telemedicine\"},{\"uuid\":\"46b6cd3a-3ba4-4267-b951-92ff844824b1\",\"text\":\"Better preparedness\"},{\"uuid\":\"8706187a-3896-43ae-97b2-45433c8771f6\",\"text\":\"Increased funding\"},{\"uuid\":\"573e4c74-930b-4188-a445-872d2d4da16b\",\"text\":\"No lasting change\"}]}',1,'2025-08-26 13:32:42','2025-08-26 13:32:42'),(7,'radio','Were travel restrictions justified?',NULL,'{\"options\":[{\"uuid\":\"4f8184ff-006d-4bbf-b5d1-eaf021c231d1\",\"text\":\"Absolutely\"},{\"uuid\":\"bafa8300-83e4-4a5e-99cd-347cfa577066\",\"text\":\"Partially\"},{\"uuid\":\"e3b3f00d-23de-44af-8ade-7a372e574980\",\"text\":\"Not at all\"},{\"uuid\":\"9d7befaa-985d-4114-822b-63c070002a9b\",\"text\":\"Overly strict\"}]}',1,'2025-08-26 13:32:42','2025-08-26 13:32:42'),(8,'radio','What was the most positive outcome?',NULL,'{\"options\":[{\"uuid\":\"91aa3149-efb7-4465-b636-cc7f15b2ad7f\",\"text\":\"Advances in medicine\"},{\"uuid\":\"d40f9b0b-5918-41da-b4bb-62f9a8584c10\",\"text\":\"Environmental recovery\"},{\"uuid\":\"feac2780-f70c-4236-8f84-49cddc12421d\",\"text\":\"Work-life balance\"},{\"uuid\":\"89f77673-fc39-4658-8d2c-1c24c628a814\",\"text\":\"Community support\"}]}',1,'2025-08-26 13:32:42','2025-08-26 13:32:42'),(9,'radio','How did it impact mental health globally?',NULL,'{\"options\":[{\"uuid\":\"3be520e8-a7cd-45c6-bfd1-1406973a81ce\",\"text\":\"Increased anxiety\"},{\"uuid\":\"2b5888c8-8c6b-4bc7-b866-c1d5ddead1d1\",\"text\":\"Higher depression rates\"},{\"uuid\":\"5d9a566a-1101-4ced-bbd9-624134b19d4f\",\"text\":\"More isolation\"},{\"uuid\":\"cd1fa5e4-f678-441e-b1eb-02c5686c5f15\",\"text\":\"Improved resilience\"}]}',1,'2025-08-26 13:32:42','2025-08-26 13:32:42'),(10,'radio','Did the pandemic accelerate technological adoption?',NULL,'{\"options\":[{\"uuid\":\"ab2eeec7-48ba-4c5c-8cd7-3a76e765fd7e\",\"text\":\"Yes, in healthcare\"},{\"uuid\":\"cfa4bbfa-73cb-4b44-b198-f2763e351de4\",\"text\":\"Yes, in e-commerce\"},{\"uuid\":\"9077c56a-fbd8-4027-8bd8-bf526a1f6629\",\"text\":\"Yes, in communication\"},{\"uuid\":\"6778d8ad-80a2-45ec-9895-240e483f29ec\",\"text\":\"No\"}]}',1,'2025-08-26 13:32:42','2025-08-26 13:32:42'),(11,'radio','What role did social media play during the pandemic?',NULL,'{\"options\":[{\"uuid\":\"e29c6af2-5e81-4124-bd2f-517f557091cc\",\"text\":\"Spread misinformation\"},{\"uuid\":\"cdbff973-3567-4c24-8618-8b0bf17031d3\",\"text\":\"Kept people connected\"},{\"uuid\":\"aecc9233-43fb-4894-a5b2-02704c4878fa\",\"text\":\"Promoted awareness\"},{\"uuid\":\"8ed96e54-98f8-4086-bf10-8f0759745c88\",\"text\":\"All of the above\"}]}',1,'2025-08-26 13:32:42','2025-08-26 13:32:42'),(12,'radio','How has remote learning affected students?',NULL,'{\"options\":[{\"uuid\":\"a57ee3d3-f672-45cf-a163-1c3f6ffb218f\",\"text\":\"Improved flexibility\"},{\"uuid\":\"63b16fde-4a80-4948-b16e-083973c62b91\",\"text\":\"Decreased performance\"},{\"uuid\":\"56f73f3a-71a4-478d-bac1-db910b699c12\",\"text\":\"Increased screen time\"},{\"uuid\":\"3c05e064-a225-4c02-b955-977090180f76\",\"text\":\"No change\"}]}',1,'2025-08-26 13:32:42','2025-08-26 13:32:42'),(13,'radio','Were government stimulus packages helpful?',NULL,'{\"options\":[{\"uuid\":\"50a289c1-0e7c-42d0-b9fa-55d0962d5311\",\"text\":\"Very helpful\"},{\"uuid\":\"d37b6127-bf16-450d-8e9b-7daa98c95604\",\"text\":\"Somewhat helpful\"},{\"uuid\":\"20be1d20-71e0-4b09-b08c-5ff1a0d5a4c3\",\"text\":\"Not helpful\"},{\"uuid\":\"f2829bb2-cbc2-408e-aa3b-755b006a1439\",\"text\":\"Harmful in the long run\"}]}',1,'2025-08-26 13:32:42','2025-08-26 13:32:42'),(14,'radio','How did the pandemic influence global supply chains?',NULL,'{\"options\":[{\"uuid\":\"69fb252f-52ab-45b7-8c91-7b3d1fde0a21\",\"text\":\"Caused shortages\"},{\"uuid\":\"cf57322e-adc1-477b-be5f-d841db425dbc\",\"text\":\"Increased prices\"},{\"uuid\":\"51d0a923-09f6-4ea4-9945-3f23a462afc3\",\"text\":\"Shifted manufacturing\"},{\"uuid\":\"cdae2755-3137-418d-9ead-845f5f1bac25\",\"text\":\"No impact\"}]}',1,'2025-08-26 13:32:42','2025-08-26 13:32:42'),(15,'radio','What industry was hit hardest by the pandemic?',NULL,'{\"options\":[{\"uuid\":\"ee9c82d7-aec2-4927-bdc3-43184ef1daef\",\"text\":\"Travel and tourism\"},{\"uuid\":\"486d2cde-cf6f-4bb8-ac97-673ffd242c43\",\"text\":\"Hospitality\"},{\"uuid\":\"fab3056c-041e-4693-8d20-9d54590db6dc\",\"text\":\"Retail\"},{\"uuid\":\"333cae3f-44e6-427a-bb95-9dc49af02a28\",\"text\":\"Entertainment\"}]}',1,'2025-08-26 13:32:42','2025-08-26 13:32:42'),(16,'radio','What was the main factor influencing your vote?',NULL,'{\"options\":[{\"uuid\":\"fe210e23-4a50-486e-9e35-4a614b26c049\",\"text\":\"Economic policies\"},{\"uuid\":\"9c510416-d77e-48ec-8968-554a56d05df5\",\"text\":\"Healthcare\"},{\"uuid\":\"c82736d4-d7ca-4ae2-9c5c-283529e829c5\",\"text\":\"Foreign relations\"},{\"uuid\":\"c9013063-0049-4a40-b405-fb1111899bfe\",\"text\":\"Social issues\"}]}',2,'2025-08-26 13:54:05','2025-08-26 13:54:05'),(17,'radio','How did social media affect the election?',NULL,'{\"options\":[{\"uuid\":\"5cce5397-f250-47bb-b3ae-ca31959416ff\",\"text\":\"Spread fake news\"},{\"uuid\":\"93ba3327-3a83-409c-ada0-529f7d1789c9\",\"text\":\"Mobilized voters\"},{\"uuid\":\"957c89db-f770-4836-b769-a1ed3ca5281a\",\"text\":\"Influenced opinions\"},{\"uuid\":\"625a80e9-9a46-4c80-a6ff-5a8f397af40c\",\"text\":\"No effect\"}]}',2,'2025-08-26 13:54:05','2025-08-26 13:54:05'),(18,'radio','Was mail-in voting secure?',NULL,'{\"options\":[{\"uuid\":\"58d09a33-b75f-4df3-9cae-f59b9d147bdb\",\"text\":\"Completely secure\"},{\"uuid\":\"5d3abbba-f6ed-408d-8acf-b48f1398c595\",\"text\":\"Mostly secure\"},{\"uuid\":\"3581385b-4e0f-4176-b477-136301151f28\",\"text\":\"Somewhat insecure\"},{\"uuid\":\"f53e49a2-213f-409c-8f86-fe16d164087c\",\"text\":\"Highly insecure\"}]}',2,'2025-08-26 13:54:05','2025-08-26 13:54:05'),(19,'radio','What was the impact on international relations?',NULL,'{\"options\":[{\"uuid\":\"3b2f0c81-bd8d-4a2b-a808-67b9965f52f3\",\"text\":\"a) Improved alliances\"},{\"uuid\":\"a9e63700-50a1-4e65-9509-f4e717fdbf60\",\"text\":\"Strained ties\"},{\"uuid\":\"7371cdcd-f775-4c7d-9ab7-f1ba31153476\",\"text\":\"No change\"},{\"uuid\":\"5b0ed176-2e0b-4ba9-ad5d-0b47715ae4e7\",\"text\":\"Worsened trade\"}]}',2,'2025-08-26 13:54:05','2025-08-26 13:54:05'),(20,'radio','What role did debates play?',NULL,'{\"options\":[{\"uuid\":\"9bd02ff1-f5be-40d3-8e68-75b203815e5a\",\"text\":\"Changed minds\"},{\"uuid\":\"5f57aa99-77ca-4ec8-8597-e19b76917710\",\"text\":\"Reinforced views\"},{\"uuid\":\"c515d731-c506-4c37-a69b-cbb20437b2c8\",\"text\":\"Entertained\"},{\"uuid\":\"9ccb44f7-c866-4a13-a017-f9c011862e2a\",\"text\":\"Irrelevant\"}]}',2,'2025-08-26 13:54:05','2025-08-26 13:54:05'),(21,'radio','How divided was the country post-election?',NULL,'{\"options\":[{\"uuid\":\"be80431f-ffec-47c8-8ca1-24513873797d\",\"text\":\"Extremely divided\"},{\"uuid\":\"5cdc36a5-3910-4d2f-a4e9-30f5bb6282d9\",\"text\":\"Moderately divided\"},{\"uuid\":\"d8df18eb-eb79-4191-8c67-70ab20b81ca8\",\"text\":\"Slightly divided\"},{\"uuid\":\"c8276287-47ac-4978-a6db-00d9ce523b44\",\"text\":\"United\"}]}',2,'2025-08-26 13:54:05','2025-08-26 13:54:05'),(22,'radio','Did the election results surprise you?',NULL,'{\"options\":[{\"uuid\":\"354eeb9f-aaa0-4261-840e-5cd881598a58\",\"text\":\"Yes, greatly\"},{\"uuid\":\"b490c3ca-ba02-47e6-aaf1-2608d3a8d4b0\",\"text\":\"Yes, mildly\"},{\"uuid\":\"eb04aca1-ea62-43c6-8f7f-191cf7ec5960\",\"text\":\"No, expected\"},{\"uuid\":\"c5a58125-5fa3-4797-9e3b-86f4bf764eb6\",\"text\":\"No opinion\"}]}',2,'2025-08-26 13:54:05','2025-08-26 13:54:05'),(23,'radio','How effective was the transition of power?',NULL,'{\"options\":[{\"uuid\":\"61bb56ac-0be7-463d-91a9-1e586afc5435\",\"text\":\"Smooth\"},{\"uuid\":\"8165d0ea-d611-4c72-adf0-82ffebd44059\",\"text\":\"Contentious\"},{\"uuid\":\"d27ea816-65b8-4dc0-bd74-b9fa7381dec0\",\"text\":\"Delayed\"},{\"uuid\":\"177f90ae-1d40-42bf-8a3a-16f6d98308ba\",\"text\":\"Peaceful\"}]}',2,'2025-08-26 13:54:05','2025-08-26 13:54:05'),(24,'radio','Did voter turnout set records?',NULL,'{\"options\":[{\"uuid\":\"cff3e6a4-16bf-4b03-aebf-502d3ba7f4d1\",\"text\":\"Yes, highest ever\"},{\"uuid\":\"ac5b66a4-c44c-40db-b7bd-14a41766e1cd\",\"text\":\"Yes, but not record\"},{\"uuid\":\"d0b8628b-3040-42d5-84ae-eb23f75ac8e9\",\"text\":\"No, average\"},{\"uuid\":\"98d74fdc-eb65-42e9-a89c-e0a508898108\",\"text\":\"Low turnout\"}]}',2,'2025-08-26 13:54:05','2025-08-26 13:54:05'),(25,'radio','What issue dominated the campaign?',NULL,'{\"options\":[{\"uuid\":\"4694384d-f86e-4508-b988-f8e791172fb3\",\"text\":\"COVID-19 response\"},{\"uuid\":\"861c0c51-f7ef-4823-b256-246d6c4c0652\",\"text\":\"Racial justice\"},{\"uuid\":\"b2cc53e0-dadc-471f-a7f5-a9b433c1f07f\",\"text\":\"Economy\"},{\"uuid\":\"b5e8c74b-9a75-469c-b535-033b2dcff6e0\",\"text\":\"Climate change\"}]}',2,'2025-08-26 13:54:05','2025-08-26 13:54:05'),(26,'radio','How did endorsements influence voters?',NULL,'{\"options\":[{\"uuid\":\"b3802300-a442-43a6-aad6-01e0defbabf3\",\"text\":\"Strongly\"},{\"uuid\":\"4178d285-e5e5-4efa-acf7-a35577a2a4bd\",\"text\":\"Moderately\"},{\"uuid\":\"1470be02-76a7-41de-a1d1-68841891c219\",\"text\":\"Minimally\"},{\"uuid\":\"0c9e6fda-74d1-4fe7-9573-45568a7dd38e\",\"text\":\"Not at all\"}]}',2,'2025-08-26 13:54:05','2025-08-26 13:54:05'),(27,'radio','Was the electoral college fair?',NULL,'{\"options\":[{\"uuid\":\"7ab62f81-f79c-40e6-be8a-8d4b3eefba00\",\"text\":\"Yes, represents states\"},{\"uuid\":\"14326b71-4681-4b80-9bf4-91a675ef1b27\",\"text\":\"No, outdated\"},{\"uuid\":\"4495d994-5d48-4140-8d14-a71fbbbe3529\",\"text\":\"Needs reform\"},{\"uuid\":\"083d79eb-f2f2-4e83-8a79-80c771e882ce\",\"text\":\"Perfect system\"}]}',2,'2025-08-26 13:54:05','2025-08-26 13:54:05'),(28,'radio','What was the role of fact-checkers?',NULL,'{\"options\":[{\"uuid\":\"f99559ab-04a5-43b6-82ed-b726e06dda4b\",\"text\":\"Essential\"},{\"uuid\":\"04993989-61a2-4a2e-8847-4f656eafca13\",\"text\":\"Biased\"},{\"uuid\":\"a45bfeec-bd46-4a37-95a5-ca1b86cb395a\",\"text\":\"Ineffective\"},{\"uuid\":\"448aad51-2ae5-412f-8f2d-c35700baf16d\",\"text\":\"Unnecessary\"}]}',2,'2025-08-26 13:54:05','2025-08-26 13:54:05'),(29,'radio','How has it affected US politics long-term?',NULL,'{\"options\":[{\"uuid\":\"77025249-7aa6-4965-a94f-6e4072b2e025\",\"text\":\"More polarization\"},{\"uuid\":\"0df406c9-95f4-4431-8db9-38e59e3e9bf8\",\"text\":\"Policy shifts\"},{\"uuid\":\"f2f4ce38-7d08-459c-a876-a7d80a9eab55\",\"text\":\"Voter engagement\"},{\"uuid\":\"def54a9f-2b5f-41b0-ad20-af3735dcb809\",\"text\":\"No change\"}]}',2,'2025-08-26 13:54:05','2025-08-26 13:54:05'),(30,'radio','Do you believe the election was fair?',NULL,'{\"options\":[{\"uuid\":\"e55a8ba7-9a2f-432a-b07c-91ca9154748e\",\"text\":\"Completely fair\"},{\"uuid\":\"b7d2672a-ebb0-4ca7-ad13-a19b2bb7921f\",\"text\":\"Mostly fair\"},{\"uuid\":\"133bce70-66c5-409b-b410-89c6c2591c68\",\"text\":\"Somewhat unfair\"},{\"uuid\":\"fd8396fa-36c2-4a36-b093-37703941542e\",\"text\":\"Stolen\"}]}',2,'2025-08-26 13:54:05','2025-08-26 13:54:05'),(31,'radio','How have wildfires impacted communities?',NULL,'{\"options\":[{\"uuid\":\"d283e4df-3efd-4163-b129-24202280fd46\",\"text\":\"Destroyed homes\"},{\"uuid\":\"678a689f-16e0-464e-9f6f-b3de797d0391\",\"text\":\"Health issues from smoke\"},{\"uuid\":\"15f5e932-b800-4b50-98f7-f15552f105de\",\"text\":\"Economic losses\"},{\"uuid\":\"b33d93c2-3013-4636-a445-6e94d5fc15d8\",\"text\":\"All of the above\"}]}',3,'2025-08-26 14:01:36','2025-08-26 14:01:36'),(32,'radio','What is the primary cause of climate change?',NULL,'{\"options\":[{\"uuid\":\"a7a80d24-c4d1-4e5d-8947-d5ed54491f36\",\"text\":\"Human activities\"},{\"uuid\":\"531c02e8-3b51-480b-9e43-722749cdabd5\",\"text\":\"Natural cycles\"},{\"uuid\":\"cbceeef7-e24a-424c-9746-4f56b1b729c6\",\"text\":\"Industrial emissions\"},{\"uuid\":\"fd327d92-7fc3-40aa-a099-8aa8efc0e7a7\",\"text\":\"Deforestation\"}]}',3,'2025-08-26 14:01:36','2025-08-26 14:01:36'),(33,'radio','How effective are international agreements like Paris Accord?',NULL,'{\"options\":[{\"uuid\":\"448370ed-f6cd-40c6-9448-96095243a2f1\",\"text\":\"Very effective\"},{\"uuid\":\"29125048-831f-4dbd-bf4a-3cdf2da00793\",\"text\":\"Somewhat effective\"},{\"uuid\":\"8d8526de-283f-45c2-bd7f-803c8c9dad41\",\"text\":\"Ineffective\"},{\"uuid\":\"00e416f2-2126-489b-8130-78bc52d2473e\",\"text\":\"Symbolic only\"}]}',3,'2025-08-26 14:04:03','2025-08-26 14:04:03'),(34,'radio','Was the 2023 Canadian wildfire season unprecedented?',NULL,'{\"options\":[{\"uuid\":\"8eb3af00-9c86-4e00-89af-ab9d50756341\",\"text\":\"Yes, record-breaking\"},{\"uuid\":\"a7e18be9-6ed2-4531-bebe-0b6657ed736b\",\"text\":\"Yes, but expected\"},{\"uuid\":\"86dea151-a3c4-439b-857e-bae7ea432bbf\",\"text\":\"No, typical\"},{\"uuid\":\"1169a8f9-332f-4871-b1f1-4d26d4b6355e\",\"text\":\"Overhyped\"}]}',3,'2025-08-26 14:04:03','2025-08-26 14:04:03'),(35,'radio','Is climate denial still prevalent?',NULL,'{\"options\":[{\"uuid\":\"87e56262-0e56-41a3-bd56-de38f7579098\",\"text\":\"Yes, widely\"},{\"uuid\":\"02b2421b-733c-48e6-82bd-cbed5c83c3c2\",\"text\":\"Yes, but decreasing\"},{\"uuid\":\"baeeadac-7bd7-4129-8558-f11e02a21863\",\"text\":\"No, rare\"},{\"uuid\":\"59927e24-12cc-41d4-92c9-3ef4761e4b30\",\"text\":\"Irrelevant\"}]}',3,'2025-08-26 14:23:28','2025-08-26 14:23:28'),(36,'radio','How do droughts affect food security?',NULL,'{\"options\":[{\"uuid\":\"fff9cc0b-5c0f-4463-91b3-cfab40a4ca86\",\"text\":\"Increase prices\"},{\"uuid\":\"6f61c978-2881-4f89-85c0-4123c1e0b9fc\",\"text\":\"Cause shortages\"},{\"uuid\":\"598563b4-0e46-4c0c-87b1-22396dd95c92\",\"text\":\"Lead to famine\"},{\"uuid\":\"c0080141-06a8-4370-8e7e-1f9a4f8a7d9a\",\"text\":\"Minimal effect\"}]}',3,'2025-08-26 14:23:28','2025-08-26 14:23:28'),(37,'radio','Do you support green energy transitions?',NULL,'{\"options\":[{\"uuid\":\"6e8aebb5-9150-4251-9441-41b34b8b95c7\",\"text\":\"Fully support\"},{\"uuid\":\"7c58b2fb-c23a-4420-a3cd-0076c7fec1d9\",\"text\":\"Partially support\"},{\"uuid\":\"0b694561-909d-4d57-8db5-7321fb3e9c1e\",\"text\":\"Oppose\"},{\"uuid\":\"043aa8a8-3836-42be-a575-e27fc7c561db\",\"text\":\"Neutral\"}]}',3,'2025-08-26 14:23:28','2025-08-26 14:23:28'),(38,'radio','Was COP28 successful?',NULL,'{\"options\":[{\"uuid\":\"3bd59e50-9934-4bbd-9f37-5661c53e9dfe\",\"text\":\"Major breakthroughs\"},{\"uuid\":\"d7590aed-1434-472f-8575-de286793d0d8\",\"text\":\"Minor progress\"},{\"uuid\":\"c463aab5-009b-425c-bb50-b28faf86a6b5\",\"text\":\"Failure\"},{\"uuid\":\"c7ae4ba1-9f4d-49e0-af5c-9ae5058f6dfe\",\"text\":\"Too early to tell\"}]}',3,'2025-08-26 14:23:28','2025-08-26 14:23:28'),(39,'radio','How has climate change affected wildlife?',NULL,'{\"options\":[{\"uuid\":\"3e4dbefd-5492-43ce-a74d-fe4637f09a18\",\"text\":\"Habitat loss\"},{\"uuid\":\"d9c71d0f-41f8-4de0-9123-31852b2a7ebc\",\"text\":\"Species extinction\"},{\"uuid\":\"7f3413de-70c3-4d02-a220-0a6e33b73ab2\",\"text\":\"Migration changes\"},{\"uuid\":\"8cf5ca69-82e9-4c0b-a951-e4568a1f25c4\",\"text\":\"No impact\"}]}',3,'2025-08-26 14:23:28','2025-08-26 14:23:28'),(40,'radio','What industry contributes most to emissions?',NULL,'{\"options\":[{\"uuid\":\"fbc67fbb-527c-46ad-9183-6eb90da26b7e\",\"text\":\"Transportation\"},{\"uuid\":\"1a88b5b0-8086-4000-8dd1-e3ba04673602\",\"text\":\"Energy production\"},{\"uuid\":\"972d9cf0-567c-449b-a2e3-399dc8713883\",\"text\":\"Agriculture\"},{\"uuid\":\"d8b3bc19-6090-44eb-9b74-3c8b8fc694ed\",\"text\":\"Manufacturing\"}]}',3,'2025-08-26 14:23:28','2025-08-26 14:23:28'),(41,'radio','Are extreme heatwaves becoming more frequent?',NULL,'{\"options\":[{\"uuid\":\"91048614-3641-4e94-b876-bbd4e5547beb\",\"text\":\"Definitely\"},{\"uuid\":\"89ab4248-8150-474a-b0e7-780b63eaf139\",\"text\":\"Probably\"},{\"uuid\":\"ee6eca2d-5a45-4c38-91c6-209694a4a3f0\",\"text\":\"Unlikely\"},{\"uuid\":\"1a6cc519-7853-41a8-8a35-530b849ee506\",\"text\":\"No\"}]}',3,'2025-08-26 14:23:28','2025-08-26 14:23:28'),(42,'radio','How did the 2022 Pakistan floods impact the region?',NULL,'{\"options\":[{\"uuid\":\"b94c2342-b03b-44b7-bbef-2fbb7304173e\",\"text\":\"Massive displacement\"},{\"uuid\":\"d990980e-40cd-49c2-8924-c4abeda9cf2d\",\"text\":\"Agricultural loss\"},{\"uuid\":\"183ac625-139a-4753-8c47-51b497d407f5\",\"text\":\"Infrastructure damage\"},{\"uuid\":\"39277c6e-c314-46d6-a930-b5186840f742\",\"text\":\"All\"}]}',3,'2025-08-26 14:23:28','2025-08-26 14:23:28'),(43,'radio','What is the best way to combat climate change?',NULL,'{\"options\":[{\"uuid\":\"f4b22ed7-3455-4cce-90a7-3ad882c2c41e\",\"text\":\"Renewable energy\"},{\"uuid\":\"98245857-c235-455e-9f47-7f35d6950c65\",\"text\":\"Carbon taxes\"},{\"uuid\":\"a731fd7c-aab3-4d7e-80e0-36e225a2c67a\",\"text\":\"Reforestation\"},{\"uuid\":\"9727978b-cdc9-449b-8c73-61e78713063a\",\"text\":\"Individual actions\"}]}',3,'2025-08-26 14:23:28','2025-08-26 14:23:28'),(44,'radio','Has sea level rise affected coastal areas?',NULL,'{\"options\":[{\"uuid\":\"ca0a7e36-c75d-40f8-9b6d-997d5009b481\",\"text\":\"Severely\"},{\"uuid\":\"bdf1617b-fbc5-4ca3-a13f-68988c0c1d53\",\"text\":\"Moderately\"},{\"uuid\":\"f20c3781-e0ee-4b1c-bb98-e4bfd28121dc\",\"text\":\"Minimally\"},{\"uuid\":\"9504b1a4-5cc3-43a5-9b91-6c27139cc4d9\",\"text\":\"Not yet\"}]}',3,'2025-08-26 14:23:28','2025-08-26 14:23:28'),(45,'radio','What role do hurricanes play in climate discussions?',NULL,'{\"options\":[{\"uuid\":\"b236c7f5-75d3-41fb-bc60-7ad2b6ed48df\",\"text\":\"Highlight urgency\"},{\"uuid\":\"2c0eef82-c9c9-4c22-be3f-a57950f16f42\",\"text\":\"Cause displacement\"},{\"uuid\":\"9a155145-d1be-464d-8eba-e6ddc58b7c28\",\"text\":\"Increase insurance costs\"},{\"uuid\":\"fd1905e0-5026-4d1e-a655-eba8013b4607\",\"text\":\"No role\"}]}',3,'2025-08-26 14:23:28','2025-08-26 14:23:28'),(46,'radio','Was the 2022 Artemis I mission successful?',NULL,'{\"options\":[{\"uuid\":\"4a436ea6-1066-4725-87ca-68a7cd857200\",\"text\":\"Fully\"},{\"uuid\":\"fa6cc5fe-2c36-47b6-afce-56ba780978dc\",\"text\":\"Partially\"},{\"uuid\":\"19ce85d7-2d96-4c0b-8dc0-fde7d04c82dd\",\"text\":\"Failed\"},{\"uuid\":\"827531cd-62d8-43ea-b289-3eb46c0e6256\",\"text\":\"Delayed\"}]}',4,'2025-08-26 14:31:09','2025-08-26 14:31:09'),(47,'radio','How has SpaceX revolutionized space travel?',NULL,'{\"options\":[{\"uuid\":\"9a096f89-fd30-4da2-8d72-da69e472a6a0\",\"text\":\"Reusable rockets\"},{\"uuid\":\"54ac5e4b-19cd-416a-a658-9cf2fcfab967\",\"text\":\"Starlink satellites\"},{\"uuid\":\"b3e52cb3-8b76-459d-a9fc-10f8f97fbb89\",\"text\":\"Mars ambitions\"},{\"uuid\":\"824dd77c-867b-40de-bfe4-a0f34ba654ca\",\"text\":\"No revolution\"}]}',4,'2025-08-26 14:31:09','2025-08-26 14:31:09'),(48,'radio','What was the significance of the James Webb Space Telescope launch?',NULL,'{\"options\":[{\"uuid\":\"f3845d9f-9de0-4fde-a0a0-f1dcd38f3e38\",\"text\":\"Deep space images\"},{\"uuid\":\"396f3952-dc25-453e-b09c-f480bee8793b\",\"text\":\"Exoplanet discovery\"},{\"uuid\":\"a30edd6d-937c-48db-892b-4f9bf22d1387\",\"text\":\"Technological feat\"},{\"uuid\":\"3559fb1b-3b9f-473e-9fce-55eb94d155a5\",\"text\":\"All\"}]}',4,'2025-08-26 14:31:09','2025-08-26 14:31:09'),(49,'radio','Do you believe in extraterrestrial life?',NULL,'{\"options\":[{\"uuid\":\"1457274a-b5cd-40a6-850d-c4cf4577ed7a\",\"text\":\"Definitely\"},{\"uuid\":\"4614eb2b-39fe-4b67-8259-c280145dd38b\",\"text\":\"Possibly\"},{\"uuid\":\"1a37c094-2cd3-4385-bbae-37e0bd9db3ee\",\"text\":\"Unlikely\"},{\"uuid\":\"ce63ba76-3507-4c48-87b1-4038edc59872\",\"text\":\"No\"}]}',4,'2025-08-26 14:47:48','2025-08-26 14:47:48'),(50,'radio','Has space exploration inspired education?',NULL,'{\"options\":[{\"uuid\":\"098bf4e9-e2ed-4cd1-bc6a-790ddb9d7232\",\"text\":\"Yes, STEM fields\"},{\"uuid\":\"47926aec-c48c-4d02-98b3-926a0163f7d2\",\"text\":\"Yes, globally\"},{\"uuid\":\"6157d66c-7934-424c-ad40-715407369c19\",\"text\":\"Minimally\"},{\"uuid\":\"255942f6-74cc-4574-b1be-d5bec56f17c9\",\"text\":\"No\"}]}',4,'2025-08-26 14:47:48','2025-08-26 14:47:48'),(51,'radio','What future mission excites you most?',NULL,'{\"options\":[{\"uuid\":\"286806e3-3655-4cee-b9ad-45f1f3e5d377\",\"text\":\"Europa Clipper\"},{\"uuid\":\"e3cef09d-7327-4eda-b980-7239ef090f70\",\"text\":\"Starship to Mars\"},{\"uuid\":\"ad8a4286-ea72-4b8b-9680-096a2678da8b\",\"text\":\"Lunar base\"},{\"uuid\":\"fd0a23ba-34dd-4cb4-9632-6eb00308c7e2\",\"text\":\"None\"}]}',4,'2025-08-26 14:47:48','2025-08-26 14:47:48'),(52,'radio','Is international cooperation in space important?',NULL,'{\"options\":[{\"uuid\":\"b7e50551-b2f2-4c85-ac77-3c3033f84873\",\"text\":\"Essential\"},{\"uuid\":\"31b0abe2-26a5-4427-9be8-dc92aad8bd49\",\"text\":\"Beneficial\"},{\"uuid\":\"f78a107d-2f25-4381-a7d8-2c4d458cb1e1\",\"text\":\"Unnecessary\"},{\"uuid\":\"b9255e31-04d6-47bb-bbbb-752fb1bbf93b\",\"text\":\"Risky\"}]}',4,'2025-08-26 14:47:48','2025-08-26 14:47:48'),(53,'radio','How do satellites affect daily life?',NULL,'{\"options\":[{\"uuid\":\"d50fc23f-56af-4e51-84eb-0e22c1f9682b\",\"text\":\"GPS navigation\"},{\"uuid\":\"470af82b-41ab-4844-be14-5bbf5d6a01a0\",\"text\":\"Weather forecasting\"},{\"uuid\":\"d26e1e76-cc4c-4c78-b337-d9c51919df22\",\"text\":\"Internet access\"},{\"uuid\":\"6f22e0b0-c236-4211-b674-7c21e20399e1\",\"text\":\"All\"}]}',4,'2025-08-26 14:47:48','2025-08-26 14:47:48'),(54,'radio','Did the DART mission change asteroid defense?',NULL,'{\"options\":[{\"uuid\":\"6be40c89-a722-441f-9e00-2888de05a76c\",\"text\":\"Proved concept\"},{\"uuid\":\"2c129c22-94e1-4ebd-9073-19bfe33d3ce4\",\"text\":\"Minor success\"},{\"uuid\":\"7ddedf8e-bb7c-4cf5-b99b-4e5b9d6c1e35\",\"text\":\"Failure\"},{\"uuid\":\"5b0f8ffe-77cc-4d34-9db4-c9b44553a05d\",\"text\":\"Irrelevant\"}]}',4,'2025-08-26 14:47:48','2025-08-26 14:47:48'),(55,'radio','What is the biggest challenge in space exploration?',NULL,'{\"options\":[{\"uuid\":\"8970af52-5b42-46e0-b3ce-792fd3d92db1\",\"text\":\"Funding\"},{\"uuid\":\"c4be5716-7256-4e33-958d-6bd321e58abe\",\"text\":\"Technology\"},{\"uuid\":\"701e6bdc-8ce5-4c6d-be4e-f443dcfb1317\",\"text\":\"Radiation\"},{\"uuid\":\"35b26acc-f88e-4a87-9416-7939526dd2f4\",\"text\":\"Politics\"}]}',4,'2025-08-26 14:47:48','2025-08-26 14:47:48'),(56,'radio','How has China\'s space program progressed?',NULL,'{\"options\":[{\"uuid\":\"bd1d9655-a092-4af8-8f35-a769e775b1d2\",\"text\":\"Moon landings\"},{\"uuid\":\"56c02a4e-bf45-4d58-bd3b-8febf178555b\",\"text\":\"Space station\"},{\"uuid\":\"e0302cfa-72d8-45ed-b362-4b3b257a0929\",\"text\":\"Mars rover\"},{\"uuid\":\"71332ee1-ec6a-45f8-8fd7-7fe5a1058c19\",\"text\":\"All\"}]}',4,'2025-08-26 14:47:48','2025-08-26 14:47:48'),(57,'radio','Are space tourism flights ethical?',NULL,'{\"options\":[{\"uuid\":\"fee44ca7-6e3f-49d3-9339-5f725c63572e\",\"text\":\"Yes, advances tech\"},{\"uuid\":\"459ff6f6-6de3-4494-af9c-1b990ba3ed0c\",\"text\":\"No, wasteful\"},{\"uuid\":\"586f5be6-5dbf-4151-b736-8090f628a3e5\",\"text\":\"Depends on cost\"},{\"uuid\":\"8c7f6ad6-67ab-4348-8052-5ec7b1d9b436\",\"text\":\"Neutral\"}]}',4,'2025-08-26 14:47:48','2025-08-26 14:47:48'),(58,'radio','What impact did the Perseverance rover have?',NULL,'{\"options\":[{\"uuid\":\"fc0ccd23-7df7-4f75-ae76-43dd056522c1\",\"text\":\"Mars samples\"},{\"uuid\":\"7a0b549a-dbf3-4b62-8ae2-b06f52e1b821\",\"text\":\"Helicopter flights\"},{\"uuid\":\"68cf51b1-3c4c-4eb5-bc31-db48f110c81f\",\"text\":\"Life search\"},{\"uuid\":\"b2951ba3-3457-4b68-920e-05badd724527\",\"text\":\"Minimal\"}]}',4,'2025-08-26 14:47:48','2025-08-26 14:47:48'),(59,'radio','How likely is human settlement on Mars?',NULL,'{\"options\":[{\"uuid\":\"f983ebd5-fedf-4a33-be08-a71f2e2a1446\",\"text\":\"Within 10 years\"},{\"uuid\":\"b323d5bc-9cf1-485f-b936-b12c639028ac\",\"text\":\"20-50 years\"},{\"uuid\":\"14e2d3e6-6ab7-4515-a2ad-58fe35d6c2ac\",\"text\":\"Never\"},{\"uuid\":\"0b94aee3-1ca2-47f2-8092-dba155e019c9\",\"text\":\"Already planning\"}]}',4,'2025-08-26 14:47:48','2025-08-26 14:47:48'),(60,'radio','What role does private industry play in space?',NULL,'{\"options\":[{\"uuid\":\"28db35f4-4e52-456a-b5f0-00a1e1f72e38\",\"text\":\"Speeds innovation\"},{\"uuid\":\"2368b6fd-81b6-4106-87e4-233fd34b77eb\",\"text\":\"Reduces costs\"},{\"uuid\":\"e421de9b-ed2a-48ab-bfd3-5d26501eb3ad\",\"text\":\"Competes with governments\"},{\"uuid\":\"51a23028-cfcf-41cb-b815-4f2cc351f4d6\",\"text\":\"Risks safety\"}]}',4,'2025-08-26 14:47:48','2025-08-26 14:47:48'),(61,'radio','What triggered the full-scale invasion?',NULL,'{\"options\":[{\"uuid\":\"4bbd402d-26f2-43eb-99eb-7008cb722563\",\"text\":\"NATO expansion\"},{\"uuid\":\"e92cd3cb-7815-40b0-9ffe-a3e86436694c\",\"text\":\"Territorial disputes\"},{\"uuid\":\"8ecce868-124b-49f9-b8ae-986562803caf\",\"text\":\"Historical tensions\"},{\"uuid\":\"917dc23e-b9bb-421f-bec4-f9176ba64115\",\"text\":\"All\"}]}',5,'2025-08-26 14:53:52','2025-08-26 14:53:52'),(62,'radio','What military aid was most crucial?',NULL,'{\"options\":[{\"uuid\":\"7e36cec5-9518-446b-adb9-1834dd00f040\",\"text\":\"Weapons\"},{\"uuid\":\"51cb5cf9-f5db-41c8-b4a1-389ded7f42ea\",\"text\":\"Intelligence\"},{\"uuid\":\"92da99ef-5b2c-4f80-9af6-aebba7209861\",\"text\":\"Training\"},{\"uuid\":\"ea0931a0-4def-48f8-8c82-0ab7f0371b96\",\"text\":\"Financial\"}]}',5,'2025-08-26 15:02:06','2025-08-26 15:02:06'),(63,'radio','Did the conflict change global alliances?',NULL,'{\"options\":[{\"uuid\":\"764486d8-7fa2-4841-83e2-005460095685\",\"text\":\"Strengthened West\"},{\"uuid\":\"ea2a6797-112e-4226-8dd6-dd51be8bf5a1\",\"text\":\"Boosted BRICS\"},{\"uuid\":\"aa0fcc34-2d76-46c5-ad34-807b78f77947\",\"text\":\"No change\"},{\"uuid\":\"c289fa27-7ef6-4d58-bd43-2b365a621bcc\",\"text\":\"Weakened UN\"}]}',5,'2025-08-26 15:02:06','2025-08-26 15:02:06'),(64,'radio','How likely is a peaceful resolution?',NULL,'{\"options\":[{\"uuid\":\"35803dd7-81a8-471b-868a-8535b44d34d2\",\"text\":\"Soon\"},{\"uuid\":\"bbb5f3ec-c1de-44e0-8fa1-7f2da2935e36\",\"text\":\"Long-term\"},{\"uuid\":\"675eeb58-e878-47ab-ade4-1db66bb6c29a\",\"text\":\"Unlikely\"},{\"uuid\":\"192bcb02-aa9d-44de-b03e-0dd98f691ec6\",\"text\":\"Impossible\"}]}',5,'2025-08-26 15:02:06','2025-08-26 15:02:06'),(65,'radio','What has been the humanitarian cost?',NULL,'{\"options\":[{\"uuid\":\"a12a8761-f3a2-4d02-9482-90995ba67ae7\",\"text\":\"Millions displaced\"},{\"uuid\":\"a042c159-008d-4d78-a8ec-1ce2c1484138\",\"text\":\"Civilian casualties\"},{\"uuid\":\"56508232-a335-47a2-bffd-46f5fa7b32ea\",\"text\":\"Infrastructure destruction\"},{\"uuid\":\"ff3e4d9f-5658-49d7-86a3-30c0ec8264b0\",\"text\":\"All\"}]}',5,'2025-08-26 15:02:06','2025-08-26 15:02:06'),(66,'radio','Is NATO\'s involvement justified?',NULL,'{\"options\":[{\"uuid\":\"5bccd2e2-008d-4ae5-9981-788c49c097e2\",\"text\":\"Yes, defensive\"},{\"uuid\":\"e0b954b8-34a5-42df-a1ed-09fae2af9394\",\"text\":\"No, escalatory\"},{\"uuid\":\"26de309f-6025-4cda-880e-25e7f4213ee0\",\"text\":\"Partial\"},{\"uuid\":\"03903e75-6b21-41a1-b3cd-659c68b9c9d3\",\"text\":\"Neutral\"}]}',5,'2025-08-26 15:02:06','2025-08-26 15:02:06'),(67,'radio','How has it impacted food security?',NULL,'{\"options\":[{\"uuid\":\"b52c6dac-7101-484f-bcdd-e991d9e58421\",\"text\":\"Grain shortages\"},{\"uuid\":\"ac413441-89c2-4906-95c8-bdecd9271971\",\"text\":\"Higher prices\"},{\"uuid\":\"0205ec6b-ddfc-4ad3-a13c-b22b44d4c155\",\"text\":\"Famine risks\"},{\"uuid\":\"2f8b00fe-f777-4415-a0b6-564fc8f0c85f\",\"text\":\"No impact\"}]}',5,'2025-08-26 15:02:06','2025-08-26 15:02:06'),(68,'radio','What role did social media play in the conflict?',NULL,'{\"options\":[{\"uuid\":\"0ca7a29f-af2c-4b3f-81f4-960a93782a5f\",\"text\":\"Propaganda tool\"},{\"uuid\":\"bbfb62d2-7573-47ff-b893-4faa0460f5b7\",\"text\":\"Real-time updates\"},{\"uuid\":\"e13beb88-787e-41de-93a4-a283a675619a\",\"text\":\"Fundraising\"},{\"uuid\":\"fc47a610-0dd8-4504-9117-f9e67d2a2b26\",\"text\":\"All\"}]}',5,'2025-08-26 15:02:06','2025-08-26 15:02:06'),(69,'radio','Were Western sanctions effective?',NULL,'{\"options\":[{\"uuid\":\"d24565de-dcf1-484a-83a3-44561cf28151\",\"text\":\"Very\"},{\"uuid\":\"b96cecfc-1fad-48fb-9ba6-113d291d36b3\",\"text\":\"Somewhat\"},{\"uuid\":\"63775418-b0cd-4d29-8cd4-0d3a25101a7c\",\"text\":\"Ineffective\"},{\"uuid\":\"f7005536-8fc4-4f0d-be07-7fc0b0b4d116\",\"text\":\"Backfired\"}]}',5,'2025-08-26 15:02:07','2025-08-26 15:02:07'),(70,'radio','How has it affected global energy prices?',NULL,'{\"options\":[{\"uuid\":\"31910c1b-dc8f-413d-90a5-e9cec95ee5ee\",\"text\":\"Skyrocketed\"},{\"uuid\":\"9d03e267-efe2-46a9-9bdf-3c2da7ef8084\",\"text\":\"Moderately increased\"},{\"uuid\":\"c5d43a15-0c68-4d48-89de-4d9a118cca43\",\"text\":\"No change\"},{\"uuid\":\"83cf0d6d-520b-40ae-abb7-0b03e0e2a904\",\"text\":\"Decreased\"}]}',5,'2025-08-26 15:02:07','2025-08-26 15:02:07'),(71,'radio','How did ChatGPT change education?',NULL,'{\"options\":[{\"uuid\":\"cc7abf82-787e-4b9c-a887-386652bd4280\",\"text\":\"Helped learning\"},{\"uuid\":\"d505c2a5-6ca2-473f-bcf0-f0eac0794ce9\",\"text\":\"Increased cheating\"},{\"uuid\":\"65ab65e5-cc65-4311-9c19-e5cccf0fc0bc\",\"text\":\"Personalized tutoring\"},{\"uuid\":\"c099bbda-132b-401c-9f5f-c7db5437698e\",\"text\":\"No effect\"}]}',6,'2025-08-26 15:07:18','2025-08-26 15:07:18'),(72,'radio','What ethical concern is most pressing?',NULL,'{\"options\":[{\"uuid\":\"00c9ad84-e644-4cef-8455-0db64d28f7c0\",\"text\":\"Bias in algorithms\"},{\"uuid\":\"7a9f66e1-4191-4f4d-8723-184374551d0c\",\"text\":\"Privacy invasion\"},{\"uuid\":\"934a1453-5d5b-41e3-9892-4376f081e66b\",\"text\":\"Job loss\"},{\"uuid\":\"466fb097-b99a-4de5-b2c0-c0f3746fa3c6\",\"text\":\"Autonomous weapons\"}]}',6,'2025-08-26 15:07:18','2025-08-26 15:07:18'),(73,'radio','Is AI regulation necessary?',NULL,'{\"options\":[{\"uuid\":\"2cd8bd64-119a-4ad3-af24-2e37718fdaec\",\"text\":\"Urgently\"},{\"uuid\":\"df2b004b-66ae-42e4-96e0-3fc2c73962cb\",\"text\":\"Eventually\"},{\"uuid\":\"7e093664-3238-45f2-b1f7-37c7793490b4\",\"text\":\"Not needed\"},{\"uuid\":\"1f14d7df-b17b-4863-8278-055c103af4f8\",\"text\":\"Overregulation risks\"}]}',6,'2025-08-26 15:07:18','2025-08-26 15:07:18'),(74,'radio','How has AI impacted jobs?',NULL,'{\"options\":[{\"uuid\":\"f6f1914d-a869-4643-8906-88363d8f05b5\",\"text\":\"Created new ones\"},{\"uuid\":\"138a1ce3-9a01-447b-93ab-aa7cbf88c368\",\"text\":\"Displaced workers\"},{\"uuid\":\"81c1767c-4c85-4692-86a1-90172c095d3a\",\"text\":\"No change\"},{\"uuid\":\"527c86f1-cf96-495e-9c7f-04027eb05a82\",\"text\":\"Improved skills\"}]}',6,'2025-08-26 15:07:18','2025-08-26 15:07:18'),(75,'radio','What is AI\'s biggest benefit?',NULL,'{\"options\":[{\"uuid\":\"50bb4b1a-d20d-4bed-b8ba-53b1a6658b80\",\"text\":\"Automation\"},{\"uuid\":\"4aed59b7-7d2b-4d14-93f2-e4bc06269862\",\"text\":\"Efficiency\"},{\"uuid\":\"dd87f9a7-b9cc-4d74-baa8-070cd10a9f89\",\"text\":\"Innovation\"},{\"uuid\":\"0267e14c-8264-449d-add3-28600c106a84\",\"text\":\"Entertainment\"}]}',6,'2025-08-26 15:07:18','2025-08-26 15:07:18'),(76,'radio','How did athletes perform under pressure?',NULL,'{\"options\":[{\"uuid\":\"604fba98-097c-43af-8465-548a6b43d533\",\"text\":\"Excellently\"},{\"uuid\":\"7198fada-9350-418d-bf3e-c0bb6af8ce14\",\"text\":\"Averagely\"},{\"uuid\":\"08455036-0dc0-434d-856e-54dfd6c463ae\",\"text\":\"Poorly\"},{\"uuid\":\"c4dec9ed-fcd5-4adf-a1de-fba1b91c7a03\",\"text\":\"Varied\"}]}',7,'2025-08-26 15:13:56','2025-08-26 15:13:56'),(77,'radio','What controversy arose?',NULL,'{\"options\":[{\"uuid\":\"a658d33a-b83b-44d1-accc-e4ac7d31cc06\",\"text\":\"Doping scandals\"},{\"uuid\":\"1f284919-e2cb-4204-84aa-6803e04d1709\",\"text\":\"Gender issues\"},{\"uuid\":\"532c6ebf-7b24-4c70-a11e-efd045a10986\",\"text\":\"Political boycotts\"},{\"uuid\":\"3d7dbda3-905b-4ff9-9c40-44c41754c82e\",\"text\":\"None\"}]}',7,'2025-08-26 15:13:56','2025-08-26 15:13:56'),(78,'radio','Were sustainability efforts successful?',NULL,'{\"options\":[{\"uuid\":\"7f97d59e-eff6-48f3-b354-4c4148408a56\",\"text\":\"Yes, eco-friendly\"},{\"uuid\":\"1f80b8fd-0aa5-4509-aac4-df045d2e6bea\",\"text\":\"Partially\"},{\"uuid\":\"dd64f155-22f6-4de7-9104-acc115a6e54b\",\"text\":\"No\"},{\"uuid\":\"19bd4fca-d0ab-40c8-9ef4-ec2d22e31168\",\"text\":\"Hypocritical\"}]}',7,'2025-08-26 15:13:56','2025-08-26 15:13:56'),(79,'radio','How did hosting affect France\'s economy?',NULL,'{\"options\":[{\"uuid\":\"50ad6115-9d87-4e31-b112-6827ec8c7c01\",\"text\":\"Boosted tourism\"},{\"uuid\":\"76be2bca-28bf-4fca-9426-29ed71e3d072\",\"text\":\"Increased spending\"},{\"uuid\":\"5c4ab40e-5753-4673-b01e-4b9b110f9b8a\",\"text\":\"Minimal impact\"},{\"uuid\":\"0db58dbc-4309-4c03-8c04-95cb1d85cf09\",\"text\":\"Negative debt\"}]}',7,'2025-08-26 15:13:56','2025-08-26 15:13:56'),(80,'radio','What was the most memorable event?',NULL,'{\"options\":[{\"uuid\":\"f4595583-7324-409a-a971-79bbab2ae6ff\",\"text\":\"Opening ceremony\"},{\"uuid\":\"38c82d1a-f445-47ff-9fb2-8a30bc46d0fd\",\"text\":\"Track and field\"},{\"uuid\":\"f1886865-81af-46b4-9f81-091a4b388c9f\",\"text\":\"Swimming\"},{\"uuid\":\"210d2e8a-ef79-4eba-a726-d9ced2ea85bb\",\"text\":\"Gymnastics\"}]}',7,'2025-08-26 15:13:56','2025-08-26 15:13:56'),(81,'radio','How did it impact corporate policies?',NULL,'{\"options\":[{\"uuid\":\"1aac781b-5660-48bf-a856-7d74ae069043\",\"text\":\"Diversity initiatives\"},{\"uuid\":\"d3c5c13e-faf3-48de-9307-22b1f706bff9\",\"text\":\"Inclusivity training\"},{\"uuid\":\"17889607-5f52-4d31-929f-35515f72c3b3\",\"text\":\"Marketing shifts\"},{\"uuid\":\"a84af4a9-4620-4971-836a-393f11119083\",\"text\":\"Superficial\"}]}',8,'2025-08-26 15:25:34','2025-08-26 15:25:34'),(82,'radio','Has policing changed since?',NULL,'{\"options\":[{\"uuid\":\"ba15a2e8-18cb-46a6-927c-0057feeff2a7\",\"text\":\"More accountability\"},{\"uuid\":\"4fe56dc8-0449-47e6-9087-72e7a34ace48\",\"text\":\"Body cameras\"},{\"uuid\":\"660aa2c2-937c-44ac-99a4-5ef8e3810c74\",\"text\":\"Defunding debates\"},{\"uuid\":\"e3f04fd3-5b9c-4868-b3b6-c0f200bd4769\",\"text\":\"No change\"}]}',8,'2025-08-26 15:25:34','2025-08-26 15:25:34'),(83,'radio','What role did celebrities play?',NULL,'{\"options\":[{\"uuid\":\"f1fc55e2-75d9-4533-acdc-c4aaf7df6a9f\",\"text\":\"Amplified message\"},{\"uuid\":\"c5d9b3cb-b7f9-49b0-a4bc-cd4fdde66dca\",\"text\":\"Donated funds\"},{\"uuid\":\"e17842a1-d477-4ea9-b4cb-39a039ee0bfd\",\"text\":\"Performed activism\"},{\"uuid\":\"700ec417-390a-4cf1-8092-8e0cbe09cd24\",\"text\":\"Irrelevant\"}]}',8,'2025-08-26 15:25:34','2025-08-26 15:25:34'),(84,'radio','How effective were the protests?',NULL,'{\"options\":[{\"uuid\":\"0ea8ba2c-3eae-4f9f-897a-2cc67c86a15b\",\"text\":\"Led to reforms\"},{\"uuid\":\"c35b6534-0c0e-4647-abe3-e1ab0e6da577\",\"text\":\"Raised awareness\"},{\"uuid\":\"925f2838-a69d-4566-ba2d-fc701d4874cf\",\"text\":\"Minimal change\"},{\"uuid\":\"6fdb49ca-ca1b-4b8f-818c-b0b5175c9109\",\"text\":\"Backlash\"}]}',8,'2025-08-26 15:25:34','2025-08-26 15:25:34'),(85,'radio','What sparked the global protests?',NULL,'{\"options\":[{\"uuid\":\"c646668d-9ca3-4f26-8c91-f7ce119efa18\",\"text\":\"Police brutality\"},{\"uuid\":\"22b6a724-7410-4b03-867c-ad11afd57d36\",\"text\":\"Racial injustice\"},{\"uuid\":\"e370b2ea-f436-41e1-b4dd-a646fea9a212\",\"text\":\"Systemic racism\"},{\"uuid\":\"3c71c459-1e23-48ef-80eb-9399b61d5e49\",\"text\":\"All\"}]}',8,'2025-08-26 15:25:34','2025-08-26 15:25:34'),(86,'radio','How do disasters affect economies?',NULL,'{\"options\":[{\"uuid\":\"2e2f067d-d9ea-4439-bfdd-800aaa69957e\",\"text\":\"Reconstruction costs\"},{\"uuid\":\"a7b71dc3-044d-47a4-a9bc-a1b1e31f7c92\",\"text\":\"Tourism decline\"},{\"uuid\":\"718352dc-71a5-4b86-a3a4-2e35612306c7\",\"text\":\"Insurance claims\"},{\"uuid\":\"87ebf311-22c5-4a4d-90ba-b41ff763247f\",\"text\":\"Growth in aid\"}]}',9,'2025-08-26 15:33:17','2025-08-26 15:33:17'),(87,'radio','What was the impact of the 2011 Japan tsunami?',NULL,'{\"options\":[{\"uuid\":\"e42d9c60-0429-4836-9874-03ac086c6376\",\"text\":\"Nuclear meltdown\"},{\"uuid\":\"25135730-7f0d-4283-9f62-5018d8d591d9\",\"text\":\"Massive loss of life\"},{\"uuid\":\"636ad5c2-8cfe-458c-8227-ba1d8e16d751\",\"text\":\"Rebuilding efforts\"},{\"uuid\":\"522baf45-d1b7-46c3-9bfd-aba8e5e32ee1\",\"text\":\"All\"}]}',9,'2025-08-26 15:33:17','2025-08-26 15:33:17'),(88,'radio','How effective is early warning systems?',NULL,'{\"options\":[{\"uuid\":\"506253d9-5eb7-4ebb-a714-4b683e5ab471\",\"text\":\"Life-saving\"},{\"uuid\":\"86f357bd-36a1-485f-8b13-ee3b876f6137\",\"text\":\"Limited\"},{\"uuid\":\"d2a78a06-4c9e-4068-b6c4-2d01e1fb06f0\",\"text\":\"Non-existent in areas\"},{\"uuid\":\"7c1f5a01-22eb-477c-81dd-36e6c933605c\",\"text\":\"Overrated\"}]}',9,'2025-08-26 15:33:17','2025-08-26 15:33:17'),(89,'radio','What causes most earthquake damage?',NULL,'{\"options\":[{\"uuid\":\"ba5b677f-e661-4a0a-a0a0-f41da527eb16\",\"text\":\"Building codes\"},{\"uuid\":\"3072fdd1-a9b7-42e3-b6c8-763ff539de6e\",\"text\":\"Population density\"},{\"uuid\":\"0f1226ee-a4cc-42fb-9a14-80275dd5529f\",\"text\":\"Aftershocks\"},{\"uuid\":\"94934f4c-4fe8-4f72-be58-037c26361034\",\"text\":\"All\"}]}',9,'2025-08-26 15:33:17','2025-08-26 15:33:17'),(90,'radio','Is climate change worsening disasters?',NULL,'{\"options\":[{\"uuid\":\"53a96c93-5a8c-488f-b98e-6ced20e60508\",\"text\":\"Yes\"},{\"uuid\":\"16125b3f-071f-4550-b358-7d5836fa756e\",\"text\":\"No\"},{\"uuid\":\"260f0265-b8a5-48f4-9e6e-43066b6e7dd1\",\"text\":\"Partially\"},{\"uuid\":\"3523cf91-9ff7-49f6-9cc2-8d740383fb7e\",\"text\":\"Unrelated\"}]}',9,'2025-08-26 15:34:04','2025-08-26 15:34:04');
/*!40000 ALTER TABLE `survey_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveys`
--

DROP TABLE IF EXISTS `surveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surveys` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expire_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveys`
--

LOCK TABLES `surveys` WRITE;
/*!40000 ALTER TABLE `surveys` DISABLE KEYS */;
INSERT INTO `surveys` VALUES (1,1,'images/zKm0dyFchlZrXqpS.jpeg','Impact of the COVID-19 Pandemic','impact-of-the-covid-19-pandemic',1,'This fake survey explores public opinions on the global COVID-19 outbreak that began in 2019.','2025-08-26 13:07:10','2025-08-26 13:32:42','2025-08-28 18:00:00'),(2,1,'images/AJbVeys7djFSg7sM.jpeg','The 2020 US Presidential Election','the-2020-us-presidential-election',1,'This fake survey gauges views on the election between Joe Biden and Donald Trump.','2025-08-26 13:36:02','2025-08-26 13:54:05','2025-08-28 18:00:00'),(3,1,'images/XGxns3pY0ZWplNAQ.jpeg','Climate Change and Extreme Weather Events','climate-change-and-extreme-weather-events',1,'This fake survey focuses on events like wildfires and hurricanes in recent years.','2025-08-26 14:01:36','2025-08-26 14:23:28','2025-08-28 18:00:00'),(4,1,'images/585BNIAvQTHEdPIP.jpeg','Advancements in Space Exploration','advancements-in-space-exploration',1,'This fake survey covers events like NASA\'s Artemis program and SpaceX missions.','2025-08-26 14:27:48','2025-08-26 14:47:48','2025-08-28 18:00:00'),(5,1,'images/9HEpkRXmpXR8pB4n.jpeg','The Russia-Ukraine Conflict','the-russia-ukraine-conflict',1,'This fake survey examines the ongoing war that started in 2022.','2025-08-26 14:53:52','2025-08-26 15:02:06','2025-08-28 18:00:00'),(6,1,'images/D6N2vPn4mSWv7oBv.jpeg','Rise of Artificial Intelligence','rise-of-artificial-intelligence',1,'This fake survey looks at AI developments like ChatGPT\'s release in 2022.','2025-08-26 15:07:18','2025-08-26 15:07:18','2025-08-28 18:00:00'),(7,1,'images/jDdCHTKGcnNPXEwU.jpeg','The 2024 Paris Olympic Games','the-2024-paris-olympic-games',1,'This fake survey reflects on the summer Olympics held in Paris.','2025-08-26 15:13:56','2025-08-26 15:13:56','2025-08-28 18:00:00'),(8,1,'images/lsuRIbBuvKYLBVug.jpeg','Black Lives Matter Movement','black-lives-matter-movement',1,'This fake survey covers the social movement peaking in 2020 after George Floyd\'s death.','2025-08-26 15:25:34','2025-08-26 15:25:34','2025-08-29 18:00:00'),(9,1,'images/R0h6weUtlrbg1J6x.jpeg','Major Natural Disasters (e.g., Earthquakes and Tsunamis)','major-natural-disasters-eg-earthquakes-and-tsunamis',1,'This fake survey discusses events like the 2023 Turkey-Syria earthquake.','2025-08-26 15:30:14','2025-08-26 15:34:04','2025-08-28 18:00:00');
/*!40000 ALTER TABLE `surveys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'John Doe','admin@example.com','2025-08-26 12:56:57','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','LB58ci1vRj','2025-08-26 12:56:57','2025-08-26 12:56:57'),(2,'Shelby Beasley','ryduba@mailinator.com',NULL,'$2y$10$yTtLXgtXeLmsxh.9rM15W.lZvdmNoqNfTx7bEGz6dCVvDANnmWiiW',NULL,'2025-08-26 15:39:48','2025-08-26 15:39:48'),(3,'Beck Klein','femocizir@mailinator.com',NULL,'$2y$10$B69UzhW/lilHNtRI8NUB..Z9I31DLBtEaxcSSyakJwOEPRTDbiQK2',NULL,'2025-08-26 15:41:42','2025-08-26 15:41:42');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-27  3:44:29
