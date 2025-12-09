/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 8.0.44 : Database - licitapp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`licitapp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `licitapp`;

/*Table structure for table `accounts_alertconfig` */

DROP TABLE IF EXISTS `accounts_alertconfig`;

CREATE TABLE `accounts_alertconfig` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `trigger` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `threshold_minutes` int unsigned NOT NULL,
  `channel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `recipients` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `milestone` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tender_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_alertconfig_tender_id_9cbbc940_fk_accounts_tender_id` (`tender_id`),
  CONSTRAINT `accounts_alertconfig_tender_id_9cbbc940_fk_accounts_tender_id` FOREIGN KEY (`tender_id`) REFERENCES `accounts_tender` (`id`),
  CONSTRAINT `accounts_alertconfig_chk_1` CHECK ((`threshold_minutes` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `accounts_alertconfig` */

insert  into `accounts_alertconfig`(`id`,`name`,`trigger`,`threshold_minutes`,`channel`,`active`,`recipients`,`notes`,`created_at`,`updated_at`,`milestone`,`tender_id`) values 
(1,'BIg data','doc',60,'slack',1,'','jhjhjhjhj','2025-11-18 01:28:23.567583','2025-11-18 01:28:23.567598','',2),
(2,'hola','doc',60,'email',1,'asdasd@hola-com,','esta malo xd','2025-12-09 02:07:36.296585','2025-12-09 02:07:36.296617','',14);

/*Table structure for table `accounts_alertlog` */

DROP TABLE IF EXISTS `accounts_alertlog`;

CREATE TABLE `accounts_alertlog` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` json DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `config_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_alertlog_config_id_844eef0b_fk_accounts_alertconfig_id` (`config_id`),
  CONSTRAINT `accounts_alertlog_config_id_844eef0b_fk_accounts_alertconfig_id` FOREIGN KEY (`config_id`) REFERENCES `accounts_alertconfig` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `accounts_alertlog` */

insert  into `accounts_alertlog`(`id`,`level`,`message`,`metadata`,`created_at`,`config_id`) values 
(1,'info','Proveedor envio propuesta para 546546','{\"supplier\": 11, \"tender_id\": 3, \"proposal_id\": 2}','2025-11-25 20:10:10.337237',NULL),
(2,'info','Proveedor envio propuesta para 1234567','{\"supplier\": 11, \"tender_id\": 4, \"proposal_id\": 3}','2025-11-25 23:39:04.772736',NULL),
(3,'info','Proveedor envio propuesta para 1234567','{\"supplier\": 11, \"tender_id\": 4, \"proposal_id\": 3}','2025-11-27 19:33:53.316987',NULL),
(4,'info','Proveedor envio propuesta para 1234567','{\"supplier\": 11, \"tender_id\": 4, \"proposal_id\": 3}','2025-11-27 19:34:27.462834',NULL),
(5,'info','Proveedor envio propuesta para 1234567','{\"supplier\": 11, \"tender_id\": 4, \"proposal_id\": 3}','2025-11-27 19:34:49.526475',NULL),
(6,'info','Proveedor envio propuesta para 1234567','{\"supplier\": 11, \"tender_id\": 4, \"proposal_id\": 3}','2025-11-27 19:34:49.621852',NULL),
(7,'info','Proveedor envio propuesta para 1234567','{\"supplier\": 11, \"tender_id\": 4, \"proposal_id\": 3}','2025-11-27 19:47:45.986420',NULL),
(8,'info','Proveedor envio propuesta para 1234567','{\"supplier\": 11, \"tender_id\": 4, \"proposal_id\": 3}','2025-11-27 19:47:46.036785',NULL),
(9,'info','Proveedor envio propuesta para 1361','{\"supplier\": 11, \"tender_id\": 7, \"proposal_id\": 4}','2025-11-28 17:58:26.640264',NULL),
(10,'info','Tu propuesta para 1361 fue Rechazada','{\"tender_id\": 7, \"proposal_id\": 4, \"supplier_id\": 11}','2025-11-28 18:23:04.603679',NULL),
(11,'info','Tu propuesta para 1361 fue Aceptada','{\"tender_id\": 7, \"proposal_id\": 4, \"supplier_id\": 11}','2025-12-01 12:03:27.879723',NULL),
(12,'info','Tu propuesta para 1361 fue Aceptada','{\"tender_id\": 7, \"proposal_id\": 4, \"supplier_id\": 11}','2025-12-01 12:28:38.887085',NULL),
(13,'info','Proveedor envio propuesta para 1234','{\"supplier\": 19, \"tender_id\": 1, \"proposal_id\": 5}','2025-12-07 01:15:48.152913',NULL),
(14,'info','Proveedor envio propuesta para LIC-2025-001','{\"supplier\": 2, \"tender_id\": 10, \"proposal_id\": 6}','2025-12-07 01:57:54.764219',NULL),
(15,'info','Proveedor envio propuesta para LIC-2025-001','{\"supplier\": 2, \"tender_id\": 10, \"proposal_id\": 6}','2025-12-07 01:58:10.267067',NULL),
(16,'info','Proveedor envio propuesta para lic 27','{\"supplier\": 2, \"tender_id\": 12, \"proposal_id\": 7}','2025-12-08 17:05:30.187181',NULL),
(17,'info','Proveedor envió propuesta para lic 28','{\"supplier\": 2, \"tender_id\": 13, \"proposal_id\": 8}','2025-12-08 19:24:40.920627',NULL),
(18,'info','Proveedor enviÃ³ propuesta para 6655546','{\"supplier\": 17, \"tender_id\": 14, \"proposal_id\": 9}','2025-12-09 01:39:34.112139',NULL),
(19,'info','Proveedor enviÃ³ propuesta para 6655546','{\"supplier\": 17, \"tender_id\": 14, \"proposal_id\": 9}','2025-12-09 01:39:35.993752',NULL),
(20,'info','Proveedor enviÃ³ propuesta para 6655546','{\"supplier\": 17, \"tender_id\": 14, \"proposal_id\": 9}','2025-12-09 01:39:39.146204',NULL),
(21,'info','Proveedor enviÃ³ propuesta para 6655546','{\"supplier\": 17, \"tender_id\": 14, \"proposal_id\": 9}','2025-12-09 01:39:41.752311',NULL),
(22,'info','Proveedor enviÃ³ propuesta para 6655546','{\"supplier\": 17, \"tender_id\": 14, \"proposal_id\": 9}','2025-12-09 01:39:46.661971',NULL);

/*Table structure for table `accounts_auditlog` */

DROP TABLE IF EXISTS `accounts_auditlog`;

