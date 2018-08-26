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
  `comentarios` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
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

-- Volcando datos para la tabla combustiblemobile.cuenta_corriente: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `cuenta_corriente` DISABLE KEYS */;
INSERT INTO `cuenta_corriente` (`id`, `usuario_id`, `linea`, `usuario_id_destino`, `usuario_id_origen`, `estacion_id`, `comentarios`, `tipo_movimiento`, `saldo`, `monto`, `audi_usuario_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, NULL, NULL, NULL, '', 'deposito', 60000.00, 60000.00, 1, '2018-08-23 16:45:28', '2018-08-23 16:45:28'),
	(2, 1, 2, 5, NULL, NULL, '', 'transferencia', 56000.00, -4000.00, 1, '2018-08-23 17:04:47', '2018-08-23 17:04:47'),
	(3, 5, 1, NULL, 1, NULL, '', 'transferencia', 4000.00, 4000.00, 1, '2018-08-23 17:04:47', '2018-08-23 17:04:47');
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

-- Volcando datos para la tabla combustiblemobile.estaciones: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `estaciones` DISABLE KEYS */;
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
	(5, '2014_10_12_000000_create_usuarios_table', 1),
	(6, '2014_10_12_100000_create_password_resets_table', 1),
	(7, '2018_07_07_004840_create_estaciones_table', 1),
	(8, '2018_07_07_005955_create_cuenta_corriente_table', 1);
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
  `rol` enum('administrador','usuario','playero') COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `comentarios` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuarios_dni_unique` (`dni`),
  UNIQUE KEY `usuarios_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla combustiblemobile.usuarios: ~111 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `dni`, `email`, `password`, `rol`, `nombre`, `comentarios`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, '12345678', 'admin@combustibleMobile.deb', '$2y$10$ADNgFbC2h.ZZXp4w.TCMueFHoy2S8Yrrs2/0ih11UZd.PcsupqVnK', 'administrador', 'Eduardo Jerez', '', 'iCQoqq7tNf', '2018-08-23 01:15:02', '2018-08-23 01:15:02'),
	(2, '18331943', 'ada00@example.net', '$2y$10$XZKflyI03cl.FtptsBhyAeCnnZclTtjy8VD/SUyjPqmCiT/MWSX3.', 'playero', 'Larue McDermott', '', 'UeP70k9In6', '2018-08-23 01:15:08', '2018-08-23 01:15:08'),
	(3, '31889695', 'abby.schroeder@example.com', '$2y$10$rVcHkPV6Hdz0oy0Ll0G1BeyAPtdKc.dmhG86.0MOSkyDlV9CPGgKC', 'playero', 'Lewis Kohler', '', 'vKqtANjevD', '2018-08-23 01:15:08', '2018-08-23 01:15:08'),
	(4, '09124146', 'harvey.klein@example.net', '$2y$10$pQVLybo28eRntRaC2xsEP.GE2IS9UA71yeEN.2..4dVRs7eIxJhI2', 'playero', 'Prof. Jaquan Jones DVM', '', 'EXqoaVzHEy', '2018-08-23 01:15:09', '2018-08-23 01:15:09'),
	(5, '77134079', 'block.kaleb@example.net', '$2y$10$tPSFZzQ2tBhK00lSyLj8Ie6YFSBRPt6cVPvs8KrJN33STfxS4B6QO', 'administrador', 'Judy Anderson', '', 'icSP0MyprD', '2018-08-23 01:15:09', '2018-08-23 01:15:09'),
	(6, '04511600', 'ovolkman@example.net', '$2y$10$5yHADeHrq/EfQ3qw1h0DruPXJl051j/zalvRCrCkrdMgo2z/U8p3O', 'usuario', 'Ms. Janessa Bednar', '', 'TVB8x4UGy3', '2018-08-23 01:15:09', '2018-08-23 01:15:09'),
	(7, '19318667', 'drake.mayert@example.org', '$2y$10$Iaw4WpM7uzq0ydJHPthYreTxMpJmX/dgZXSWve09FBCJ7BGUagkP2', 'playero', 'Kylee Herman', '', '38rgUUZZCh', '2018-08-23 01:15:09', '2018-08-23 01:15:09'),
	(8, '68300006', 'vruecker@example.com', '$2y$10$R/JEMYQ9qRU1nSL93CDBVeWHht4BlOcW2GkrXKK3QKZ.9PI7EDvPO', 'playero', 'Nelson Shields', '', 'C2K3nl1eqN', '2018-08-23 01:15:09', '2018-08-23 01:15:09'),
	(9, '75457046', 'rosemarie92@example.com', '$2y$10$Q6Pu7r1uzBoudslEvzlVKuLQBp2jwDg4WOIGYX5uzfBv16vERYnVG', 'playero', 'Corine Lockman', '', 'fa8RZFA1mK', '2018-08-23 01:15:09', '2018-08-23 01:15:09'),
	(10, '48667763', 'grimes.jaida@example.net', '$2y$10$5a0w4On7VKTc8Sncpf5T8ug90WyIgoT6RGRRKwi3OborY8V5fJJTS', 'usuario', 'Josiah Morissette V', '', 'nsF5okaAnV', '2018-08-23 01:15:09', '2018-08-23 01:15:09'),
	(11, '58455471', 'viva26@example.net', '$2y$10$qNDaWkura0QU5VYwub4tZOplkXq1.vAH7e7kAL970Ok/G1u0mwtc6', 'usuario', 'Shayne Rolfson', '', 'xdJB4Ptdtq', '2018-08-23 01:15:09', '2018-08-23 01:15:09'),
	(12, '86017341', 'schuppe.brandi@example.org', '$2y$10$zU.bZctlVveeXt1YyJGjd.Kcralyqe4kLJq17qlH.xl1EbHGNcbUi', 'usuario', 'Aaliyah Fadel', '', 'SHdLTVPn3B', '2018-08-23 01:15:09', '2018-08-23 01:15:09'),
	(13, '59182343', 'stokes.meagan@example.net', '$2y$10$qImyAejHkXyNpbZL2pNtOekRH.DjXY3Ym1a0IMV/AfyYZl1K73.DC', 'playero', 'Jared Batz', '', '98R5GMlxRe', '2018-08-23 01:15:09', '2018-08-23 01:15:09'),
	(14, '55068739', 'holson@example.net', '$2y$10$vpDdNznRECVIrqQk5mQEMuSxSJfYddPb3I4AWo/NEn7wzuDkbUfsC', 'administrador', 'Ms. Amalia Rolfson', '', 'DTfiPvCa5V', '2018-08-23 01:15:09', '2018-08-23 01:15:09'),
	(15, '41553315', 'nienow.berneice@example.net', '$2y$10$VZeOuvat2SZc09Gi4dnDlO5J43H8bJGvDjIYyLMsogA7r5bDA6Tk2', 'administrador', 'Ignacio Swift', '', 'ZVSKrbuj4f', '2018-08-23 01:15:09', '2018-08-23 01:15:09'),
	(16, '87934612', 'rkautzer@example.org', '$2y$10$WHsuwpzSwv8aiJpZpBgGVOtmQITDVdK8OBZcr3GIQa0TpRDhT6/se', 'playero', 'Bryon Satterfield DVM', '', 'PLKAm88csY', '2018-08-23 01:15:09', '2018-08-23 01:15:09'),
	(17, '73000564', 'htorphy@example.com', '$2y$10$98jfNqXLMstGHYVMSeBHguTT.rU.16pUdmzAT.9E0HyIgztQpCc0S', 'usuario', 'Mrs. Roxanne Christiansen', '', 'og7JM6WQaa', '2018-08-23 01:15:09', '2018-08-23 01:15:09'),
	(18, '96373560', 'ydicki@example.net', '$2y$10$Amt8RERsxJwcFB61sDHDMuHLCsjpCA4ohxJnJ8aEkkdpoN93dW8Je', 'usuario', 'Horace Jenkins', '', '1K8Q9Ewmd4', '2018-08-23 01:15:09', '2018-08-23 01:15:09'),
	(19, '18849508', 'ieffertz@example.com', '$2y$10$J6EQqNOtVv1QWR959Lq.SeVxmwhOw7b1BlZ0UQvf2QAxzARoK2Q5u', 'administrador', 'Cyril Morar', '', 'FX7nmj4sb6', '2018-08-23 01:15:09', '2018-08-23 01:15:09'),
	(20, '97380410', 'sdubuque@example.org', '$2y$10$UiNCyXeX0q3k3Po/FMGwC.ND9UDdKvzgy6mD7vrDcB8jLygZ3BA12', 'playero', 'Aron Quigley', '', '1WaRk4qLf8', '2018-08-23 01:15:09', '2018-08-23 01:15:09'),
	(21, '44405264', 'katharina19@example.net', '$2y$10$OBv72q9LDJaZhUNrYXMbEemuFG9hBH98CGGNpS9wawRAXS62t4lmO', 'administrador', 'Aliyah Krajcik DDS', '', 'SvXJcboUte', '2018-08-23 01:15:09', '2018-08-23 01:15:09'),
	(22, '03938132', 'vthiel@example.com', '$2y$10$Mhk943phoqgusxQTlNyk9.l/6pb8RJMgMn16OUonZI29s64Q00aCm', 'administrador', 'Magdalen Rowe', '', 'Yq9koz8I7x', '2018-08-23 01:15:09', '2018-08-23 01:15:09'),
	(23, '11869839', 'brycen.kiehn@example.org', '$2y$10$ssBpkIgCYkr14NtvPCcGqez7WM4xi2sFpcBJFnjpmMRGODsxLBlh2', 'administrador', 'Kevin Hoppe', '', 'KnBJB5YY0T', '2018-08-23 01:15:09', '2018-08-23 01:15:09'),
	(24, '21325511', 'pouros.fabian@example.net', '$2y$10$2vTYzCXg95bSqhk67hMvfOaUg3QXykWh.cBvs6.AArDujQrQOPX1O', 'usuario', 'Ciara Johns', '', 'WQOhINGkXd', '2018-08-23 01:15:09', '2018-08-23 01:15:09'),
	(25, '41409844', 'miller.rose@example.org', '$2y$10$tPTvbuVax75hE9Y5ix/ZiO2sTMSOI5qb/ww4mij5eTBs1d/gm4NoK', 'administrador', 'June Cummings', '', 'N0Tqfwkh7U', '2018-08-23 01:15:09', '2018-08-23 01:15:09'),
	(26, '58057970', 'vschneider@example.com', '$2y$10$HOwm4.Cih1Mrn7KWVi0Qr.DvjCgsEkb76H7nPoFkEbAxRuQRx.OSu', 'administrador', 'Brad Muller', '', 'f54RpWAarN', '2018-08-23 01:15:09', '2018-08-23 01:15:09'),
	(27, '05918561', 'kleannon@example.com', '$2y$10$xkX2e63/cEsKBZnMzZbI4OvQPaQvji5JGsiEEsmzXu0wzWQ5G8Cqy', 'usuario', 'Talon Veum DVM', '', 'ZTMFcjj4if', '2018-08-23 01:15:09', '2018-08-23 01:15:09'),
	(28, '13026548', 'wgutmann@example.com', '$2y$10$idrBTtFTDBuLgQAA0.fmpeLYNbBd/AZxWC3XId42J9.ta5L1AyEHS', 'administrador', 'Mario Anderson', '', 'UbZgcjep9W', '2018-08-23 01:15:09', '2018-08-23 01:15:09'),
	(29, '74083449', 'enos.kassulke@example.net', '$2y$10$SIZoYJSLevzjQfIcxTWUsewgSmY3jEyMpwvVbozONrejVAQyr8/4O', 'playero', 'Layla Fay', '', 'ZChn4M1ifG', '2018-08-23 01:15:09', '2018-08-23 01:15:09'),
	(30, '99640561', 'schmitt.rubie@example.com', '$2y$10$tr4ag1fEzKISp4dWxTSdjuSLmmKtKnZM9OsPLW6G/rutag67ehmJK', 'playero', 'Freeman Morissette', '', 'w3ZpvTqNgK', '2018-08-23 01:15:10', '2018-08-23 01:15:10'),
	(31, '69715934', 'vlabadie@example.org', '$2y$10$b3fYNNLeV9viI5XqgiLLtOgpO7RwqkdfC2FMVD2EnaCdc62TLJ6FW', 'administrador', 'Josiane Hills', '', 'BxV5Sk1YGo', '2018-08-23 01:15:10', '2018-08-23 01:15:10'),
	(32, '63470639', 'zgaylord@example.net', '$2y$10$25xmqxY46tRYWttK3bBIiO62tdhenjfa/iJH7ZtUtqGrHMDKQIh76', 'usuario', 'Karina Crona', '', 'z6sndSqdIr', '2018-08-23 01:15:10', '2018-08-23 01:15:10'),
	(33, '63577738', 'zulauf.tia@example.com', '$2y$10$J7kVu.E8SW71q0Ms9tU1h.jgINJGikkhRt1EcLnYK6lZdK8Mfyt.G', 'administrador', 'Rosalinda Prosacco V', '', 'NdAdk8jhqi', '2018-08-23 01:15:10', '2018-08-23 01:15:10'),
	(34, '61646624', 'batz.georgiana@example.org', '$2y$10$y7aotykrD4K/3DIHJamAp.xce9Th2sJE0FshxzcRfFBPV5FBzDCW2', 'usuario', 'Luis Hyatt', '', 'amTdNCBZz0', '2018-08-23 01:15:10', '2018-08-23 01:15:10'),
	(35, '53340517', 'morris63@example.net', '$2y$10$42RwkVCHPLkgJaiwli/59ObgTKz84gwNxXFtsWdhUCAOBjcBj5Y5S', 'playero', 'Wiley Fadel', '', 'mPONbT0HSL', '2018-08-23 01:15:10', '2018-08-23 01:15:10'),
	(36, '42137169', 'norberto.ward@example.net', '$2y$10$PNlN4iQDHBAeCgnhXRnw6uJF9iuRgV84seZ2.iUxkfsBi3Ko5KAkO', 'playero', 'Jorge Emard', '', 'H11C5WcyoN', '2018-08-23 01:15:10', '2018-08-23 01:15:10'),
	(37, '09318146', 'olen16@example.com', '$2y$10$GD4vGWI2xzhYDR22f2wKZefj7r4ZblS7Pbmh.3kSNDyscePc2ejMO', 'administrador', 'Jakayla Wunsch', '', 'gNO96sv8Yl', '2018-08-23 01:15:10', '2018-08-23 01:15:10'),
	(38, '42101103', 'ida.parisian@example.net', '$2y$10$QzKzxXieTtDpEOoDjvqX6uE22./BwNvOLkmwGgFvRotfG.Dk1EbfW', 'administrador', 'Aisha Marks', '', 'YIFub8WkL9', '2018-08-23 01:15:10', '2018-08-23 01:15:10'),
	(39, '42905464', 'reilly.chaim@example.org', '$2y$10$4lm6l7mpAki.bpJqrdJe9uHds1./HI6kar329zD3p1pw1DFzcAie6', 'usuario', 'Delmer Gaylord', '', 'xtEQ8sxtqL', '2018-08-23 01:15:10', '2018-08-23 01:15:10'),
	(40, '07827638', 'sporer.wava@example.net', '$2y$10$XXsPtCvJV7uRJNwGPgEa5ennaegXd769RmewOSaUv5sLuhutaDsD6', 'administrador', 'Prof. Chester Koepp PhD', '', 'WXe9M0qO7i', '2018-08-23 01:15:10', '2018-08-23 01:15:10'),
	(41, '25147192', 'oberbrunner.ernie@example.net', '$2y$10$epPflIVgXiKAmIRc6MD7JuOWslOAeI6zaukPxxVTyEXaIBZty1O/y', 'administrador', 'Beryl Runolfsson', '', 't41RiZNyoK', '2018-08-23 01:15:10', '2018-08-23 01:15:10'),
	(42, '87827999', 'marquis93@example.net', '$2y$10$roycqpwk896VILwpDdkRfOVJBeyJigi.whk0N3mO0mg3cWPaTPfX.', 'usuario', 'Prof. Osborne Russel', '', 'oYL0vpwdIa', '2018-08-23 01:15:10', '2018-08-23 01:15:10'),
	(43, '64877960', 'rafaela.conroy@example.net', '$2y$10$aOWx/yp2EhN31a/ZB/nvIuBqDJDRHOK/W6L6kWjxK9cJjIsVmlSdy', 'playero', 'Jessyca Cremin', '', 'DS0Ajxy0wr', '2018-08-23 01:15:10', '2018-08-23 01:15:10'),
	(44, '67336276', 'rlangosh@example.com', '$2y$10$YeYHkP6W6zIP4As27O/Ia.wKoLEVZEg9OJiUD/.lKAd3s2pWoQf0G', 'administrador', 'Nora Hudson Jr.', '', 'uR97qhdqTg', '2018-08-23 01:15:10', '2018-08-23 01:15:10'),
	(45, '47797493', 'kub.brandy@example.net', '$2y$10$MGKj6ZWnPvFCMJRtPHit1uW90g0n.6Q50jWizhUs.nf.I3jyYXvIm', 'usuario', 'Prof. Deonte Goyette', '', 'GtphKgrGhT', '2018-08-23 01:15:10', '2018-08-23 01:15:10'),
	(46, '25263173', 'bwatsica@example.net', '$2y$10$oMzC0L4TiHV6jO3lR8.LCOrHFg7BzpRx9eFWAbXIhiGixGcVglOAW', 'playero', 'Delores Torphy II', '', '8sekSLRJCB', '2018-08-23 01:15:10', '2018-08-23 01:15:10'),
	(47, '09626251', 'pmayer@example.org', '$2y$10$gWWPGegnlglD0wNK3vKjKukQ7Kz.2lWT/gYMVLIoHb2PsNMEaZfNq', 'administrador', 'London Tillman', '', '4p753k2w9w', '2018-08-23 01:15:10', '2018-08-23 01:15:10'),
	(48, '20262759', 'larson.isac@example.com', '$2y$10$44vaM.ON5AHBKqX3WcABfulJh8E6vy1YN1WunnQVpdmJsFW/N.Z5G', 'usuario', 'Dr. Waldo Thiel III', '', 'uROsVAr97u', '2018-08-23 01:15:10', '2018-08-23 01:15:10'),
	(49, '90126765', 'dillon32@example.com', '$2y$10$WFufKswevPJXzBfo3EZlcuTM33tDOEzFN8REUOGqHBRlRz8hXSdrC', 'administrador', 'Brendan Wehner', '', 'pnTi94eE6m', '2018-08-23 01:15:10', '2018-08-23 01:15:10'),
	(50, '88964628', 'jovan74@example.com', '$2y$10$.rLD4mQsu43pM2KoCNkz9u8l2LJfFTBpYIFtKwwl8RCX8DTda7BOK', 'usuario', 'Darrin Kreiger', '', 'iZDHphuBUK', '2018-08-23 01:15:10', '2018-08-23 01:15:10'),
	(51, '27490837', 'nsipes@example.org', '$2y$10$MZXVEdeZqq0Vdjwi6LpJteIS5oTxklnIZymeoTnXJRIwEqjbPcorS', 'usuario', 'Clay Bernhard IV', '', 'kb5O47tNfA', '2018-08-23 01:15:10', '2018-08-23 01:15:10'),
	(52, '19326805', 'lkerluke@example.org', '$2y$10$ED3YjHgzkg0vPkWCG4RgYuPAtlD/yZrRtkYMf8.YxGe.ZhQtOX/kC', 'usuario', 'Ms. Alycia Mohr', '', 'MzRKcCG6LC', '2018-08-23 01:15:10', '2018-08-23 01:15:10'),
	(53, '69383563', 'gavin56@example.org', '$2y$10$dfpqDEwliFduelXwZgJ03.sgoW9t7sGzG1B4KAGQmhah1fi63Th/u', 'administrador', 'Prof. Lenore O\'Kon Sr.', '', 'Uy24ZfzgxD', '2018-08-23 01:15:10', '2018-08-23 01:15:10'),
	(54, '59503700', 'blick.marley@example.com', '$2y$10$AnoUI8dzuV8yDLxcfdlI0.gzZUkDVfmv2ksG/5Vei.vACE0Owut/S', 'usuario', 'Mack Bahringer V', '', 'vWVk30rAUk', '2018-08-23 01:15:10', '2018-08-23 01:15:10'),
	(55, '34662432', 'fern57@example.com', '$2y$10$.MdsTzlM.ClId7cnrIJro.eSLSgwBnq0ys1kweUw4oHy.R0YDWiVe', 'administrador', 'Norberto Blanda', '', 'ayKLP8vNrI', '2018-08-23 01:15:10', '2018-08-23 01:15:10'),
	(56, '60942993', 'quincy.hoeger@example.org', '$2y$10$ANSxxwfLcYaLNKE16ugpL.SwXXzOEjRb1VCJFBHheTwQd6N4Djuea', 'playero', 'Ali Wilkinson', '', 'hSR5Ynnrv7', '2018-08-23 01:15:10', '2018-08-23 01:15:10'),
	(57, '87893186', 'malinda78@example.com', '$2y$10$a1QdzgBvjnEEucG7jXIia.LfGbrZSDtmhcpkqZ.UxDyqTsm2B1Rjm', 'usuario', 'Domenico Rice', '', 'c6F5UxF4yD', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(58, '29791809', 'guy.lehner@example.org', '$2y$10$b7wroRpt31.CRmzEEeNWtenxWNCgIHAc.JJR3/eiOncc7L8PolIhm', 'usuario', 'Vivienne Mayer III', '', 'lgfObVpwTL', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(59, '12307282', 'bobbie.padberg@example.net', '$2y$10$6SQafRUY26coFqxf9B.mwOohGJWwbE40KhWPE0D/ZQpF2fQM7AuPa', 'usuario', 'Maida Denesik', '', 'rIabyEntyn', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(60, '32944162', 'shana.morar@example.com', '$2y$10$77trY.4P/WCJ.JxSn44cYuzGbc10ryIZfyQlzB4KOacMtgAzhuQsS', 'playero', 'Prof. Floy Little MD', '', 'FyaaRzU8um', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(61, '19576620', 'audrey.oconner@example.com', '$2y$10$PmXEuhEheEEOy0L3ejn1OeQLPygy3VXxZ8KDF0ElLzxY2ZN78nrMy', 'playero', 'Bruce Ledner', '', 'DU4EcSq4kS', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(62, '01703780', 'ibogisich@example.net', '$2y$10$lnv9kytTDOmicgHts.7a.uzodC0oqdI4frUeO7W5HHJJle5HH4GyK', 'usuario', 'Novella Greenfelder DVM', '', 'LR7mx861WM', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(63, '05148735', 'murphy.reuben@example.com', '$2y$10$kSjQ6ZdjOrsM8ZYovqgFtOhT9zbBKYFdFnldGKSqr86OBaLSRJGnu', 'playero', 'Mr. Isai Kshlerin Sr.', '', 'aYTQRHbKpN', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(64, '93263865', 'herman.keshawn@example.com', '$2y$10$WZCU4OjULxckGEE6xRoma.8NJTAyXbtOV/tkWvp71iR2XJHRYauo6', 'playero', 'Dr. Jaron Reinger I', '', 'w8Qsp2tQ1n', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(65, '97937169', 'marilou.johnson@example.com', '$2y$10$9l2B9qxpsqeG1cb2IcYmOu0PiMCFlBh3w1SrHlWXRhMp4TPAzon0m', 'usuario', 'Prof. Savanah Boyer Sr.', '', 'Yts8eK5tCQ', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(66, '41654954', 'corene75@example.com', '$2y$10$qz1bHFACaK56gAFdfVvci.m5tfIlV1lO9CWWbKWN6DCk5Hl1.lWE6', 'administrador', 'Maya Weissnat', '', 'jBVHfwgVJT', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(67, '87840071', 'asha03@example.com', '$2y$10$xF2tfrwvB/LciohRX9ewWevsXaEdDMnLbrIzSS1hkYf4yWOt3yQ6a', 'usuario', 'Margot Anderson', '', 'MxLjzYHgFi', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(68, '19435043', 'dfritsch@example.org', '$2y$10$oomDJHMwDpKPPAFI0qVmHOTV5u9vUbPtGqy.ETcQJtzPVPgmwU16e', 'playero', 'Mr. Buddy Conn IV', '', 'tJWYdXwWsv', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(69, '18113770', 'kristin16@example.net', '$2y$10$Zfxh4dmpq00AC0PeilNHG.twwZt1.cDYjFkOUVsnWGjWMYOFp/rue', 'playero', 'Makenna Stark', '', 'TocJxlpe2y', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(70, '32068179', 'etha77@example.org', '$2y$10$vyw/nzJUnoVm1oKNSTZrmurSVFIqgxrGL6raO0/JwUNF2QTRlghJ.', 'administrador', 'Elyse Pouros', '', 'EMkRYu6gSO', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(71, '65311224', 'treutel.easter@example.org', '$2y$10$VsOPG7Hj193UM7NEX7CI2eLQ8sUjAc3VC2RkIkDJ5Stov6nEJLv9.', 'playero', 'Walton Sawayn', '', 'pIlY0HXZme', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(72, '40672448', 'alda82@example.net', '$2y$10$UlauveCXKH5z3B/UgZ12MeB5JDzuCab45slGucmZGXWQUUiUrA1aG', 'usuario', 'Yesenia Stehr', '', 'hDDvopCLT8', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(73, '03742102', 'adam89@example.org', '$2y$10$DL9mMpWiCQLtp..lWyX2MeJ5ekrGlERTktX0p5cyTBX3DzIv6iFrq', 'administrador', 'Santino Thompson', '', '6tJlej9aYc', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(74, '99590249', 'turner.christy@example.com', '$2y$10$47hT9zQgcmt3F6RB6gDWyOe9NiJdqPiSOxaPyMtjWMPki4m2CoRny', 'playero', 'Logan Rogahn', '', 'sdj8thohcb', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(75, '10975733', 'dashawn.wolff@example.net', '$2y$10$6UOif42YruyaT.qVMB8FxeJJw0IqL6Ha5tS1Y6WYYFSEmGNdbFkqa', 'playero', 'Abigail Renner III', '', 'CHEBZLAoM8', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(76, '38826427', 'bailey.gabrielle@example.com', '$2y$10$ANEc637rVTYTKKX1lG1.Vextcvibt5IhF9zZ4hwnqj6.m3Fru1HrK', 'administrador', 'Prof. Lenna Ziemann', '', 'fOLeH5yucp', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(77, '31858675', 'cordia26@example.com', '$2y$10$sF7acUMb/S7B7OtSC0R6qO5k35u2Hqq99RirEBUAOgjejnAsOudFG', 'usuario', 'Anabel Mayer', '', '25oxhT6GP7', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(78, '30801834', 'estrella.ullrich@example.net', '$2y$10$mn7lzBzKy6So0ESPkCfcV.bVRSlvIedbFoBn4B5GiboorVSGgoqRe', 'usuario', 'Charles Lehner', '', 'InQAcO9mgg', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(79, '82932353', 'elyssa55@example.net', '$2y$10$ukm5WIo0yG7.sDunoEyfOeJDkBBHjUE57tW5dVQGQUI8I7VDRxNru', 'playero', 'Corene Welch', '', 'fNkmyhpKOI', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(80, '16445337', 'strosin.janis@example.net', '$2y$10$Zy7GSzoTQFRmGHroVfOTmOCYb/mStGRiju4Y2e.j6qR6oWrIHKUUy', 'usuario', 'Mr. Roy Cassin III', '', 'GU7y13IF4m', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(81, '09280201', 'ogutmann@example.org', '$2y$10$..lZzXfSzNbkznZRGkFF/.7LlRJUzNUi87JGqZxzKz1dimplAW8Fu', 'administrador', 'Green Bartell', '', '2aenPQxac2', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(82, '75820633', 'mabelle65@example.com', '$2y$10$R/q7w4HhLTeYiSU3N5hPYuXO5qyCRltIWq7UE2MdMOT3k73w4mFDe', 'playero', 'Ms. Malika Schumm II', '', '7HYDJKRl6T', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(83, '44138512', 'logan.crist@example.net', '$2y$10$vT.hoIh03XYYjIvodEoMwOmTLPAClit9htWkzPthy6VsmIzzXa51C', 'administrador', 'Dr. Jared Quitzon', '', 'ZvQ1TxO24K', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(84, '20971842', 'dparker@example.org', '$2y$10$m2T7ywoM/hE9ZZlNj93di.J7hmJfKYrr.KT5dPnVqHe0.M.GblvSy', 'administrador', 'Cecile Yost', '', 'i0qf9p22FN', '2018-08-23 01:15:11', '2018-08-23 01:15:11'),
	(85, '31310257', 'triston.wunsch@example.net', '$2y$10$jxZIqF.I9DenE5ay.WJID.nqWQTiCB/ilN5R.byuXMlAFiAg9YUFa', 'usuario', 'Kenyatta Bailey', '', 'UYdC5sZVq2', '2018-08-23 01:15:12', '2018-08-23 01:15:12'),
	(86, '99331665', 'ghettinger@example.org', '$2y$10$qKSySnGUVbMNi0WU.b8Hy.KUxVDfi1hHgzrWnyLyNmzj3cyuZS6za', 'administrador', 'Shaina Rodriguez', '', 'kzH5PzPYwK', '2018-08-23 01:15:12', '2018-08-23 01:15:12'),
	(87, '66592141', 'roberts.thomas@example.com', '$2y$10$KBzjjh3RsNypxvwFRTDf.O5TMtBj.Sa9g6xWGPzCYnwwv8O/Hpp4K', 'playero', 'Dock Fahey', '', 'CZHgSfNTGe', '2018-08-23 01:15:12', '2018-08-23 01:15:12'),
	(88, '02532042', 'emily43@example.com', '$2y$10$GYMlUXNw5hcslaF2D7JTY.rC3j1Jy/bQii1W2xkgqEbJ9DEYgF9Gi', 'usuario', 'Lulu Brown', '', 'u0HxLUGQdJ', '2018-08-23 01:15:12', '2018-08-23 01:15:12'),
	(89, '70317135', 'allie.bernier@example.com', '$2y$10$aaVk6nqI0ReFcTD8Au3swOKq722bmmaUhkR9gWJxk0VM0uqXToKJ6', 'usuario', 'Unique Erdman V', '', 'nQOezXxhlL', '2018-08-23 01:15:12', '2018-08-23 01:15:12'),
	(90, '37652130', 'hkirlin@example.com', '$2y$10$R7KlzhWFyORjGy10tKgvWOw/u58JdH4LPqjg3bsheUP2eZR5cZur2', 'playero', 'Isaac Roberts', '', '3znIR9hfTp', '2018-08-23 01:15:12', '2018-08-23 01:15:12'),
	(91, '14724898', 'nhowell@example.net', '$2y$10$epHQQud7iOC8nDMh9IM1jeZECi2msGQUN1nOXNTnCpGbca0y8pi2.', 'usuario', 'Hettie Rutherford', '', 'Uh0CB1Szus', '2018-08-23 01:15:12', '2018-08-23 01:15:12'),
	(92, '60835986', 'trace.bernier@example.com', '$2y$10$xXDIwI8yLJJIjO8piZqqkev4XbXg/jDa.VGcJ/aax3y/QyHdgFQCe', 'usuario', 'Baylee Doyle III', '', 'ff1SPMGrVv', '2018-08-23 01:15:12', '2018-08-23 01:15:12'),
	(93, '61247831', 'jbotsford@example.org', '$2y$10$LNEGDEG3upvqvX1tzJv1RufOrLbnHP9vv7BssUOblSJjwKqOAjE9y', 'administrador', 'Mossie Schneider', '', 'qwzsq0SrFK', '2018-08-23 01:15:12', '2018-08-23 01:15:12'),
	(94, '04921111', 'neal.kuhic@example.org', '$2y$10$1FWWoBwc38nbS9wonKd1VuIWWrtQwXyhFO22f1HqN004b/FjF4gIO', 'administrador', 'Ms. Letha Wiza', '', 'jEVqmVMwmx', '2018-08-23 01:15:12', '2018-08-23 01:15:12'),
	(95, '54712272', 'mschmitt@example.com', '$2y$10$bu0Irx2TrTrDQGlLVGWie.J6.2JEs3qhi8NZwB23oQftlNPtDtfn.', 'playero', 'Roscoe Green', '', 'TaXDzTHhb5', '2018-08-23 01:15:12', '2018-08-23 01:15:12'),
	(96, '53995493', 'anikolaus@example.net', '$2y$10$KG3SA4tghhnrwkqMUir/5uzVH95/SHFxj5/A2KQ26AUkIuwzGYCTu', 'playero', 'Jarrett Schimmel', '', 'T0mQ3FGSDm', '2018-08-23 01:15:12', '2018-08-23 01:15:12'),
	(97, '95558877', 'melvina.turner@example.org', '$2y$10$ETQe8Je9qB6hvQk.2TpU6uOAucd2bWq2uaXoeeN1V5E45rX254UNG', 'usuario', 'Aimee Howell', '', 'xMGPtkFSQs', '2018-08-23 01:15:12', '2018-08-23 01:15:12'),
	(98, '60281839', 'berge.maryjane@example.org', '$2y$10$iJw4/0KZjzQJJXxNQGANaue/xIBURqeIW5.7lpf6OzfH2sVzNKwqi', 'usuario', 'Mr. Bryce Jerde MD', '', 'byFPjLUNtY', '2018-08-23 01:15:12', '2018-08-23 01:15:12'),
	(99, '60344118', 'jborer@example.com', '$2y$10$V7p8lfmoQ/yrx4MJ7URbneOFHVwKj/5hxnzN/3Jikn1xtMTUsECW6', 'usuario', 'Jovan Olson', '', '3hUDESCY6s', '2018-08-23 01:15:12', '2018-08-23 01:15:12'),
	(100, '44119977', 'hortense23@example.net', '$2y$10$xjP9xgZxQWPjiRIT/EafDOfuZRYpmsXpliRkFfZ0coOT0Xl6daV1y', 'playero', 'Mr. Waldo Block', '', 'aUYwjGRRQI', '2018-08-23 01:15:12', '2018-08-23 01:15:12'),
	(101, '03688093', 'ceasar.emard@example.com', '$2y$10$b8Bq.uYr1hP7QTZo9W6YCu90cOhbFvUEvUd9SZGem5mXCZWs5Q9wK', 'usuario', 'Destini McDermott IV', '', 'xhLU8rgXvW', '2018-08-23 01:15:12', '2018-08-23 01:15:12'),
	(102, '57959979', 'qwyman@example.com', '$2y$10$hR96MzbmKnzJLeBHSnsPTOoM8Y9Y4a2tboFHvqIwp.z79hVYJPNUi', 'playero', 'Dr. Skylar Schiller', '', '2Sv4t8gGga', '2018-08-23 01:15:12', '2018-08-23 01:15:12'),
	(103, '01814593', 'veum.carroll@example.org', '$2y$10$3MHau12SbLGRjaQDr.5K1.rm/Qpc5Lus3BpMMoFYQ4XhO0WYao7Sq', 'playero', 'Torrance Romaguera Sr.', '', 'LvFTD6Wq3G', '2018-08-23 01:15:12', '2018-08-23 01:15:12'),
	(104, '56945534', 'pat.thompson@example.net', '$2y$10$6cUlNxa/zWYUp.Ca5cyVle0gxjO7kAedjSBSy.NKavIdxwUkunrS.', 'administrador', 'Prof. Ike Conn', '', '8oLuDQFLEJ', '2018-08-23 01:15:12', '2018-08-23 01:15:12'),
	(105, '83595345', 'wiegand.kelsie@example.com', '$2y$10$UrR2rUsLT12oPellMjWt1epmakAugYTh45N/c90D4Pn0TlyTknD86', 'administrador', 'Ellis Conn', '', 'B8jWbaQk4l', '2018-08-23 01:15:12', '2018-08-23 01:15:12'),
	(106, '39012638', 'lwiegand@example.net', '$2y$10$ArX.6NwuadD/ixoyR4awnuyylSbGqfs6W8FmzbQMMtxPMGf5Be62u', 'usuario', 'Aileen Miller', '', 'YbeBazSZGK', '2018-08-23 01:15:12', '2018-08-23 01:15:12'),
	(107, '45161015', 'enola24@example.com', '$2y$10$7xTraGp3CxNryEuH.XH1GOMeITI64gw5KCBdH1tvkN.vxVopmQOQO', 'administrador', 'Evan Nader', '', '7psiLC4gAI', '2018-08-23 01:15:12', '2018-08-23 01:15:12'),
	(108, '29800633', 'conroy.jarred@example.com', '$2y$10$D8hGWd57XjeUilYVUGJdku15p4LHWCjjgLspJF3QN1.cOSTBWvlyO', 'administrador', 'Brielle Zemlak', '', 'jRdB36HSzb', '2018-08-23 01:15:12', '2018-08-23 01:15:12'),
	(109, '54301068', 'hpadberg@example.com', '$2y$10$lHzyD5zzhS.YLqgE03Kw3.QTgCKFBtvPXf0OJqETQhOpSFF3Tnr6a', 'administrador', 'Giovanny Kohler V', '', 'km7HdiZx3D', '2018-08-23 01:15:12', '2018-08-23 01:15:12'),
	(110, '77423882', 'fisher.audreanne@example.com', '$2y$10$6Dfdx4sEcNEWSu9s0twkO.dy4ZMT0xTzF8K.5VTJqs0ovZaGURbFe', 'playero', 'Haven Paucek', '', 'jvDthZzjrW', '2018-08-23 01:15:12', '2018-08-23 01:15:12'),
	(111, '32808970', 'lockman.euna@example.org', '$2y$10$kLqRUSGF3k.ksnQA/gao7O57kMYQ0cIVvr2PwL5R/qeyyQZaHPTIi', 'playero', 'Shirley Hand', '', 'R73aZBIc4G', '2018-08-23 01:15:12', '2018-08-23 01:15:12');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
