-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.19 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla combustiblemobile.cuenta_corriente
CREATE TABLE IF NOT EXISTS `cuenta_corriente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int(10) unsigned NOT NULL,
  `linea` int(10) unsigned NOT NULL DEFAULT '1',
  `usuario_id_destino` int(10) unsigned DEFAULT NULL,
  `usuario_id_origen` int(10) unsigned DEFAULT NULL,
  `estacion_id` int(10) unsigned DEFAULT NULL,
  `usuario_id_consumidor` int(10) unsigned DEFAULT NULL,
  `comentarios` varchar(200) COLLATE utf8_unicode_ci DEFAULT '',
  `tipo_movimiento` enum('transferencia','consumo','deposito','extraccion') COLLATE utf8_unicode_ci NOT NULL,
  `saldo` double(8,2) NOT NULL DEFAULT '0.00',
  `monto` double(8,2) NOT NULL DEFAULT '0.00',
  `audi_usuario_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cuenta_corriente_usuario_id_index` (`usuario_id`),
  KEY `linea` (`usuario_id`),
  KEY `cuenta_corriente_audi_usuario_id_foreign` (`audi_usuario_id`),
  CONSTRAINT `cuenta_corriente_audi_usuario_id_foreign` FOREIGN KEY (`audi_usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `cuenta_corriente_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla combustiblemobile.cuenta_corriente: ~40 rows (aproximadamente)
/*!40000 ALTER TABLE `cuenta_corriente` DISABLE KEYS */;
INSERT INTO `cuenta_corriente` (`id`, `usuario_id`, `linea`, `usuario_id_destino`, `usuario_id_origen`, `estacion_id`, `usuario_id_consumidor`, `comentarios`, `tipo_movimiento`, `saldo`, `monto`, `audi_usuario_id`, `created_at`, `updated_at`) VALUES
	(1, 5, 1, NULL, NULL, NULL, NULL, 'Deposito Inicial', 'deposito', 20000.00, 20000.00, 1, '2018-08-27 00:50:56', '2018-08-27 00:50:56'),
	(2, 6, 1, NULL, NULL, NULL, NULL, 'Deposito Inicial', 'deposito', 20000.00, 20000.00, 1, '2018-08-27 00:50:56', '2018-08-27 00:50:56'),
	(3, 7, 1, NULL, NULL, NULL, NULL, 'Deposito Inicial', 'deposito', 20000.00, 20000.00, 1, '2018-08-27 00:50:56', '2018-08-27 00:50:56'),
	(4, 8, 1, NULL, NULL, NULL, NULL, 'Deposito Inicial', 'deposito', 20000.00, 20000.00, 1, '2018-08-27 00:50:56', '2018-08-27 00:50:56'),
	(5, 9, 1, NULL, NULL, NULL, NULL, 'Deposito Inicial', 'deposito', 20000.00, 20000.00, 1, '2018-08-27 00:50:57', '2018-08-27 00:50:57'),
	(6, 10, 1, NULL, NULL, NULL, NULL, 'Deposito Inicial', 'deposito', 20000.00, 20000.00, 1, '2018-08-27 00:50:57', '2018-08-27 00:50:57'),
	(7, 11, 1, NULL, NULL, NULL, NULL, 'Deposito Inicial', 'deposito', 20000.00, 20000.00, 1, '2018-08-27 00:50:57', '2018-08-27 00:50:57'),
	(8, 12, 1, NULL, NULL, NULL, NULL, 'Deposito Inicial', 'deposito', 20000.00, 20000.00, 1, '2018-08-27 00:50:57', '2018-08-27 00:50:57'),
	(9, 13, 1, NULL, NULL, NULL, NULL, 'Deposito Inicial', 'deposito', 20000.00, 20000.00, 1, '2018-08-27 00:50:57', '2018-08-27 00:50:57'),
	(10, 14, 1, NULL, NULL, NULL, NULL, 'Deposito Inicial', 'deposito', 20000.00, 20000.00, 1, '2018-08-27 00:50:57', '2018-08-27 00:50:57'),
	(11, 5, 2, NULL, NULL, 2, 16, 'Consumo Estacion: SHELL', 'consumo', 18000.00, -2000.00, 1, '2018-08-27 00:50:59', '2018-08-27 00:50:59'),
	(12, 6, 2, NULL, NULL, 2, 23, 'Consumo Estacion: SHELL', 'consumo', 18000.00, -2000.00, 1, '2018-08-27 00:50:59', '2018-08-27 00:50:59'),
	(13, 7, 2, NULL, NULL, 2, 27, 'Consumo Estacion: SHELL', 'consumo', 18000.00, -2000.00, 1, '2018-08-27 00:50:59', '2018-08-27 00:50:59'),
	(14, 8, 2, NULL, NULL, 2, 32, 'Consumo Estacion: SHELL', 'consumo', 18000.00, -2000.00, 1, '2018-08-27 00:50:59', '2018-08-27 00:50:59'),
	(15, 9, 2, NULL, NULL, 2, 35, 'Consumo Estacion: SHELL', 'consumo', 18000.00, -2000.00, 1, '2018-08-27 00:50:59', '2018-08-27 00:50:59'),
	(16, 10, 2, NULL, NULL, 2, 40, 'Consumo Estacion: SHELL', 'consumo', 18000.00, -2000.00, 1, '2018-08-27 00:50:59', '2018-08-27 00:50:59'),
	(17, 11, 2, NULL, NULL, 2, 42, 'Consumo Estacion: SHELL', 'consumo', 18000.00, -2000.00, 1, '2018-08-27 00:50:59', '2018-08-27 00:50:59'),
	(18, 12, 2, NULL, NULL, 2, 52, 'Consumo Estacion: SHELL', 'consumo', 18000.00, -2000.00, 1, '2018-08-27 00:50:59', '2018-08-27 00:50:59'),
	(19, 13, 2, NULL, NULL, 2, 53, 'Consumo Estacion: SHELL', 'consumo', 18000.00, -2000.00, 1, '2018-08-27 00:51:00', '2018-08-27 00:51:00'),
	(20, 14, 2, NULL, NULL, 2, 62, 'Consumo Estacion: SHELL', 'consumo', 18000.00, -2000.00, 1, '2018-08-27 00:51:00', '2018-08-27 00:51:00'),
	(21, 5, 3, 8, NULL, NULL, NULL, 'Egreso por Transferencia a : 8', 'transferencia', 14000.00, -4000.00, 1, '2018-08-27 00:51:02', '2018-08-27 00:51:02'),
	(22, 8, 3, NULL, 5, NULL, NULL, 'Ingreso por Transferencia de : 5', 'transferencia', 22000.00, 4000.00, 1, '2018-08-27 00:51:02', '2018-08-27 00:51:02'),
	(23, 6, 3, 7, NULL, NULL, NULL, 'Egreso por Transferencia a : 7', 'transferencia', 14000.00, -4000.00, 1, '2018-08-27 00:51:02', '2018-08-27 00:51:02'),
	(24, 7, 3, NULL, 6, NULL, NULL, 'Ingreso por Transferencia de : 6', 'transferencia', 22000.00, 4000.00, 1, '2018-08-27 00:51:02', '2018-08-27 00:51:02'),
	(25, 7, 4, 7, NULL, NULL, NULL, 'Egreso por Transferencia a : 7', 'transferencia', 18000.00, -4000.00, 1, '2018-08-27 00:51:02', '2018-08-27 00:51:02'),
	(26, 7, 4, NULL, 7, NULL, NULL, 'Ingreso por Transferencia de : 7', 'transferencia', 26000.00, 4000.00, 1, '2018-08-27 00:51:02', '2018-08-27 00:51:02'),
	(27, 8, 4, 8, NULL, NULL, NULL, 'Egreso por Transferencia a : 8', 'transferencia', 18000.00, -4000.00, 1, '2018-08-27 00:51:02', '2018-08-27 00:51:02'),
	(28, 8, 4, NULL, 8, NULL, NULL, 'Ingreso por Transferencia de : 8', 'transferencia', 26000.00, 4000.00, 1, '2018-08-27 00:51:02', '2018-08-27 00:51:02'),
	(29, 9, 3, 12, NULL, NULL, NULL, 'Egreso por Transferencia a : 12', 'transferencia', 14000.00, -4000.00, 1, '2018-08-27 00:51:02', '2018-08-27 00:51:02'),
	(30, 12, 3, NULL, 9, NULL, NULL, 'Ingreso por Transferencia de : 9', 'transferencia', 22000.00, 4000.00, 1, '2018-08-27 00:51:02', '2018-08-27 00:51:02'),
	(31, 10, 3, 10, NULL, NULL, NULL, 'Egreso por Transferencia a : 10', 'transferencia', 14000.00, -4000.00, 1, '2018-08-27 00:51:02', '2018-08-27 00:51:02'),
	(32, 10, 3, NULL, 10, NULL, NULL, 'Ingreso por Transferencia de : 10', 'transferencia', 22000.00, 4000.00, 1, '2018-08-27 00:51:02', '2018-08-27 00:51:02'),
	(33, 11, 3, 5, NULL, NULL, NULL, 'Egreso por Transferencia a : 5', 'transferencia', 14000.00, -4000.00, 1, '2018-08-27 00:51:02', '2018-08-27 00:51:02'),
	(34, 5, 4, NULL, 11, NULL, NULL, 'Ingreso por Transferencia de : 11', 'transferencia', 18000.00, 4000.00, 1, '2018-08-27 00:51:02', '2018-08-27 00:51:02'),
	(35, 12, 4, 6, NULL, NULL, NULL, 'Egreso por Transferencia a : 6', 'transferencia', 18000.00, -4000.00, 1, '2018-08-27 00:51:02', '2018-08-27 00:51:02'),
	(36, 6, 4, NULL, 12, NULL, NULL, 'Ingreso por Transferencia de : 12', 'transferencia', 18000.00, 4000.00, 1, '2018-08-27 00:51:02', '2018-08-27 00:51:02'),
	(37, 13, 3, 10, NULL, NULL, NULL, 'Egreso por Transferencia a : 10', 'transferencia', 14000.00, -4000.00, 1, '2018-08-27 00:51:02', '2018-08-27 00:51:02'),
	(38, 10, 4, NULL, 13, NULL, NULL, 'Ingreso por Transferencia de : 13', 'transferencia', 18000.00, 4000.00, 1, '2018-08-27 00:51:02', '2018-08-27 00:51:02'),
	(39, 14, 3, 14, NULL, NULL, NULL, 'Egreso por Transferencia a : 14', 'transferencia', 14000.00, -4000.00, 1, '2018-08-27 00:51:02', '2018-08-27 00:51:02'),
	(40, 14, 3, NULL, 14, NULL, NULL, 'Ingreso por Transferencia de : 14', 'transferencia', 22000.00, 4000.00, 1, '2018-08-27 00:51:02', '2018-08-27 00:51:02'),
	(41, 5, 5, NULL, NULL, NULL, NULL, NULL, 'extraccion', 5677.00, -12323.00, 1, '2018-08-27 01:17:29', '2018-08-27 01:17:29'),
	(42, 5, 6, NULL, NULL, NULL, NULL, NULL, 'deposito', 18000.00, 12323.00, 1, '2018-08-27 01:17:38', '2018-08-27 01:17:38');
/*!40000 ALTER TABLE `cuenta_corriente` ENABLE KEYS */;

-- Volcando estructura para tabla combustiblemobile.estaciones
CREATE TABLE IF NOT EXISTS `estaciones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla combustiblemobile.estaciones: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `estaciones` DISABLE KEYS */;
INSERT INTO `estaciones` (`id`, `codigo`, `nombre`, `created_at`, `updated_at`) VALUES
	(1, 'EST01', 'YPF', '2018-08-27 00:50:48', '2018-08-27 00:50:48'),
	(2, 'EST02', 'SHELL', '2018-08-27 00:50:48', '2018-08-27 00:50:48'),
	(3, 'EST03', 'AXION', '2018-08-27 00:50:48', '2018-08-27 00:50:48');