CREATE TABLE `accounts_auditlog` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `actor` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` json DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `accounts_auditlog` */

insert  into `accounts_auditlog`(`id`,`actor`,`action`,`message`,`metadata`,`created_at`) values 
(1,'admin','admin_view','abrió el panel administrador.','{}','2025-11-14 01:16:36.553979'),
(2,'admin','admin_view','abrió el panel administrador.','{}','2025-11-14 01:17:33.033342'),
(3,'KIROS PIXULA','admin_denied','intentó acceder al panel administrador sin permisos.','{}','2025-11-14 01:19:11.462774'),
(4,'admin','logout','cerró sesión.','{}','2025-11-15 16:35:09.670042'),
(5,'admin','login','inició sesión.','{}','2025-11-15 16:37:30.385805'),
(6,'admin','admin_view','abrió el panel administrador.','{}','2025-11-15 17:12:13.308195'),
(7,'admin','admin_view','abrió el panel administrador.','{}','2025-11-15 17:12:20.688950'),
(8,'admin','admin_view','abrió el panel administrador.','{}','2025-11-15 17:37:30.205016'),
(9,'admin','admin_view','abrió el panel administrador.','{}','2025-11-15 17:39:55.196976'),
(10,'admin','logout','cerró sesión.','{}','2025-11-15 18:28:15.680088'),
(11,'ASD ASD','password_reset_requested','solicitó recuperación de contraseña.','{}','2025-11-15 18:28:27.576422'),
(12,'hola hola','registro','creó una nueva cuenta.','{\"run\": \"20558616-4\"}','2025-11-15 18:29:28.242697'),
(13,'hola hola','logout','cerró sesión.','{}','2025-11-15 18:29:33.208316'),
(14,'hola hola','password_reset_requested','solicitó recuperación de contraseña.','{}','2025-11-15 18:29:38.519565'),
(15,'hola hola','password_reset_requested','solicitó recuperación de contraseña.','{\"email_sent\": false}','2025-11-15 18:37:57.279913'),
(16,'hola hola','password_reset_requested','solicitó recuperación de contraseña.','{\"email_sent\": false}','2025-11-15 18:39:18.706556'),
(17,'hola hola','password_reset_requested','solicitó recuperación de contraseña.','{\"email_sent\": false}','2025-11-15 19:10:27.014162'),
(18,'hola hola','password_reset_requested','solicitó recuperación de contraseña.','{\"email_sent\": false}','2025-11-15 19:10:27.325414'),
(19,'hola hola','password_reset_requested','solicitó recuperación de contraseña.','{\"email_sent\": false}','2025-11-15 19:15:42.110530'),
(20,'hola hola','password_reset_requested','solicitó recuperación de contraseña.','{\"email_sent\": false}','2025-11-15 19:32:17.189219'),
(21,'hola hola','password_reset_requested','solicitó recuperación de contraseña.','{\"email_sent\": false}','2025-11-15 19:33:03.426527'),
(22,'hola hola','password_reset_requested','solicitó recuperación de contraseña.','{\"email_sent\": false}','2025-11-15 19:33:35.290800'),
(23,'hola hola','password_reset_requested','solicitó recuperación de contraseña.','{\"email_sent\": false}','2025-11-15 19:33:38.764594'),
(24,'hola hola','password_reset_requested','solicitó recuperación de contraseña.','{\"email_sent\": false}','2025-11-15 19:33:49.926726'),
(25,'hola hola','password_reset_requested','solicitó recuperación de contraseña.','{\"email_sent\": false}','2025-11-15 19:33:59.846414'),
(26,'hola hola','password_reset_requested','solicitó recuperación de contraseña.','{\"email_sent\": false}','2025-11-15 19:39:31.416441'),
(27,'hola hola','password_reset_requested','solicitó recuperación de contraseña.','{\"email_sent\": false}','2025-11-15 19:39:45.136159'),
(28,'admin','login','inició sesión.','{}','2025-11-16 02:01:56.422942'),
(29,'admin','organization_register','Solicitó registrar hola.','{\"org_id\": 1}','2025-11-16 02:04:50.811312'),
(30,'admin','organization_status','Cambió estado de hola a activo.','{\"org_id\": 1}','2025-11-16 02:04:53.820347'),
(31,'admin','organization_status','Cambió estado de hola a inactivo.','{\"org_id\": 1}','2025-11-16 02:04:55.269431'),
(32,'admin','organization_status','Cambió estado de hola a bloqueado.','{\"org_id\": 1}','2025-11-16 02:04:56.302566'),
(33,'admin','organization_status','Cambió estado de hola a suspendido.','{\"org_id\": 1}','2025-11-16 02:04:57.303570'),
(34,'admin','admin_view','abrió el panel administrador.','{}','2025-11-16 02:40:50.070077'),
(35,'admin','admin_view','abrió el panel administrador.','{}','2025-11-16 02:44:07.859074'),
(36,'admin','admin_view','abrió el panel administrador.','{}','2025-11-16 02:53:04.603355'),
(37,'admin','admin_view','abrió el panel administrador.','{}','2025-11-16 03:14:08.225833'),
(38,'admin','admin_view','abrió el panel administrador.','{}','2025-11-16 03:21:19.484928'),
(39,'admin','admin_view','abrió el panel administrador.','{}','2025-11-16 03:22:14.785820'),
(40,'admin','admin_view','abrió el panel administrador.','{}','2025-11-16 03:22:16.085038'),
(41,'admin','admin_view','abrió el panel administrador.','{}','2025-11-16 03:45:06.282002'),
(42,'admin','admin_view','abrió el panel administrador.','{}','2025-11-16 03:51:49.935704'),
(43,'admin','admin_view','abrió el panel administrador.','{}','2025-11-16 03:54:47.372991'),
(44,'admin','admin_view','abrió el panel administrador.','{}','2025-11-16 03:56:35.509492'),
(45,'admin','admin_view','abrió el panel administrador.','{}','2025-11-16 03:56:37.390910'),
(46,'admin','logout','cerró sesión.','{}','2025-11-16 04:09:35.931752'),
(47,'admin','login','inició sesión.','{}','2025-11-16 04:26:19.745133'),
(48,'admin','admin_user_delete','Eliminó al usuario amarikonaos@boris.com.','{\"user_id\": 4}','2025-11-16 07:30:39.502840'),
(49,'admin','admin_user_delete','Eliminó al usuario asd@gmail.com.','{\"user_id\": 1}','2025-11-16 07:30:42.580678'),
(50,'admin','document_upload','subió hola.','{\"document_id\": 1}','2025-11-16 07:46:50.309085'),
(51,'admin','admin_view','abrió el panel administrador.','{}','2025-11-16 07:52:04.688456'),
(52,'admin','admin_view','abrió el panel administrador.','{}','2025-11-16 07:52:09.546020'),
(53,'admin','admin_view','abrió el panel administrador.','{}','2025-11-16 07:52:20.328155'),
(54,'admin','logout','cerró sesión.','{}','2025-11-16 21:00:55.957349'),
(55,'hola hola','password_reset_requested','solicitó recuperación de contraseña.','{\"email_sent\": false}','2025-11-16 21:01:01.532366'),
(56,'hola hola','password_reset_requested','solicitó recuperación de contraseña.','{\"email_sent\": false}','2025-11-16 21:01:19.850504'),
(57,'admin','login','inició sesión.','{}','2025-11-16 21:01:32.013076'),
(58,'admin','logout','cerró sesión.','{}','2025-11-16 21:01:48.696666'),
(59,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"acunajavier542@gmail.com\"}','2025-11-16 21:01:57.168623'),
(60,'hola hola','password_reset_requested','solicitó recuperación de contraseña.','{\"email_sent\": false}','2025-11-16 21:02:01.796912'),
(61,'hola hola','password_reset','actualizó su contraseña.','{}','2025-11-16 21:02:18.125981'),
(62,'hola hola','login','inició sesión.','{}','2025-11-16 21:02:25.947142'),
(63,'hola hola','logout','cerró sesión.','{}','2025-11-16 22:39:49.284082'),
(64,'admin','login','inició sesión.','{}','2025-11-18 01:08:27.342888'),
(65,'admin','admin_view','abrió el panel administrador.','{}','2025-11-18 01:09:12.536896'),
(66,'admin','logout','cerró sesión.','{}','2025-11-18 01:10:43.281324'),
(67,'hola hola','password_reset_requested','solicitó recuperación de contraseña.','{\"email_sent\": false}','2025-11-18 01:11:20.379773'),
(68,'admin','login','inició sesión.','{}','2025-11-18 01:18:27.308338'),
(69,'admin','tender_create','creó la licitación 1234.','{\"tender_id\": 1}','2025-11-18 01:26:38.278233'),
(70,'admin','tender_create','creó la licitación 12345.','{\"tender_id\": 2}','2025-11-18 01:27:52.053738'),
(71,'admin','tender_state_change','Cambió 12345 a publicada.','{\"tender_id\": 2}','2025-11-18 01:28:02.703935'),
(72,'admin','alert_config_create','Configuró alerta BIg data para 12345.','{\"alert_id\": 1}','2025-11-18 01:28:23.570224'),
(73,'admin','logout','cerró sesión.','{}','2025-11-18 01:32:14.793130'),
(74,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"acunajavier542@gmail.com\"}','2025-11-18 01:32:26.606807'),
(75,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"asd\"}','2025-11-18 01:32:34.917997'),
(76,'admin','login','inició sesión.','{}','2025-11-18 14:58:55.469455'),
(77,'admin','admin_view','abrió el panel administrador.','{}','2025-11-18 14:59:17.714603'),
(78,'admin','admin_view','abrió el panel administrador.','{}','2025-11-18 14:59:35.535223'),
(79,'hola hola','password_reset_requested','solicitó recuperación de contraseña.','{\"email_sent\": false}','2025-11-18 15:12:17.475598'),
(80,'hola hola','password_reset_requested','solicitó recuperación de contraseña.','{\"email_sent\": false}','2025-11-18 15:16:53.215194'),
(81,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin\"}','2025-11-18 17:10:58.990822'),
(82,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin\"}','2025-11-18 17:25:43.179359'),
(83,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin\"}','2025-11-18 17:25:47.894370'),
(84,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin\"}','2025-11-18 17:26:25.084050'),
(85,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin@admin.cl\"}','2025-11-18 17:26:42.920431'),
(86,'(Trabajo) Nicole Castro?  Montocello ACUNA','registro','creó una nueva cuenta.','{\"run\": \"21269243-3\"}','2025-11-18 17:27:33.811191'),
(87,'(Trabajo) Nicole Castro?  Montocello ACUNA','admin_user_update','Actualizó datos de admin@admin.cl.','{\"user_id\": 2}','2025-11-18 17:28:21.486319'),
(88,'(Trabajo) Nicole Castro?  Montocello ACUNA','logout','cerró sesión.','{}','2025-11-18 17:28:37.356030'),
(89,'hola hola','login','inició sesión.','{}','2025-11-18 17:28:55.970026'),
(90,'diego moreno','registro','creó una nueva cuenta.','{\"run\": \"13253648-1\"}','2025-11-18 17:32:58.370272'),
(91,'hola hola','logout','cerró sesión.','{}','2025-11-18 17:47:09.655103'),
(92,'(Trabajo) Nicole Castro?  Montocello ACUNA','password_reset_requested','solicitó recuperación de contraseña.','{\"email_sent\": false}','2025-11-18 17:47:15.588805'),
(93,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin\"}','2025-11-18 22:00:44.228241'),
(94,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin@admin.cl\"}','2025-11-18 22:00:58.711503'),
(95,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin@admin.cl\"}','2025-11-18 22:01:07.852407'),
(96,'javier acuna','registro','creó una nueva cuenta.','{\"run\": \"6215767-4\"}','2025-11-18 22:02:02.375141'),
(97,'javier acuna','admin_view','abrió el panel administrador.','{}','2025-11-18 22:03:23.621768'),
(98,'javier acuna','logout','cerró sesión.','{}','2025-11-18 22:03:46.277614'),
(99,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"ja.acunaq@duocuc.cl\"}','2025-11-18 22:45:36.883039'),
(100,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"ja.acunaq@duocuc.cl\"}','2025-11-18 22:45:51.058939'),
(101,'hola hola','login','inició sesión.','{}','2025-11-18 22:46:06.532334'),
(102,'hola hola','logout','cerró sesión.','{}','2025-11-18 22:48:45.705028'),
(103,'javier acuna','login','inició sesión.','{}','2025-11-18 22:49:02.213719'),
(104,'javier acuna','admin_view','abrió el panel administrador.','{}','2025-11-18 22:50:25.357252'),
(105,'javier acuna','admin_view','abrió el panel administrador.','{}','2025-11-18 22:51:14.586028'),
(106,'javier acuna','logout','cerró sesión.','{}','2025-11-18 23:04:42.466513'),
(107,'hola hola','login','inició sesión.','{}','2025-11-18 23:05:10.227706'),
(108,'hola hola','logout','cerró sesión.','{}','2025-11-18 23:09:42.531637'),
(109,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"hola123@gmail.com\"}','2025-11-18 23:10:05.050230'),
(110,'javier acuna','login','inició sesión.','{}','2025-11-18 23:10:19.026039'),
(111,'javier acuna','admin_view','abrió el panel administrador.','{}','2025-11-18 23:11:52.525376'),
(112,'javier acuna','logout','cerró sesión.','{}','2025-11-18 23:12:19.654018'),
(113,'isai lobos','registro','creó una nueva cuenta.','{\"run\": \"21238611-1\"}','2025-11-18 23:13:17.584343'),
(114,'isai lobos','logout','cerró sesión.','{}','2025-11-18 23:23:04.690106'),
(115,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"asd@gmail.com\"}','2025-11-25 12:29:28.932276'),
(116,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin\"}','2025-11-25 12:38:07.478432'),
(117,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin@admin.cl\"}','2025-11-25 12:38:21.273431'),
(118,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin@admin.cl\"}','2025-11-25 12:38:29.937716'),
(119,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin\"}','2025-11-25 13:04:48.002885'),
(120,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin\"}','2025-11-25 13:05:38.869392'),
(121,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin\"}','2025-11-25 13:05:42.922195'),
(122,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin\"}','2025-11-25 14:02:14.111124'),
(123,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin\"}','2025-11-25 14:02:18.009854'),
(124,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin\"}','2025-11-25 14:02:29.253915'),
(125,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin@example.com\"}','2025-11-25 14:02:51.806017'),
(126,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin\"}','2025-11-25 14:04:59.672142'),
(127,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin@admin.cl\"}','2025-11-25 14:12:01.361872'),
(128,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin\"}','2025-11-25 14:12:20.098157'),
(129,'Javier acuña','login','inició sesión.','{}','2025-11-25 14:17:30.613811'),
(130,'Javier acuña','admin_user_delete','Eliminó al usuario ostras@gmail.com.','{\"user_id\": 6}','2025-11-25 14:18:00.597519'),
(131,'Javier acuña','admin_user_delete','Eliminó al usuario dmoreno@carnenuestra.cl.','{\"user_id\": 7}','2025-11-25 14:18:04.317255'),
(132,'Javier acuña','admin_user_delete','Eliminó al usuario acunajavier542@gmail.com.','{\"user_id\": 5}','2025-11-25 14:18:05.711902'),
(133,'Javier acuña','admin_user_delete','Eliminó al usuario hola123@gmail.com.','{\"user_id\": 8}','2025-11-25 14:18:08.060991'),
(134,'Javier acuña','admin_view','abrió el panel administrador.','{}','2025-11-25 14:18:19.596783'),
(135,'Javier acuña','logout','cerró sesión.','{}','2025-11-25 14:18:56.322884'),
(136,'yop acuña','registro','creó una nueva cuenta.','{\"run\": \"20558616-4\"}','2025-11-25 14:19:52.045857'),
(137,'yop acuña','logout','cerró sesión.','{}','2025-11-25 14:20:26.208811'),
(138,'yo2 acuña','registro','creó una nueva cuenta.','{\"run\": \"21269243-3\"}','2025-11-25 14:21:18.725418'),
(139,'yo2 acuña','logout','cerró sesión.','{}','2025-11-25 14:22:18.888923'),
(140,'yop acuña','login','inició sesión.','{}','2025-11-25 14:22:32.242742'),
(141,'yop acuña','logout','cerró sesión.','{}','2025-11-25 14:34:51.465332'),
(142,'yo2 acuña','login','inició sesión.','{}','2025-11-25 14:35:07.112563'),
(143,'yop acuña','login','inició sesión.','{}','2025-11-25 17:32:43.573876'),
(144,'yop acuña','tender_create','creó la licitación 546546.','{\"tender_id\": 3}','2025-11-25 17:34:24.818622'),
(145,'yop acuña','login','inició sesión.','{}','2025-11-25 19:30:00.803591'),
(146,'yop acuña','login','inició sesión.','{}','2025-11-25 22:49:37.422540'),
(147,'yop acuña','login','inició sesión.','{}','2025-11-25 23:02:43.783803'),
(148,'yop acuña','tender_create','creó la licitación 1234567.','{\"tender_id\": 4}','2025-11-25 23:23:38.038908'),
(149,'yop acuña','logout','cerró sesión.','{}','2025-11-25 23:37:30.542339'),
(150,'yo2 acuña','login','inició sesión.','{}','2025-11-25 23:37:43.684255'),
(151,'yop acuña','logout','cerró sesión.','{}','2025-11-26 16:55:20.885131'),
(152,'yo2 acuña','login','inició sesión.','{}','2025-11-26 16:55:33.107936'),
(153,'yop acuña','tender_create','creó la licitación 123456789asd.','{\"tender_id\": 6}','2025-11-28 15:22:22.802145'),
(154,'yop acuña','logout','cerró sesión.','{}','2025-11-28 15:23:15.260279'),
(155,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin\"}','2025-11-28 15:23:20.668959'),
(156,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin@admin.cl\"}','2025-11-28 15:23:44.672258'),
(157,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin@example.com\"}','2025-11-28 15:23:52.418098'),
(158,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin@admin.cl\"}','2025-11-28 15:26:02.170028'),
(159,'Javier acuña','login','inició sesión.','{}','2025-11-28 15:30:40.334765'),
(160,'Javier acuña','tender_state_change','Cambió 123456789asd a publicada.','{\"tender_id\": 6}','2025-11-28 17:55:09.993994'),
(161,'Javier acuña','logout','cerró sesión.','{}','2025-11-28 17:55:59.612584'),
(162,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"hola1234@gmail.com\"}','2025-11-28 17:56:09.042560'),
(163,'yop acuña','login','inició sesión.','{}','2025-11-28 17:56:35.428564'),
(164,'yop acuña','login','inició sesión.','{}','2025-11-28 17:56:36.526118'),
(165,'yop acuña','tender_create','creó la licitación 1361.','{\"tender_id\": 7}','2025-11-28 17:57:30.569693'),
(166,'yop acuña','tender_state_change','Cambió 1361 a publicada.','{\"tender_id\": 7}','2025-11-28 17:57:40.940533'),
(167,'yop acuña','tender_create','creó la licitación 1.','{\"tender_id\": 8}','2025-12-02 19:27:10.981951'),
(168,'yop acuña','tender_create','creó la licitación 2.','{\"tender_id\": 9}','2025-12-02 19:45:01.633653'),
(169,'yo2 acuña','logout','cerró sesión.','{}','2025-12-02 23:37:10.331255'),
(170,'Juan Martínez','registro','creó una nueva cuenta.','{\"run\": \"15842963-2\"}','2025-12-02 23:43:42.564985'),
(171,'Juan Martínez','logout','cerró sesión.','{}','2025-12-02 23:43:51.744061'),
(172,'Daniela Rojas','registro','creó una nueva cuenta.','{\"run\": \"17294581-3\"}','2025-12-02 23:45:54.527295'),
(173,'Daniela Rojas','logout','cerró sesión.','{}','2025-12-02 23:45:57.026960'),
(174,'Carlos Fuentes','registro','creó una nueva cuenta.','{\"run\": \"13775946-2\"}','2025-12-02 23:46:37.757074'),
(175,'Carlos Fuentes','logout','cerró sesión.','{}','2025-12-02 23:46:41.257544'),
(176,'María Sepúlveda','registro','creó una nueva cuenta.','{\"run\": \"16908337-1\"}','2025-12-02 23:47:10.939495'),
(177,'María Sepúlveda','logout','cerró sesión.','{}','2025-12-02 23:47:13.209182'),
(178,'Pablo Álvarez','registro','creó una nueva cuenta.','{\"run\": \"14663285-8\"}','2025-12-02 23:47:50.668343'),
(179,'Pablo Álvarez','logout','cerró sesión.','{}','2025-12-02 23:47:52.935323'),
(180,'Fernanda Muñoz','registro','creó una nueva cuenta.','{\"run\": \"18112459-8\"}','2025-12-02 23:48:35.434375'),
(181,'Fernanda Muñoz','logout','cerró sesión.','{}','2025-12-02 23:50:30.397149'),
(182,'Daniela Rojas','login','inició sesión.','{}','2025-12-02 23:50:50.139695'),
(183,'Daniela Rojas','logout','cerró sesión.','{}','2025-12-02 23:59:27.157346'),
(184,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin@admin.com\"}','2025-12-03 00:00:24.434198'),
(185,'Javier acuña','login','inició sesión.','{}','2025-12-03 00:00:38.766630'),
(186,'yop acuña','logout','cerró sesión.','{}','2025-12-03 15:22:14.538670'),
(187,'Daniela Rojas','login','inició sesión.','{}','2025-12-03 15:24:08.011133'),
(188,'Daniela Rojas','tender_create','creó la licitación LIC-2025-001.','{\"tender_id\": 10}','2025-12-03 15:45:15.904338'),
(189,'Daniela Rojas','logout','cerró sesión.','{}','2025-12-03 16:57:43.931963'),
(190,'Carlos Fuentes','login','inició sesión.','{}','2025-12-03 16:59:09.412799'),
(191,'yasna burgos','registro','creó una nueva cuenta.','{\"run\": \"20225632-5\"}','2025-12-03 18:40:05.823614'),
(192,'yasna burgos','admin_view','abrió el panel administrador.','{}','2025-12-03 18:45:43.045976'),
(193,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin@admin.cl\"}','2025-12-03 19:40:01.572386'),
(194,'Javier acuña','login','inició sesión.','{}','2025-12-03 19:40:12.030972'),
(195,'Javier acuña','admin_view','abrió el panel administrador.','{}','2025-12-03 19:58:36.828816'),
(196,'Javier acuña','login','inició sesión.','{}','2025-12-04 18:18:43.196797'),
(197,'María Sepúlveda','login','inició sesión.','{}','2025-12-04 18:34:27.108443'),
(198,'Javier acuña','login','inició sesión.','{}','2025-12-05 12:26:19.906514'),
(199,'Javier acuña','login','inició sesión.','{}','2025-12-05 14:11:00.907839'),
(200,'Javier acuña','login','inició sesión.','{}','2025-12-05 14:11:02.174852'),
(201,'Javier acuña','logout','cerró sesión.','{}','2025-12-05 14:19:58.765760'),
(202,'yop acuña','login','inició sesión.','{}','2025-12-05 14:20:12.380638'),
(203,'yop acuña','logout','cerró sesión.','{}','2025-12-05 14:20:26.837675'),
(204,'yo2 acuña','login','inició sesión.','{}','2025-12-05 14:27:58.888088'),
(205,'yo2 acuña','login','inició sesión.','{}','2025-12-05 14:28:00.027525'),
(206,'yop acuña','login','inició sesión.','{}','2025-12-05 18:00:16.253577'),
(207,'yop acuña','login','inició sesión.','{}','2025-12-05 18:00:17.833566'),
(208,'yop acuña','login','inició sesión.','{}','2025-12-05 18:00:18.651520'),
(209,'yop acuña','logout','cerró sesión.','{}','2025-12-05 18:35:27.179775'),
(210,'Javier acuña','login','inició sesión.','{}','2025-12-05 18:35:46.224773'),
(211,'yop acuña','login','inició sesión.','{}','2025-12-05 18:37:35.656581'),
(212,'Javier acuña','admin_view','abrió el panel administrador.','{}','2025-12-05 19:05:50.139640'),
(213,'Javier acuña','admin_view','abrió el panel administrador.','{}','2025-12-05 19:53:52.369811'),
(214,'Javier acuña','login','inició sesión.','{}','2025-12-07 01:02:15.653782'),
(215,'isai villalobos','registro','creó una nueva cuenta.','{\"run\": \"21238611-1\"}','2025-12-07 01:14:33.261188'),
(216,'isai villalobos','proposal_submit','Envió/actualizó propuesta para 1234.','{\"tender_id\": 1, \"proposal_id\": 5}','2025-12-07 01:15:48.157911'),
(217,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"cristian\"}','2025-12-07 01:17:08.506820'),
(218,'isai villalobos','logout','cerró sesión.','{}','2025-12-07 01:18:07.088400'),
(219,'María Sepúlveda','login','inició sesión.','{}','2025-12-07 01:22:53.896766'),
(220,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"pablo.alvarez@cmpc-pro.cl\"}','2025-12-07 01:23:23.548208'),
(221,'María Sepúlveda','logout','cerró sesión.','{}','2025-12-07 01:23:46.750339'),
(222,'Daniela Rojas','login','inició sesión.','{}','2025-12-07 01:23:56.736088'),
(223,'Carlos Fuentes','login','inició sesión.','{}','2025-12-07 01:24:01.490158'),
(224,'Javier acuña','logout','cerró sesión.','{}','2025-12-07 01:30:31.770313'),
(225,'Daniela Rojas','login','inició sesión.','{}','2025-12-07 01:31:02.152276'),
(226,'Javier acuña','login','inició sesión.','{}','2025-12-07 01:43:00.886541'),
(227,'Daniela Rojas','logout','cerró sesión.','{}','2025-12-07 01:44:24.707942'),
(228,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin@admin\"}','2025-12-07 01:44:40.408424'),
(229,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin@admin\"}','2025-12-07 01:44:53.563126'),
(230,'Javier acuña','logout','cerró sesión.','{}','2025-12-07 01:45:03.312843'),
(231,'Javier acuña','login','inició sesión.','{}','2025-12-07 01:45:07.480633'),
(232,'Sistema','login_failed','Intento de inicio de sesión fallido.','{\"identifier\": \"admin@admin.cl\"}','2025-12-07 01:45:10.218228'),
(233,'Javier acuña','login','inició sesión.','{}','2025-12-07 01:45:17.759974'),
(234,'Javier acuña','proposal_submit','Envió/actualizó propuesta para LIC-2025-001.','{\"tender_id\": 10, \"proposal_id\": 6}','2025-12-07 01:57:54.775372'),
(235,'Javier acuña','proposal_submit','Envió/actualizó propuesta para LIC-2025-001.','{\"tender_id\": 10, \"proposal_id\": 6}','2025-12-07 01:58:10.276665'),
(236,'Javier acuña','login','inició sesión.','{}','2025-12-07 20:28:36.795103'),
(237,'Javier acuña','tender_create','cre? la licitaci?n LIC-2025-00123.','{\"tender_id\": 11}','2025-12-07 21:54:14.273634'),
(238,'Javier acuña','login','inició sesión.','{}','2025-12-07 22:21:51.846971'),
(239,'Javier acuña','logout','cerró sesión.','{}','2025-12-08 00:09:53.878067'),
(240,'Daniela Rojas','login','inició sesión.','{}','2025-12-08 01:22:25.889381'),
(241,'Daniela Rojas','logout','cerró sesión.','{}','2025-12-08 01:23:21.824325'),
(242,'Carlos Fuentes','login','inició sesión.','{}','2025-12-08 01:23:29.407212'),
(243,'Carlos Fuentes','logout','cerró sesión.','{}','2025-12-08 01:23:40.848692'),
(244,'Ricardo Castillo','registro','creó una nueva cuenta.','{\"run\": \"12459781-1\"}','2025-12-08 01:29:00.682824'),
(245,'Ricardo Castillo','account_self_deactivate','desactivó su cuenta.','{\"user_id\": 20}','2025-12-08 01:38:23.854143'),
(246,'Javier acuña','login','inició sesión.','{}','2025-12-08 01:38:48.443348'),
(247,'Javier acuña','admin_view','abrió el panel administrador.','{}','2025-12-08 01:39:23.509426'),
(248,'Javier acuña','login','inició sesión.','{}','2025-12-08 02:14:12.816016'),
(249,'Daniela Rojas','login','inició sesión.','{}','2025-12-08 02:50:28.491948'),
(250,'Javier acuña','login','inició sesión.','{}','2025-12-08 15:45:47.977748'),
(251,'Daniela Rojas','login','inició sesión.','{}','2025-12-08 16:01:27.428420'),
(252,'Daniela Rojas','account_self_deactivate','desactivó su cuenta.','{\"user_id\": 13}','2025-12-08 16:01:47.230531'),
(253,'Javier acuña','user_toggle_active','activado al usuario daniela.rojas@enel-postula.cl','{\"user_id\": 13}','2025-12-08 17:00:55.788603'),
(254,'Javier acuña','user_toggle_active','activado al usuario ricardo.castillo@sodimac-pro.cl','{\"user_id\": 20}','2025-12-08 17:02:18.669959'),
(255,'yop acuña','login','inició sesión.','{}','2025-12-08 17:03:17.882715'),
(256,'yop acuña','tender_create','cre? la licitaci?n lic 27.','{\"tender_id\": 12}','2025-12-08 17:04:57.206397'),
(257,'Javier acuña','proposal_submit','Envió/actualizó propuesta para lic 27.','{\"tender_id\": 12, \"proposal_id\": 7}','2025-12-08 17:05:30.194931'),
(258,'yop acuña','logout','cerrÃ³ sesiÃ³n.','{}','2025-12-08 17:37:44.282883'),
(259,'yop acuña','login','iniciÃ³ sesiÃ³n.','{}','2025-12-08 17:37:52.319534'),
(260,'Daniela Rojas','login','iniciÃ³ sesiÃ³n.','{}','2025-12-08 18:08:05.233885'),
(261,'yop acuña','tender_create','cre? la licitaci?n lic 28.','{\"tender_id\": 13}','2025-12-08 19:22:54.233781'),
(262,'Javier acuña','login','iniciÃ³ sesiÃ³n.','{}','2025-12-08 19:24:30.256614'),
(263,'Javier acuña','login','iniciÃ³ sesiÃ³n.','{}','2025-12-08 19:24:31.200696'),
(264,'Javier acuña','proposal_submit','Envió/actualizó propuesta para lic 28.','{\"tender_id\": 13, \"proposal_id\": 8}','2025-12-08 19:24:40.937548'),
(265,'Javier acuña','login','iniciÃ³ sesiÃ³n.','{}','2025-12-08 19:44:47.367568'),
(266,'Javier acuña','logout','cerrÃ³ sesiÃ³n.','{}','2025-12-08 19:45:00.363862'),
(267,'Sistema','login_failed','Intento de inicio de sesiÃ³n fallido.','{\"identifier\": \"hola1234@gmail.com\"}','2025-12-08 19:45:07.599150'),
(268,'Sistema','login_failed','Intento de inicio de sesiÃ³n fallido.','{\"identifier\": \"hola1234@gmail.com\"}','2025-12-08 19:45:15.421427'),
(269,'yop acuña','login','iniciÃ³ sesiÃ³n.','{}','2025-12-08 19:45:25.271962'),
(270,'Javier acuña','login','iniciÃ³ sesiÃ³n.','{}','2025-12-08 20:14:58.220216'),
(271,'Javier acuña','admin_user_update','ActualizÃ³ datos de daniela.rojas@enel-postula.cl.','{\"user_id\": 13}','2025-12-08 20:16:13.646823'),
(272,'Javier acuña','logout','cerrÃ³ sesiÃ³n.','{}','2025-12-08 20:16:20.785890'),
(273,'Daniela Rojas','login','iniciÃ³ sesiÃ³n.','{}','2025-12-08 20:16:35.891634'),
(274,'Sistema','login_failed','Intento de inicio de sesiÃ³n fallido.','{\"identifier\": \"hola12345@gmail.com\"}','2025-12-08 20:48:59.064896'),
(275,'yo2 acuña','login','iniciÃ³ sesiÃ³n.','{}','2025-12-08 20:49:07.603383'),
(276,'yo2 acuña','logout','cerrÃ³ sesiÃ³n.','{}','2025-12-08 20:49:53.117146'),
(277,'María Sepúlveda','login','iniciÃ³ sesiÃ³n.','{}','2025-12-08 20:50:20.064716'),
(278,'Carlos Fuentes','login','iniciÃ³ sesiÃ³n.','{}','2025-12-08 23:07:05.088183'),
(279,'Carlos Fuentes','tender_create','cre? la licitaci?n 6655546.','{\"tender_id\": 14}','2025-12-08 23:10:14.681749'),
(280,'Javier acuña','login','iniciÃ³ sesiÃ³n.','{}','2025-12-08 23:12:51.924067'),
(281,'Javier acuña','login','iniciÃ³ sesiÃ³n.','{}','2025-12-08 23:13:28.992671'),
(282,'Javier acuña','logout','cerrÃ³ sesiÃ³n.','{}','2025-12-08 23:22:52.271041'),
(283,'Javier acuña','login','iniciÃ³ sesiÃ³n.','{}','2025-12-08 23:22:59.169722'),
(284,'Carlos Fuentes','login','iniciÃ³ sesiÃ³n.','{}','2025-12-08 23:34:55.569866'),
(285,'Carlos Fuentes','logout','cerrar sesion.','{}','2025-12-09 00:52:02.839578'),
(286,'Fernanda Muñoz','login','iniciar sesion.','{}','2025-12-09 00:52:25.648303'),
(287,'Fernanda Muñoz','logout','cerrar sesion.','{}','2025-12-09 01:06:35.656860'),
(288,'Carlos Fuentes','login','iniciar sesion.','{}','2025-12-09 01:06:54.340569'),
(289,'Javier acuña','logout','cerrar sesion.','{}','2025-12-09 01:10:44.221985'),
(290,'Carlos Fuentes','login','iniciar sesion.','{}','2025-12-09 01:11:05.111032'),
(291,'Carlos Fuentes','logout','cerrar sesion.','{}','2025-12-09 01:37:55.001429'),
(292,'Fernanda Muñoz','login','iniciar sesion.','{}','2025-12-09 01:38:07.866299'),
(293,'Fernanda Muñoz','proposal_submit','EnviÃ³/actualizÃ³ propuesta para 6655546.','{\"tender_id\": 14, \"proposal_id\": 9}','2025-12-09 01:39:34.139656'),
(294,'Fernanda Muñoz','proposal_submit','EnviÃ³/actualizÃ³ propuesta para 6655546.','{\"tender_id\": 14, \"proposal_id\": 9}','2025-12-09 01:39:36.011660'),
(295,'Fernanda Muñoz','proposal_submit','EnviÃ³/actualizÃ³ propuesta para 6655546.','{\"tender_id\": 14, \"proposal_id\": 9}','2025-12-09 01:39:39.211341'),
(296,'Fernanda Muñoz','proposal_submit','EnviÃ³/actualizÃ³ propuesta para 6655546.','{\"tender_id\": 14, \"proposal_id\": 9}','2025-12-09 01:39:41.871952'),
(297,'Fernanda Muñoz','proposal_submit','EnviÃ³/actualizÃ³ propuesta para 6655546.','{\"tender_id\": 14, \"proposal_id\": 9}','2025-12-09 01:39:46.683878'),
(298,'Fernanda Muñoz','logout','cerrar sesion.','{}','2025-12-09 01:41:50.105198'),
(299,'Carlos Fuentes','login','iniciar sesion.','{}','2025-12-09 01:42:00.377956'),
(300,'Carlos Fuentes','logout','cerrar sesion.','{}','2025-12-09 01:44:17.219946'),
(301,'Fernanda Muñoz','login','iniciar sesion.','{}','2025-12-09 01:44:28.449711'),
(302,'Fernanda Muñoz','login','iniciar sesion.','{}','2025-12-09 01:44:29.777039'),
(303,'Fernanda Muñoz','logout','cerrar sesion.','{}','2025-12-09 01:44:37.510702'),
(304,'Carlos Fuentes','login','iniciar sesion.','{}','2025-12-09 01:44:45.993307'),
(305,'Carlos Fuentes','logout','cerrar sesion.','{}','2025-12-09 01:48:55.194363'),
(306,'Fernanda Muñoz','login','iniciar sesion.','{}','2025-12-09 01:49:09.195988'),
(307,'Fernanda Muñoz','logout','cerrar sesion.','{}','2025-12-09 01:59:52.970475'),
(308,'Carlos Fuentes','alert_config_create','ConfigurÃ³ alerta hola para 6655546.','{\"alert_id\": 2}','2025-12-09 02:07:36.338040'),
(309,'Sistema','logout','cerrar sesion.','{}','2025-12-09 02:08:07.422598'),
(310,'Javier acuña','login','iniciar sesion.','{}','2025-12-09 02:08:19.941849'),
(311,'Javier acuña','login','iniciar sesion.','{}','2025-12-09 02:08:21.291992'),
(312,'Javier acuña','admin_view','abrir el panel administrador.','{}','2025-12-09 02:15:57.408894'),
(313,'Javier acuña','login','iniciar sesion.','{}','2025-12-09 03:13:16.245919'),
(314,'Carlos Fuentes','login','iniciar sesion.','{}','2025-12-09 04:09:48.472613'),
(315,'Javier acuña','login','iniciar sesion.','{}','2025-12-09 15:54:34.413307'),
(316,'Javier acuña','login','iniciar sesion.','{}','2025-12-09 16:09:50.705567'),
(317,'Javier acuña','login','iniciar sesion.','{}','2025-12-09 16:09:51.480721'),
(318,'Javier acuña','logout','cerrar sesion.','{}','2025-12-09 16:10:14.602038'),
(319,'Daniela Rojas','login','iniciar sesion.','{}','2025-12-09 16:10:35.280127'),
(320,'Daniela Rojas','logout','cerrar sesion.','{}','2025-12-09 16:50:54.464352'),
(321,'Javier acuña','login','iniciar sesion.','{}','2025-12-09 16:51:01.337282'),
(322,'Javier acuña','admin_user_update','ActualizÃ³ datos de ricardo.castillo@sodimac-pro.cl.','{\"user_id\": 20}','2025-12-09 18:13:36.124152'),
(323,'Javier acuña','admin_user_update','ActualizÃ³ datos de ricardo.castillo@sodimac-pro.cl.','{\"user_id\": 20}','2025-12-09 18:13:45.349049'),
(324,'Javier acuña','logout','cerrar sesion.','{}','2025-12-09 18:13:52.249164'),
(325,'Javier acuña','login','iniciar sesion.','{}','2025-12-09 18:52:01.076513'),
(326,'Javier acuña','login','iniciar sesion.','{}','2025-12-09 18:54:55.389358');

/*Table structure for table `accounts_document` */

DROP TABLE IF EXISTS `accounts_document`;

CREATE TABLE `accounts_document` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `content_type` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `doc_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size_bytes` bigint NOT NULL,
  `state` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tender_id` bigint DEFAULT NULL,
  `sla_due_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_document_tender_id_2b04052c_fk_accounts_tender_id` (`tender_id`),
  CONSTRAINT `accounts_document_tender_id_2b04052c_fk_accounts_tender_id` FOREIGN KEY (`tender_id`) REFERENCES `accounts_tender` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `accounts_document` */

