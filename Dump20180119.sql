-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: kinorating
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actors` (
  `act_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'идентификатор актера',
  `mov_id` int(11) NOT NULL,
  `act_age` int(11) DEFAULT '0' COMMENT 'возраст',
  PRIMARY KEY (`act_id`,`mov_id`),
  KEY `fk_actors_movies1_idx` (`mov_id`),
  CONSTRAINT `fk_actors_movies1` FOREIGN KEY (`mov_id`) REFERENCES `movies` (`mov_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES (1,1,26),(2,1,36),(3,2,50),(4,2,35),(5,3,56),(6,3,40),(7,4,37),(7,6,37),(7,7,37),(8,5,41),(9,8,58),(10,9,57),(10,10,57),(11,11,31);
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actors_translate`
--

DROP TABLE IF EXISTS `actors_translate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actors_translate` (
  `act_id` int(11) NOT NULL COMMENT 'идентификатор актера',
  `lang_short_name` char(2) NOT NULL COMMENT 'идентификатор языка',
  `act_first_name` varchar(40) NOT NULL COMMENT 'имя актера',
  `act_second_name` varchar(40) DEFAULT NULL COMMENT 'фамилия актера',
  PRIMARY KEY (`act_id`,`lang_short_name`),
  KEY `fk_actors_ru_languages1_idx` (`lang_short_name`),
  CONSTRAINT `fk_actors_ru_actors1` FOREIGN KEY (`act_id`) REFERENCES `actors` (`act_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_actors_ru_languages1` FOREIGN KEY (`lang_short_name`) REFERENCES `languages` (`short_name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors_translate`
--

LOCK TABLES `actors_translate` WRITE;
/*!40000 ALTER TABLE `actors_translate` DISABLE KEYS */;
INSERT INTO `actors_translate` VALUES (1,'en','Marine','Vacth'),(1,'ru','Марина','Вакт'),(2,'en','Jérémie','Renier'),(2,'ru','Жереми','Ренье'),(3,'en','Claes','Bang'),(3,'ru','Клас','Банг'),(4,'en','Elisabeth','Moss'),(4,'ru','Элизабет','Мосс'),(5,'en','Ville','Virtanen'),(5,'ru','Вилле','Виртанен'),(6,'en','Dome','Karukoski'),(6,'ru','Доме','Карукоски'),(7,'en','Ryan','Gosling'),(7,'ru','Райан','Гослинг'),(8,'en','Colin','Farrell'),(8,'ru','Колин','Фаррелл'),(9,'en','Kevin','Spacey'),(9,'ru','Кевин','Спейси'),(10,'en','Tilda','Swinton'),(10,'ru','Тильда','Суинтон'),(11,'en','Robert','Pattinson'),(11,'ru','Роберт','Паттинсон');
/*!40000 ALTER TABLE `actors_translate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `short_name` char(2) NOT NULL COMMENT 'обозначение языка(2 символа)',
  `full_name` varchar(15) NOT NULL COMMENT 'название языка',
  PRIMARY KEY (`short_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES ('en','english'),('ru','russian');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `mov_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'идентификатор фильма',
  `mov_release_year` int(11) DEFAULT '0' COMMENT 'год выхода фильма',
  `mov_length` int(11) NOT NULL COMMENT 'продолжительность в минутах',
  `mov_rating` double DEFAULT '0' COMMENT 'пользовательский рейтинг фильма на сайте',
  `mov_addition_date` date NOT NULL,
  `mov_mark_amount` int(11) DEFAULT '0',
  PRIMARY KEY (`mov_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,2017,110,5,'2017-12-12',3),(2,2017,152,6.5,'2017-12-14',2),(3,2017,100,7.75,'2017-12-14',4),(4,2015,129,8.25,'2017-12-14',4),(5,2017,121,NULL,'2017-12-14',0),(6,2011,100,NULL,'2017-12-14',0),(7,2012,140,8,'2017-12-14',1),(8,1999,122,NULL,'2017-12-14',0),(9,2013,118,NULL,'2017-12-14',0),(10,2017,120,NULL,'2017-12-14',0),(11,2017,101,6,'2017-12-14',1),(12,2017,116,NULL,'2017-12-22',0),(13,1976,113,NULL,'2017-12-22',0),(14,213,4554,NULL,'2017-12-24',0);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_translate`
--

DROP TABLE IF EXISTS `movies_translate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_translate` (
  `mov_id` int(11) NOT NULL COMMENT 'идентификатор фильма',
  `lang_short_name` char(2) NOT NULL COMMENT 'идентификатор языка, на котором информация представлена в таблице',
  `mov_title` varchar(50) NOT NULL COMMENT 'название фильма',
  `mov_director` varchar(50) NOT NULL COMMENT 'режиссер',
  `mov_genre` varchar(50) DEFAULT NULL COMMENT 'жанр',
  PRIMARY KEY (`mov_id`,`lang_short_name`),
  KEY `fk_movies_ru_languages1_idx` (`lang_short_name`),
  CONSTRAINT `fk_movies_en_movies10` FOREIGN KEY (`mov_id`) REFERENCES `movies` (`mov_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_movies_ru_languages1` FOREIGN KEY (`lang_short_name`) REFERENCES `languages` (`short_name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_translate`
--

LOCK TABLES `movies_translate` WRITE;
/*!40000 ALTER TABLE `movies_translate` DISABLE KEYS */;
INSERT INTO `movies_translate` VALUES (1,'en','L\'Amant double','François Ozon','thriller, drama, romance'),(1,'ru','Двуличный любовник','Франсуа Озон','триллер, драма, мелодрама'),(2,'en','The Square','Ruben Östlund','drama, comedy'),(2,'ru','Квадрат','Рубен Эстлунд','драма, комедия'),(3,'en','Toivon tuolla puolen','Aki Kaurismäki','drama, comedy'),(3,'ru','По ту сторону надежды','Аки Каурисмяки','драма, комедия'),(4,'en','Song to Song','Terrence Malick','drama, melodrama'),(4,'ru','Песня за песней','Терренс Малик','драма, мелодрама'),(5,'en','The Killing of a Sacred Deer','Yorgos Lanthimos','horror, thriller, drama, detective'),(5,'ru','Убийство священного оленя','Йоргос Лантимос','ужасы, триллер, драма, детектив'),(6,'en','Drive','Nicolas Winding Refn','drama, criminal'),(6,'ru','Драйв','Николас Виндинг Рефн','драма, криминал'),(7,'en','The Place Beyond the Pines','Derek Cianfrance','thriller, drama, criminal'),(7,'ru','Место под соснами','Дерек Сиенфрэнс','триллер, драма, криминал'),(8,'en','American Beauty','Sam Mendes','drama, melodrama'),(8,'ru','Красота по-американски','Сэм Мендес','драма, мелодрама'),(9,'en','Only Lovers Left Alive','Jim Jarmusch','fantasy, thriller, drama'),(9,'ru','Выживут только любовники','Джим Джармуш','фэнтези, триллер, драма'),(10,'en','Okja','Bong Joon-ho','fantasy, action, drama, adventure'),(10,'ru','Окча','Пон Джун-хо','фантастика, боевик, драма, приключения'),(11,'en','Good Time','Benny Safdie','thriller, drama, criminal'),(11,'ru','Хорошее время','Бен Сэфди','триллер, драма, криминал'),(12,'ru','Аритмия','Борис Хлебников','драма'),(13,'ru','Таксист','Мартин Скорсезе','триллер, драма, криминал');
/*!40000 ALTER TABLE `movies_translate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `rev_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'идентификатор отзыва',
  `us_id` int(11) NOT NULL COMMENT 'идентификатор пользователя, добавившего отзыв',
  `mov_id` int(11) NOT NULL COMMENT 'идентификатор фильма, на который оставили отзыв',
  `rev_review` text NOT NULL COMMENT 'текст отзыва',
  `rev_date` date NOT NULL COMMENT 'дата добавления отзыва',
  PRIMARY KEY (`rev_id`,`us_id`,`mov_id`),
  KEY `fk_reviews_users1_idx` (`us_id`),
  KEY `fk_reviews_movies1_idx` (`mov_id`),
  CONSTRAINT `fk_reviews_movies1` FOREIGN KEY (`mov_id`) REFERENCES `movies` (`mov_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reviews_users1` FOREIGN KEY (`us_id`) REFERENCES `users` (`us_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,3,1,'test text1','2017-12-14'),(2,4,2,'test text2','2017-12-15'),(3,5,3,'test text3','2017-12-16'),(4,6,4,'test text4','2017-12-14'),(5,3,5,'test text5','2017-12-15'),(6,4,6,'test text6','2017-12-18'),(7,5,7,'test text7','2017-12-17'),(8,6,8,'test text8','2017-12-14');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_marks`
--

DROP TABLE IF EXISTS `user_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_marks` (
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `user_mark` int(11) DEFAULT '0',
  PRIMARY KEY (`user_id`,`movie_id`),
  KEY `fk_user_marks_movies1_idx` (`movie_id`),
  CONSTRAINT `fk_user_marks_movies1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`mov_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_marks_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`us_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_marks`
--

LOCK TABLES `user_marks` WRITE;
/*!40000 ALTER TABLE `user_marks` DISABLE KEYS */;
INSERT INTO `user_marks` VALUES (1,1,5),(1,3,9),(1,7,8),(1,11,6),(3,1,5),(3,2,7),(3,3,7),(3,4,9),(4,1,5),(4,2,6),(4,3,8),(4,4,8),(5,3,7),(5,4,8),(6,4,8);
/*!40000 ALTER TABLE `user_marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `us_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'идентификатор пользователя',
  `us_login` varchar(40) NOT NULL COMMENT 'логин',
  `us_password` varchar(32) NOT NULL COMMENT 'пароль',
  `us_email` varchar(40) NOT NULL COMMENT 'эл. почта',
  `us_role` varchar(10) NOT NULL DEFAULT 'user' COMMENT 'роль: администратор или пользователь',
  `us_status` varchar(10) NOT NULL DEFAULT 'allowed' COMMENT 'статус пользователя(забанен или нет)',
  `us_rating` double DEFAULT '0' COMMENT 'рейтинг пользователя',
  `us_registration_date` date DEFAULT NULL COMMENT 'дата регистрации пользователя',
  PRIMARY KEY (`us_id`),
  UNIQUE KEY `us_login_UNIQUE` (`us_login`),
  UNIQUE KEY `us_email_UNIQUE` (`us_email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','2e6e5a2b38ba905790605c9b101497bc','admin','admin','allowed',94,'2017-12-13'),(2,'temp_user','4ea529d477bee44cd3bff6a622c0e6c3','user@user.com','USER','ALLOWED',0,'2017-12-15'),(3,'user01','b75705d7e35e7014521a46b532236ec3','user01@user.com','USER','ALLOWED',0,'2017-12-18'),(4,'user02','8bd108c8a01a892d129c52484ef97a0d','user02@user.com','USER','ALLOWED',0,'2017-12-18'),(5,'user03','a7d39043afa25be5cc235d943b64917a','user03@user.com','USER','ALLOWED',0,'2017-12-18'),(6,'user04','a7d39043afa25be5cc235d943b64917a','user04@user.com','USER','ALLOWED',0,'2017-12-18'),(7,'user05','fe510823ea9f953fbc758c714247a63b','user05@user.com','USER','BANNED',0,'2017-12-20'),(8,'user06','29a4b79bd438555382de11012a82136e','user06@user.com','USER','ALLOWED',0,'2017-12-20'),(9,'user07','ac805b8ff22f71374ceac37684235925','user07@user.com','USER','ALLOWED',0,'2017-12-20'),(10,'user08','e0141ba2f1770f9b6d40a497fbe4e25b','user08@user.com','USER','ALLOWED',0,'2017-12-20');
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

-- Dump completed on 2018-01-19 21:39:44
