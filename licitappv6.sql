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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `accounts_alertconfig` */

insert  into `accounts_alertconfig`(`id`,`name`,`trigger`,`threshold_minutes`,`channel`,`active`,`recipients`,`notes`,`created_at`,`updated_at`,`milestone`,`tender_id`) values 
(1,'BIg data','doc',60,'slack',1,'','jhjhjhjhj','2025-11-18 01:28:23.567583','2025-11-18 01:28:23.567598','',2);

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(12,'info','Tu propuesta para 1361 fue Aceptada','{\"tender_id\": 7, \"proposal_id\": 4, \"supplier_id\": 11}','2025-12-01 12:28:38.887085',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(168,'yop acuña','tender_create','creó la licitación 2.','{\"tender_id\": 9}','2025-12-02 19:45:01.633653');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `accounts_document` */

insert  into `accounts_document`(`id`,`name`,`version`,`updated_at`,`content_type`,`created_at`,`doc_type`,`file`,`owner`,`size_bytes`,`state`,`tender_id`,`sla_due_at`) values 
(1,'hola','1.0','2025-11-16 07:46:50.301565','image/png','2025-11-16 07:46:50.305930','Bases','docs/2025/11/Captura_de_pantalla_2025-11-15_125134.png','yo',41423,'ok',NULL,NULL),
(2,'Bases 123456789','','2025-11-28 15:08:56.571223','application/vnd.openxmlformats-officedocument.wordprocessingml.document','2025-11-28 15:08:56.602963','Bases','docs/2025/11/hola1234.docx','yop acuña',13609,'ok',NULL,NULL),
(3,'Bases 123456789asd','','2025-11-28 15:22:22.785424','application/vnd.openxmlformats-officedocument.wordprocessingml.document','2025-11-28 15:22:22.791822','Bases','docs/2025/11/hola1234_kCEFB8f.docx','yop acuña',13609,'ok',6,NULL),
(4,'Bases 1361','','2025-11-28 17:57:30.541758','application/vnd.openxmlformats-officedocument.wordprocessingml.document','2025-11-28 17:57:30.563668','Bases','docs/2025/11/hola1234_kCEFB8f_FSXPiWB.docx','yop acuña',13609,'ok',7,NULL),
(5,'Bases 1','','2025-12-02 19:27:10.968791','application/vnd.openxmlformats-officedocument.wordprocessingml.document','2025-12-02 19:27:10.973434','Bases','docs/2025/12/hola1234.docx','yop acuña',13609,'ok',8,NULL),
(6,'Bases 2','','2025-12-02 19:45:01.619340','application/vnd.openxmlformats-officedocument.wordprocessingml.document','2025-12-02 19:45:01.627067','Bases','docs/2025/12/hola1234_hacD2NA.docx','yop acuña',13609,'ok',9,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `accounts_organization` */

insert  into `accounts_organization`(`id`,`name`,`short_name`,`tax_id`,`org_type`,`industry`,`contact_name`,`contact_email`,`contact_phone`,`website`,`address`,`status`,`notes`,`created_at`,`updated_at`,`corporate_email`) values 
(1,'hola','asd','123456789','empresa','asd','','','123456789','','casa123','suspendido','','2025-11-16 02:04:50.806002','2025-11-16 02:04:57.301186','acunajavier542@gmail.com');

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
  `empresa_entidad` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `run` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `run` (`run`),
  CONSTRAINT `accounts_profile_user_id_49a85d32_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `accounts_profile` */

insert  into `accounts_profile`(`id`,`empresa_entidad`,`user_id`,`run`) values 
(8,'agrolujuma',10,'20558616-4'),
(9,'meatcorp',11,'21269243-3');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `accounts_proposal` */

insert  into `accounts_proposal`(`id`,`amount`,`category`,`description`,`status`,`created_at`,`updated_at`,`supplier_id`,`tender_id`,`response_note`,`document`) values 
(2,2123451564.00,'otros','hola xd','enviada','2025-11-25 20:08:41.894346','2025-11-25 20:10:10.325888',11,3,'',NULL),
(3,657657657.00,'tecnologia','hola123456788','enviada','2025-11-25 23:39:04.766893','2025-11-27 19:47:46.020713',11,4,'','proposals/2025/11/hola1234_kCEFB8f.docx'),
(4,0.00,'otros','','aceptada','2025-11-28 17:58:26.634621','2025-12-01 12:28:38.882433',11,7,'Propuesta aceptada','proposals/2025/11/hola1234_YUKINzm.docx');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `accounts_tender` */

insert  into `accounts_tender`(`id`,`code`,`title`,`description`,`process_type`,`status`,`publish_at`,`close_at`,`budget_amount`,`budget_currency`,`has_winner`,`created_at`,`updated_at`,`buyer_id`,`external_id`,`sla_due_at`,`category`,`created_by_id`) values 
(1,'1234','hola1','asdasdsadas','lp','publicada','2025-11-17','2025-11-30',1000.00,'CLP',0,'2025-11-18 01:26:38.275411','2025-11-18 01:26:38.275426',1,'2','2025-11-18','otros',NULL),
(2,'12345','hola12','asdasdsadas','lp','publicada','2025-11-17','2025-11-30',10007.00,'CLP',0,'2025-11-18 01:27:52.049997','2025-11-18 01:28:02.698093',1,'22','2025-11-18','otros',NULL),
(3,'546546','el pepe','prueba','lc','publicada','2025-11-25','2025-11-30',100000000.00,'CLP',1,'2025-11-25 17:34:24.813458','2025-11-25 17:34:24.813485',NULL,'','2025-12-28','tecnologia',NULL),
(4,'1234567','prueba1','preuab','lp','publicada','2025-11-25','2025-11-29',100000000.00,'CLP',1,'2025-11-25 23:23:38.023387','2025-11-25 23:23:38.023413',NULL,'ola','2025-11-30','tecnologia',NULL),
(6,'123456789asd','pruba_aviso2','hola soy yo','lp','publicada','2025-11-28','2025-11-30',1000000.00,'CLP',0,'2025-11-28 15:22:22.745554','2025-11-28 17:55:09.945174',NULL,'',NULL,'transporte',NULL),
(7,'1361','prueba3','prueba1231','lp','cerrada','2025-11-28','2025-11-30',1000000.00,'CLP',0,'2025-11-28 17:57:30.535284','2025-12-01 12:28:38.845285',NULL,'',NULL,'otros',10),
(8,'1','prueba3','pruebasdasd','lc','borrador','2025-12-02','2025-12-30',1000.00,'CLP',0,'2025-12-02 19:27:10.940569','2025-12-02 19:27:10.940595',NULL,'',NULL,'evento',10),
(9,'2','hola','holaaa','lc','publicada','2025-12-02','2025-12-30',10000.00,'CLP',0,'2025-12-02 19:45:01.608585','2025-12-02 19:45:01.608808',NULL,'',NULL,'transporte',10);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `auth_group` */

insert  into `auth_group`(`id`,`name`) values 
(2,'Administrador'),
(1,'Empresa Postulante'),
(3,'Entidad Licitante');

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
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(93,'Can view tender question',22,'view_tenderquestion');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(2,'pbkdf2_sha256$870000$zYhjsHaZRdnw06tAaRN1gF$cqWEwVtS78iEeOtzihYY124tT2LCeABwA5e/WVDcauI=','2025-11-28 15:30:40.325719',1,'admin','Javier','acuña','admin@admin.cl',1,1,'2025-11-13 00:59:23.420733'),
(9,'pbkdf2_sha256$870000$28XPHkjYrjW20XqbSEOLWn$R3BUtdQu2+iPDfjiSDzI2ckub7L88QsLzkDcb5/b0ZQ=','2025-11-18 23:13:17.583030',0,'duocuc','isai','lobos','duocuc@gmail.com',0,1,'2025-11-18 23:13:16.956836'),
(10,'pbkdf2_sha256$870000$upjvgbyS5VnIxVIJaLdK0B$ywjULmJbrkFDMM11zCs6kp98swlEjNu53WJ3POGGG3o=','2025-11-28 17:56:36.521212',0,'hola1234','yop','acuña','hola1234@gmail.com',0,1,'2025-11-25 14:19:51.296122'),
(11,'pbkdf2_sha256$870000$4wPhr8EJFA2PEaOaNTUMCh$eKZGrRuVzfC+htOTm+SvuIUzRyj9biIoCxhiR26xRP8=','2025-11-26 16:55:33.092934',0,'hola12345','yo2','acuña','hola12345@gmail.com',0,1,'2025-11-25 14:21:17.982885');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `auth_user_groups` */

insert  into `auth_user_groups`(`id`,`user_id`,`group_id`) values 
(5,2,2),
(8,9,3),
(9,10,3),
(10,11,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(15,'accounts','alertconfig'),
(14,'accounts','alertlog'),
(9,'accounts','auditlog'),
(8,'accounts','document'),
(19,'accounts','documentrevision'),
(17,'accounts','kpisnapshot'),
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
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(36,'accounts','0018_tender_created_by','2025-11-28 16:28:17.676043');

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
('11dw4nj7kbibaw1f36iftz5y9je3i9jf','e30:1vLP3R:QGiwrikUfvObGfuayzusm1OfLQvdr4BsapWC8-lh9jY','2025-12-02 16:59:45.759781'),
('2vtxdxxb1yzod7bi6wl5ih7l0svfdlgn','e30:1vLP3M:vDsh8FKJ7TpMFts2PbRggUxQDXZyRFtObPEBCPbfDAU','2025-12-02 16:59:40.284403'),
('3cgfbhhxqqh1xd4old0dyx1u44ycj3jp','.eJxVjDEOAiEQRe9CbQiMQEZLe89ABmaQVQPJslsZ766bbKHtf-_9l4q0LjWuQ-Y4sTorUIffLVF-SNsA36ndus69LfOU9KbonQ597SzPy-7-HVQa9Vsna5BSDsYDYEHMhQQQmKw9ZUaTEIp3cCxEgcCW4oSdCUGCAW-9qPcH7Bo37g:1vLNAV:fez5N2vqTqAXyO2JHx55biovNDHCJAayG_E63rzakhM','2025-12-02 14:58:55.479921'),
('50iz8d4s3tvo5q7dhth35124jxf4memp','e30:1vLP48:ZTuhPsB0sh5rY8RKlyVjUW4Um6Pq4tMxiaWzZWvnb8c','2025-12-02 17:00:28.206905'),
('b94drvarwo7aulw8l3724kultcckzzan','e30:1vLP8L:Ai11rlxRe-4FFZqw_zqHfy_wDEj4gSywegc9QkfojYI','2025-12-02 17:04:49.623177'),
('cqoyw6yuauxgl0nh5qcrbpmrr7kglak3','e30:1vLPEN:An3EIVncc6JDrOsXEoSuKTctPJIkpps7x0BEPNF_5bE','2025-12-02 17:11:03.807117'),
('e9m1yrgubidcm2q7kujhqzvy5ttvdzmq','e30:1vLP3R:QGiwrikUfvObGfuayzusm1OfLQvdr4BsapWC8-lh9jY','2025-12-02 16:59:45.187817'),
('fsxzrv68gsn6xok2d61dt725p920bq95','.eJxVjMEOwiAQBf-FsyEsBQoevfcbCAuLVA0kpT0Z_92Q9KDXNzPvzXw49uKPTptfE7syAHb5HTHEJ9VB0iPUe-Ox1X1bkQ-Fn7TzpSV63U7376CEXkaNLjoAazKh0C4onGbQhkhjgqwMCWlTFhElhkk4zORUjKikmck6pdnnCx3LOJo:1vO2bP:hrNG3yUarJDRF9g_7SP2mDolmj3Q2RzJjcMTV7SZByo','2025-12-09 23:37:43.688713'),
('hh918msl29hr8weza6w78lme4jz3obwo','.eJxVjDsOwjAQBe_iGln-xD9Kes5grXdtHEC2FCcV4u4QKQW0b2bei0XY1hq3kZc4EzszKdjpd0yAj9x2Qndot86xt3WZE98VftDBr53y83K4fwcVRv3WBZUICZTPEkrKJCbtrHXoFdHkwaHFoqFkhZjIJPJeOOFJCyUNmRDY-wMwCDjD:1vP2hv:sIDaI1PvGTPU1PoRVN-TGX67ls9woiwM6NPZyju-aAc','2025-12-12 17:56:35.432533'),
('jqly1a2glgjl5618v4r3lf2q676n88iq','.eJxVjDEOAiEQRe9CbQiMQEZLe89ABmaQVQPJslsZ766bbKHtf-_9l4q0LjWuQ-Y4sTorUIffLVF-SNsA36ndus69LfOU9KbonQ597SzPy-7-HVQa9Vsna5BSDsYDYEHMhQQQmKw9ZUaTEIp3cCxEgcCW4oSdCUGCAW-9qPcH7Bo37g:1vLAMV:_rxQNPj2mUfL0FaC-cPOTu4878rCmUY9uX77_qUw2wI','2025-12-02 01:18:27.310611'),
('n16eibtf9fflduz7aowyobuh9m0zv7g8','e30:1vLP3N:T0in4banzj3gG5IwZuv1Yji1MxJtoHpEHKLc_rlaSL4','2025-12-02 16:59:41.868837'),
('o616us3sd84o5e9jgi4o6385h84q41mq','e30:1vLP3R:QGiwrikUfvObGfuayzusm1OfLQvdr4BsapWC8-lh9jY','2025-12-02 16:59:45.612742'),
('oxui654ppvk1rxlrcntgywkqotndszbk','e30:1vLP3R:QGiwrikUfvObGfuayzusm1OfLQvdr4BsapWC8-lh9jY','2025-12-02 16:59:45.494846'),
('q5ia2y1a6g2szguoerdkjt2vrmp252pf','.eJxVjDsOwjAQBe_iGln-xD9Kes5grXdtHEC2FCcV4u4QKQW0b2bei0XY1hq3kZc4EzszKdjpd0yAj9x2Qndot86xt3WZE98VftDBr53y83K4fwcVRv3WBZUICZTPEkrKJCbtrHXoFdHkwaHFoqFkhZjIJPJeOOFJCyUNmRDY-wMwCDjD:1vP2hw:xxw0S-U6QAY0Lz4vYf2zbDYsUh2CYIlYEkHFWPH8fMs','2025-12-12 17:56:36.530018'),
('ruzm32y4fg9nsteg1pwfaosd8z5e09uq','.eJxVjMEOwiAQBf-FsyEsBQoevfcbCAuLVA0kpT0Z_92Q9KDXNzPvzXw49uKPTptfE7syAHb5HTHEJ9VB0iPUe-Ox1X1bkQ-Fn7TzpSV63U7376CEXkaNLjoAazKh0C4onGbQhkhjgqwMCWlTFhElhkk4zORUjKikmck6pdnnCx3LOJo:1vOInl:Ioean-gJJDOwNsFnZQFejf18yZeT4fVBRAaONTfqrRU','2025-12-10 16:55:33.115395'),
('uvxz6f7ygmeinsaq2e3t19lyz20etsdh','.eJxVjMEOwiAQBf-FsyEsBQoevfcbCAuLVA0kpT0Z_92Q9KDXNzPvzXw49uKPTptfE7syAHb5HTHEJ9VB0iPUe-Ox1X1bkQ-Fn7TzpSV63U7376CEXkaNLjoAazKh0C4onGbQhkhjgqwMCWlTFhElhkk4zORUjKikmck6pdnnCx3LOJo:1vNu8J:gtOAQNd_fnsLwz8vdBvonXWN06FTJgp8NZy2F2t-Beg','2025-12-09 14:35:07.116523'),
('vuzey9tm0ge314ofpjfhr0nn47aq412a','.eJxVjEEOwiAQRe_C2pAOSAku3XsGMswMUjWQlHbVeHdt0oVu_3vvbyriupS4dpnjxOqivDr9bgnpKXUH_MB6b5paXeYp6V3RB-361lhe18P9OyjYy7e2KMZbRyEzJ0yOwA52dJABjMlnCOQGsJ5EQh69cWQzB6SQMjCAC-r9AetGN_0:1vLPZa:nHge5Ev0zGUUSHXk_Vxz2rO9W9XJTcpvK2Q5YK-0jc0','2025-12-02 17:32:58.373445'),
('x55heuewmw6y3a1i5v4mqa35r7r5u0bm','.eJxVjDsOwjAQBe_iGln-xD9Kes5grXdtHEC2FCcV4u4QKQW0b2bei0XY1hq3kZc4EzszKdjpd0yAj9x2Qndot86xt3WZE98VftDBr53y83K4fwcVRv3WBZUICZTPEkrKJCbtrHXoFdHkwaHFoqFkhZjIJPJeOOFJCyUNmRDY-wMwCDjD:1vNwuB:UdEQybhkO6b2LFXV1uvfBdJafLsPhYBRTJiRwJ5BnSo','2025-12-09 17:32:43.588001'),
('xo1bvn0os00e1ng1yfke5h78l0krxoce','e30:1vLP3R:QGiwrikUfvObGfuayzusm1OfLQvdr4BsapWC8-lh9jY','2025-12-02 16:59:45.914571'),
('xv2cp6mbiulx971st45670gm32v9naer','e30:1vLP3P:Ezvvaie8rQyVCAYGJRdTe9jPkh-pSwz53XI4lBPiLbM','2025-12-02 16:59:43.666519'),
('zmqdlu6kdwiazd78xa6vf10yq2ivczft','.eJxVjEEOwiAQRe_C2hAGkIJL9z0DmYFBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERVpx-N8L04LaDfMd2m2Wa27pMJHdFHrTLcc78vB7u30HFXr_1OUBmO7hMpiTDziSrqQQFwGipWBVUccUkwMGz9sRZJUYNrAuwBy_eH_jROIo:1vJiRK:gkssXXStfLd-I7quwsJVrFf6_8qXcex-n09I7_Gl50o','2025-11-28 01:17:26.849578');

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

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