insert  into `accounts_document`(`id`,`name`,`version`,`updated_at`,`content_type`,`created_at`,`doc_type`,`file`,`owner`,`size_bytes`,`state`,`tender_id`,`sla_due_at`) values 
(1,'hola','1.0','2025-11-16 07:46:50.301565','image/png','2025-11-16 07:46:50.305930','Bases','docs/2025/11/Captura_de_pantalla_2025-11-15_125134.png','yo',41423,'ok',NULL,NULL),
(2,'Bases 123456789','','2025-11-28 15:08:56.571223','application/vnd.openxmlformats-officedocument.wordprocessingml.document','2025-11-28 15:08:56.602963','Bases','docs/2025/11/hola1234.docx','yop acuña',13609,'ok',NULL,NULL),
(3,'Bases 123456789asd','','2025-11-28 15:22:22.785424','application/vnd.openxmlformats-officedocument.wordprocessingml.document','2025-11-28 15:22:22.791822','Bases','docs/2025/11/hola1234_kCEFB8f.docx','yop acuña',13609,'ok',6,NULL),
(4,'Bases 1361','','2025-11-28 17:57:30.541758','application/vnd.openxmlformats-officedocument.wordprocessingml.document','2025-11-28 17:57:30.563668','Bases','docs/2025/11/hola1234_kCEFB8f_FSXPiWB.docx','yop acuña',13609,'ok',7,NULL),
(5,'Bases 1','','2025-12-02 19:27:10.968791','application/vnd.openxmlformats-officedocument.wordprocessingml.document','2025-12-02 19:27:10.973434','Bases','docs/2025/12/hola1234.docx','yop acuña',13609,'ok',NULL,NULL),
(6,'Bases 2','','2025-12-02 19:45:01.619340','application/vnd.openxmlformats-officedocument.wordprocessingml.document','2025-12-02 19:45:01.627067','Bases','docs/2025/12/hola1234_hacD2NA.docx','yop acuña',13609,'ok',9,NULL),
(7,'Bases LIC-2025-001','','2025-12-03 15:45:15.887699','application/vnd.openxmlformats-officedocument.wordprocessingml.document','2025-12-03 15:45:15.893963','Bases','docs/2025/12/Bases_LIC-2025-001.docx','Daniela Rojas',36901,'ok',10,NULL),
(8,'Bases LIC-2025-00123 (1)','','2025-12-07 21:54:14.253232','application/vnd.openxmlformats-officedocument.wordprocessingml.document','2025-12-07 21:54:14.259810','Bases','docs/2025/12/Acta_de_constitución_Correguido.docx','Javier acuña',160042,'ok',11,NULL),
(9,'Bases lic 27 (1)','','2025-12-08 17:04:57.190509','application/vnd.openxmlformats-officedocument.wordprocessingml.document','2025-12-08 17:04:57.200773','Bases','docs/2025/12/Bases_Licitacion_LIC-2025-001.docx','yop acuña',36929,'ok',12,NULL),
(10,'Bases lic 28 (1)','','2025-12-08 19:22:54.214862','application/vnd.openxmlformats-officedocument.wordprocessingml.document','2025-12-08 19:22:54.224584','Bases','docs/2025/12/Bases_Licitacion_LIC-2025-001_HT92MVP.docx','yop acuña',36929,'ok',13,NULL),
(11,'Bases 6655546 (1)','','2025-12-08 23:10:14.656079','application/pdf','2025-12-08 23:10:14.669013','Bases','docs/2025/12/CR_VII__VIII_Guide_Of_Registration_1.pdf','Carlos Fuentes',1400672,'ok',14,NULL);