/*!40000 ALTER TABLE `estaciones` ENABLE KEYS */;

-- Volcando estructura para tabla combustiblemobile.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla combustiblemobile.migrations: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(109, '2014_10_12_000000_create_usuarios_table', 1),
	(110, '2014_10_12_100000_create_password_resets_table', 1),
	(111, '2018_07_07_004840_create_estaciones_table', 1),
	(112, '2018_07_07_005955_create_cuenta_corriente_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Volcando estructura para tabla combustiblemobile.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla combustiblemobile.password_resets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Volcando estructura para tabla combustiblemobile.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dni` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rol` enum('administrador','usuario','expendedor','cuenta_principal') COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `comentarios` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `cuenta_principal_id` int(10) unsigned DEFAULT NULL,
  `es_cuenta_principal` tinyint(1) NOT NULL DEFAULT '0',
  `estacion_id` int(10) unsigned DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuarios_dni_unique` (`dni`),
  UNIQUE KEY `usuarios_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla combustiblemobile.usuarios: ~64 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `dni`, `email`, `password`, `rol`, `nombre`, `comentarios`, `cuenta_principal_id`, `es_cuenta_principal`, `estacion_id`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, '12345678', 'admin@combustibleMobile.deb', '$2y$10$zzRJVITMPPhJyZG06NDdt.TSEKOXenpEpb/kqfmUXsKI3WwGN7yRO', 'administrador', 'Eduardo Jerez', '', NULL, 0, NULL, 'Otosif9Yhm', '2018-08-27 00:50:49', '2018-08-27 00:50:49'),
	(2, '99999999', 'sebastian.purdy@example.org', '$2y$10$Pf.BDxYDK2E273U94NEQfuF2CI6WQpAoH.Cb7Zb.Cf6M4BSLUGmay', 'expendedor', 'Prof. Elta Kerluke I', '', NULL, 0, 1, 'qQApHUPT7O', '2018-08-27 00:50:49', '2018-08-27 00:50:49'),
	(3, '88888888', 'halle85@example.com', '$2y$10$2RejgZhv23/HKDEY/alQX.oX9RAHf265SRMLvuVBqxAnujEQf6zR.', 'expendedor', 'Prof. Abe Bins DDS', '', NULL, 0, 2, 'zWt13iDTh4', '2018-08-27 00:50:49', '2018-08-27 00:50:49'),
	(4, '77777777', 'davis.fred@example.com', '$2y$10$4sk02mooYge3154eE4l8UOQxks3sJ0LYaf2.fgICmYBPQ2XrHGBvG', 'expendedor', 'Lenore Wisoky', '', NULL, 0, 3, 'yDNyre1dBv', '2018-08-27 00:50:49', '2018-08-27 00:50:49'),
	(5, '60497353', 'kuphal.davin@example.org', '$2y$10$e/BjB9vSt/M7v0RGPPdZeOM4/Rk5Q01MJz6jcPnPmmcwi2AhiwaYG', 'cuenta_principal', 'Ms. Lucy Gutkowski', '', NULL, 1, NULL, 'osmbiHMZuF', '2018-08-27 00:50:50', '2018-08-27 00:50:50'),
	(6, '06766149', 'alvah73@example.org', '$2y$10$GRv6kLec43dHcA.KueSV.OABgovjJx9.QCHvKBfkemdgK57Wm8DJe', 'cuenta_principal', 'Miss Tabitha Haag', '', NULL, 1, NULL, 'pWcHQ1jFaa', '2018-08-27 00:50:50', '2018-08-27 00:50:50'),
	(7, '44889194', 'wisoky.elyse@example.com', '$2y$10$DIn1bbWwgynyrQc/4oYUmeRrAC0xf4F7DatzgJwEMVLQt/tWHgj6S', 'cuenta_principal', 'Mariam Kris', '', NULL, 1, NULL, 'TpA48utMdE', '2018-08-27 00:50:50', '2018-08-27 00:50:50'),
	(8, '81442052', 'kautzer.rahsaan@example.org', '$2y$10$K3yihE2jbgkinV0yHo6nauH2ODT8pNqYeRkcIMtCN7Qbij5P1vqBK', 'cuenta_principal', 'Foster Rau', '', NULL, 1, NULL, 'D775MgWar7', '2018-08-27 00:50:50', '2018-08-27 00:50:50'),
	(9, '72449236', 'fkirlin@example.org', '$2y$10$zkkNhmQBef9wjg7GD2FbDOk.PWQTGDGYn8CTxCwWavbmaAgSVp.AW', 'cuenta_principal', 'Chasity Runolfsson', '', NULL, 1, NULL, 'Of4Yj3JYO0', '2018-08-27 00:50:50', '2018-08-27 00:50:50'),
	(10, '86745836', 'paxton43@example.net', '$2y$10$dHYMl0YmYONPcdhJ8qVWGOlxCcWr1ZPrabqNc5dufcrfSj8xyOpsq', 'cuenta_principal', 'Waylon Donnelly', '', NULL, 1, NULL, 'pZjs0XE20C', '2018-08-27 00:50:50', '2018-08-27 00:50:50'),
	(11, '55994297', 'eloisa01@example.com', '$2y$10$F.5y.GUPsHD8.dXqJ4MDRui9OOg5ZvroyF6Yq80uozYZLW.1LBctG', 'cuenta_principal', 'Geovany Stroman I', '', NULL, 1, NULL, 'jukkwxzdwe', '2018-08-27 00:50:50', '2018-08-27 00:50:50'),
	(12, '66158740', 'herdman@example.org', '$2y$10$25Kz6VXpY3tnzDpD9MpNUOaJV8MPiyvT33fbtHKJFZMwMpli5jnze', 'cuenta_principal', 'Mr. Nils Jacobson V', '', NULL, 1, NULL, 'lpGDTI6NWZ', '2018-08-27 00:50:50', '2018-08-27 00:50:50'),
	(13, '87191368', 'dickens.darrick@example.org', '$2y$10$fjzeCvDRL0ODl8jBX6l7Q.Mf6RIwJPN4/gZ5iUZQIyhWkzB.S3cma', 'cuenta_principal', 'Cyrus Harvey', '', NULL, 1, NULL, '0iTiXCaQxc', '2018-08-27 00:50:50', '2018-08-27 00:50:50'),
	(14, '39226914', 'zella.koss@example.org', '$2y$10$Pd5gDdSMtyA3Z5j4CJFjTe1jT/rRL2yocldRhGTY6L5Pz/6tpiqR2', 'cuenta_principal', 'Prof. Rodolfo Kuhlman DDS', '', NULL, 1, NULL, '5et3pGc35l', '2018-08-27 00:50:50', '2018-08-27 00:50:50'),
	(15, '13643303', 'eschaefer@example.org', '$2y$10$yceBNg7kENBgvBC56IQAeu63YNMo3UaTvN3ByvQb.NB4ni8vGpJLa', 'usuario', 'Carolyne Will', '', 5, 0, NULL, 'p4EOklEqdR', '2018-08-27 00:50:50', '2018-08-27 00:50:50'),
	(16, '01661018', 'torp.jolie@example.org', '$2y$10$APJvM2z4J..mMrbBLe0l4OZgd6NFn6eW.66GqQSrKdBVDfRjyRjHO', 'usuario', 'Erling Abshire', '', 5, 0, NULL, 'Frs3XikeYG', '2018-08-27 00:50:50', '2018-08-27 00:50:50'),
	(17, '26914515', 'elenora19@example.net', '$2y$10$LfhhleFBV6F8GQNAGZG8Eu3PuWW456YqLR/JiOOZ87RBCsx2IKAnm', 'usuario', 'Katharina Miller', '', 5, 0, NULL, 'vGg0JuTqnB', '2018-08-27 00:50:50', '2018-08-27 00:50:50'),
	(18, '67012900', 'herminio.mayert@example.org', '$2y$10$bvCG4bUOdpz0WgJV4A56EuLCvQrRpFvt9J11gXP5ePQcyrcL5OR7q', 'usuario', 'Donato Dach IV', '', 5, 0, NULL, 'pmPIP5ZLh2', '2018-08-27 00:50:50', '2018-08-27 00:50:50'),
	(19, '54853944', 'pouros.hettie@example.com', '$2y$10$X1RCKXzinJbRisgd52vcAOzrQeibkewflDBdfnG/2w.f/tq0N6I7W', 'usuario', 'Lucinda Cruickshank', '', 5, 0, NULL, 'D1BXkXVZri', '2018-08-27 00:50:51', '2018-08-27 00:50:51'),
	(20, '53108682', 'kaitlin.hyatt@example.net', '$2y$10$2IfIJ.5AgDyGAzMfW.CCc.x8GaTmcy9sEH2lIqCVGrNVKIZUiMU9S', 'usuario', 'Palma Murray', '', 5, 0, NULL, '3AaLi4IqTA', '2018-08-27 00:50:51', '2018-08-27 00:50:51'),
	(21, '04335949', 'natalia10@example.com', '$2y$10$ASQyYKBIy6tTm7.VK7u7gONjlogxFua0wfIGeQ5yE7.Wwcm4fW4eG', 'usuario', 'Dolores Zboncak', '', 6, 0, NULL, 'KbplxupbqD', '2018-08-27 00:50:51', '2018-08-27 00:50:51'),
	(22, '05139029', 'jboyer@example.net', '$2y$10$SBkh/3Ivc2/E0WO1s6v0iu15TYnuHIjDsQBRoKDQ2dLhH8dxCz0qC', 'usuario', 'Dedrick Carter MD', '', 6, 0, NULL, 'eL2OMIegRa', '2018-08-27 00:50:51', '2018-08-27 00:50:51'),
	(23, '93756701', 'harvey.gonzalo@example.com', '$2y$10$DavL62dW7DCdFJdGGw2MX.c3GTFroXvbvN5zsYe0Y7x6vX3iuz1Wm', 'usuario', 'Cathy Hansen', '', 6, 0, NULL, '2Ze5s0ZJHs', '2018-08-27 00:50:51', '2018-08-27 00:50:51'),
	(24, '78246487', 'tfadel@example.com', '$2y$10$29ng7IahduT4MzXBij.zj.S7udjqa61LPD467A0PmJQ9OOhtnd63C', 'usuario', 'Dr. Sonny Klein', '', 7, 0, NULL, 'rpqZV0oWVK', '2018-08-27 00:50:51', '2018-08-27 00:50:51'),
	(25, '53352533', 'henry97@example.org', '$2y$10$BwfNzlkBkCzu6kDgQy55fOHPt8BLVd8xk1Dfi1nr1a60CM3zsr772', 'usuario', 'Mrs. Kathleen Tillman DVM', '', 7, 0, NULL, 'X9mOE9KxFl', '2018-08-27 00:50:51', '2018-08-27 00:50:51'),
	(26, '78691627', 'oreilly.emory@example.org', '$2y$10$hebY8JcJuaLhtU4rOU8/SewburUXDLc9d8R58D9O6XCrxlnSmg.aW', 'usuario', 'Mr. Damion Russel I', '', 7, 0, NULL, 'lpfVPKxdJ3', '2018-08-27 00:50:51', '2018-08-27 00:50:51'),
	(27, '56830550', 'sporer.gennaro@example.org', '$2y$10$QVbIyLQcwE77NPFrpR4wxOF6CMstxkz0f9CCp9HIP19/9sAqzPO9i', 'usuario', 'Leila Batz', '', 7, 0, NULL, 'LPZxsDlWnN', '2018-08-27 00:50:51', '2018-08-27 00:50:51'),
	(28, '37493621', 'jennings97@example.com', '$2y$10$MAT3M8wHS8G1EVkRhpCpAOUt3zS1SWzo9/ho50neBIGrAFU24sOTK', 'usuario', 'Dr. Max Ortiz MD', '', 7, 0, NULL, 'xRM95uOce1', '2018-08-27 00:50:52', '2018-08-27 00:50:52'),
	(29, '33933243', 'marietta75@example.com', '$2y$10$h2ZIm5X9PBRtNJBreFbV7O1eOeDGJgdYfbDMSYYidtFWcls9x5K/O', 'usuario', 'Dr. Buford Reichert', '', 7, 0, NULL, 'VjTYfs6O5i', '2018-08-27 00:50:52', '2018-08-27 00:50:52'),
	(30, '93801504', 'michelle.gleason@example.net', '$2y$10$nH2gPJrItorBTBnTvnlseu5MgnOKXfpCJ4mo0Tk6nfldjdAZOVhem', 'usuario', 'Vidal Beahan', '', 8, 0, NULL, 'nMIGsZaD8x', '2018-08-27 00:50:52', '2018-08-27 00:50:52'),
	(31, '05422384', 'vlind@example.com', '$2y$10$.If1g1.o5E4VlLuENtXPMuhAQWCA8X0LlL9wcxBUgsnfvflGe/uAu', 'usuario', 'Moses Wilkinson Jr.', '', 8, 0, NULL, 'HCDVNQPrxv', '2018-08-27 00:50:52', '2018-08-27 00:50:52'),
	(32, '71133998', 'thoeger@example.org', '$2y$10$aWkc4gT7NkwoHSdRTB2RL.P7FiI6Fr.zuaFVXlEmyPmv9Y29UANvy', 'usuario', 'Demario Schuster', '', 8, 0, NULL, 'oJzZK64zwD', '2018-08-27 00:50:52', '2018-08-27 00:50:52'),
	(33, '35669194', 'chyna90@example.com', '$2y$10$buVJOMvgn6WqTpd4CD7VteSSt7mjj1GfbdXYGqoMa7otaSEpzQgFm', 'usuario', 'Catharine Sauer', '', 9, 0, NULL, 'TdEEOqejlc', '2018-08-27 00:50:52', '2018-08-27 00:50:52'),
	(34, '49960328', 'ealtenwerth@example.com', '$2y$10$wnDe8Vh/.gAi.r0O928rse4wVKEb9eFzDZ7Qv9MRQzNyPJ1ugibX.', 'usuario', 'Dimitri Weber', '', 9, 0, NULL, 'pL2Ln5Svim', '2018-08-27 00:50:52', '2018-08-27 00:50:52'),
	(35, '16929366', 'jaeden19@example.org', '$2y$10$BPbDeRCaGjKEqvk9.fEZau6jC9byYAJOOPpQ5srWBj7zL7A46jzbK', 'usuario', 'Jorge Funk', '', 9, 0, NULL, 'Sxaa6uM6Lb', '2018-08-27 00:50:52', '2018-08-27 00:50:52'),
	(36, '09265311', 'cristopher.heidenreich@example.org', '$2y$10$LU7xwqX9P1l89lVPxvh3quIb2MgJ1INsdYhD5WZtgLYAJat3Y7uyu', 'usuario', 'Daisy McGlynn', '', 10, 0, NULL, 'MftFhEvDxo', '2018-08-27 00:50:52', '2018-08-27 00:50:52'),
	(37, '15899346', 'mack.aufderhar@example.net', '$2y$10$IaW4REHD8EaTRvrWc40oHesFsqQ9ST5GOA1YERrqvFtlG6.cFbMeC', 'usuario', 'Herminio Ebert', '', 10, 0, NULL, 'lDHstY8LiH', '2018-08-27 00:50:53', '2018-08-27 00:50:53'),
	(38, '65424712', 'block.humberto@example.com', '$2y$10$PoGWHynhyXge4SoqPD7kZO/G/.Z1ZKeGf3oCJrUl2e5E78hJcPAWm', 'usuario', 'Eloise McKenzie', '', 10, 0, NULL, 'iyYtVOM5Po', '2018-08-27 00:50:53', '2018-08-27 00:50:53'),
	(39, '00526611', 'valentine74@example.com', '$2y$10$VGYNn/V5dDVQyeJP2lqzk.AJqQ5h9MBajQfp12xAVorzE/4GmcaHW', 'usuario', 'Amie Gaylord', '', 10, 0, NULL, 'yKij78PYAW', '2018-08-27 00:50:53', '2018-08-27 00:50:53'),
	(40, '69537653', 'dbernhard@example.net', '$2y$10$HLbB55eiE9yovybRzFhUwedefCq7khDG5WnGaxw4XVa7G6fIhhWve', 'usuario', 'Chester Schaden', '', 10, 0, NULL, '242hrsCmpN', '2018-08-27 00:50:53', '2018-08-27 00:50:53'),
	(41, '58529814', 'crist.hailey@example.com', '$2y$10$SvscTkpK0OmxWcDyoh/ode3/feOAomCzHskrfni7Phj4C9foI/kOu', 'usuario', 'Devyn Toy', '', 10, 0, NULL, 'aFPc1ZBEVZ', '2018-08-27 00:50:53', '2018-08-27 00:50:53'),
	(42, '01547116', 'trystan21@example.net', '$2y$10$6xNd3exWSfCKtG214utW/.bGNkU57DbP9Vq0qbP7cW5r8XN2tR6Gu', 'usuario', 'Mariah Lebsack', '', 11, 0, NULL, 'UMpgTMTz1D', '2018-08-27 00:50:53', '2018-08-27 00:50:53'),
	(43, '76952023', 'schamberger.keeley@example.com', '$2y$10$gBwvOzc1OzdEyIfoGixbpuJmUPjgb59H/uU.Zqzs9PiHHep9rpgnm', 'usuario', 'Alysson Koepp', '', 11, 0, NULL, 'H37g9QwSd2', '2018-08-27 00:50:53', '2018-08-27 00:50:53'),
	(44, '68137404', 'probel@example.net', '$2y$10$0IiySiF8HdimFes7Exc7tudXqEpDp5QDWV03cBU6juFFGmHjlkCKu', 'usuario', 'Ms. Joanie Walter Jr.', '', 11, 0, NULL, 'jVRQEo6TVu', '2018-08-27 00:50:53', '2018-08-27 00:50:53'),
	(45, '49165683', 'kellie.kuhn@example.org', '$2y$10$29eCjsh/hcgvxqvj4IsSpeHO0BFeaxybRUEekHSC6dGaZ01DLTNMG', 'usuario', 'Jude Gerhold', '', 11, 0, NULL, 'HRRL81RA7t', '2018-08-27 00:50:54', '2018-08-27 00:50:54'),
	(46, '05683874', 'dakota.kuhn@example.net', '$2y$10$esGz7GDqaMzlDBkjdNuaK.5vR/5Edg5B9uCGVKx0IVcApTA/BKHzK', 'usuario', 'Kaci Feeney', '', 11, 0, NULL, 'hfLtkOo88J', '2018-08-27 00:50:54', '2018-08-27 00:50:54'),
	(47, '71895212', 'schmidt.kobe@example.com', '$2y$10$56RCS5le5fYRsJfxK8q4rOoHNGy7ksIpy2kgrnr2dFM2PXLO2uAii', 'usuario', 'Prof. Alberto DuBuque', '', 12, 0, NULL, 'RGBhIDlHqR', '2018-08-27 00:50:54', '2018-08-27 00:50:54'),
	(48, '56606880', 'nigel.fritsch@example.org', '$2y$10$x0OA6ol14nUz49gL/V8ccOsTULAGF4poTdWpGHMt7LjOb1tTn4fRO', 'usuario', 'Nick Wintheiser', '', 12, 0, NULL, 'X7ESeO0fG1', '2018-08-27 00:50:54', '2018-08-27 00:50:54'),
	(49, '25642132', 'albertha25@example.com', '$2y$10$NhexzE8nTHhwXz6HaF9LQOHP5YOE52pZG02CSOtnJ1QZJfMDxbpr2', 'usuario', 'Dexter Gorczany', '', 12, 0, NULL, 'MKLUYVsz8x', '2018-08-27 00:50:54', '2018-08-27 00:50:54'),
	(50, '55249964', 'burdette.crist@example.com', '$2y$10$DrQbaO/.wY5VsfiyW9NFLe5mmjOJAXOC7qTjCKfhSLge5SV5JYM9K', 'usuario', 'Ena Douglas', '', 12, 0, NULL, '5DQuUnVeMS', '2018-08-27 00:50:54', '2018-08-27 00:50:54'),
	(51, '06015168', 'adrianna54@example.org', '$2y$10$Hu6R/v4Em/kqA.ojkTD1Nui2Ys8lr/VJzO8KMve0EUMc.wiX9jkBS', 'usuario', 'Bethel Parker', '', 12, 0, NULL, 'JTSfoeMgeW', '2018-08-27 00:50:54', '2018-08-27 00:50:54'),
	(52, '37853039', 'marty98@example.net', '$2y$10$/6IgVV486/gfBW2eMWKnAOMSKqytOuIYqp0w/2/uzAp2NZCjkwz/y', 'usuario', 'Miss Queen O\'Connell', '', 12, 0, NULL, 'KlLThCcMYQ', '2018-08-27 00:50:54', '2018-08-27 00:50:54'),
	(53, '43496999', 'kilback.martina@example.net', '$2y$10$gy5.PP3FiocCD2LAxMbye.LMyKuYxsAkkmSFQNmmJwAk5lj7kTCFS', 'usuario', 'Tomasa Fahey', '', 13, 0, NULL, 'NeusaTIHVH', '2018-08-27 00:50:54', '2018-08-27 00:50:54'),
	(54, '53728802', 'eliseo.upton@example.com', '$2y$10$3nanshAdSov5KFBjVCPlv.r3Rpc5RcJtK7Vg4lArTaHPXEmmr.DWm', 'usuario', 'Cleo Carroll', '', 13, 0, NULL, 'PirhbMKdMz', '2018-08-27 00:50:55', '2018-08-27 00:50:55'),
	(55, '84380901', 'maye.schiller@example.net', '$2y$10$G49iog.HzIe2byeFs/8po.gec4QgOjCCHbxW8JprpEi9LTuh0Dp5i', 'usuario', 'Kaylah Blanda I', '', 13, 0, NULL, '0HqeCzzbIy', '2018-08-27 00:50:55', '2018-08-27 00:50:55'),
	(56, '49542340', 'filiberto41@example.net', '$2y$10$FkYo8nlNNdHZ4X0Rb.LHzuxjGC0271XDmAXJ5aH2heGm54J9apKL6', 'usuario', 'Dr. Luther Oberbrunner', '', 13, 0, NULL, 'pA6wy0lb7U', '2018-08-27 00:50:55', '2018-08-27 00:50:55'),
	(57, '74644772', 'qkrajcik@example.net', '$2y$10$l4voXFOFYKmVLWX2.HqmheLnJCIP2PlKXwkMmRsV5jxAolKRxu/DW', 'usuario', 'Aglae Jones', '', 13, 0, NULL, '6TIAuPI1yJ', '2018-08-27 00:50:55', '2018-08-27 00:50:55'),
	(58, '40005707', 'cleveland.lebsack@example.net', '$2y$10$2Ek2F.Ew/hc9/AGoVe4HGuOFRbaY/vmLER15Xap6w7YCloeIsudbO', 'usuario', 'Prof. Mattie Johnston Sr.', '', 13, 0, NULL, 'LgXWo4HXkh', '2018-08-27 00:50:55', '2018-08-27 00:50:55'),
	(59, '84806770', 'gardner.roberts@example.org', '$2y$10$7IdGWoMZd0cdFqjN7XlcQep8nDIvKxP9BFEk6h5yMcwQSn1nBAlZu', 'usuario', 'Shaylee Larkin', '', 14, 0, NULL, 'Guc8UvGHcP', '2018-08-27 00:50:55', '2018-08-27 00:50:55'),
	(60, '63024767', 'sdurgan@example.net', '$2y$10$5os5uaRTyc2Wh4ahCJGHF.x6uZAgwG3Ah./wByUeTjI/I36BHLPy2', 'usuario', 'Jacques Langworth', '', 14, 0, NULL, 'xeiTdveeFP', '2018-08-27 00:50:55', '2018-08-27 00:50:55'),
	(61, '93795483', 'rutherford.lillie@example.org', '$2y$10$yKYnE/mUIkrLOvMnkxQsY..JSg1qCjDF.vT5HW9hPmiQkCvGT/wpG', 'usuario', 'Jo Mohr', '', 14, 0, NULL, 'YkMnWrbF0d', '2018-08-27 00:50:55', '2018-08-27 00:50:55'),
	(62, '05952329', 'clarissa77@example.net', '$2y$10$F7Cjdc1Ii9xJkTeSoICY7uiWxIgu4Ztef4oD.fEVCFi26k/pLnEFW', 'usuario', 'Dr. Mario Price III', '', 14, 0, NULL, 'CNYatXF0hp', '2018-08-27 00:50:56', '2018-08-27 00:50:56'),
	(63, '19865981', 'zgulgowski@example.com', '$2y$10$D5pHPH41KFlIAJOZZKxk9umle8uMqTRSX2JdHnjB4N2QmQybNH5nW', 'usuario', 'Jalon Steuber DDS', '', 14, 0, NULL, 'O8zWvInhkS', '2018-08-27 00:50:56', '2018-08-27 00:50:56'),
	(64, '81184022', 'iyost@example.org', '$2y$10$bUlBL2oznQOrrwsi.z5SOugygt09r4m.ZPL9S9fDkUuDLTdfrA3te', 'usuario', 'Arnulfo Wunsch', '', 14, 0, NULL, '7vus6DzGSc', '2018-08-27 00:50:56', '2018-08-27 00:50:56');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