/*Table structure for table `accounts_documentooficial` */

DROP TABLE IF EXISTS `accounts_documentooficial`;

CREATE TABLE `accounts_documentooficial` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsable` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `archivo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vigente` tinyint(1) NOT NULL,
  `creado_en` datetime(6) NOT NULL,
  `empresa_id` bigint DEFAULT NULL,
  `licitacion_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_documentoof_empresa_id_d9358226_fk_accounts_` (`empresa_id`),
  KEY `accounts_documentoof_licitacion_id_e0b73bd5_fk_accounts_` (`licitacion_id`),
  CONSTRAINT `accounts_documentoof_empresa_id_d9358226_fk_accounts_` FOREIGN KEY (`empresa_id`) REFERENCES `accounts_organization` (`id`),
  CONSTRAINT `accounts_documentoof_licitacion_id_e0b73bd5_fk_accounts_` FOREIGN KEY (`licitacion_id`) REFERENCES `accounts_tender` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `accounts_documentooficial` */

/*Table structure for table `accounts_documentrevision` */

DROP TABLE IF EXISTS `accounts_documentrevision`;

CREATE TABLE `accounts_documentrevision` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `decision` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `document_id` bigint NOT NULL,
  `reviewer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_documentrev_document_id_747c844b_fk_accounts_` (`document_id`),
  KEY `accounts_documentrevision_reviewer_id_ef3f0768_fk_auth_user_id` (`reviewer_id`),
  CONSTRAINT `accounts_documentrev_document_id_747c844b_fk_accounts_` FOREIGN KEY (`document_id`) REFERENCES `accounts_document` (`id`),
  CONSTRAINT `accounts_documentrevision_reviewer_id_ef3f0768_fk_auth_user_id` FOREIGN KEY (`reviewer_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `accounts_documentrevision` */

/*Table structure for table `accounts_kpisnapshot` */

DROP TABLE IF EXISTS `accounts_kpisnapshot`;

CREATE TABLE `accounts_kpisnapshot` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `period` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_date` date NOT NULL,
  `total_tenders` int unsigned NOT NULL,
  `active_tenders` int unsigned NOT NULL,
  `awarded_tenders` int unsigned NOT NULL,
  `total_documents` int unsigned NOT NULL,
  `observed_documents` int unsigned NOT NULL,
  `avg_response_time_hours` decimal(7,2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_kpisnapshot_period_reference_date_5b8c433f_uniq` (`period`,`reference_date`),
  CONSTRAINT `accounts_kpisnapshot_chk_1` CHECK ((`total_tenders` >= 0)),
  CONSTRAINT `accounts_kpisnapshot_chk_2` CHECK ((`active_tenders` >= 0)),
  CONSTRAINT `accounts_kpisnapshot_chk_3` CHECK ((`awarded_tenders` >= 0)),
  CONSTRAINT `accounts_kpisnapshot_chk_4` CHECK ((`total_documents` >= 0)),
  CONSTRAINT `accounts_kpisnapshot_chk_5` CHECK ((`observed_documents` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `accounts_kpisnapshot` */

insert  into `accounts_kpisnapshot`(`id`,`period`,`reference_date`,`total_tenders`,`active_tenders`,`awarded_tenders`,`total_documents`,`observed_documents`,`avg_response_time_hours`,`created_at`) values 
(1,'daily','2025-11-15',0,0,0,0,0,0.00,'2025-11-15 17:39:31.149967');

/*Table structure for table `accounts_notificacion` */

DROP TABLE IF EXISTS `accounts_notificacion`;

CREATE TABLE `accounts_notificacion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mensaje` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `leida` tinyint(1) NOT NULL,
  `creado_en` datetime(6) NOT NULL,
  `clave_evento` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `licitacion_id` bigint DEFAULT NULL,
  `usuario_id` int NOT NULL,
  `target_url` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_notificacio_licitacion_id_44aac17c_fk_accounts_` (`licitacion_id`),
  KEY `accounts_notificacion_usuario_id_576d9e07_fk_auth_user_id` (`usuario_id`),
  CONSTRAINT `accounts_notificacio_licitacion_id_44aac17c_fk_accounts_` FOREIGN KEY (`licitacion_id`) REFERENCES `accounts_tender` (`id`),
  CONSTRAINT `accounts_notificacion_usuario_id_576d9e07_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `accounts_notificacion` */

insert  into `accounts_notificacion`(`id`,`tipo`,`titulo`,`mensaje`,`leida`,`creado_en`,`clave_evento`,`licitacion_id`,`usuario_id`,`target_url`) values 
(1,'propuesta_recibida','Propuesta recibida en lic 28','Javier acuña envió propuesta.',1,'2025-12-08 19:24:40.930714',NULL,13,10,NULL),
(2,'propuesta_recibida','Propuesta recibida en 6655546','Fernanda Muñoz enviÃ³ propuesta.',1,'2025-12-09 01:39:34.126939',NULL,14,14,NULL),
(3,'propuesta_recibida','Propuesta recibida en 6655546','Fernanda Muñoz enviÃ³ propuesta.',1,'2025-12-09 01:39:36.005031',NULL,14,14,NULL),
(4,'propuesta_recibida','Propuesta recibida en 6655546','Fernanda Muñoz enviÃ³ propuesta.',1,'2025-12-09 01:39:39.183511',NULL,14,14,NULL),
(5,'propuesta_recibida','Propuesta recibida en 6655546','Fernanda Muñoz enviÃ³ propuesta.',1,'2025-12-09 01:39:41.823662',NULL,14,14,NULL),
(6,'propuesta_recibida','Propuesta recibida en 6655546','Fernanda Muñoz enviÃ³ propuesta.',1,'2025-12-09 01:39:46.674876',NULL,14,14,NULL);

/*Table structure for table `accounts_organization` */

DROP TABLE IF EXISTS `accounts_organization`;

CREATE TABLE `accounts_organization` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `industry` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_phone` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `corporate_email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_id` (`tax_id`),
  UNIQUE KEY `corporate_email` (`corporate_email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `accounts_organization` */

insert  into `accounts_organization`(`id`,`name`,`short_name`,`tax_id`,`org_type`,`industry`,`contact_name`,`contact_email`,`contact_phone`,`website`,`address`,`status`,`notes`,`created_at`,`updated_at`,`corporate_email`) values 
(1,'hola','asd','123456789','empresa','asd','','','123456789','','casa123','suspendido','','2025-11-16 02:04:50.806002','2025-11-16 02:04:57.301186','acunajavier542@gmail.com'),
(2,'sodimac','sodimac','2','empresa','','','','1','','','','adasdads','2025-12-09 15:12:27.000000','2025-12-09 15:12:31.000000','');

/*Table structure for table `accounts_organizationmembership` */

DROP TABLE IF EXISTS `accounts_organizationmembership`;

CREATE TABLE `accounts_organizationmembership` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `organization_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_organizationmem_organization_id_user_id_2b10e9ce_uniq` (`organization_id`,`user_id`),
  KEY `accounts_organizationmembership_user_id_8cbb5f64_fk_auth_user_id` (`user_id`),
  CONSTRAINT `accounts_organizatio_organization_id_c57f0637_fk_accounts_` FOREIGN KEY (`organization_id`) REFERENCES `accounts_organization` (`id`),
  CONSTRAINT `accounts_organizationmembership_user_id_8cbb5f64_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `accounts_organizationmembership` */

/*Table structure for table `accounts_prediction` */

DROP TABLE IF EXISTS `accounts_prediction`;

CREATE TABLE `accounts_prediction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `metric` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `horizon_days` int unsigned NOT NULL,
  `expected_value` decimal(12,2) NOT NULL,
  `confidence` decimal(4,2) NOT NULL,
  `notes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `accounts_prediction_chk_1` CHECK ((`horizon_days` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `accounts_prediction` */

/*Table structure for table `accounts_profile` */

DROP TABLE IF EXISTS `accounts_profile`;

CREATE TABLE `accounts_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `empresa_entidad_id` bigint DEFAULT NULL,
  `user_id` int NOT NULL,
  `run` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `run` (`run`),
  KEY `fk_profile_empresa` (`empresa_entidad_id`),
  CONSTRAINT `accounts_profile_user_id_49a85d32_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `fk_profile_empresa` FOREIGN KEY (`empresa_entidad_id`) REFERENCES `accounts_organization` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `accounts_profile` */

insert  into `accounts_profile`(`id`,`empresa_entidad_id`,`user_id`,`run`) values 
(8,NULL,10,'20558616-4'),
(9,NULL,11,'21269243-3'),
(10,NULL,12,'15842963-2'),
(11,NULL,13,'17294581-3'),
(12,NULL,14,'13775946-2'),
(13,NULL,15,'16908337-1'),
(14,NULL,16,'14663285-8'),
(15,NULL,17,'18112459-8'),
(16,NULL,18,'20225632-5'),
(17,NULL,19,'21238611-1'),
(18,NULL,20,'12459781-1'),
(20,NULL,22,NULL),
(21,NULL,23,NULL);

/*Table structure for table `accounts_proposal` */

DROP TABLE IF EXISTS `accounts_proposal`;

CREATE TABLE `accounts_proposal` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` decimal(14,2) NOT NULL,
  `category` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `supplier_id` int NOT NULL,
  `tender_id` bigint NOT NULL,
  `response_note` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `document` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_proposal_tender_id_supplier_id_3f172c2b_uniq` (`tender_id`,`supplier_id`),
  KEY `accounts_proposal_supplier_id_779ecc69_fk_auth_user_id` (`supplier_id`),
  CONSTRAINT `accounts_proposal_supplier_id_779ecc69_fk_auth_user_id` FOREIGN KEY (`supplier_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `accounts_proposal_tender_id_6da48cca_fk_accounts_tender_id` FOREIGN KEY (`tender_id`) REFERENCES `accounts_tender` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `accounts_proposal` */

insert  into `accounts_proposal`(`id`,`amount`,`category`,`description`,`status`,`created_at`,`updated_at`,`supplier_id`,`tender_id`,`response_note`,`document`) values 
(2,2123451564.00,'otros','hola xd','enviada','2025-11-25 20:08:41.894346','2025-11-25 20:10:10.325888',11,3,'',NULL),
(3,657657657.00,'tecnologia','hola123456788','enviada','2025-11-25 23:39:04.766893','2025-11-27 19:47:46.020713',11,4,'','proposals/2025/11/hola1234_kCEFB8f.docx'),
(4,0.00,'otros','','aceptada','2025-11-28 17:58:26.634621','2025-12-01 12:28:38.882433',11,7,'Propuesta aceptada','proposals/2025/11/hola1234_YUKINzm.docx'),
(5,0.00,'otros','','enviada','2025-12-07 01:15:48.147148','2025-12-07 01:15:48.147252',19,1,'','proposals/2025/12/Manual_de_usuario.docx'),
(6,0.00,'otros','','enviada','2025-12-07 01:57:54.737232','2025-12-07 01:58:10.255617',2,10,'','proposals/2025/12/hola1234_IEtKrLN.docx'),
(7,0.00,'otros','','enviada','2025-12-08 17:05:30.179208','2025-12-08 17:05:30.179244',2,12,'','proposals/2025/12/Acta_de_constitución_Correguido.docx'),
(8,0.00,'otros','','enviada','2025-12-08 19:24:40.914767','2025-12-08 19:24:40.914800',2,13,'','proposals/2025/12/Acta_de_constitución_Correguido_SZLR5qg.docx'),
(9,0.00,'otros','','enviada','2025-12-09 01:39:34.100749','2025-12-09 01:39:46.651918',17,14,'','proposals/2025/12/Propuesta_Comercial_Jira_Service_Manager_-_ANID_v1.pdf');

/*Table structure for table `accounts_tender` */

DROP TABLE IF EXISTS `accounts_tender`;

CREATE TABLE `accounts_tender` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(220) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `process_type` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish_at` date DEFAULT NULL,
  `close_at` date DEFAULT NULL,
  `budget_amount` decimal(14,2) DEFAULT NULL,
  `budget_currency` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_winner` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `buyer_id` bigint DEFAULT NULL,
  `external_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sla_due_at` date DEFAULT NULL,
  `category` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `accounts_tender_buyer_id_316ff9f6_fk_accounts_organization_id` (`buyer_id`),
  KEY `accounts_tender_created_by_id_1061c972_fk_auth_user_id` (`created_by_id`),
  CONSTRAINT `accounts_tender_buyer_id_316ff9f6_fk_accounts_organization_id` FOREIGN KEY (`buyer_id`) REFERENCES `accounts_organization` (`id`),
  CONSTRAINT `accounts_tender_created_by_id_1061c972_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `accounts_tender` */

insert  into `accounts_tender`(`id`,`code`,`title`,`description`,`process_type`,`status`,`publish_at`,`close_at`,`budget_amount`,`budget_currency`,`has_winner`,`created_at`,`updated_at`,`buyer_id`,`external_id`,`sla_due_at`,`category`,`created_by_id`) values 
(1,'1234','hola1','asdasdsadas','lp','publicada','2025-11-17','2025-11-30',1000.00,'CLP',0,'2025-11-18 01:26:38.275411','2025-11-18 01:26:38.275426',1,'2','2025-11-18','otros',NULL),
(2,'12345','hola12','asdasdsadas','lp','publicada','2025-11-17','2025-11-30',10007.00,'CLP',0,'2025-11-18 01:27:52.049997','2025-11-18 01:28:02.698093',1,'22','2025-11-18','otros',NULL),
(3,'546546','el pepe','prueba','lc','cerrada','2025-11-25','2025-11-30',100000000.00,'CLP',1,'2025-11-25 17:34:24.813458','2025-12-03 19:57:52.764933',NULL,'','2025-12-28','tecnologia',NULL),
(4,'1234567','prueba1','preuab','lp','cerrada','2025-11-25','2025-11-29',100000000.00,'CLP',1,'2025-11-25 23:23:38.023387','2025-12-03 19:57:46.966148',NULL,'ola','2025-11-30','tecnologia',NULL),
(6,'123456789asd','pruba_aviso2','hola soy yo','lp','publicada','2025-11-28','2025-11-30',1000000.00,'CLP',0,'2025-11-28 15:22:22.745554','2025-11-28 17:55:09.945174',NULL,'',NULL,'transporte',NULL),
(7,'1361','prueba3','prueba1231','lp','cerrada','2025-11-28','2025-11-30',1000000.00,'CLP',0,'2025-11-28 17:57:30.535284','2025-12-01 12:28:38.845285',NULL,'',NULL,'otros',10),
(9,'2','hola','holaaa','lc','publicada','2025-12-02','2025-12-30',10000.00,'CLP',0,'2025-12-02 19:45:01.608585','2025-12-02 19:45:01.608808',NULL,'',NULL,'transporte',10),
(10,'LIC-2025-001','Servicio de mantención eléctrica edificios corporativos','Mantención preventiva y correctiva de sistemas eléctricos en edificios administrativos.','lp','publicada','2025-12-03','2026-03-30',120000000.00,'CLP',0,'2025-12-03 15:45:15.879990','2025-12-03 15:45:15.880021',NULL,'',NULL,'tecnologia',13),
(11,'LIC-2025-00123','hola1234567899','holaaaaa','lp','publicada','2025-12-07','2025-12-30',1234567.00,'CLP',0,'2025-12-07 21:54:14.208851','2025-12-07 21:54:14.208878',NULL,'',NULL,'tecnologia',2),
(12,'lic 27','prueba4','esto es una prueba xd','tr','publicada','2025-12-08','2025-12-09',10000.00,'CLP',0,'2025-12-08 17:04:57.182049','2025-12-08 17:04:57.182073',NULL,'',NULL,'transporte',10),
(13,'lic 28','sdfdsfds','dfsdfdsfd','lp','publicada','2025-12-08','2025-12-10',1.00,'CLP',0,'2025-12-08 19:22:54.187660','2025-12-08 19:22:54.187685',NULL,'',NULL,'tecnologia',10),
(14,'6655546','Administracion Jira','Requiere de un experto que pueda actualizar el uso del dominio de la institucion, con los roles y permisos que correspondan al alineamiento de la empresa','lp','publicada','2025-12-08','2025-12-26',5000000.00,'CLP',0,'2025-12-08 23:10:14.636583','2025-12-08 23:10:14.636615',NULL,'',NULL,'tecnologia',14);

/*Table structure for table `accounts_tendercomment` */

DROP TABLE IF EXISTS `accounts_tendercomment`;

CREATE TABLE `accounts_tendercomment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `author_id` int DEFAULT NULL,
  `tender_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_tendercomment_author_id_befdd4aa_fk_auth_user_id` (`author_id`),
  KEY `accounts_tendercomment_tender_id_1e3ec4a4_fk_accounts_tender_id` (`tender_id`),
  CONSTRAINT `accounts_tendercomment_author_id_befdd4aa_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `accounts_tendercomment_tender_id_1e3ec4a4_fk_accounts_tender_id` FOREIGN KEY (`tender_id`) REFERENCES `accounts_tender` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `accounts_tendercomment` */

/*Table structure for table `accounts_tenderquestion` */

DROP TABLE IF EXISTS `accounts_tenderquestion`;

CREATE TABLE `accounts_tenderquestion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `answered_at` datetime(6) DEFAULT NULL,
  `tender_id` bigint NOT NULL,
  `answered_by_id` int DEFAULT NULL,
  `supplier_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_tenderquestion_tender_id_cb5b4f7a_fk_accounts_tender_id` (`tender_id`),
  KEY `accounts_tenderquestion_answered_by_id_3466cda8_fk_auth_user_id` (`answered_by_id`),
  KEY `accounts_tenderquestion_supplier_id_29a707e1_fk_auth_user_id` (`supplier_id`),
  CONSTRAINT `accounts_tenderquestion_answered_by_id_3466cda8_fk_auth_user_id` FOREIGN KEY (`answered_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `accounts_tenderquestion_supplier_id_29a707e1_fk_auth_user_id` FOREIGN KEY (`supplier_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `accounts_tenderquestion_tender_id_cb5b4f7a_fk_accounts_tender_id` FOREIGN KEY (`tender_id`) REFERENCES `accounts_tender` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `accounts_tenderquestion` */

/*Table structure for table `accounts_tenderstage` */

DROP TABLE IF EXISTS `accounts_tenderstage`;

CREATE TABLE `accounts_tenderstage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int unsigned NOT NULL,
  `due_date` date DEFAULT NULL,
  `completed_at` date DEFAULT NULL,
  `notes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tender_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_tenderstage_tender_id_2c2c6a1f_fk_accounts_tender_id` (`tender_id`),
  CONSTRAINT `accounts_tenderstage_tender_id_2c2c6a1f_fk_accounts_tender_id` FOREIGN KEY (`tender_id`) REFERENCES `accounts_tender` (`id`),
  CONSTRAINT `accounts_tenderstage_chk_1` CHECK ((`order` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `accounts_tenderstage` */

insert  into `accounts_tenderstage`(`id`,`name`,`status`,`order`,`due_date`,`completed_at`,`notes`,`tender_id`) values 
(1,'Cambio a publicada','completado',1,NULL,NULL,'',2),
(2,'Cambio a publicada','completado',1,NULL,NULL,'',6),
(3,'Cambio a publicada','completado',1,NULL,NULL,'',7);

/*Table structure for table `alertas_config` */

DROP TABLE IF EXISTS `alertas_config`;

CREATE TABLE `alertas_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint NOT NULL,
  `tipo_alerta` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `horas_anticipacion` int DEFAULT '24',
  `canal` enum('APP','EMAIL') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'APP',
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_id` (`usuario_id`,`tipo_alerta`,`canal`),
  CONSTRAINT `alertas_config_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `alertas_config` */

/*Table structure for table `alertas_log` */

DROP TABLE IF EXISTS `alertas_log`;

CREATE TABLE `alertas_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `alerta_id` bigint DEFAULT NULL,
  `usuario_id` bigint DEFAULT NULL,
  `resultado` enum('ENVIADA','FALLIDA') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detalle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creado_en` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `alertas_log` */

/*Table structure for table `auditoria` */

DROP TABLE IF EXISTS `auditoria`;

CREATE TABLE `auditoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `entidad` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usuario_id` bigint DEFAULT NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detalle` json DEFAULT NULL,
  `creado_en` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `auditoria_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `auditoria` */

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `auth_group` */

insert  into `auth_group`(`id`,`name`) values 
(2,'Administrador'),
(4,'Empresa licitante'),
(1,'Empresa Postulante'),
(3,'Entidad Licitante'),
(5,'Proveedor');

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add usuario',7,'add_usuario'),
(26,'Can change usuario',7,'change_usuario'),
(27,'Can delete usuario',7,'delete_usuario'),
(28,'Can view usuario',7,'view_usuario'),
(29,'Can add document',8,'add_document'),
(30,'Can change document',8,'change_document'),
(31,'Can delete document',8,'delete_document'),
(32,'Can view document',8,'view_document'),
(33,'Can add audit log',9,'add_auditlog'),
(34,'Can change audit log',9,'change_auditlog'),
(35,'Can delete audit log',9,'delete_auditlog'),
(36,'Can view audit log',9,'view_auditlog'),
(37,'Can add profile',10,'add_profile'),
(38,'Can change profile',10,'change_profile'),
(39,'Can delete profile',10,'delete_profile'),
(40,'Can view profile',10,'view_profile'),
(41,'Can add Organización',11,'add_organization'),
(42,'Can change Organización',11,'change_organization'),
(43,'Can delete Organización',11,'delete_organization'),
(44,'Can view Organización',11,'view_organization'),
(45,'Can add Etapa de licitación',12,'add_tenderstage'),
(46,'Can change Etapa de licitación',12,'change_tenderstage'),
(47,'Can delete Etapa de licitación',12,'delete_tenderstage'),
(48,'Can view Etapa de licitación',12,'view_tenderstage'),
(49,'Can add Licitación',13,'add_tender'),
(50,'Can change Licitación',13,'change_tender'),
(51,'Can delete Licitación',13,'delete_tender'),
(52,'Can view Licitación',13,'view_tender'),
(53,'Can add alert log',14,'add_alertlog'),
(54,'Can change alert log',14,'change_alertlog'),
(55,'Can delete alert log',14,'delete_alertlog'),
(56,'Can view alert log',14,'view_alertlog'),
(57,'Can add alert config',15,'add_alertconfig'),
(58,'Can change alert config',15,'change_alertconfig'),
(59,'Can delete alert config',15,'delete_alertconfig'),
(60,'Can view alert config',15,'view_alertconfig'),
(61,'Can add prediction',16,'add_prediction'),
(62,'Can change prediction',16,'change_prediction'),
(63,'Can delete prediction',16,'delete_prediction'),
(64,'Can view prediction',16,'view_prediction'),
(65,'Can add kpi snapshot',17,'add_kpisnapshot'),
(66,'Can change kpi snapshot',17,'change_kpisnapshot'),
(67,'Can delete kpi snapshot',17,'delete_kpisnapshot'),
(68,'Can view kpi snapshot',17,'view_kpisnapshot'),
(69,'Can add organization membership',18,'add_organizationmembership'),
(70,'Can change organization membership',18,'change_organizationmembership'),
(71,'Can delete organization membership',18,'delete_organizationmembership'),
(72,'Can view organization membership',18,'view_organizationmembership'),
(73,'Acceso a documentos',11,'access_documentos'),
(74,'Acceso a licitaciones',11,'access_licitaciones'),
(75,'Acceso a alertas',11,'access_alertas'),
(76,'Acceso a reportes',11,'access_reportes'),
(77,'Acceso a empresas',11,'access_empresas'),
(78,'Can add document revision',19,'add_documentrevision'),
(79,'Can change document revision',19,'change_documentrevision'),
(80,'Can delete document revision',19,'delete_documentrevision'),
(81,'Can view document revision',19,'view_documentrevision'),
(82,'Can add tender comment',20,'add_tendercomment'),
(83,'Can change tender comment',20,'change_tendercomment'),
(84,'Can delete tender comment',20,'delete_tendercomment'),
(85,'Can view tender comment',20,'view_tendercomment'),
(86,'Can add proposal',21,'add_proposal'),
(87,'Can change proposal',21,'change_proposal'),
(88,'Can delete proposal',21,'delete_proposal'),
(89,'Can view proposal',21,'view_proposal'),
(90,'Can add tender question',22,'add_tenderquestion'),
(91,'Can change tender question',22,'change_tenderquestion'),
(92,'Can delete tender question',22,'delete_tenderquestion'),
(93,'Can view tender question',22,'view_tenderquestion'),
(94,'Can add Licitación Mercado Público',23,'add_mplicitacion'),
(95,'Can change Licitación Mercado Público',23,'change_mplicitacion'),
(96,'Can delete Licitación Mercado Público',23,'delete_mplicitacion'),
(97,'Can view Licitación Mercado Público',23,'view_mplicitacion'),
(98,'Can add documento oficial',24,'add_documentooficial'),
(99,'Can change documento oficial',24,'change_documentooficial'),
(100,'Can delete documento oficial',24,'delete_documentooficial'),
(101,'Can view documento oficial',24,'view_documentooficial'),
(102,'Can add notificacion',25,'add_notificacion'),
(103,'Can change notificacion',25,'change_notificacion'),
(104,'Can delete notificacion',25,'delete_notificacion'),
(105,'Can view notificacion',25,'view_notificacion');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(2,'pbkdf2_sha256$870000$j7zaKJaC50Z1xcpVcJtfpQ$nwSRG3Gt+fc+ynvALFGAOhByb3mBuCGkilIckHLSnAc=','2025-12-09 18:54:55.385315',1,'admin','Javier','acuña','admin@admin.cl',1,1,'2025-11-13 00:59:23.420733'),
(9,'pbkdf2_sha256$870000$28XPHkjYrjW20XqbSEOLWn$R3BUtdQu2+iPDfjiSDzI2ckub7L88QsLzkDcb5/b0ZQ=','2025-11-18 23:13:17.583030',0,'duocuc','isai','lobos','duocuc@gmail.com',0,1,'2025-11-18 23:13:16.956836'),
(10,'pbkdf2_sha256$1000000$dQQnIIGvBCwoO9Ksy5N0Ac$TqlNYs2ea7XnWGSoPOvX9Lh01kd2G+h5fJf6QAedHJQ=','2025-12-08 19:45:25.265907',0,'hola1234','yop','acuña','hola1234@gmail.com',0,1,'2025-11-25 14:19:51.296122'),
(11,'pbkdf2_sha256$1000000$LcpsGN9C6ylBlRGKmo7IAb$XKP0NGZGAZKb+gDB/ogGPV2oqhGMyBJpSuwfMDb/WLM=','2025-12-08 20:49:07.595424',0,'hola12345','yo2','acuña','hola12345@gmail.com',0,1,'2025-11-25 14:21:17.982885'),
(12,'pbkdf2_sha256$1000000$BifjBxWbfjQkFJGL5ZvNBr$joT8AP8wyWmj69s5XSWOThGCQQK2yKrnaB4ALezSxt8=','2025-12-02 23:43:42.561726',0,'juan.martinez','Juan','Martínez','juan.martinez@codelco-pro.cl',0,1,'2025-12-02 23:43:41.783451'),
(13,'pbkdf2_sha256$870000$O6sx83Q2pwodzGgYiva3Yh$KhRw2Uyi99Dls+yCPPVI87Sdz5TN/jEKEdXHnbYluc8=','2025-12-09 16:10:35.276309',0,'daniela.rojas','Daniela','Rojas','daniela.rojas@enel-postula.cl',0,1,'2025-12-02 23:45:53.791358'),
(14,'pbkdf2_sha256$1000000$KlEuxVMmWCTi3W48piO5h8$ZZnvFZVgQV2J6W6siVMRDA8kUwOkWLOmM4dnVdEWRH4=','2025-12-09 04:09:48.448027',0,'carlos.fuentes','Carlos','Fuentes','carlos.fuentes@aguaslicitaciones.cl',0,1,'2025-12-02 23:46:37.007843'),
(15,'pbkdf2_sha256$1000000$zBrZ0HqWiXqg8lzFQvb9uV$4/vhbV2JaV4rPF2jhPQIj5ZuIfpFV6VL0w3mKcDoEBc=','2025-12-08 20:50:20.059081',0,'maria.sepulveda','María','Sepúlveda','maria.sepulveda@bch-postula.cl',0,1,'2025-12-02 23:47:10.204242'),
(16,'pbkdf2_sha256$1000000$z3qvSo3jouS3PpgRKjGjAE$l1dFA/QGi1fhtH/dRhO4A3irg3kpXaLGMAxHvNwH4fM=','2025-12-02 23:47:50.666889',0,'pablo.alvarez','Pablo','Álvarez','pablo.alvarez@cmpc-pro.cl',0,1,'2025-12-02 23:47:49.812196'),
(17,'pbkdf2_sha256$1000000$w8khURbqzvQTNhzI4EE3e3$SLx33mbMm3p+sOo3njf/QrpvvbDdcEiOrJzMN/hwxb0=','2025-12-09 01:49:09.192013',0,'fernanda.munoz','Fernanda','Muñoz','fernanda.munoz@metrolicitaciones.cl',0,1,'2025-12-02 23:48:34.638014'),
(18,'pbkdf2_sha256$1000000$GJLlT7a0uJtpYKnN8hwphz$+fGfGnimz9ckj+Ap72DjPwi937wiuvwIWXKSekyclUQ=','2025-12-03 18:40:05.816884',0,'yasna.burgos','yasna','burgos','yasna.burgos@mail.udp.cl',0,1,'2025-12-03 18:40:04.871985'),
(19,'pbkdf2_sha256$1000000$uyAFOHx3KPxEMrwhRUoYed$CB+bIuLq19/D2ssP+e2enrTHU3sztyXS9lSBNlVAhZE=','2025-12-07 01:14:33.258693',0,'isa.villalobos','isai','villalobos','isa.villalobos@duocuc.cl',0,1,'2025-12-07 01:14:32.388716'),
(20,'pbkdf2_sha256$1000000$7CIywxTv5fxPjpsumb8InL$6Wlba3y/mpPCrbv0LmE+s5kx79ytwYwl/0vosGY4vD4=','2025-12-08 01:29:00.680177',0,'ricardo.castillo','Ricardo','Castillo','ricardo.castillo@sodimac-pro.cl',0,1,'2025-12-08 01:28:59.825600'),
(22,'pbkdf2_sha256$870000$m19LtBnPNKwoIKpefAYUjZ$c1tx8mquYq3C16howcCdG3WrxMJgJxZOAoHoaZ6HX/c=',NULL,0,'asd','clara','quintana','asd@gmail.com',0,1,'2025-12-09 18:45:04.752768'),
(23,'pbkdf2_sha256$870000$MGMOYVOkpkaYTLdTikm2sE$fTNf19AVEfJdKmTMpIS6p9b5ElfUvxW9e8N/YBJ7Wzk=',NULL,0,'es.quintana','esteban','quintana','es.quintana@duocuc.cl',0,1,'2025-12-09 18:46:25.490088');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `auth_user_groups` */

insert  into `auth_user_groups`(`id`,`user_id`,`group_id`) values 
(5,2,2),
(8,9,3),
(9,10,3),
(10,11,1),
(11,12,4),
(12,13,4),
(13,14,4),
(14,15,5),
(15,16,5),
(16,17,5),
(17,18,2),
(18,19,2),
(19,20,5),
(21,22,4),
(22,23,5);

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(15,'accounts','alertconfig'),
(14,'accounts','alertlog'),
(9,'accounts','auditlog'),
(8,'accounts','document'),
(24,'accounts','documentooficial'),
(19,'accounts','documentrevision'),
(17,'accounts','kpisnapshot'),
(25,'accounts','notificacion'),
(11,'accounts','organization'),
(18,'accounts','organizationmembership'),
(16,'accounts','prediction'),
(10,'accounts','profile'),
(21,'accounts','proposal'),
(13,'accounts','tender'),
(20,'accounts','tendercomment'),
(22,'accounts','tenderquestion'),
(12,'accounts','tenderstage'),
(7,'accounts','usuario'),
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(23,'mercadopublico','mplicitacion'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'accounts','0001_initial','2025-11-08 20:57:34.421906'),
(2,'accounts','0002_document','2025-11-08 20:57:34.445069'),
(3,'contenttypes','0001_initial','2025-11-08 20:57:34.477805'),
(4,'auth','0001_initial','2025-11-08 20:57:34.946997'),
(5,'admin','0001_initial','2025-11-08 20:57:35.053636'),
(6,'admin','0002_logentry_remove_auto_add','2025-11-08 20:57:35.059469'),
(7,'admin','0003_logentry_add_action_flag_choices','2025-11-08 20:57:35.064713'),
(8,'contenttypes','0002_remove_content_type_name','2025-11-08 20:57:35.160581'),
(9,'auth','0002_alter_permission_name_max_length','2025-11-08 20:57:35.302911'),
(10,'auth','0003_alter_user_email_max_length','2025-11-08 20:57:35.321975'),
(11,'auth','0004_alter_user_username_opts','2025-11-08 20:57:35.327841'),
(12,'auth','0005_alter_user_last_login_null','2025-11-08 20:57:35.378005'),
(13,'auth','0006_require_contenttypes_0002','2025-11-08 20:57:35.379762'),
(14,'auth','0007_alter_validators_add_error_messages','2025-11-08 20:57:35.384565'),
(15,'auth','0008_alter_user_username_max_length','2025-11-08 20:57:35.433593'),
(16,'auth','0009_alter_user_last_name_max_length','2025-11-08 20:57:35.488369'),
(17,'auth','0010_alter_group_name_max_length','2025-11-08 20:57:35.502112'),
(18,'auth','0011_update_proxy_permissions','2025-11-08 20:57:35.509325'),
(19,'auth','0012_alter_user_first_name_max_length','2025-11-08 20:57:35.563254'),
(20,'sessions','0001_initial','2025-11-08 20:57:35.592527'),
(21,'accounts','0003_alter_document_options_rename_nombre_document_name_and_more','2025-11-08 21:11:45.913613'),
(22,'accounts','0004_auditlog_profile','2025-11-14 01:16:24.533072'),
(23,'accounts','0005_organization','2025-11-14 01:48:26.916875'),
(24,'accounts','0006_tender_tenderstage','2025-11-14 01:57:11.767478'),
(25,'accounts','0007_alertconfig_alertlog','2025-11-15 17:11:18.748772'),
(26,'accounts','0008_prediction_kpisnapshot','2025-11-15 17:37:04.991311'),
(27,'accounts','0009_profile_run','2025-11-15 18:27:46.998601'),
(28,'accounts','0010_document_tender_organization_corporate_email_and_more','2025-11-16 02:03:40.290865'),
(29,'accounts','0011_document_sla_due_at_tender_external_id_and_more','2025-11-16 03:13:54.518861'),
(30,'accounts','0012_alertconfig_milestone_alertconfig_tender','2025-11-16 03:21:07.365067'),
(31,'accounts','0013_tendercomment','2025-11-16 03:36:45.634242'),
(32,'accounts','0014_add_proposal_and_category','2025-11-25 12:27:36.809649'),
(33,'accounts','0015_proposal_response_note','2025-11-25 14:53:58.424723'),
(34,'accounts','0016_tenderquestion','2025-11-25 17:28:33.790666'),
(35,'accounts','0017_proposal_document','2025-11-27 19:44:49.283831'),
(36,'accounts','0018_tender_created_by','2025-11-28 16:28:17.676043'),
(37,'mercadopublico','0001_initial','2025-12-05 19:51:58.495827'),
(38,'accounts','0019_documentooficial','2025-12-08 03:47:57.551054'),
(39,'accounts','0020_notificacion','2025-12-08 05:43:10.670949'),
(40,'accounts','0021_notificacion_target_url','2025-12-08 05:56:17.241150'),
(41,'accounts','0022_alter_notificacion_tipo','2025-12-08 22:12:46.409778'),
(42,'accounts','0023_alter_profile_empresa_entidad','2025-12-08 22:31:59.643022');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('0tx6d29ci4abxvwf17sf2ybn34jz0y9i','.eJxVjMsOwiAQRf-FtSEQZoBx6d5vIMNLqoYmpV0Z_12bdKHbe865LxF4W1vYRlnClMVZaBSn3zFyepS-k3znfptlmvu6TFHuijzokNc5l-flcP8OGo_2rcEBxmhqskRkSTnvKiAbb2wil9BBzRwVg2H2lLQicGx0LYqrJUTx_gDw2jeW:1vSiBY:lMnGR1iAJUGtptxc82esP0iHiGkagWZrdGYHKjKlSNc','2025-12-08 22:50:20.069109'),
('11dw4nj7kbibaw1f36iftz5y9je3i9jf','e30:1vLP3R:QGiwrikUfvObGfuayzusm1OfLQvdr4BsapWC8-lh9jY','2025-12-02 16:59:45.759781'),
('2vtxdxxb1yzod7bi6wl5ih7l0svfdlgn','e30:1vLP3M:vDsh8FKJ7TpMFts2PbRggUxQDXZyRFtObPEBCPbfDAU','2025-12-02 16:59:40.284403'),
('3axcg5eajq1j8dang7hzjex5ldjxf855','.eJxVjMsOwiAQRf-FtSEMb1y69xsIA4NUDU1KuzL-uzbpQrf3nHNfLKZtbXEbtMSpsDOT7PS7YcoP6jso99RvM89zX5cJ-a7wgw5-nQs9L4f7d9DSaN-awPugwWZtSqjKiaq9kEURCBMqJacSaHSQnSaLJoN0Slu0AUAGdMjeH8HnNuk:1vRDud:lRKWEg37acMXWWHdWYZUaumHIh21d6gSxNys8rHm8UY','2025-12-04 20:18:43.205739'),
('3cgfbhhxqqh1xd4old0dyx1u44ycj3jp','.eJxVjDEOAiEQRe9CbQiMQEZLe89ABmaQVQPJslsZ766bbKHtf-_9l4q0LjWuQ-Y4sTorUIffLVF-SNsA36ndus69LfOU9KbonQ597SzPy-7-HVQa9Vsna5BSDsYDYEHMhQQQmKw9ZUaTEIp3cCxEgcCW4oSdCUGCAW-9qPcH7Bo37g:1vLNAV:fez5N2vqTqAXyO2JHx55biovNDHCJAayG_E63rzakhM','2025-12-02 14:58:55.479921'),
('3df0e6lnsnfh8i8oylo82inguz6wunvy','.eJxVjMsOwiAQRf-FtSEMb1y69xsIA4NUDU1KuzL-uzbpQrf3nHNfLKZtbXEbtMSpsDOT7PS7YcoP6jso99RvM89zX5cJ-a7wgw5-nQs9L4f7d9DSaN-awPugwWZtSqjKiaq9kEURCBMqJacSaHSQnSaLJoN0Slu0AUAGdMjeH8HnNuk:1vSn9H:a_aveKTzh54yFlqVedaFgWCuXO3MMa0NYniXlho8wCs','2025-12-09 04:08:19.950387'),
('4dwwwj8lbhlvk0lzvp07sl7txin6j6e8','.eJxVjDkOwjAUBe_iGll4dyjpcwbrbyYBlEhxUiHuDpFSQPtm5r1UgW0dytZkKSOrizJOnX5HBHrItBO-w3SbNc3Tuoyod0UftOl-ZnleD_fvYIA2fOtoLXcglapJKbA33mVGk0zOkjqpCSpl9uICuIiVfIiULAaP9gyMpN4fF6o4zg:1vS3c6:KfbVor1UkTf4FeV6TIwQG_xwdTbNXaT-vAyweNpdM48','2025-12-07 03:31:02.164169'),
('4l6thsfd4im27pvf5ut0pbc54bksyik6','.eJxVjcsOgjAURP-la0O4bWmpOx9bguEHmj4uUpWS8NCF8d8tCQvdzpk58ybaLHOnlwlHHTzZE0p2v5k17o5xBf5m4nXI3BDnMdhsrWQbnbJq8Pg4bt0_QWemLq0RylJxEI4XXrVM5i0vc-oZQl6oFo1kBriV4CRHYQsHVDIurFAAVFlpk9T4PkT9DPjSfbpL0lNdXZrDuW7I5wvMmkCl:1vSiKE:p75AU7PiD88G0oNCJdR_whiTX3ZjF79T4NRnRJeEy8o','2025-12-08 22:59:18.969530'),
('4rmsaswnub8c8v408ks8pns7bbxq836u','.eJxVjDkOwjAUBe_iGll4dyjpcwbrbyYBlEhxUiHuDpFSQPtm5r1UgW0dytZkKSOrizJOnX5HBHrItBO-w3SbNc3Tuoyod0UftOl-ZnleD_fvYIA2fOtoLXcglapJKbA33mVGk0zOkjqpCSpl9uICuIiVfIiULAaP9gyMpN4fF6o4zg:1vShet:Ugp2qKu679zXQ3OX3BJC_Ubz01Md6uuSNAoME4VXViM','2025-12-08 22:16:35.895383'),
('50iz8d4s3tvo5q7dhth35124jxf4memp','e30:1vLP48:ZTuhPsB0sh5rY8RKlyVjUW4Um6Pq4tMxiaWzZWvnb8c','2025-12-02 17:00:28.206905'),
('6u72bn6ac3u90ohb8peuucuo6sxqofil','.eJxVjE0OwiAYRO_C2pAChYhL956BfD8gVQNJaVfGu7ckXdTdZN6b-YoA65LD2uIcJhY3oUZxOZcI9I6lE35BeVZJtSzzhLIr8qBNPirHz_1w_w4ytLyvB9KYwDoktyf2CTwAEiprDZEmBq9VYozIRpuBKKF13UkR6Aqj-G1d-Dqs:1vS3VJ:GiUDDgnuXT-VBoZ1WK21ZQXqIVXrZ7_oPSf3wP1c-MI','2025-12-07 03:24:01.494477'),
('700vpuuajfox1t2h9lmlq98pys7adaqq','.eJxVjDEOwjAMRe-SGUXGJK3FyM4ZIsd2SAG1UtNOiLtDpQ6w_vfef7nE61LT2mxOg7qzQ3f43TLLw8YN6J3H2-RlGpd5yH5T_E6bv05qz8vu_h1UbvVbG0TL_Slir2ilI6RjRtMQgFVMiQtpJKBSBCOIBAHNCJGCBegKu_cH-R84iQ:1vQaIQ:lzl1fw6CECC-aI8wXz10Vjk9FP2prlOmqTKqP1LNYwc','2025-12-17 00:00:38.770262'),
('7c5g3onndbgdr3ozaa5w6nsxmvhesg9a','.eJxVjDkOwjAUBe_iGll4dyjpcwbrbyYBlEhxUiHuDpFSQPtm5r1UgW0dytZkKSOrizJOnX5HBHrItBO-w3SbNc3Tuoyod0UftOl-ZnleD_fvYIA2fOtoLXcglapJKbA33mVGk0zOkjqpCSpl9uICuIiVfIiULAaP9gyMpN4fF6o4zg:1vSfeX:_-jxR0WI87cFSfHthPXpqxFjMfg0aCzTz3V0Ml1vQg8','2025-12-08 20:08:05.240187'),
('7y25ok6yjx5b6ltw64282ipyqxqp1jxg','.eJxVjMsOwiAQRf-FtSEQZoBx6d5vIMNLqoYmpV0Z_12bdKHbe865LxF4W1vYRlnClMVZaBSn3zFyepS-k3znfptlmvu6TFHuijzokNc5l-flcP8OGo_2rcEBxmhqskRkSTnvKiAbb2wil9BBzRwVg2H2lLQicGx0LYqrJUTx_gDw2jeW:1vRE9r:LoxnBjwxOLPIwg89fgmIeuvfpzyAXs67zv9MdoaLSIs','2025-12-04 20:34:27.117709'),
('85w1jlu6fj2xw65xp3fq0jtfw2jwywi9','.eJxVjEsOwjAMBe-SNYrU5uOaJXvOENmOSwsokZp2hbg7VOoCtm9m3ssk2tYpbU2XNGdzNh2Y0-_IJA8tO8l3KrdqpZZ1mdnuij1os9ea9Xk53L-Didr0rR30wSH67Am7MEZEADd46jWiG0SigENVlC4KqwIyK4SRxA19BGXz_gDo6TgR:1vSmmC:dRrKY7mcnXOUmiD030j-PpGcHmwHN0SfHn1w2Je6QOw','2025-12-09 03:44:28.457923'),
('99h6sc608ebch4gnk34lcsfk2dkexorg','.eJxVjcsOwiAQRf-FtWmGIhTc-dg2Nf0BQmfQopYmfejC-O_SpAtd3WTumXPfzLp5au08-sEGYjuWs83vrXF493Ep6Obitc-wj9MQmmxBsrUds7In_zis7J-gdWObvlEScIXqglpdlCtyj2QAoBBGKYOaE2jgZsuFIK_zRhIKCU6CSpGIJHXUhWifwb9sl-aS9FiV53p_qmr2-QLVGEBv:1vT033:9tnZqEg3FVomedNf_MRvyitq_ENqlBb-mW8mYdjjTMw','2025-12-09 17:54:45.044960'),
('ad5umeyyo5vnw2pierypkb7xlf1zvueo','.eJxVjMsOwiAQRf-FtSEMb1y69xsIA4NUDU1KuzL-uzbpQrf3nHNfLKZtbXEbtMSpsDOT7PS7YcoP6jso99RvM89zX5cJ-a7wgw5-nQs9L4f7d9DSaN-awPugwWZtSqjKiaq9kEURCBMqJacSaHSQnSaLJoN0Slu0AUAGdMjeH8HnNuk:1vSQlQ:WmL1K7PdTmYFyX6WQCuDb33JAhNdXmmZ5ufFYxcMOUA','2025-12-08 04:14:12.823130'),
('b94drvarwo7aulw8l3724kultcckzzan','e30:1vLP8L:Ai11rlxRe-4FFZqw_zqHfy_wDEj4gSywegc9QkfojYI','2025-12-02 17:04:49.623177'),
('cqoyw6yuauxgl0nh5qcrbpmrr7kglak3','e30:1vLPEN:An3EIVncc6JDrOsXEoSuKTctPJIkpps7x0BEPNF_5bE','2025-12-02 17:11:03.807117'),
('dtvx3a0s38pgdowe6l42855hr7bva38t','.eJxVjMsOwiAQRf-FtSEMb1y69xsIA4NUDU1KuzL-uzbpQrf3nHNfLKZtbXEbtMSpsDOT7PS7YcoP6jso99RvM89zX5cJ-a7wgw5-nQs9L4f7d9DSaN-awPugwWZtSqjKiaq9kEURCBMqJacSaHSQnSaLJoN0Slu0AUAGdMjeH8HnNuk:1vSkZH:Mln3r48vz0vtFJBBOwNBJlU13bBYHXDJZxHYAgsN6zQ','2025-12-09 01:22:59.173872'),
('e9m1yrgubidcm2q7kujhqzvy5ttvdzmq','e30:1vLP3R:QGiwrikUfvObGfuayzusm1OfLQvdr4BsapWC8-lh9jY','2025-12-02 16:59:45.187817'),
('esxr3nwnvqnroxm9qhphnkylk3i8quw7','.eJxVjMsKwyAQAP_Fc5F1SdT02Hu_QdbVrWmLQh6n0H8vQg7tdWaYQwXatxL2NS9hTuqqjFGXXxiJX7l2k55UH01zq9syR90TfdpV31vK79vZ_g0KraV_icGCQXFOyI5G3MRxEI8DgXACFDuyh4wO0KTBSuQII3oBTJPPVn2-At439Q:1vRWmu:Ocv14AHDdoF2UBo_xgii0ZviwSIGXITIX2afkFIxLR0','2025-12-05 16:28:00.030040'),
('gbkw9w57z2vyqayro5i5wgc9eul0ghb9','.eJxVjMsOwiAQRf-FtSEMb1y69xsIA4NUDU1KuzL-uzbpQrf3nHNfLKZtbXEbtMSpsDOT7PS7YcoP6jso99RvM89zX5cJ-a7wgw5-nQs9L4f7d9DSaN-awPugwWZtSqjKiaq9kEURCBMqJacSaHSQnSaLJoN0Slu0AUAGdMjeH8HnNuk:1vSdQp:VOT7P3Pr9B-PY08oyugnE7a5DCYDBUtx8oZSHtYShuY','2025-12-08 17:45:47.994176'),
('gv5wvwp47fquqjp8zet6ch25ozinf84f','.eJxVjMsOwiAQRf-FtSEMb1y69xsIA4NUDU1KuzL-uzbpQrf3nHNfLKZtbXEbtMSpsDOT7PS7YcoP6jso99RvM89zX5cJ-a7wgw5-nQs9L4f7d9DSaN-awPugwWZtSqjKiaq9kEURCBMqJacSaHSQnSaLJoN0Slu0AUAGdMjeH8HnNuk:1vS3pj:4gCAxEi6D_MyajJCiloeJOQkh46sd7h1zPhP7DvMXnE','2025-12-07 03:45:07.484508'),
('gwdsu0qwfbswsff9ebcltyz4o96gr5kl','.eJxVjE0OwiAYRO_C2pAChYhL956BfD8gVQNJaVfGu7ckXdTdZN6b-YoA65LD2uIcJhY3oUZxOZcI9I6lE35BeVZJtSzzhLIr8qBNPirHz_1w_w4ytLyvB9KYwDoktyf2CTwAEiprDZEmBq9VYozIRpuBKKF13UkR6Aqj-G1d-Dqs:1vSmFt:5FJQS7exFKbKLsbXcvBmAySq6M_qBQs1muJLjJfbXYA','2025-12-09 03:11:05.117070'),
('hh918msl29hr8weza6w78lme4jz3obwo','.eJxVjDsOwjAQBe_iGln-xD9Kes5grXdtHEC2FCcV4u4QKQW0b2bei0XY1hq3kZc4EzszKdjpd0yAj9x2Qndot86xt3WZE98VftDBr53y83K4fwcVRv3WBZUICZTPEkrKJCbtrHXoFdHkwaHFoqFkhZjIJPJeOOFJCyUNmRDY-wMwCDjD:1vP2hv:sIDaI1PvGTPU1PoRVN-TGX67ls9woiwM6NPZyju-aAc','2025-12-12 17:56:35.432533'),
('ivfsvos1j51t9xew1dudlj9cs0nv5mk0','.eJxVjEEOwiAQRe_C2hAgHWBcuvcMhIFBqgaS0q6Md9cmXej2v_f-S4S4rTVsg5cwZ3EWWonT70gxPbjtJN9ju3WZeluXmeSuyIMOee2Zn5fD_TuocdRvXRAc80RWgcFiyCs0nCxoRjCKdS7eEVgzecxWu0gmMyhmjdopJBDvD_eMN4g:1vRa6K:Tw-lBgdZKXtUUYBw3vy4KQ7iNpP-QNcIDZB8G3PB9sU','2025-12-05 20:00:16.261067'),
('jqly1a2glgjl5618v4r3lf2q676n88iq','.eJxVjDEOAiEQRe9CbQiMQEZLe89ABmaQVQPJslsZ766bbKHtf-_9l4q0LjWuQ-Y4sTorUIffLVF-SNsA36ndus69LfOU9KbonQ597SzPy-7-HVQa9Vsna5BSDsYDYEHMhQQQmKw9ZUaTEIp3cCxEgcCW4oSdCUGCAW-9qPcH7Bo37g:1vLAMV:_rxQNPj2mUfL0FaC-cPOTu4878rCmUY9uX77_qUw2wI','2025-12-02 01:18:27.310611'),
('ksp68zriy15w4qxa98p3ugbfugx87h6k','.eJxVjEsOAiEQBe_C2hC6CQgu3XsGQtONjJohmc9q4t11klno9lXV21TK69LSOsuUBlYXBUGdfkfK5SnjTviRx3vXpY_LNJDeFX3QWd86y-t6uH8HLc_tWzsWg7GQQzA5VoPWMYJFlHMMzJ5iZQAjAcBZ5EKmSiBPKNkzRK_eH_u7N_Y:1vQrll:LKctDQA52WLv31xgYjTxPxVcgRH8VBR1foQ98dQI9XI','2025-12-17 18:40:05.834674'),
('n16eibtf9fflduz7aowyobuh9m0zv7g8','e30:1vLP3N:T0in4banzj3gG5IwZuv1Yji1MxJtoHpEHKLc_rlaSL4','2025-12-02 16:59:41.868837'),
('nnflk9jzejudp66w7fl2dq0r03j7pbrz','.eJxVjEEOwiAQRe_C2hAgHWBcuvcMhIFBqgaS0q6Md9cmXej2v_f-S4S4rTVsg5cwZ3EWWonT70gxPbjtJN9ju3WZeluXmeSuyIMOee2Zn5fD_TuocdRvXRAc80RWgcFiyCs0nCxoRjCKdS7eEVgzecxWu0gmMyhmjdopJBDvD_eMN4g:1vShAj:Rq8Oan6E7SKy1gBDR4ggVSWSEf6kkZQ-yZLGVNVmA6Q','2025-12-08 21:45:25.276874'),
('o616us3sd84o5e9jgi4o6385h84q41mq','e30:1vLP3R:QGiwrikUfvObGfuayzusm1OfLQvdr4BsapWC8-lh9jY','2025-12-02 16:59:45.612742'),
('og0db4eu1vrh2irz75bko19h98fpbc1k','.eJxVjEEOwiAQRe_C2hAgHWBcuvcMhIFBqgaS0q6Md9cmXej2v_f-S4S4rTVsg5cwZ3EWWonT70gxPbjtJN9ju3WZeluXmeSuyIMOee2Zn5fD_TuocdRvXRAc80RWgcFiyCs0nCxoRjCKdS7eEVgzecxWu0gmMyhmjdopJBDvD_eMN4g:1vRa6L:x9K9QGUe46HQXha-TkCnt--Veh7TMQEomKxPYFHVBE4','2025-12-05 20:00:17.837322'),
('onw83bhbdtm0dqskvwn1le1mrc468hh8','.eJxVjcsOgjAURP-la0O4bWmpOx9bguEHmj4uUpWS8NCF8d8tCQvdzpk58ybaLHOnlwlHHTzZE0p2v5k17o5xBf5m4nXI3BDnMdhsrWQbnbJq8Pg4bt0_QWemLq0RylJxEI4XXrVM5i0vc-oZQl6oFo1kBriV4CRHYQsHVDIurFAAVFlpk9T4PkT9DPjSfbpL0lNdXZrDuW7I5wvMmkCl:1vSoJ9:XPuSCNW7ebb44y_NVUyZa4KmxGz1UpJwAe7KSMWSZdg','2025-12-09 05:22:35.236213'),
('oxui654ppvk1rxlrcntgywkqotndszbk','e30:1vLP3R:QGiwrikUfvObGfuayzusm1OfLQvdr4BsapWC8-lh9jY','2025-12-02 16:59:45.494846'),
('px17cr9njz20o4ttt8jz86tbaen6glvw','.eJxVjMsOwiAQRf-FtSEMb1y69xsIA4NUDU1KuzL-uzbpQrf3nHNfLKZtbXEbtMSpsDOT7PS7YcoP6jso99RvM89zX5cJ-a7wgw5-nQs9L4f7d9DSaN-awPugwWZtSqjKiaq9kEURCBMqJacSaHSQnSaLJoN0Slu0AUAGdMjeH8HnNuk:1vRb7S:0UD9PEsxV9hGsGhmu64OZAq5kCDVcwZGm-vmEqoUsy0','2025-12-05 21:05:30.489133'),
('qruqjglvtduhbekmomuys4b5304varoe','.eJxVjcsOgjAURP-la0O4bWmpOx9bguEHmj4uUpWS8NCF8d8tCQvdzpk58ybaLHOnlwlHHTzZE0p2v5k17o5xBf5m4nXI3BDnMdhsrWQbnbJq8Pg4bt0_QWemLq0RylJxEI4XXrVM5i0vc-oZQl6oFo1kBriV4CRHYQsHVDIurFAAVFlpk9T4PkT9DPjSfbpL0lNdXZrDuW7I5wvMmkCl:1vSU4m:7Piin5M3sEc7s0iMmKOqlVBGNO62s7DAuOUXL4aXAIQ','2025-12-08 07:46:24.468526'),
('qws69dsblhkfipbneptp63o4wfs3fr1e','.eJxVjMsOwiAQRf-FtSEMb1y69xsIA4NUDU1KuzL-uzbpQrf3nHNfLKZtbXEbtMSpsDOT7PS7YcoP6jso99RvM89zX5cJ-a7wgw5-nQs9L4f7d9DSaN-awPugwWZtSqjKiaq9kEURCBMqJacSaHSQnSaLJoN0Slu0AUAGdMjeH8HnNuk:1vRWWS:J3-mtPYTVjZa2m8Dc_yvM7yLnfa7r6oC8vTyZBNi_PE','2025-12-05 16:11:00.922629'),
('rcopz1xhjrarmjyktunjlfpt2n2ilbzd','.eJxVjMEOwiAQRP-FsyELyBY8evcbCOxSqRqalPZk_Hdp0oOeJpn3Zt4ixG0tYWt5CROLi9Di9NulSM9cd8CPWO-zpLmuy5TkrsiDNnmbOb-uh_t3UGIrfU2WQSHhSA5HjIPOxB4ABuMRPTnF4ED5szKGs9PJMhkL0QL26Ib4fAHQuTaz:1vT0He:LFEvxvlqeKElejQTYZaUsRpsOzpzsXogmESssaRqeLI','2025-12-09 18:09:50.711064'),
('rrjikf7wcpl7c5bt1qh2ecp2vjvxxmbb','.eJxVjDEOwjAMRe-SGUXGJK3FyM4ZIsd2SAG1UtNOiLtDpQ6w_vfef7nE61LT2mxOg7qzQ3f43TLLw8YN6J3H2-RlGpd5yH5T_E6bv05qz8vu_h1UbvVbG0TL_Slir2ilI6RjRtMQgFVMiQtpJKBSBCOIBAHNCJGCBegKu_cH-R84iQ:1vQshw:MSqJl3a9wDgNK3a9JXZTaYS5F9b-KQAmxg-yfZ37QcA','2025-12-17 19:40:12.039044'),
('ruzm32y4fg9nsteg1pwfaosd8z5e09uq','.eJxVjMEOwiAQBf-FsyEsBQoevfcbCAuLVA0kpT0Z_92Q9KDXNzPvzXw49uKPTptfE7syAHb5HTHEJ9VB0iPUe-Ox1X1bkQ-Fn7TzpSV63U7376CEXkaNLjoAazKh0C4onGbQhkhjgqwMCWlTFhElhkk4zORUjKikmck6pdnnCx3LOJo:1vOInl:Ioean-gJJDOwNsFnZQFejf18yZeT4fVBRAaONTfqrRU','2025-12-10 16:55:33.115395'),
('s13zbcnktmerb1em8btbta1c8829o50u','.eJxVjcsOgjAURP-la0O4bWmpSyNLg2HhtunjIlUpCQ9dGP_dkrDQ7ZyZM2-izTJ3eplw1MGTPaFk95tZ4-4YV-BvJl6HzA1xHoPN1kq20Sk7DR4fh637J-jM1KU1QlkqDsLxwquWybzlZU49Q8gL1aKRzAC3EpzkKGzhgErGhRUKgCorbZIa34eonwFfuk93SXpu6ktVHeuGfL7NRkC0:1vRWY4:LSvtcu-lre_Dm7tjqQAKHhQhr0P93tAuUa3O_LrEQag','2025-12-05 16:12:40.803761'),
('se6kd5r8mscn0ju4mpjk9q7wkq6aj891','.eJxVjMEOwiAQRP-FsyELyBY8evcbCOxSqRqalPZk_Hdp0oOeJpn3Zt4ixG0tYWt5CROLi9Di9NulSM9cd8CPWO-zpLmuy5TkrsiDNnmbOb-uh_t3UGIrfU2WQSHhSA5HjIPOxB4ABuMRPTnF4ED5szKGs9PJMhkL0QL26Ib4fAHQuTaz:1vT2rP:ScegfLRc8uBEiwdnGy4t2yAZ4QukVimvIXkyA8TQ3Ww','2025-12-09 20:54:55.393493'),
('ss9hsnzhjd61vaxgi51fwrx3v3tz2ueb','.eJxVjMsOwiAQRf-FtSEMb1y69xsIA4NUDU1KuzL-uzbpQrf3nHNfLKZtbXEbtMSpsDOT7PS7YcoP6jso99RvM89zX5cJ-a7wgw5-nQs9L4f7d9DSaN-awPugwWZtSqjKiaq9kEURCBMqJacSaHSQnSaLJoN0Slu0AUAGdMjeH8HnNuk:1vS3pt:nBreexACBLvO6s9KYYtGhtcHX0QIGSY9pbZ99ZXRJLI','2025-12-07 03:45:17.763284'),
('t0md88mgbmizc5472t08o6srxj8a9tyl','.eJxVjMsKwyAQAP_Fc5F1SdT02Hu_QdbVrWmLQh6n0H8vQg7tdWaYQwXatxL2NS9hTuqqjFGXXxiJX7l2k55UH01zq9syR90TfdpV31vK79vZ_g0KraV_icGCQXFOyI5G3MRxEI8DgXACFDuyh4wO0KTBSuQII3oBTJPPVn2-At439Q:1vRWms:srModCk-Bju9MgECrY9Nsj_HuDqy2dA-QJlcGtJE-YQ','2025-12-05 16:27:58.893297'),
('toclkn4x1pjojf2en0rv4f3n9x51fvdi','.eJxVjE0OwiAYRO_C2pAChYhL956BfD8gVQNJaVfGu7ckXdTdZN6b-YoA65LD2uIcJhY3oUZxOZcI9I6lE35BeVZJtSzzhLIr8qBNPirHz_1w_w4ytLyvB9KYwDoktyf2CTwAEiprDZEmBq9VYozIRpuBKKF13UkR6Aqj-G1d-Dqs:1vSkkp:Wzu4M5tU_XF1b3jrKWh9qvcgFqAcDiDO9zgnmt9Xf4I','2025-12-09 01:34:55.573637'),
('uovb0x6kiim6f6g4mfq9kodfukq111jk','.eJxVjMsOwiAQRf-FtSEMb1y69xsIA4NUDU1KuzL-uzbpQrf3nHNfLKZtbXEbtMSpsDOT7PS7YcoP6jso99RvM89zX5cJ-a7wgw5-nQs9L4f7d9DSaN-awPugwWZtSqjKiaq9kEURCBMqJacSaHSQnSaLJoN0Slu0AUAGdMjeH8HnNuk:1vSgqU:Qhu5XHTdlAco8PUA5CyU5nJ67a1xsjQLUn4qpe6qYwU','2025-12-08 21:24:30.265021'),
('upx8lf8b21r78rupd56df86g9l4vnt9g','.eJxVjcsOgjAURP-la0O4bWmpOx9bguEHmj4uUpWS8NCF8d8tCQvdzpk58ybaLHOnlwlHHTzZE0p2v5k17o5xBf5m4nXI3BDnMdhsrWQbnbJq8Pg4bt0_QWemLq0RylJxEI4XXrVM5i0vc-oZQl6oFo1kBriV4CRHYQsHVDIurFAAVFlpk9T4PkT9DPjSfbpL0lNdXZrDuW7I5wvMmkCl:1vSOAI:KE5nmnchg-xVDITn5sSy80rfKQMzXCC7_VSyZjBCNqI','2025-12-08 01:27:42.858919'),
('ur27qtldhd8yeg4pnthlhc0i2sdf77oa','.eJxVjEEOwiAQRe_C2hAgHWBcuvcMhIFBqgaS0q6Md9cmXej2v_f-S4S4rTVsg5cwZ3EWWonT70gxPbjtJN9ju3WZeluXmeSuyIMOee2Zn5fD_TuocdRvXRAc80RWgcFiyCs0nCxoRjCKdS7eEVgzecxWu0gmMyhmjdopJBDvD_eMN4g:1vRagR:S8HPHdARJMhhGBelGFslhVBL94FxbC45Iy5qgYALXak','2025-12-05 20:37:35.661222'),
('uvxz6f7ygmeinsaq2e3t19lyz20etsdh','.eJxVjMEOwiAQBf-FsyEsBQoevfcbCAuLVA0kpT0Z_92Q9KDXNzPvzXw49uKPTptfE7syAHb5HTHEJ9VB0iPUe-Ox1X1bkQ-Fn7TzpSV63U7376CEXkaNLjoAazKh0C4onGbQhkhjgqwMCWlTFhElhkk4zORUjKikmck6pdnnCx3LOJo:1vNu8J:gtOAQNd_fnsLwz8vdBvonXWN06FTJgp8NZy2F2t-Beg','2025-12-09 14:35:07.116523'),
('vqf5vnzlvuwxvlb2kiu5d0ldhywd1z5p','.eJxVjEEOwiAQRe_C2hAgHWBcuvcMhIFBqgaS0q6Md9cmXej2v_f-S4S4rTVsg5cwZ3EWWonT70gxPbjtJN9ju3WZeluXmeSuyIMOee2Zn5fD_TuocdRvXRAc80RWgcFiyCs0nCxoRjCKdS7eEVgzecxWu0gmMyhmjdopJBDvD_eMN4g:1vSfBI:nzq_iH7j1MxGfm5Qee7DXGGU8UZJLkpK2l-plL3OluY','2025-12-08 19:37:52.324017'),
('vuzey9tm0ge314ofpjfhr0nn47aq412a','.eJxVjEEOwiAQRe_C2pAOSAku3XsGMswMUjWQlHbVeHdt0oVu_3vvbyriupS4dpnjxOqivDr9bgnpKXUH_MB6b5paXeYp6V3RB-361lhe18P9OyjYy7e2KMZbRyEzJ0yOwA52dJABjMlnCOQGsJ5EQh69cWQzB6SQMjCAC-r9AetGN_0:1vLPZa:nHge5Ev0zGUUSHXk_Vxz2rO9W9XJTcpvK2Q5YK-0jc0','2025-12-02 17:32:58.373445'),
('x55heuewmw6y3a1i5v4mqa35r7r5u0bm','.eJxVjDsOwjAQBe_iGln-xD9Kes5grXdtHEC2FCcV4u4QKQW0b2bei0XY1hq3kZc4EzszKdjpd0yAj9x2Qndot86xt3WZE98VftDBr53y83K4fwcVRv3WBZUICZTPEkrKJCbtrHXoFdHkwaHFoqFkhZjIJPJeOOFJCyUNmRDY-wMwCDjD:1vNwuB:UdEQybhkO6b2LFXV1uvfBdJafLsPhYBRTJiRwJ5BnSo','2025-12-09 17:32:43.588001'),
('xo1bvn0os00e1ng1yfke5h78l0krxoce','e30:1vLP3R:QGiwrikUfvObGfuayzusm1OfLQvdr4BsapWC8-lh9jY','2025-12-02 16:59:45.914571'),
('xtusmbn5mvi3ezg5ylnjfbe5bh4gd2fu','.eJxVjMEOwiAQRP-FsyELyBY8evcbCOxSqRqalPZk_Hdp0oOeJpn3Zt4ixG0tYWt5CROLi9Di9NulSM9cd8CPWO-zpLmuy5TkrsiDNnmbOb-uh_t3UGIrfU2WQSHhSA5HjIPOxB4ABuMRPTnF4ED5szKGs9PJMhkL0QL26Ib4fAHQuTaz:1vT2ob:NbTgHjgh6JP-7_jSoYHA-BAFx-Gj9Z3bmZTM5bHiHG8','2025-12-09 20:52:01.083691'),
('xv2cp6mbiulx971st45670gm32v9naer','e30:1vLP3P:Ezvvaie8rQyVCAYGJRdTe9jPkh-pSwz53XI4lBPiLbM','2025-12-02 16:59:43.666519'),
('z8d30pyhkzj9sfy2txo3jn6ru665epfn','.eJxVjDkOwjAUBe_iGll4dyjpcwbrbyYBlEhxUiHuDpFSQPtm5r1UgW0dytZkKSOrizJOnX5HBHrItBO-w3SbNc3Tuoyod0UftOl-ZnleD_fvYIA2fOtoLXcglapJKbA33mVGk0zOkjqpCSpl9uICuIiVfIiULAaP9gyMpN4fF6o4zg:1vSRKW:8Z3sA7p7AV7PQFhu2Pn1NPaAbTvuPbCVL6g78y2jGnk','2025-12-08 04:50:28.494815'),
('zk2votmud8oxyl1rc407q49n8w5honlj','.eJxVjE0OwiAYRO_C2pAChYhL956BfD8gVQNJaVfGu7ckXdTdZN6b-YoA65LD2uIcJhY3oUZxOZcI9I6lE35BeVZJtSzzhLIr8qBNPirHz_1w_w4ytLyvB9KYwDoktyf2CTwAEiprDZEmBq9VYozIRpuBKKF13UkR6Aqj-G1d-Dqs:1vSp2q:NbFwZPQN3KFXRGYTELIb6GdKCHtnAx3PIOl_ZWNqTOs','2025-12-09 06:09:48.485106'),
('zmqdlu6kdwiazd78xa6vf10yq2ivczft','.eJxVjEEOwiAQRe_C2hAGkIJL9z0DmYFBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERVpx-N8L04LaDfMd2m2Wa27pMJHdFHrTLcc78vB7u30HFXr_1OUBmO7hMpiTDziSrqQQFwGipWBVUccUkwMGz9sRZJUYNrAuwBy_eH_jROIo:1vJiRK:gkssXXStfLd-I7quwsJVrFf6_8qXcex-n09I7_Gl50o','2025-11-28 01:17:26.849578'),
('zvwxkszfujopr956ccemx78nzjx8y1z0','.eJxVjcsOgjAURP-la0O4bWmpOx9bguEHmj4uUpWS8NCF8d8tCQvdzpk58ybaLHOnlwlHHTzZE0p2v5k17o5xBf5m4nXI3BDnMdhsrWQbnbJq8Pg4bt0_QWemLq0RylJxEI4XXrVM5i0vc-oZQl6oFo1kBriV4CRHYQsHVDIurFAAVFlpk9T4PkT9DPjSfbpL0lNdXZrDuW7I5wvMmkCl:1vSoGW:y4q-dGxrHCtn13910r52FjCXNU6WIIXSt147Y4H65O0','2025-12-09 05:19:52.076050');

/*Table structure for table `etapas` */

DROP TABLE IF EXISTS `etapas`;

CREATE TABLE `etapas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orden` int DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `etapas` */

insert  into `etapas`(`id`,`codigo`,`nombre`,`orden`,`activo`) values 
(1,'CREACION','Creación',1,1),
(2,'POSTULACION','Postulación',2,1),
(3,'REVISION','Revisión',3,1),
(4,'CIERRE','Cierre',4,1);

/*Table structure for table `kpi_snapshots` */

DROP TABLE IF EXISTS `kpi_snapshots`;

CREATE TABLE `kpi_snapshots` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `licitaciones_activas` int DEFAULT NULL,
  `cumplimiento_doc` decimal(5,2) DEFAULT NULL,
  `tasa_adjudicacion` decimal(5,2) DEFAULT NULL,
  `tiempo_respuesta_h` decimal(8,2) DEFAULT NULL,
  `creado_en` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `kpi_snapshots` */

/*Table structure for table `mp_licitaciones` */

DROP TABLE IF EXISTS `mp_licitaciones`;

CREATE TABLE `mp_licitaciones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci,
  `estado` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `organismo_codigo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `organismo_nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_publicacion` datetime(6) DEFAULT NULL,
  `fecha_cierre` datetime(6) DEFAULT NULL,
  `monto_estimado` decimal(18,2) DEFAULT NULL,
  `raw_json` json NOT NULL,
  `fecha_sync` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `mp_licitaciones` */

/*Table structure for table `organizaciones` */

DROP TABLE IF EXISTS `organizaciones`;

CREATE TABLE `organizaciones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rut` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` enum('PUBLICA','PRIVADA') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'PUBLICA',
  `direccion` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comuna` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creado_en` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rut` (`rut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `organizaciones` */

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rut` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol` enum('ADMIN','FUNCIONARIO','LICITANTE','POSTULANTE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'POSTULANTE',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `creado_en` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rut` (`rut`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `usuarios` */

/*Table structure for table `bi_dim_empresa` */

DROP TABLE IF EXISTS `bi_dim_empresa`;

/*!50001 DROP VIEW IF EXISTS `bi_dim_empresa` */;
/*!50001 DROP TABLE IF EXISTS `bi_dim_empresa` */;

/*!50001 CREATE TABLE  `bi_dim_empresa`(
 `empresa_id` bigint ,
 `nombre_empresa` varchar(180) ,
 `rut_empresa` varchar(15) ,
 `tipo_empresa` enum('PUBLICA','PRIVADA') 
)*/;

/*Table structure for table `bi_dim_licitacion` */

DROP TABLE IF EXISTS `bi_dim_licitacion`;

/*!50001 DROP VIEW IF EXISTS `bi_dim_licitacion` */;
/*!50001 DROP TABLE IF EXISTS `bi_dim_licitacion` */;

/*!50001 CREATE TABLE  `bi_dim_licitacion`(
 `licitacion_id` bigint ,
 `codigo_licitacion` varchar(40) ,
 `titulo` varchar(220) ,
 `descripcion` longtext ,
 `tipo_proceso` varchar(4) ,
 `estado` varchar(15) ,
 `fecha_publicacion` date ,
 `fecha_cierre` date ,
 `monto_referencial` decimal(14,2) ,
 `moneda` varchar(4) ,
 `categoria` varchar(40) ,
 `empresa_licitante_id` bigint ,
 `fecha_creacion` date 
)*/;

/*Table structure for table `bi_dim_tiempo` */

DROP TABLE IF EXISTS `bi_dim_tiempo`;

/*!50001 DROP VIEW IF EXISTS `bi_dim_tiempo` */;
/*!50001 DROP TABLE IF EXISTS `bi_dim_tiempo` */;

/*!50001 CREATE TABLE  `bi_dim_tiempo`(
 `fecha` date ,
 `anio` int ,
 `mes` int ,
 `dia` int ,
 `semana` int ,
 `dia_nombre` varchar(9) ,
 `mes_nombre` varchar(9) 
)*/;

/*Table structure for table `bi_dim_usuario` */

DROP TABLE IF EXISTS `bi_dim_usuario`;

/*!50001 DROP VIEW IF EXISTS `bi_dim_usuario` */;
/*!50001 DROP TABLE IF EXISTS `bi_dim_usuario` */;

/*!50001 CREATE TABLE  `bi_dim_usuario`(
 `usuario_id` int ,
 `username` varchar(150) ,
 `first_name` varchar(150) ,
 `last_name` varchar(150) ,
 `email` varchar(254) ,
 `rut_usuario` varchar(12) ,
 `empresa_asociada_id` bigint ,
 `fecha_registro` datetime(6) 
)*/;

/*Table structure for table `bi_fact_alertas` */

DROP TABLE IF EXISTS `bi_fact_alertas`;

/*!50001 DROP VIEW IF EXISTS `bi_fact_alertas` */;
/*!50001 DROP TABLE IF EXISTS `bi_fact_alertas` */;

/*!50001 CREATE TABLE  `bi_fact_alertas`(
 `alerta_log_id` bigint ,
 `alerta_id` bigint ,
 `usuario_id` bigint ,
 `tipo_alerta` varchar(60) ,
 `canal` enum('APP','EMAIL') ,
 `resultado` enum('ENVIADA','FALLIDA') ,
 `detalle` varchar(255) ,
 `fecha_alerta` date 
)*/;

/*Table structure for table `bi_fact_propuestas` */

DROP TABLE IF EXISTS `bi_fact_propuestas`;

/*!50001 DROP VIEW IF EXISTS `bi_fact_propuestas` */;
/*!50001 DROP TABLE IF EXISTS `bi_fact_propuestas` */;

/*!50001 CREATE TABLE  `bi_fact_propuestas`(
 `propuesta_id` bigint ,
 `licitacion_id` bigint ,
 `usuario_id` int ,
 `monto_ofertado` decimal(14,2) ,
 `estado_propuesta` varchar(20) ,
 `fecha_envio` date 
)*/;

/*View structure for view bi_dim_empresa */

/*!50001 DROP TABLE IF EXISTS `bi_dim_empresa` */;
/*!50001 DROP VIEW IF EXISTS `bi_dim_empresa` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bi_dim_empresa` AS select `o`.`id` AS `empresa_id`,`o`.`nombre` AS `nombre_empresa`,`o`.`rut` AS `rut_empresa`,`o`.`tipo` AS `tipo_empresa` from `organizaciones` `o` */;

/*View structure for view bi_dim_licitacion */

/*!50001 DROP TABLE IF EXISTS `bi_dim_licitacion` */;
/*!50001 DROP VIEW IF EXISTS `bi_dim_licitacion` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bi_dim_licitacion` AS select `t`.`id` AS `licitacion_id`,`t`.`code` AS `codigo_licitacion`,`t`.`title` AS `titulo`,`t`.`description` AS `descripcion`,`t`.`process_type` AS `tipo_proceso`,`t`.`status` AS `estado`,`t`.`publish_at` AS `fecha_publicacion`,`t`.`close_at` AS `fecha_cierre`,`t`.`budget_amount` AS `monto_referencial`,`t`.`budget_currency` AS `moneda`,`t`.`category` AS `categoria`,`t`.`buyer_id` AS `empresa_licitante_id`,cast(`t`.`created_at` as date) AS `fecha_creacion` from `accounts_tender` `t` */;

/*View structure for view bi_dim_tiempo */

/*!50001 DROP TABLE IF EXISTS `bi_dim_tiempo` */;
/*!50001 DROP VIEW IF EXISTS `bi_dim_tiempo` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bi_dim_tiempo` AS with recursive `fechas` as (select cast('2025-01-01' as date) AS `fecha` union all select (`fechas`.`fecha` + interval 1 day) AS `DATE_ADD(fecha, INTERVAL 1 DAY)` from `fechas` where (`fechas`.`fecha` < '2025-12-31')) select `fechas`.`fecha` AS `fecha`,year(`fechas`.`fecha`) AS `anio`,month(`fechas`.`fecha`) AS `mes`,dayofmonth(`fechas`.`fecha`) AS `dia`,week(`fechas`.`fecha`,0) AS `semana`,dayname(`fechas`.`fecha`) AS `dia_nombre`,monthname(`fechas`.`fecha`) AS `mes_nombre` from `fechas` */;

/*View structure for view bi_dim_usuario */

/*!50001 DROP TABLE IF EXISTS `bi_dim_usuario` */;
/*!50001 DROP VIEW IF EXISTS `bi_dim_usuario` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bi_dim_usuario` AS select `u`.`id` AS `usuario_id`,`u`.`username` AS `username`,`u`.`first_name` AS `first_name`,`u`.`last_name` AS `last_name`,`u`.`email` AS `email`,`p`.`run` AS `rut_usuario`,`p`.`empresa_entidad_id` AS `empresa_asociada_id`,`u`.`date_joined` AS `fecha_registro` from (`auth_user` `u` left join `accounts_profile` `p` on((`p`.`user_id` = `u`.`id`))) */;

/*View structure for view bi_fact_alertas */

/*!50001 DROP TABLE IF EXISTS `bi_fact_alertas` */;
/*!50001 DROP VIEW IF EXISTS `bi_fact_alertas` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bi_fact_alertas` AS select `l`.`id` AS `alerta_log_id`,`l`.`alerta_id` AS `alerta_id`,`c`.`usuario_id` AS `usuario_id`,`c`.`tipo_alerta` AS `tipo_alerta`,`c`.`canal` AS `canal`,`l`.`resultado` AS `resultado`,`l`.`detalle` AS `detalle`,cast(`l`.`creado_en` as date) AS `fecha_alerta` from (`alertas_log` `l` left join `alertas_config` `c` on((`c`.`id` = `l`.`alerta_id`))) */;

/*View structure for view bi_fact_propuestas */

/*!50001 DROP TABLE IF EXISTS `bi_fact_propuestas` */;
/*!50001 DROP VIEW IF EXISTS `bi_fact_propuestas` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bi_fact_propuestas` AS select `p`.`id` AS `propuesta_id`,`p`.`tender_id` AS `licitacion_id`,`p`.`supplier_id` AS `usuario_id`,`p`.`amount` AS `monto_ofertado`,`p`.`status` AS `estado_propuesta`,cast(`p`.`created_at` as date) AS `fecha_envio` from `accounts_proposal` `p` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
