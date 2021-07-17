CREATE DATABASE  IF NOT EXISTS `onlinedatabase` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `onlinedatabase`;
-- MariaDB dump 10.19  Distrib 10.4.19-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: onlinedatabase
-- ------------------------------------------------------
-- Server version	10.4.19-MariaDB

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idRole` int(11) NOT NULL,
  `idTypeUser` int(11) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `userPass` varchar(500) DEFAULT NULL,
  `e_mail` varchar(50) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `finalDate` datetime DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userName_UNIQUE` (`userName`),
  KEY `id_idx` (`idRole`),
  KEY `idTypeUser_idx` (`idTypeUser`),
  CONSTRAINT `idRole` FOREIGN KEY (`idRole`) REFERENCES `roles` (`id`),
  CONSTRAINT `idTypeUser` FOREIGN KEY (`idTypeUser`) REFERENCES `typeuserses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (11,1,1,'prade516','$2a$10$0FSI/46vUuXE4dRDdvIcs.0U4VAMoOswlKZhsb3kPh4b32qvq5Cuy','prade516@gmail.com','2021-07-16 00:00:00',NULL,'1'),(18,1,2,'prade5_16','$2a$10$WreNSux3dXnvC8KIitJXGuuQbRW4mNvE5dE9oV/SlvVs357AaHRN6','prade516@gmail.com','2021-07-16 00:00:00',NULL,'1');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idBusiness` int(11) DEFAULT NULL,
  `idLocation` int(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `e_mail` varchar(25) DEFAULT NULL,
  `postal_code` varchar(15) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_idx1` (`idBusiness`),
  KEY `id_idx2` (`idLocation`),
  CONSTRAINT `idBusiness` FOREIGN KEY (`idBusiness`) REFERENCES `businesses` (`id`),
  CONSTRAINT `idLocation` FOREIGN KEY (`idLocation`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (10,62,71,'Ovidio Lagos 124','prade516@gmail.com','2000',1),(11,62,71,'dddd','dddd','233',1);
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branchusers`
--

DROP TABLE IF EXISTS `branchusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branchusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idBranch` int(11) NOT NULL,
  `idAccount` int(11) NOT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idBranch_branchuser` (`idBranch`),
  KEY `idAccount_branchuser` (`idAccount`),
  KEY `idBranch_branchusers` (`idBranch`),
  KEY `idAccount_branchusers` (`idAccount`),
  CONSTRAINT `Account_branchuser` FOREIGN KEY (`idAccount`) REFERENCES `accounts` (`id`),
  CONSTRAINT `Branch_branchuser` FOREIGN KEY (`idBranch`) REFERENCES `branches` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branchusers`
--

LOCK TABLES `branchusers` WRITE;
/*!40000 ALTER TABLE `branchusers` DISABLE KEYS */;
INSERT INTO `branchusers` VALUES (8,10,11,1),(9,11,11,1);
/*!40000 ALTER TABLE `branchusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `businesses`
--

DROP TABLE IF EXISTS `businesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businesses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `businessName` varchar(200) NOT NULL,
  `cuit_cuil` varchar(15) DEFAULT NULL,
  `logo` varchar(5000) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `businessName_UNIQUE` (`businessName`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `businesses`
--

LOCK TABLES `businesses` WRITE;
/*!40000 ALTER TABLE `businesses` DISABLE KEYS */;
INSERT INTO `businesses` VALUES (62,'AtomoTecho','20-19032740-0','Sin logo',1);
/*!40000 ALTER TABLE `businesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Leches','Leches',1),(2,'Cremas de leche, mantecas y margarinas','Cremas de leche, mantecas y margarinas',1),(3,'Quesos untables y ricotas','Quesos untables y ricotas',1),(4,'Postres lácteos y yogures','Postres lácteos y yogures',1),(5,'Masas frescas y levaduras','Masas frescas y levaduras',1),(6,'Fiambres, embutidos y encurtidos','Fiambres, embutidos y encurtidos',1),(7,'Quesos excepto untables y ricotas','Quesos excepto untables y ricotas',1),(8,'Hamburguesas, milanesas y bocaditos de carne, poll','Hamburguesas, milanesas y bocaditos de carne, pollo, cerdo y/o pescado congelados',1),(9,'Vegetales congelados, milanesas y medallones sin c','Vegetales congelados, milanesas y medallones sin carne congelados',1),(10,'Comidas preparadas y panificados congelados','Comidas preparadas y panificados congelados',1),(11,'Helados y postres congelados','Helados y postres congelados',1),(12,'Frutas y verduras','Frutas y verduras',1),(13,'Salsas y aderezos','Salsas y aderezos',1),(14,'Especias y condimentos','Especias y condimentos',1),(15,'Polvo para postres y repostería, y productos de re','Polvo para postres y repostería, y productos de repostería',1),(16,'Conservas y salsas de tomate','Conservas y salsas de tomate',1),(17,'Otras conservas','Otras conservas',1),(18,'Pastas secas','Pastas secas',1),(19,'Arroz','Arroz',1),(20,'Sopas, caldos y puré','Sopas, caldos y puré',1),(21,'Legumbres secas, otras harinas, granos y semillas','Legumbres secas, otras harinas, granos y semillas',1),(22,'Aceites','Aceites',1),(23,'Panes rallados y rebozadores','Panes rallados y rebozadores',1),(24,'Harinas de trigo y premezclas','Harinas de trigo y premezclas',1),(25,'Golosinas, alfajores y chocolates','Golosinas, alfajores y chocolates',1),(26,'Panificados y cereales','Panificados y cereales',1),(27,'Galletitas','Galletitas',1),(28,'Infusiones','Infusiones',1),(29,'Mermeladas, dulces y miel','Mermeladas, dulces y miel',1),(30,'Dulce de leche','Dulce de leche',1),(31,'Endulzantes','Endulzantes',1),(32,'Snacks','Snacks',1),(33,'Jugos','Jugos',1),(34,'Aguas saborizadas','Aguas saborizadas',1),(35,'Gaseosas','Gaseosas',1),(36,'Aguas','Aguas',1),(37,'Bebidas sin alcohol refrigeradas','Bebidas sin alcohol refrigeradas',1),(38,'Cervezas y aperitivos','Cervezas y aperitivos',1),(39,'Vinos y espumantes','Vinos y espumantes',1),(40,'Espirituosas, destilados y licores','Espirituosas, destilados y licores',1),(41,'Bebidas con alcohol refrigeradas','Bebidas con alcohol refrigeradas',1),(42,'Afeitado y depilación','Afeitado y depilación',1),(43,'Colonias y desodorantes corporales, polvos pédicos','Colonias y desodorantes corporales, polvos pédicos y talcos',1),(44,'Jabones de tocador, geles y sales de baño, artícul','Jabones de tocador, geles y sales de baño, artículos de baño',1),(45,'Cremas decolorantes y coloración para el cabello','Cremas decolorantes y coloración para el cabello',1),(46,'Champúes, Acondicionadores, fijadores y productos ','Champúes, Acondicionadores, fijadores y productos para el tratamiento capilar',1),(47,'Cuidado facial y artículos de farmacia','Cuidado facial y artículos de farmacia',1),(48,'Cremas corporales','Cremas corporales',1),(49,'Protectores solares y bronceadores','Protectores solares y bronceadores',1),(50,'Cuidado oral','Cuidado oral',1),(51,'Productos para la higiene del bebé, accesorios par','Productos para la higiene del bebé, accesorios para el bebé y alimentación infantil',1),(52,'Pañales y ropa interior descartable.','Pañales y ropa interior descartable.',1),(53,'Productos de gestión menstrual, toallas para la in','Productos de gestión menstrual, toallas para la incontinencia y cuidado materno',1),(54,'Accesorios de limpieza','Accesorios de limpieza',1),(55,'Accesorios de cocina','Accesorios de cocina',1),(56,'Jabón en pan, prelavado, quitamanchas y perfumes p','Jabón en pan, prelavado, quitamanchas y perfumes para la ropa',1),(57,'Jabones en polvo, jabones líquidos y suavizantes p','Jabones en polvo, jabones líquidos y suavizantes para la ropa',1),(58,'Desodorantes y desinfectantes ambientales','Desodorantes y desinfectantes ambientales',1),(59,'Lavandinas','Lavandinas',1),(60,'Lavavajillas','Lavavajillas',1),(61,'Limpieza de pisos y muebles','Limpieza de pisos y muebles',1),(62,'Limpiadores cremosos, de cocina, de baño y multius','Limpiadores cremosos, de cocina, de baño y multiuso',1),(63,'Insecticidas y repelentes','Insecticidas y repelentes',1),(64,'Papeles','Papeles',1),(65,'Alimentos y accesorios para mascotas','Alimentos y accesorios para mascotas',1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `idProvince` int(11) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idProvince_idx` (`idProvince`),
  CONSTRAINT `idProvince` FOREIGN KEY (`idProvince`) REFERENCES `provinces` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,1,'25 de Mayo',NULL,1),(2,1,'3 de febrero',NULL,1),(3,1,'A. Alsina',NULL,1),(4,1,'A. Gonzáles Cháves',NULL,1),(5,1,'Aguas Verdes',NULL,1),(6,1,'Alberti',NULL,1),(7,1,'Arrecifes',NULL,1),(8,1,'Ayacucho',NULL,1),(9,1,'Azul',NULL,1),(10,1,'Bahía Blanca',NULL,1),(11,1,'Balcarce',NULL,1),(12,1,'Baradero',NULL,1),(13,1,'Benito Juárez',NULL,1),(14,1,'Berisso',NULL,1),(15,1,'Bolívar',NULL,1),(16,1,'Bragado',NULL,1),(17,1,'Brandsen',NULL,1),(18,1,'Campana',NULL,1),(19,1,'Cañuelas',NULL,1),(20,1,'Capilla del Señor',NULL,1),(21,1,'Capitán Sarmiento',NULL,1),(22,1,'Carapachay',NULL,1),(23,1,'Carhue',NULL,1),(24,1,'Cariló',NULL,1),(25,1,'Carlos Casares',NULL,1),(26,1,'Carlos Tejedor',NULL,1),(27,1,'Carmen de Areco',NULL,1),(28,1,'Carmen de Patagones',NULL,1),(29,1,'Castelli',NULL,1),(30,1,'Chacabuco',NULL,1),(31,1,'Chascomús',NULL,1),(32,1,'Chivilcoy',NULL,1),(33,1,'Colón',NULL,1),(34,1,'Coronel Dorrego',NULL,1),(35,1,'Coronel Pringles',NULL,1),(36,1,'Coronel Rosales',NULL,1),(37,1,'Coronel Suarez',NULL,1),(38,1,'Costa Azul',NULL,1),(39,1,'Costa Chica',NULL,1),(40,1,'Costa del Este',NULL,1),(41,1,'Costa Esmeralda',NULL,1),(42,1,'Daireaux',NULL,1),(43,1,'Darregueira',NULL,1),(44,1,'Del Viso',NULL,1),(45,1,'Dolores',NULL,1),(46,1,'Don Torcuato',NULL,1),(47,1,'Ensenada',NULL,1),(48,1,'Escobar',NULL,1),(49,1,'Exaltación de la Cruz',NULL,1),(50,1,'Florentino Ameghino',NULL,1),(51,1,'Garín',NULL,1),(52,1,'Gral. Alvarado',NULL,1),(53,1,'Gral. Alvear',NULL,1),(54,1,'Gral. Arenales',NULL,1),(55,1,'Gral. Belgrano',NULL,1),(56,1,'Gral. Guido',NULL,1),(57,1,'Gral. Lamadrid',NULL,1),(58,1,'Gral. Las Heras',NULL,1),(59,1,'Gral. Lavalle',NULL,1),(60,1,'Gral. Madariaga',NULL,1),(61,1,'Gral. Pacheco',NULL,1),(62,1,'Gral. Paz',NULL,1),(63,1,'Gral. Pinto',NULL,1),(64,1,'Gral. Pueyrredón',NULL,1),(65,1,'Gral. Rodríguez',NULL,1),(66,1,'Gral. Viamonte',NULL,1),(67,1,'Gral. Villegas',NULL,1),(68,1,'Guaminí',NULL,1),(69,1,'Guernica',NULL,1),(70,1,'Hipólito Yrigoyen',NULL,1),(71,1,'Ing. Maschwitz',NULL,1),(72,1,'Junín',NULL,1),(73,1,'La Plata',NULL,1),(74,1,'Laprida',NULL,1),(75,1,'Las Flores',NULL,1),(76,1,'Las Toninas',NULL,1),(77,1,'Leandro N. Alem',NULL,1),(78,1,'Lincoln',NULL,1),(79,1,'Loberia',NULL,1),(80,1,'Lobos',NULL,1),(81,1,'Los Cardales',NULL,1),(82,1,'Los Toldos',NULL,1),(83,1,'Lucila del Mar',NULL,1),(84,1,'Luján',NULL,1),(85,1,'Magdalena',NULL,1),(86,1,'Maipú',NULL,1),(87,1,'Mar Chiquita',NULL,1),(88,1,'Mar de Ajó',NULL,1),(89,1,'Mar de las Pampas',NULL,1),(90,1,'Mar del Plata',NULL,1),(91,1,'Mar del Tuyú',NULL,1),(92,1,'Marcos Paz',NULL,1),(93,1,'Mercedes',NULL,1),(94,1,'Miramar',NULL,1),(95,1,'Monte',NULL,1),(96,1,'Monte Hermoso',NULL,1),(97,1,'Munro',NULL,1),(98,1,'Navarro',NULL,1),(99,1,'Necochea',NULL,1),(100,1,'Olavarría',NULL,1),(101,1,'Partido de la Costa',NULL,1),(102,1,'Pehuajó',NULL,1),(103,1,'Pellegrini',NULL,1),(104,1,'Pergamino',NULL,1),(105,1,'Pigüé',NULL,1),(106,1,'Pila',NULL,1),(107,1,'Pilar',NULL,1),(108,1,'Pinamar',NULL,1),(109,1,'Pinar del Sol',NULL,1),(110,1,'Polvorines',NULL,1),(111,1,'Pte. Perón',NULL,1),(112,1,'Puán',NULL,1),(113,1,'Punta Indio',NULL,1),(114,1,'Ramallo',NULL,1),(115,1,'Rauch',NULL,1),(116,1,'Rivadavia',NULL,1),(117,1,'Rojas',NULL,1),(118,1,'Roque Pérez',NULL,1),(119,1,'Saavedra',NULL,1),(120,1,'Saladillo',NULL,1),(121,1,'Salliqueló',NULL,1),(122,1,'Salto',NULL,1),(123,1,'San Andrés de Giles',NULL,1),(124,1,'San Antonio de Areco',NULL,1),(125,1,'San Antonio de Padua',NULL,1),(126,1,'San Bernardo',NULL,1),(127,1,'San Cayetano',NULL,1),(128,1,'San Clemente del Tuyú',NULL,1),(129,1,'San Nicolás',NULL,1),(130,1,'San Pedro',NULL,1),(131,1,'San Vicente',NULL,1),(132,1,'Santa Teresita',NULL,1),(133,1,'Suipacha',NULL,1),(134,1,'Tandil',NULL,1),(135,1,'Tapalqué',NULL,1),(136,1,'Tordillo',NULL,1),(137,1,'Tornquist',NULL,1),(138,1,'Trenque Lauquen',NULL,1),(139,1,'Tres Lomas',NULL,1),(140,1,'Villa Gesell',NULL,1),(141,1,'Villarino',NULL,1),(142,1,'Zárate',NULL,1),(143,2,'11 de Septiembre',NULL,1),(144,2,'20 de Junio',NULL,1),(145,2,'25 de Mayo',NULL,1),(146,2,'Acassuso',NULL,1),(147,2,'Adrogué',NULL,1),(148,2,'Aldo Bonzi',NULL,1),(149,2,'Área Reserva Cinturón Ecológico',NULL,1),(150,2,'Avellaneda',NULL,1),(151,2,'Banfield',NULL,1),(152,2,'Barrio Parque',NULL,1),(153,2,'Barrio Santa Teresita',NULL,1),(154,2,'Beccar',NULL,1),(155,2,'Bella Vista',NULL,1),(156,2,'Berazategui',NULL,1),(157,2,'Bernal Este',NULL,1),(158,2,'Bernal Oeste',NULL,1),(159,2,'Billinghurst',NULL,1),(160,2,'Boulogne',NULL,1),(161,2,'Burzaco',NULL,1),(162,2,'Carapachay',NULL,1),(163,2,'Caseros',NULL,1),(164,2,'Castelar',NULL,1),(165,2,'Churruca',NULL,1),(166,2,'Ciudad Evita',NULL,1),(167,2,'Ciudad Madero',NULL,1),(168,2,'Ciudadela',NULL,1),(169,2,'Claypole',NULL,1),(170,2,'Crucecita',NULL,1),(171,2,'Dock Sud',NULL,1),(172,2,'Don Bosco',NULL,1),(173,2,'Don Orione',NULL,1),(174,2,'El Jagüel',NULL,1),(175,2,'El Libertador',NULL,1),(176,2,'El Palomar',NULL,1),(177,2,'El Tala',NULL,1),(178,2,'El Trébol',NULL,1),(179,2,'Ezeiza',NULL,1),(180,2,'Ezpeleta',NULL,1),(181,2,'Florencio Varela',NULL,1),(182,2,'Florida',NULL,1),(183,2,'Francisco Álvarez',NULL,1),(184,2,'Gerli',NULL,1),(185,2,'Glew',NULL,1),(186,2,'González Catán',NULL,1),(187,2,'Gral. Lamadrid',NULL,1),(188,2,'Grand Bourg',NULL,1),(189,2,'Gregorio de Laferrere',NULL,1),(190,2,'Guillermo Enrique Hudson',NULL,1),(191,2,'Haedo',NULL,1),(192,2,'Hurlingham',NULL,1),(193,2,'Ing. Sourdeaux',NULL,1),(194,2,'Isidro Casanova',NULL,1),(195,2,'Ituzaingó',NULL,1),(196,2,'José C. Paz',NULL,1),(197,2,'José Ingenieros',NULL,1),(198,2,'José Marmol',NULL,1),(199,2,'La Lucila',NULL,1),(200,2,'La Reja',NULL,1),(201,2,'La Tablada',NULL,1),(202,2,'Lanús',NULL,1),(203,2,'Llavallol',NULL,1),(204,2,'Loma Hermosa',NULL,1),(205,2,'Lomas de Zamora',NULL,1),(206,2,'Lomas del Millón',NULL,1),(207,2,'Lomas del Mirador',NULL,1),(208,2,'Longchamps',NULL,1),(209,2,'Los Polvorines',NULL,1),(210,2,'Luis Guillón',NULL,1),(211,2,'Malvinas Argentinas',NULL,1),(212,2,'Martín Coronado',NULL,1),(213,2,'Martínez',NULL,1),(214,2,'Merlo',NULL,1),(215,2,'Ministro Rivadavia',NULL,1),(216,2,'Monte Chingolo',NULL,1),(217,2,'Monte Grande',NULL,1),(218,2,'Moreno',NULL,1),(219,2,'Morón',NULL,1),(220,2,'Muñiz',NULL,1),(221,2,'Olivos',NULL,1),(222,2,'Pablo Nogués',NULL,1),(223,2,'Pablo Podestá',NULL,1),(224,2,'Paso del Rey',NULL,1),(225,2,'Pereyra',NULL,1),(226,2,'Piñeiro',NULL,1),(227,2,'Plátanos',NULL,1),(228,2,'Pontevedra',NULL,1),(229,2,'Quilmes',NULL,1),(230,2,'Rafael Calzada',NULL,1),(231,2,'Rafael Castillo',NULL,1),(232,2,'Ramos Mejía',NULL,1),(233,2,'Ranelagh',NULL,1),(234,2,'Remedios de Escalada',NULL,1),(235,2,'Sáenz Peña',NULL,1),(236,2,'San Antonio de Padua',NULL,1),(237,2,'San Fernando',NULL,1),(238,2,'San Francisco Solano',NULL,1),(239,2,'San Isidro',NULL,1),(240,2,'San José',NULL,1),(241,2,'San Justo',NULL,1),(242,2,'San Martín',NULL,1),(243,2,'San Miguel',NULL,1),(244,2,'Santos Lugares',NULL,1),(245,2,'Sarandí',NULL,1),(246,2,'Sourigues',NULL,1),(247,2,'Tapiales',NULL,1),(248,2,'Temperley',NULL,1),(249,2,'Tigre',NULL,1),(250,2,'Tortuguitas',NULL,1),(251,2,'Tristán Suárez',NULL,1),(252,2,'Trujui',NULL,1),(253,2,'Turdera',NULL,1),(254,2,'Valentín Alsina',NULL,1),(255,2,'Vicente López',NULL,1),(256,2,'Villa Adelina',NULL,1),(257,2,'Villa Ballester',NULL,1),(258,2,'Villa Bosch',NULL,1),(259,2,'Villa Caraza',NULL,1),(260,2,'Villa Celina',NULL,1),(261,2,'Villa Centenario',NULL,1),(262,2,'Villa de Mayo',NULL,1),(263,2,'Villa Diamante',NULL,1),(264,2,'Villa Domínico',NULL,1),(265,2,'Villa España',NULL,1),(266,2,'Villa Fiorito',NULL,1),(267,2,'Villa Guillermina',NULL,1),(268,2,'Villa Insuperable',NULL,1),(269,2,'Villa José León Suárez',NULL,1),(270,2,'Villa La Florida',NULL,1),(271,2,'Villa Luzuriaga',NULL,1),(272,2,'Villa Martelli',NULL,1),(273,2,'Villa Obrera',NULL,1),(274,2,'Villa Progreso',NULL,1),(275,2,'Villa Raffo',NULL,1),(276,2,'Villa Sarmiento',NULL,1),(277,2,'Villa Tesei',NULL,1),(278,2,'Villa Udaondo',NULL,1),(279,2,'Virrey del Pino',NULL,1),(280,2,'Wilde',NULL,1),(281,2,'William Morris',NULL,1),(282,3,'Agronomía',NULL,1),(283,3,'Almagro',NULL,1),(284,3,'Balvanera',NULL,1),(285,3,'Barracas',NULL,1),(286,3,'Belgrano',NULL,1),(287,3,'Boca',NULL,1),(288,3,'Boedo',NULL,1),(289,3,'Caballito',NULL,1),(290,3,'Chacarita',NULL,1),(291,3,'Coghlan',NULL,1),(292,3,'Colegiales',NULL,1),(293,3,'Constitución',NULL,1),(294,3,'Flores',NULL,1),(295,3,'Floresta',NULL,1),(296,3,'La Paternal',NULL,1),(297,3,'Liniers',NULL,1),(298,3,'Mataderos',NULL,1),(299,3,'Monserrat',NULL,1),(300,3,'Monte Castro',NULL,1),(301,3,'Nueva Pompeya',NULL,1),(302,3,'Núñez',NULL,1),(303,3,'Palermo',NULL,1),(304,3,'Parque Avellaneda',NULL,1),(305,3,'Parque Chacabuco',NULL,1),(306,3,'Parque Chas',NULL,1),(307,3,'Parque Patricios',NULL,1),(308,3,'Puerto Madero',NULL,1),(309,3,'Recoleta',NULL,1),(310,3,'Retiro',NULL,1),(311,3,'Saavedra',NULL,1),(312,3,'San Cristóbal',NULL,1),(313,3,'San Nicolás',NULL,1),(314,3,'San Telmo',NULL,1),(315,3,'Vélez Sársfield',NULL,1),(316,3,'Versalles',NULL,1),(317,3,'Villa Crespo',NULL,1),(318,3,'Villa del Parque',NULL,1),(319,3,'Villa Devoto',NULL,1),(320,3,'Villa Gral. Mitre',NULL,1),(321,3,'Villa Lugano',NULL,1),(322,3,'Villa Luro',NULL,1),(323,3,'Villa Ortúzar',NULL,1),(324,3,'Villa Pueyrredón',NULL,1),(325,3,'Villa Real',NULL,1),(326,3,'Villa Riachuelo',NULL,1),(327,3,'Villa Santa Rita',NULL,1),(328,3,'Villa Soldati',NULL,1),(329,3,'Villa Urquiza',NULL,1),(330,4,'Aconquija',NULL,1),(331,4,'Ancasti',NULL,1),(332,4,'Andalgalá',NULL,1),(333,4,'Antofagasta',NULL,1),(334,4,'Belén',NULL,1),(335,4,'Capayán',NULL,1),(336,4,'Capital',NULL,1),(337,4,'4',NULL,1),(338,4,'Corral Quemado',NULL,1),(339,4,'El Alto',NULL,1),(340,4,'El Rodeo',NULL,1),(341,4,'F.Mamerto Esquiú',NULL,1),(342,4,'Fiambalá',NULL,1),(343,4,'Hualfín',NULL,1),(344,4,'Huillapima',NULL,1),(345,4,'Icaño',NULL,1),(346,4,'La Puerta',NULL,1),(347,4,'Las Juntas',NULL,1),(348,4,'Londres',NULL,1),(349,4,'Los Altos',NULL,1),(350,4,'Los Varela',NULL,1),(351,4,'Mutquín',NULL,1),(352,4,'Paclín',NULL,1),(353,4,'Poman',NULL,1),(354,4,'Pozo de La Piedra',NULL,1),(355,4,'Puerta de Corral',NULL,1),(356,4,'Puerta San José',NULL,1),(357,4,'Recreo',NULL,1),(358,4,'S.F.V de 4',NULL,1),(359,4,'San Fernando',NULL,1),(360,4,'San Fernando del Valle',NULL,1),(361,4,'San José',NULL,1),(362,4,'Santa María',NULL,1),(363,4,'Santa Rosa',NULL,1),(364,4,'Saujil',NULL,1),(365,4,'Tapso',NULL,1),(366,4,'Tinogasta',NULL,1),(367,4,'Valle Viejo',NULL,1),(368,4,'Villa Vil',NULL,1),(369,5,'Aviá Teraí',NULL,1),(370,5,'Barranqueras',NULL,1),(371,5,'Basail',NULL,1),(372,5,'Campo Largo',NULL,1),(373,5,'Capital',NULL,1),(374,5,'Capitán Solari',NULL,1),(375,5,'Charadai',NULL,1),(376,5,'Charata',NULL,1),(377,5,'Chorotis',NULL,1),(378,5,'Ciervo Petiso',NULL,1),(379,5,'Cnel. Du Graty',NULL,1),(380,5,'Col. Benítez',NULL,1),(381,5,'Col. Elisa',NULL,1),(382,5,'Col. Popular',NULL,1),(383,5,'Colonias Unidas',NULL,1),(384,5,'Concepción',NULL,1),(385,5,'Corzuela',NULL,1),(386,5,'Cote Lai',NULL,1),(387,5,'El Sauzalito',NULL,1),(388,5,'Enrique Urien',NULL,1),(389,5,'Fontana',NULL,1),(390,5,'Fte. Esperanza',NULL,1),(391,5,'Gancedo',NULL,1),(392,5,'Gral. Capdevila',NULL,1),(393,5,'Gral. Pinero',NULL,1),(394,5,'Gral. San Martín',NULL,1),(395,5,'Gral. Vedia',NULL,1),(396,5,'Hermoso Campo',NULL,1),(397,5,'I. del Cerrito',NULL,1),(398,5,'J.J. Castelli',NULL,1),(399,5,'La Clotilde',NULL,1),(400,5,'La Eduvigis',NULL,1),(401,5,'La Escondida',NULL,1),(402,5,'La Leonesa',NULL,1),(403,5,'La Tigra',NULL,1),(404,5,'La Verde',NULL,1),(405,5,'Laguna Blanca',NULL,1),(406,5,'Laguna Limpia',NULL,1),(407,5,'Lapachito',NULL,1),(408,5,'Las Breñas',NULL,1),(409,5,'Las Garcitas',NULL,1),(410,5,'Las Palmas',NULL,1),(411,5,'Los Frentones',NULL,1),(412,5,'Machagai',NULL,1),(413,5,'Makallé',NULL,1),(414,5,'Margarita Belén',NULL,1),(415,5,'Miraflores',NULL,1),(416,5,'Misión N. Pompeya',NULL,1),(417,5,'Napenay',NULL,1),(418,5,'Pampa Almirón',NULL,1),(419,5,'Pampa del Indio',NULL,1),(420,5,'Pampa del Infierno',NULL,1),(421,5,'Pdcia. de La Plaza',NULL,1),(422,5,'Pdcia. Roca',NULL,1),(423,5,'Pdcia. Roque Sáenz Peña',NULL,1),(424,5,'Pto. Bermejo',NULL,1),(425,5,'Pto. Eva Perón',NULL,1),(426,5,'Puero Tirol',NULL,1),(427,5,'Puerto Vilelas',NULL,1),(428,5,'Quitilipi',NULL,1),(429,5,'Resistencia',NULL,1),(430,5,'Sáenz Peña',NULL,1),(431,5,'Samuhú',NULL,1),(432,5,'San Bernardo',NULL,1),(433,5,'Santa Sylvina',NULL,1),(434,5,'Taco Pozo',NULL,1),(435,5,'Tres Isletas',NULL,1),(436,5,'Villa Ángela',NULL,1),(437,5,'Villa Berthet',NULL,1),(438,5,'Villa R. Bermejito',NULL,1),(439,6,'Aldea Apeleg',NULL,1),(440,6,'Aldea Beleiro',NULL,1),(441,6,'Aldea Epulef',NULL,1),(442,6,'Alto Río Sengerr',NULL,1),(443,6,'Buen Pasto',NULL,1),(444,6,'Camarones',NULL,1),(445,6,'Carrenleufú',NULL,1),(446,6,'Cholila',NULL,1),(447,6,'Co. Centinela',NULL,1),(448,6,'Colan Conhué',NULL,1),(449,6,'Comodoro Rivadavia',NULL,1),(450,6,'Corcovado',NULL,1),(451,6,'Cushamen',NULL,1),(452,6,'Dique F. Ameghino',NULL,1),(453,6,'Dolavón',NULL,1),(454,6,'Dr. R. Rojas',NULL,1),(455,6,'El Hoyo',NULL,1),(456,6,'El Maitén',NULL,1),(457,6,'Epuyén',NULL,1),(458,6,'Esquel',NULL,1),(459,6,'Facundo',NULL,1),(460,6,'Gaimán',NULL,1),(461,6,'Gan Gan',NULL,1),(462,6,'Gastre',NULL,1),(463,6,'Gdor. Costa',NULL,1),(464,6,'Gualjaina',NULL,1),(465,6,'J. de San Martín',NULL,1),(466,6,'Lago Blanco',NULL,1),(467,6,'Lago Puelo',NULL,1),(468,6,'Lagunita Salada',NULL,1),(469,6,'Las Plumas',NULL,1),(470,6,'Los Altares',NULL,1),(471,6,'Paso de los Indios',NULL,1),(472,6,'Paso del Sapo',NULL,1),(473,6,'Pto. Madryn',NULL,1),(474,6,'Pto. Pirámides',NULL,1),(475,6,'Rada Tilly',NULL,1),(476,6,'Rawson',NULL,1),(477,6,'Río Mayo',NULL,1),(478,6,'Río Pico',NULL,1),(479,6,'Sarmiento',NULL,1),(480,6,'Tecka',NULL,1),(481,6,'Telsen',NULL,1),(482,6,'Trelew',NULL,1),(483,6,'Trevelin',NULL,1),(484,6,'Veintiocho de Julio',NULL,1),(485,7,'Achiras',NULL,1),(486,7,'Adelia Maria',NULL,1),(487,7,'Agua de Oro',NULL,1),(488,7,'Alcira Gigena',NULL,1),(489,7,'Aldea Santa Maria',NULL,1),(490,7,'Alejandro Roca',NULL,1),(491,7,'Alejo Ledesma',NULL,1),(492,7,'Alicia',NULL,1),(493,7,'Almafuerte',NULL,1),(494,7,'Alpa Corral',NULL,1),(495,7,'Alta Gracia',NULL,1),(496,7,'Alto Alegre',NULL,1),(497,7,'Alto de Los Quebrachos',NULL,1),(498,7,'Altos de Chipion',NULL,1),(499,7,'Amboy',NULL,1),(500,7,'Ambul',NULL,1),(501,7,'Ana Zumaran',NULL,1),(502,7,'Anisacate',NULL,1),(503,7,'Arguello',NULL,1),(504,7,'Arias',NULL,1),(505,7,'Arroyito',NULL,1),(506,7,'Arroyo Algodon',NULL,1),(507,7,'Arroyo Cabral',NULL,1),(508,7,'Arroyo Los Patos',NULL,1),(509,7,'Assunta',NULL,1),(510,7,'Atahona',NULL,1),(511,7,'Ausonia',NULL,1),(512,7,'Avellaneda',NULL,1),(513,7,'Ballesteros',NULL,1),(514,7,'Ballesteros Sud',NULL,1),(515,7,'Balnearia',NULL,1),(516,7,'Bañado de Soto',NULL,1),(517,7,'Bell Ville',NULL,1),(518,7,'Bengolea',NULL,1),(519,7,'Benjamin Gould',NULL,1),(520,7,'Berrotaran',NULL,1),(521,7,'Bialet Masse',NULL,1),(522,7,'Bouwer',NULL,1),(523,7,'Brinkmann',NULL,1),(524,7,'Buchardo',NULL,1),(525,7,'Bulnes',NULL,1),(526,7,'Cabalango',NULL,1),(527,7,'Calamuchita',NULL,1),(528,7,'Calchin',NULL,1),(529,7,'Calchin Oeste',NULL,1),(530,7,'Calmayo',NULL,1),(531,7,'Camilo Aldao',NULL,1),(532,7,'Caminiaga',NULL,1),(533,7,'Cañada de Luque',NULL,1),(534,7,'Cañada de Machado',NULL,1),(535,7,'Cañada de Rio Pinto',NULL,1),(536,7,'Cañada del Sauce',NULL,1),(537,7,'Canals',NULL,1),(538,7,'Candelaria Sud',NULL,1),(539,7,'Capilla de Remedios',NULL,1),(540,7,'Capilla de Siton',NULL,1),(541,7,'Capilla del Carmen',NULL,1),(542,7,'Capilla del Monte',NULL,1),(543,7,'Capital',NULL,1),(544,7,'Capitan Gral B. O´Higgins',NULL,1),(545,7,'Carnerillo',NULL,1),(546,7,'Carrilobo',NULL,1),(547,7,'Casa Grande',NULL,1),(548,7,'Cavanagh',NULL,1),(549,7,'Cerro Colorado',NULL,1),(550,7,'Chaján',NULL,1),(551,7,'Chalacea',NULL,1),(552,7,'Chañar Viejo',NULL,1),(553,7,'Chancaní',NULL,1),(554,7,'Charbonier',NULL,1),(555,7,'Charras',NULL,1),(556,7,'Chazón',NULL,1),(557,7,'Chilibroste',NULL,1),(558,7,'Chucul',NULL,1),(559,7,'Chuña',NULL,1),(560,7,'Chuña Huasi',NULL,1),(561,7,'Churqui Cañada',NULL,1),(562,7,'Cienaga Del Coro',NULL,1),(563,7,'Cintra',NULL,1),(564,7,'Col. Almada',NULL,1),(565,7,'Col. Anita',NULL,1),(566,7,'Col. Barge',NULL,1),(567,7,'Col. Bismark',NULL,1),(568,7,'Col. Bremen',NULL,1),(569,7,'Col. Caroya',NULL,1),(570,7,'Col. Italiana',NULL,1),(571,7,'Col. Iturraspe',NULL,1),(572,7,'Col. Las Cuatro Esquinas',NULL,1),(573,7,'Col. Las Pichanas',NULL,1),(574,7,'Col. Marina',NULL,1),(575,7,'Col. Prosperidad',NULL,1),(576,7,'Col. San Bartolome',NULL,1),(577,7,'Col. San Pedro',NULL,1),(578,7,'Col. Tirolesa',NULL,1),(579,7,'Col. Vicente Aguero',NULL,1),(580,7,'Col. Videla',NULL,1),(581,7,'Col. Vignaud',NULL,1),(582,7,'Col. Waltelina',NULL,1),(583,7,'Colazo',NULL,1),(584,7,'Comechingones',NULL,1),(585,7,'Conlara',NULL,1),(586,7,'Copacabana',NULL,1),(587,7,'7',NULL,1),(588,7,'Coronel Baigorria',NULL,1),(589,7,'Coronel Moldes',NULL,1),(590,7,'Corral de Bustos',NULL,1),(591,7,'Corralito',NULL,1),(592,7,'Cosquín',NULL,1),(593,7,'Costa Sacate',NULL,1),(594,7,'Cruz Alta',NULL,1),(595,7,'Cruz de Caña',NULL,1),(596,7,'Cruz del Eje',NULL,1),(597,7,'Cuesta Blanca',NULL,1),(598,7,'Dean Funes',NULL,1),(599,7,'Del Campillo',NULL,1),(600,7,'Despeñaderos',NULL,1),(601,7,'Devoto',NULL,1),(602,7,'Diego de Rojas',NULL,1),(603,7,'Dique Chico',NULL,1),(604,7,'El Arañado',NULL,1),(605,7,'El Brete',NULL,1),(606,7,'El Chacho',NULL,1),(607,7,'El Crispín',NULL,1),(608,7,'El Fortín',NULL,1),(609,7,'El Manzano',NULL,1),(610,7,'El Rastreador',NULL,1),(611,7,'El Rodeo',NULL,1),(612,7,'El Tío',NULL,1),(613,7,'Elena',NULL,1),(614,7,'Embalse',NULL,1),(615,7,'Esquina',NULL,1),(616,7,'Estación Gral. Paz',NULL,1),(617,7,'Estación Juárez Celman',NULL,1),(618,7,'Estancia de Guadalupe',NULL,1),(619,7,'Estancia Vieja',NULL,1),(620,7,'Etruria',NULL,1),(621,7,'Eufrasio Loza',NULL,1),(622,7,'Falda del Carmen',NULL,1),(623,7,'Freyre',NULL,1),(624,7,'Gral. Baldissera',NULL,1),(625,7,'Gral. Cabrera',NULL,1),(626,7,'Gral. Deheza',NULL,1),(627,7,'Gral. Fotheringham',NULL,1),(628,7,'Gral. Levalle',NULL,1),(629,7,'Gral. Roca',NULL,1),(630,7,'Guanaco Muerto',NULL,1),(631,7,'Guasapampa',NULL,1),(632,7,'Guatimozin',NULL,1),(633,7,'Gutenberg',NULL,1),(634,7,'Hernando',NULL,1),(635,7,'Huanchillas',NULL,1),(636,7,'Huerta Grande',NULL,1),(637,7,'Huinca Renanco',NULL,1),(638,7,'Idiazabal',NULL,1),(639,7,'Impira',NULL,1),(640,7,'Inriville',NULL,1),(641,7,'Isla Verde',NULL,1),(642,7,'Italó',NULL,1),(643,7,'James Craik',NULL,1),(644,7,'Jesús María',NULL,1),(645,7,'Jovita',NULL,1),(646,7,'Justiniano Posse',NULL,1),(647,7,'Km 658',NULL,1),(648,7,'L. V. Mansilla',NULL,1),(649,7,'La Batea',NULL,1),(650,7,'La Calera',NULL,1),(651,7,'La Carlota',NULL,1),(652,7,'La Carolina',NULL,1),(653,7,'La Cautiva',NULL,1),(654,7,'La Cesira',NULL,1),(655,7,'La Cruz',NULL,1),(656,7,'La Cumbre',NULL,1),(657,7,'La Cumbrecita',NULL,1),(658,7,'La Falda',NULL,1),(659,7,'La Francia',NULL,1),(660,7,'La Granja',NULL,1),(661,7,'La Higuera',NULL,1),(662,7,'La Laguna',NULL,1),(663,7,'La Paisanita',NULL,1),(664,7,'La Palestina',NULL,1),(665,7,'12',NULL,1),(666,7,'La Paquita',NULL,1),(667,7,'La Para',NULL,1),(668,7,'La Paz',NULL,1),(669,7,'La Playa',NULL,1),(670,7,'La Playosa',NULL,1),(671,7,'La Población',NULL,1),(672,7,'La Posta',NULL,1),(673,7,'La Puerta',NULL,1),(674,7,'La Quinta',NULL,1),(675,7,'La Rancherita',NULL,1),(676,7,'La Rinconada',NULL,1),(677,7,'La Serranita',NULL,1),(678,7,'La Tordilla',NULL,1),(679,7,'Laborde',NULL,1),(680,7,'Laboulaye',NULL,1),(681,7,'Laguna Larga',NULL,1),(682,7,'Las Acequias',NULL,1),(683,7,'Las Albahacas',NULL,1),(684,7,'Las Arrias',NULL,1),(685,7,'Las Bajadas',NULL,1),(686,7,'Las Caleras',NULL,1),(687,7,'Las Calles',NULL,1),(688,7,'Las Cañadas',NULL,1),(689,7,'Las Gramillas',NULL,1),(690,7,'Las Higueras',NULL,1),(691,7,'Las Isletillas',NULL,1),(692,7,'Las Junturas',NULL,1),(693,7,'Las Palmas',NULL,1),(694,7,'Las Peñas',NULL,1),(695,7,'Las Peñas Sud',NULL,1),(696,7,'Las Perdices',NULL,1),(697,7,'Las Playas',NULL,1),(698,7,'Las Rabonas',NULL,1),(699,7,'Las Saladas',NULL,1),(700,7,'Las Tapias',NULL,1),(701,7,'Las Varas',NULL,1),(702,7,'Las Varillas',NULL,1),(703,7,'Las Vertientes',NULL,1),(704,7,'Leguizamón',NULL,1),(705,7,'Leones',NULL,1),(706,7,'Los Cedros',NULL,1),(707,7,'Los Cerrillos',NULL,1),(708,7,'Los Chañaritos (C.E)',NULL,1),(709,7,'Los Chanaritos (R.S)',NULL,1),(710,7,'Los Cisnes',NULL,1),(711,7,'Los Cocos',NULL,1),(712,7,'Los Cóndores',NULL,1),(713,7,'Los Hornillos',NULL,1),(714,7,'Los Hoyos',NULL,1),(715,7,'Los Mistoles',NULL,1),(716,7,'Los Molinos',NULL,1),(717,7,'Los Pozos',NULL,1),(718,7,'Los Reartes',NULL,1),(719,7,'Los Surgentes',NULL,1),(720,7,'Los Talares',NULL,1),(721,7,'Los Zorros',NULL,1),(722,7,'Lozada',NULL,1),(723,7,'Luca',NULL,1),(724,7,'Luque',NULL,1),(725,7,'Luyaba',NULL,1),(726,7,'Malagueño',NULL,1),(727,7,'Malena',NULL,1),(728,7,'Malvinas Argentinas',NULL,1),(729,7,'Manfredi',NULL,1),(730,7,'Maquinista Gallini',NULL,1),(731,7,'Marcos Juárez',NULL,1),(732,7,'Marull',NULL,1),(733,7,'Matorrales',NULL,1),(734,7,'Mattaldi',NULL,1),(735,7,'Mayu Sumaj',NULL,1),(736,7,'Media Naranja',NULL,1),(737,7,'Melo',NULL,1),(738,7,'Mendiolaza',NULL,1),(739,7,'Mi Granja',NULL,1),(740,7,'Mina Clavero',NULL,1),(741,7,'Miramar',NULL,1),(742,7,'Morrison',NULL,1),(743,7,'Morteros',NULL,1),(744,7,'Mte. Buey',NULL,1),(745,7,'Mte. Cristo',NULL,1),(746,7,'Mte. De Los Gauchos',NULL,1),(747,7,'Mte. Leña',NULL,1),(748,7,'Mte. Maíz',NULL,1),(749,7,'Mte. Ralo',NULL,1),(750,7,'Nicolás Bruzone',NULL,1),(751,7,'Noetinger',NULL,1),(752,7,'Nono',NULL,1),(753,7,'Nueva 7',NULL,1),(754,7,'Obispo Trejo',NULL,1),(755,7,'Olaeta',NULL,1),(756,7,'Oliva',NULL,1),(757,7,'Olivares San Nicolás',NULL,1),(758,7,'Onagolty',NULL,1),(759,7,'Oncativo',NULL,1),(760,7,'Ordoñez',NULL,1),(761,7,'Pacheco De Melo',NULL,1),(762,7,'Pampayasta N.',NULL,1),(763,7,'Pampayasta S.',NULL,1),(764,7,'Panaholma',NULL,1),(765,7,'Pascanas',NULL,1),(766,7,'Pasco',NULL,1),(767,7,'Paso del Durazno',NULL,1),(768,7,'Paso Viejo',NULL,1),(769,7,'Pilar',NULL,1),(770,7,'Pincén',NULL,1),(771,7,'Piquillín',NULL,1),(772,7,'Plaza de Mercedes',NULL,1),(773,7,'Plaza Luxardo',NULL,1),(774,7,'Porteña',NULL,1),(775,7,'Potrero de Garay',NULL,1),(776,7,'Pozo del Molle',NULL,1),(777,7,'Pozo Nuevo',NULL,1),(778,7,'Pueblo Italiano',NULL,1),(779,7,'Puesto de Castro',NULL,1),(780,7,'Punta del Agua',NULL,1),(781,7,'Quebracho Herrado',NULL,1),(782,7,'Quilino',NULL,1),(783,7,'Rafael García',NULL,1),(784,7,'Ranqueles',NULL,1),(785,7,'Rayo Cortado',NULL,1),(786,7,'Reducción',NULL,1),(787,7,'Rincón',NULL,1),(788,7,'Río Bamba',NULL,1),(789,7,'Río Ceballos',NULL,1),(790,7,'Río Cuarto',NULL,1),(791,7,'Río de Los Sauces',NULL,1),(792,7,'Río Primero',NULL,1),(793,7,'Río Segundo',NULL,1),(794,7,'Río Tercero',NULL,1),(795,7,'Rosales',NULL,1),(796,7,'Rosario del Saladillo',NULL,1),(797,7,'Sacanta',NULL,1),(798,7,'Sagrada Familia',NULL,1),(799,7,'Saira',NULL,1),(800,7,'Saladillo',NULL,1),(801,7,'Saldán',NULL,1),(802,7,'Salsacate',NULL,1),(803,7,'Salsipuedes',NULL,1),(804,7,'Sampacho',NULL,1),(805,7,'San Agustín',NULL,1),(806,7,'San Antonio de Arredondo',NULL,1),(807,7,'San Antonio de Litín',NULL,1),(808,7,'San Basilio',NULL,1),(809,7,'San Carlos Minas',NULL,1),(810,7,'San Clemente',NULL,1),(811,7,'San Esteban',NULL,1),(812,7,'San Francisco',NULL,1),(813,7,'San Ignacio',NULL,1),(814,7,'San Javier',NULL,1),(815,7,'San Jerónimo',NULL,1),(816,7,'San Joaquín',NULL,1),(817,7,'San José de La Dormida',NULL,1),(818,7,'San José de Las Salinas',NULL,1),(819,7,'San Lorenzo',NULL,1),(820,7,'San Marcos Sierras',NULL,1),(821,7,'San Marcos Sud',NULL,1),(822,7,'San Pedro',NULL,1),(823,7,'San Pedro N.',NULL,1),(824,7,'San Roque',NULL,1),(825,7,'San Vicente',NULL,1),(826,7,'Santa Catalina',NULL,1),(827,7,'Santa Elena',NULL,1),(828,7,'Santa Eufemia',NULL,1),(829,7,'Santa Maria',NULL,1),(830,7,'Sarmiento',NULL,1),(831,7,'Saturnino M.Laspiur',NULL,1),(832,7,'Sauce Arriba',NULL,1),(833,7,'Sebastián Elcano',NULL,1),(834,7,'Seeber',NULL,1),(835,7,'Segunda Usina',NULL,1),(836,7,'Serrano',NULL,1),(837,7,'Serrezuela',NULL,1),(838,7,'Sgo. Temple',NULL,1),(839,7,'Silvio Pellico',NULL,1),(840,7,'Simbolar',NULL,1),(841,7,'Sinsacate',NULL,1),(842,7,'Sta. Rosa de Calamuchita',NULL,1),(843,7,'Sta. Rosa de Río Primero',NULL,1),(844,7,'Suco',NULL,1),(845,7,'Tala Cañada',NULL,1),(846,7,'Tala Huasi',NULL,1),(847,7,'Talaini',NULL,1),(848,7,'Tancacha',NULL,1),(849,7,'Tanti',NULL,1),(850,7,'Ticino',NULL,1),(851,7,'Tinoco',NULL,1),(852,7,'Tío Pujio',NULL,1),(853,7,'Toledo',NULL,1),(854,7,'Toro Pujio',NULL,1),(855,7,'Tosno',NULL,1),(856,7,'Tosquita',NULL,1),(857,7,'Tránsito',NULL,1),(858,7,'Tuclame',NULL,1),(859,7,'Tutti',NULL,1),(860,7,'Ucacha',NULL,1),(861,7,'Unquillo',NULL,1),(862,7,'Valle de Anisacate',NULL,1),(863,7,'Valle Hermoso',NULL,1),(864,7,'Vélez Sarfield',NULL,1),(865,7,'Viamonte',NULL,1),(866,7,'Vicuña Mackenna',NULL,1),(867,7,'Villa Allende',NULL,1),(868,7,'Villa Amancay',NULL,1),(869,7,'Villa Ascasubi',NULL,1),(870,7,'Villa Candelaria N.',NULL,1),(871,7,'Villa Carlos Paz',NULL,1),(872,7,'Villa Cerro Azul',NULL,1),(873,7,'Villa Ciudad de América',NULL,1),(874,7,'Villa Ciudad Pque Los Reartes',NULL,1),(875,7,'Villa Concepción del Tío',NULL,1),(876,7,'Villa Cura Brochero',NULL,1),(877,7,'Villa de Las Rosas',NULL,1),(878,7,'Villa de María',NULL,1),(879,7,'Villa de Pocho',NULL,1),(880,7,'Villa de Soto',NULL,1),(881,7,'Villa del Dique',NULL,1),(882,7,'Villa del Prado',NULL,1),(883,7,'Villa del Rosario',NULL,1),(884,7,'Villa del Totoral',NULL,1),(885,7,'Villa Dolores',NULL,1),(886,7,'Villa El Chancay',NULL,1),(887,7,'Villa Elisa',NULL,1),(888,7,'Villa Flor Serrana',NULL,1),(889,7,'Villa Fontana',NULL,1),(890,7,'Villa Giardino',NULL,1),(891,7,'Villa Gral. Belgrano',NULL,1),(892,7,'Villa Gutierrez',NULL,1),(893,7,'Villa Huidobro',NULL,1),(894,7,'Villa La Bolsa',NULL,1),(895,7,'Villa Los Aromos',NULL,1),(896,7,'Villa Los Patos',NULL,1),(897,7,'Villa María',NULL,1),(898,7,'Villa Nueva',NULL,1),(899,7,'Villa Pque. Santa Ana',NULL,1),(900,7,'Villa Pque. Siquiman',NULL,1),(901,7,'Villa Quillinzo',NULL,1),(902,7,'Villa Rossi',NULL,1),(903,7,'Villa Rumipal',NULL,1),(904,7,'Villa San Esteban',NULL,1),(905,7,'Villa San Isidro',NULL,1),(906,7,'Villa 21',NULL,1),(907,7,'Villa Sarmiento (G.R)',NULL,1),(908,7,'Villa Sarmiento (S.A)',NULL,1),(909,7,'Villa Tulumba',NULL,1),(910,7,'Villa Valeria',NULL,1),(911,7,'Villa Yacanto',NULL,1),(912,7,'Washington',NULL,1),(913,7,'Wenceslao Escalante',NULL,1),(914,7,'Ycho Cruz Sierras',NULL,1),(915,8,'Alvear',NULL,1),(916,8,'Bella Vista',NULL,1),(917,8,'Berón de Astrada',NULL,1),(918,8,'Bonpland',NULL,1),(919,8,'Caá Cati',NULL,1),(920,8,'Capital',NULL,1),(921,8,'Chavarría',NULL,1),(922,8,'Col. C. Pellegrini',NULL,1),(923,8,'Col. Libertad',NULL,1),(924,8,'Col. Liebig',NULL,1),(925,8,'Col. Sta Rosa',NULL,1),(926,8,'Concepción',NULL,1),(927,8,'Cruz de Los Milagros',NULL,1),(928,8,'Curuzú-Cuatiá',NULL,1),(929,8,'Empedrado',NULL,1),(930,8,'Esquina',NULL,1),(931,8,'Estación Torrent',NULL,1),(932,8,'Felipe Yofré',NULL,1),(933,8,'Garruchos',NULL,1),(934,8,'Gdor. Agrónomo',NULL,1),(935,8,'Gdor. Martínez',NULL,1),(936,8,'Goya',NULL,1),(937,8,'Guaviravi',NULL,1),(938,8,'Herlitzka',NULL,1),(939,8,'Ita-Ibate',NULL,1),(940,8,'Itatí',NULL,1),(941,8,'Ituzaingó',NULL,1),(942,8,'José Rafael Gómez',NULL,1),(943,8,'Juan Pujol',NULL,1),(944,8,'La Cruz',NULL,1),(945,8,'Lavalle',NULL,1),(946,8,'Lomas de Vallejos',NULL,1),(947,8,'Loreto',NULL,1),(948,8,'Mariano I. Loza',NULL,1),(949,8,'Mburucuyá',NULL,1),(950,8,'Mercedes',NULL,1),(951,8,'Mocoretá',NULL,1),(952,8,'Mte. Caseros',NULL,1),(953,8,'Nueve de Julio',NULL,1),(954,8,'Palmar Grande',NULL,1),(955,8,'Parada Pucheta',NULL,1),(956,8,'Paso de La Patria',NULL,1),(957,8,'Paso de Los Libres',NULL,1),(958,8,'Pedro R. Fernandez',NULL,1),(959,8,'Perugorría',NULL,1),(960,8,'Pueblo Libertador',NULL,1),(961,8,'Ramada Paso',NULL,1),(962,8,'Riachuelo',NULL,1),(963,8,'Saladas',NULL,1),(964,8,'San Antonio',NULL,1),(965,8,'San Carlos',NULL,1),(966,8,'San Cosme',NULL,1),(967,8,'San Lorenzo',NULL,1),(968,8,'20 del Palmar',NULL,1),(969,8,'San Miguel',NULL,1),(970,8,'San Roque',NULL,1),(971,8,'Santa Ana',NULL,1),(972,8,'Santa Lucía',NULL,1),(973,8,'Santo Tomé',NULL,1),(974,8,'Sauce',NULL,1),(975,8,'Tabay',NULL,1),(976,8,'Tapebicuá',NULL,1),(977,8,'Tatacua',NULL,1),(978,8,'Virasoro',NULL,1),(979,8,'Yapeyú',NULL,1),(980,8,'Yataití Calle',NULL,1),(981,9,'Alarcón',NULL,1),(982,9,'Alcaraz',NULL,1),(983,9,'Alcaraz N.',NULL,1),(984,9,'Alcaraz S.',NULL,1),(985,9,'Aldea Asunción',NULL,1),(986,9,'Aldea Brasilera',NULL,1),(987,9,'Aldea Elgenfeld',NULL,1),(988,9,'Aldea Grapschental',NULL,1),(989,9,'Aldea Ma. Luisa',NULL,1),(990,9,'Aldea Protestante',NULL,1),(991,9,'Aldea Salto',NULL,1),(992,9,'Aldea San Antonio (G)',NULL,1),(993,9,'Aldea San Antonio (P)',NULL,1),(994,9,'Aldea 19',NULL,1),(995,9,'Aldea San Miguel',NULL,1),(996,9,'Aldea San Rafael',NULL,1),(997,9,'Aldea Spatzenkutter',NULL,1),(998,9,'Aldea Sta. María',NULL,1),(999,9,'Aldea Sta. Rosa',NULL,1),(1000,9,'Aldea Valle María',NULL,1),(1001,9,'Altamirano Sur',NULL,1),(1002,9,'Antelo',NULL,1),(1003,9,'Antonio Tomás',NULL,1),(1004,9,'Aranguren',NULL,1),(1005,9,'Arroyo Barú',NULL,1),(1006,9,'Arroyo Burgos',NULL,1),(1007,9,'Arroyo Clé',NULL,1),(1008,9,'Arroyo Corralito',NULL,1),(1009,9,'Arroyo del Medio',NULL,1),(1010,9,'Arroyo Maturrango',NULL,1),(1011,9,'Arroyo Palo Seco',NULL,1),(1012,9,'Banderas',NULL,1),(1013,9,'Basavilbaso',NULL,1),(1014,9,'Betbeder',NULL,1),(1015,9,'Bovril',NULL,1),(1016,9,'Caseros',NULL,1),(1017,9,'Ceibas',NULL,1),(1018,9,'Cerrito',NULL,1),(1019,9,'Chajarí',NULL,1),(1020,9,'Chilcas',NULL,1),(1021,9,'Clodomiro Ledesma',NULL,1),(1022,9,'Col. Alemana',NULL,1),(1023,9,'Col. Avellaneda',NULL,1),(1024,9,'Col. Avigdor',NULL,1),(1025,9,'Col. Ayuí',NULL,1),(1026,9,'Col. Baylina',NULL,1),(1027,9,'Col. Carrasco',NULL,1),(1028,9,'Col. Celina',NULL,1),(1029,9,'Col. Cerrito',NULL,1),(1030,9,'Col. Crespo',NULL,1),(1031,9,'Col. Elia',NULL,1),(1032,9,'Col. Ensayo',NULL,1),(1033,9,'Col. Gral. Roca',NULL,1),(1034,9,'Col. La Argentina',NULL,1),(1035,9,'Col. Merou',NULL,1),(1036,9,'Col. Oficial Nª3',NULL,1),(1037,9,'Col. Oficial Nº13',NULL,1),(1038,9,'Col. Oficial Nº14',NULL,1),(1039,9,'Col. Oficial Nº5',NULL,1),(1040,9,'Col. Reffino',NULL,1),(1041,9,'Col. Tunas',NULL,1),(1042,9,'Col. Viraró',NULL,1),(1043,9,'Colón',NULL,1),(1044,9,'Concepción del Uruguay',NULL,1),(1045,9,'Concordia',NULL,1),(1046,9,'Conscripto Bernardi',NULL,1),(1047,9,'Costa Grande',NULL,1),(1048,9,'Costa San Antonio',NULL,1),(1049,9,'Costa Uruguay N.',NULL,1),(1050,9,'Costa Uruguay S.',NULL,1),(1051,9,'Crespo',NULL,1),(1052,9,'Crucecitas 3ª',NULL,1),(1053,9,'Crucecitas 7ª',NULL,1),(1054,9,'Crucecitas 8ª',NULL,1),(1055,9,'Cuchilla Redonda',NULL,1),(1056,9,'Curtiembre',NULL,1),(1057,9,'Diamante',NULL,1),(1058,9,'Distrito 6º',NULL,1),(1059,9,'Distrito Chañar',NULL,1),(1060,9,'Distrito Chiqueros',NULL,1),(1061,9,'Distrito Cuarto',NULL,1),(1062,9,'Distrito Diego López',NULL,1),(1063,9,'Distrito Pajonal',NULL,1),(1064,9,'Distrito Sauce',NULL,1),(1065,9,'Distrito Tala',NULL,1),(1066,9,'Distrito Talitas',NULL,1),(1067,9,'Don Cristóbal 1ª Sección',NULL,1),(1068,9,'Don Cristóbal 2ª Sección',NULL,1),(1069,9,'Durazno',NULL,1),(1070,9,'El Cimarrón',NULL,1),(1071,9,'El Gramillal',NULL,1),(1072,9,'El Palenque',NULL,1),(1073,9,'El Pingo',NULL,1),(1074,9,'El Quebracho',NULL,1),(1075,9,'El Redomón',NULL,1),(1076,9,'El Solar',NULL,1),(1077,9,'Enrique Carbo',NULL,1),(1078,9,'9',NULL,1),(1079,9,'Espinillo N.',NULL,1),(1080,9,'Estación Campos',NULL,1),(1081,9,'Estación Escriña',NULL,1),(1082,9,'Estación Lazo',NULL,1),(1083,9,'Estación Raíces',NULL,1),(1084,9,'Estación Yerúa',NULL,1),(1085,9,'Estancia Grande',NULL,1),(1086,9,'Estancia Líbaros',NULL,1),(1087,9,'Estancia Racedo',NULL,1),(1088,9,'Estancia Solá',NULL,1),(1089,9,'Estancia Yuquerí',NULL,1),(1090,9,'Estaquitas',NULL,1),(1091,9,'Faustino M. Parera',NULL,1),(1092,9,'Febre',NULL,1),(1093,9,'Federación',NULL,1),(1094,9,'Federal',NULL,1),(1095,9,'Gdor. Echagüe',NULL,1),(1096,9,'Gdor. Mansilla',NULL,1),(1097,9,'Gilbert',NULL,1),(1098,9,'González Calderón',NULL,1),(1099,9,'Gral. Almada',NULL,1),(1100,9,'Gral. Alvear',NULL,1),(1101,9,'Gral. Campos',NULL,1),(1102,9,'Gral. Galarza',NULL,1),(1103,9,'Gral. Ramírez',NULL,1),(1104,9,'Gualeguay',NULL,1),(1105,9,'Gualeguaychú',NULL,1),(1106,9,'Gualeguaycito',NULL,1),(1107,9,'Guardamonte',NULL,1),(1108,9,'Hambis',NULL,1),(1109,9,'Hasenkamp',NULL,1),(1110,9,'Hernandarias',NULL,1),(1111,9,'Hernández',NULL,1),(1112,9,'Herrera',NULL,1),(1113,9,'Hinojal',NULL,1),(1114,9,'Hocker',NULL,1),(1115,9,'Ing. Sajaroff',NULL,1),(1116,9,'Irazusta',NULL,1),(1117,9,'Isletas',NULL,1),(1118,9,'J.J De Urquiza',NULL,1),(1119,9,'Jubileo',NULL,1),(1120,9,'La Clarita',NULL,1),(1121,9,'La Criolla',NULL,1),(1122,9,'La Esmeralda',NULL,1),(1123,9,'La Florida',NULL,1),(1124,9,'La Fraternidad',NULL,1),(1125,9,'La Hierra',NULL,1),(1126,9,'La Ollita',NULL,1),(1127,9,'La Paz',NULL,1),(1128,9,'La Picada',NULL,1),(1129,9,'La Providencia',NULL,1),(1130,9,'La Verbena',NULL,1),(1131,9,'Laguna Benítez',NULL,1),(1132,9,'Larroque',NULL,1),(1133,9,'Las Cuevas',NULL,1),(1134,9,'Las Garzas',NULL,1),(1135,9,'Las Guachas',NULL,1),(1136,9,'Las Mercedes',NULL,1),(1137,9,'Las Moscas',NULL,1),(1138,9,'Las Mulitas',NULL,1),(1139,9,'Las Toscas',NULL,1),(1140,9,'Laurencena',NULL,1),(1141,9,'Libertador San Martín',NULL,1),(1142,9,'Loma Limpia',NULL,1),(1143,9,'Los Ceibos',NULL,1),(1144,9,'Los Charruas',NULL,1),(1145,9,'Los Conquistadores',NULL,1),(1146,9,'Lucas González',NULL,1),(1147,9,'Lucas N.',NULL,1),(1148,9,'Lucas S. 1ª',NULL,1),(1149,9,'Lucas S. 2ª',NULL,1),(1150,9,'Maciá',NULL,1),(1151,9,'María Grande',NULL,1),(1152,9,'María Grande 2ª',NULL,1),(1153,9,'Médanos',NULL,1),(1154,9,'Mojones N.',NULL,1),(1155,9,'Mojones S.',NULL,1),(1156,9,'Molino Doll',NULL,1),(1157,9,'Monte Redondo',NULL,1),(1158,9,'Montoya',NULL,1),(1159,9,'Mulas Grandes',NULL,1),(1160,9,'Ñancay',NULL,1),(1161,9,'Nogoyá',NULL,1),(1162,9,'Nueva Escocia',NULL,1),(1163,9,'Nueva Vizcaya',NULL,1),(1164,9,'Ombú',NULL,1),(1165,9,'Oro Verde',NULL,1),(1166,9,'Paraná',NULL,1),(1167,9,'Pasaje Guayaquil',NULL,1),(1168,9,'Pasaje Las Tunas',NULL,1),(1169,9,'Paso de La Arena',NULL,1),(1170,9,'Paso de La Laguna',NULL,1),(1171,9,'Paso de Las Piedras',NULL,1),(1172,9,'Paso Duarte',NULL,1),(1173,9,'Pastor Britos',NULL,1),(1174,9,'Pedernal',NULL,1),(1175,9,'Perdices',NULL,1),(1176,9,'Picada Berón',NULL,1),(1177,9,'Piedras Blancas',NULL,1),(1178,9,'Primer Distrito Cuchilla',NULL,1),(1179,9,'Primero de Mayo',NULL,1),(1180,9,'Pronunciamiento',NULL,1),(1181,9,'Pto. Algarrobo',NULL,1),(1182,9,'Pto. Ibicuy',NULL,1),(1183,9,'Pueblo Brugo',NULL,1),(1184,9,'Pueblo Cazes',NULL,1),(1185,9,'Pueblo Gral. Belgrano',NULL,1),(1186,9,'Pueblo Liebig',NULL,1),(1187,9,'Puerto Yeruá',NULL,1),(1188,9,'Punta del Monte',NULL,1),(1189,9,'Quebracho',NULL,1),(1190,9,'Quinto Distrito',NULL,1),(1191,9,'Raices Oeste',NULL,1),(1192,9,'Rincón de Nogoyá',NULL,1),(1193,9,'Rincón del Cinto',NULL,1),(1194,9,'Rincón del Doll',NULL,1),(1195,9,'Rincón del Gato',NULL,1),(1196,9,'Rocamora',NULL,1),(1197,9,'Rosario del Tala',NULL,1),(1198,9,'San Benito',NULL,1),(1199,9,'San Cipriano',NULL,1),(1200,9,'San Ernesto',NULL,1),(1201,9,'San Gustavo',NULL,1),(1202,9,'San Jaime',NULL,1),(1203,9,'San José',NULL,1),(1204,9,'San José de Feliciano',NULL,1),(1205,9,'San Justo',NULL,1),(1206,9,'San Marcial',NULL,1),(1207,9,'San Pedro',NULL,1),(1208,9,'San Ramírez',NULL,1),(1209,9,'San Ramón',NULL,1),(1210,9,'San Roque',NULL,1),(1211,9,'San Salvador',NULL,1),(1212,9,'San Víctor',NULL,1),(1213,9,'Santa Ana',NULL,1),(1214,9,'Santa Anita',NULL,1),(1215,9,'Santa Elena',NULL,1),(1216,9,'Santa Lucía',NULL,1),(1217,9,'Santa Luisa',NULL,1),(1218,9,'Sauce de Luna',NULL,1),(1219,9,'Sauce Montrull',NULL,1),(1220,9,'Sauce Pinto',NULL,1),(1221,9,'Sauce Sur',NULL,1),(1222,9,'Seguí',NULL,1),(1223,9,'Sir Leonard',NULL,1),(1224,9,'Sosa',NULL,1),(1225,9,'Tabossi',NULL,1),(1226,9,'Tezanos Pinto',NULL,1),(1227,9,'Ubajay',NULL,1),(1228,9,'Urdinarrain',NULL,1),(1229,9,'Veinte de Septiembre',NULL,1),(1230,9,'Viale',NULL,1),(1231,9,'Victoria',NULL,1),(1232,9,'Villa Clara',NULL,1),(1233,9,'Villa del Rosario',NULL,1),(1234,9,'Villa Domínguez',NULL,1),(1235,9,'Villa Elisa',NULL,1),(1236,9,'Villa Fontana',NULL,1),(1237,9,'Villa Gdor. Etchevehere',NULL,1),(1238,9,'Villa Mantero',NULL,1),(1239,9,'Villa Paranacito',NULL,1),(1240,9,'Villa Urquiza',NULL,1),(1241,9,'Villaguay',NULL,1),(1242,9,'Walter Moss',NULL,1),(1243,9,'Yacaré',NULL,1),(1244,9,'Yeso Oeste',NULL,1),(1245,10,'Buena Vista',NULL,1),(1246,10,'Clorinda',NULL,1),(1247,10,'Col. Pastoril',NULL,1),(1248,10,'Cte. Fontana',NULL,1),(1249,10,'El Colorado',NULL,1),(1250,10,'El Espinillo',NULL,1),(1251,10,'Estanislao Del Campo',NULL,1),(1252,10,'10',NULL,1),(1253,10,'Fortín Lugones',NULL,1),(1254,10,'Gral. Lucio V. Mansilla',NULL,1),(1255,10,'Gral. Manuel Belgrano',NULL,1),(1256,10,'Gral. Mosconi',NULL,1),(1257,10,'Gran Guardia',NULL,1),(1258,10,'Herradura',NULL,1),(1259,10,'Ibarreta',NULL,1),(1260,10,'Ing. Juárez',NULL,1),(1261,10,'Laguna Blanca',NULL,1),(1262,10,'Laguna Naick Neck',NULL,1),(1263,10,'Laguna Yema',NULL,1),(1264,10,'Las Lomitas',NULL,1),(1265,10,'Los Chiriguanos',NULL,1),(1266,10,'Mayor V. Villafañe',NULL,1),(1267,10,'Misión San Fco.',NULL,1),(1268,10,'Palo Santo',NULL,1),(1269,10,'Pirané',NULL,1),(1270,10,'Pozo del Maza',NULL,1),(1271,10,'Riacho He-He',NULL,1),(1272,10,'San Hilario',NULL,1),(1273,10,'San Martín II',NULL,1),(1274,10,'Siete Palmas',NULL,1),(1275,10,'Subteniente Perín',NULL,1),(1276,10,'Tres Lagunas',NULL,1),(1277,10,'Villa Dos Trece',NULL,1),(1278,10,'Villa Escolar',NULL,1),(1279,10,'Villa Gral. Güemes',NULL,1),(1280,11,'Abdon Castro Tolay',NULL,1),(1281,11,'Abra Pampa',NULL,1),(1282,11,'Abralaite',NULL,1),(1283,11,'Aguas Calientes',NULL,1),(1284,11,'Arrayanal',NULL,1),(1285,11,'Barrios',NULL,1),(1286,11,'Caimancito',NULL,1),(1287,11,'Calilegua',NULL,1),(1288,11,'Cangrejillos',NULL,1),(1289,11,'Caspala',NULL,1),(1290,11,'Catuá',NULL,1),(1291,11,'Cieneguillas',NULL,1),(1292,11,'Coranzulli',NULL,1),(1293,11,'Cusi-Cusi',NULL,1),(1294,11,'El Aguilar',NULL,1),(1295,11,'El Carmen',NULL,1),(1296,11,'El Cóndor',NULL,1),(1297,11,'El Fuerte',NULL,1),(1298,11,'El Piquete',NULL,1),(1299,11,'El Talar',NULL,1),(1300,11,'Fraile Pintado',NULL,1),(1301,11,'Hipólito Yrigoyen',NULL,1),(1302,11,'Huacalera',NULL,1),(1303,11,'Humahuaca',NULL,1),(1304,11,'La Esperanza',NULL,1),(1305,11,'La Mendieta',NULL,1),(1306,11,'La Quiaca',NULL,1),(1307,11,'Ledesma',NULL,1),(1308,11,'Libertador Gral. San Martin',NULL,1),(1309,11,'Maimara',NULL,1),(1310,11,'Mina Pirquitas',NULL,1),(1311,11,'Monterrico',NULL,1),(1312,11,'Palma Sola',NULL,1),(1313,11,'Palpalá',NULL,1),(1314,11,'Pampa Blanca',NULL,1),(1315,11,'Pampichuela',NULL,1),(1316,11,'Perico',NULL,1),(1317,11,'Puesto del Marqués',NULL,1),(1318,11,'Puesto Viejo',NULL,1),(1319,11,'Pumahuasi',NULL,1),(1320,11,'Purmamarca',NULL,1),(1321,11,'Rinconada',NULL,1),(1322,11,'Rodeitos',NULL,1),(1323,11,'Rosario de Río Grande',NULL,1),(1324,11,'San Antonio',NULL,1),(1325,11,'San Francisco',NULL,1),(1326,11,'San Pedro',NULL,1),(1327,11,'San Rafael',NULL,1),(1328,11,'San Salvador',NULL,1),(1329,11,'Santa Ana',NULL,1),(1330,11,'Santa Catalina',NULL,1),(1331,11,'Santa Clara',NULL,1),(1332,11,'Susques',NULL,1),(1333,11,'Tilcara',NULL,1),(1334,11,'Tres Cruces',NULL,1),(1335,11,'Tumbaya',NULL,1),(1336,11,'Valle Grande',NULL,1),(1337,11,'Vinalito',NULL,1),(1338,11,'Volcán',NULL,1),(1339,11,'Yala',NULL,1),(1340,11,'Yaví',NULL,1),(1341,11,'Yuto',NULL,1),(1342,12,'Abramo',NULL,1),(1343,12,'Adolfo Van Praet',NULL,1),(1344,12,'Agustoni',NULL,1),(1345,12,'Algarrobo del Aguila',NULL,1),(1346,12,'Alpachiri',NULL,1),(1347,12,'Alta Italia',NULL,1),(1348,12,'Anguil',NULL,1),(1349,12,'Arata',NULL,1),(1350,12,'Ataliva Roca',NULL,1),(1351,12,'Bernardo Larroude',NULL,1),(1352,12,'Bernasconi',NULL,1),(1353,12,'Caleufú',NULL,1),(1354,12,'Carro Quemado',NULL,1),(1355,12,'Catriló',NULL,1),(1356,12,'Ceballos',NULL,1),(1357,12,'Chacharramendi',NULL,1),(1358,12,'Col. Barón',NULL,1),(1359,12,'Col. Santa María',NULL,1),(1360,12,'Conhelo',NULL,1),(1361,12,'Coronel Hilario Lagos',NULL,1),(1362,12,'Cuchillo-Có',NULL,1),(1363,12,'Doblas',NULL,1),(1364,12,'Dorila',NULL,1),(1365,12,'Eduardo Castex',NULL,1),(1366,12,'Embajador Martini',NULL,1),(1367,12,'Falucho',NULL,1),(1368,12,'Gral. Acha',NULL,1),(1369,12,'Gral. Manuel Campos',NULL,1),(1370,12,'Gral. Pico',NULL,1),(1371,12,'Guatraché',NULL,1),(1372,12,'Ing. Luiggi',NULL,1),(1373,12,'Intendente Alvear',NULL,1),(1374,12,'Jacinto Arauz',NULL,1),(1375,12,'La Adela',NULL,1),(1376,12,'La Humada',NULL,1),(1377,12,'La Maruja',NULL,1),(1378,12,'12',NULL,1),(1379,12,'La Reforma',NULL,1),(1380,12,'Limay Mahuida',NULL,1),(1381,12,'Lonquimay',NULL,1),(1382,12,'Loventuel',NULL,1),(1383,12,'Luan Toro',NULL,1),(1384,12,'Macachín',NULL,1),(1385,12,'Maisonnave',NULL,1),(1386,12,'Mauricio Mayer',NULL,1),(1387,12,'Metileo',NULL,1),(1388,12,'Miguel Cané',NULL,1),(1389,12,'Miguel Riglos',NULL,1),(1390,12,'Monte Nievas',NULL,1),(1391,12,'Parera',NULL,1),(1392,12,'Perú',NULL,1),(1393,12,'Pichi-Huinca',NULL,1),(1394,12,'Puelches',NULL,1),(1395,12,'Puelén',NULL,1),(1396,12,'Quehue',NULL,1),(1397,12,'Quemú Quemú',NULL,1),(1398,12,'Quetrequén',NULL,1),(1399,12,'Rancul',NULL,1),(1400,12,'Realicó',NULL,1),(1401,12,'Relmo',NULL,1),(1402,12,'Rolón',NULL,1),(1403,12,'Rucanelo',NULL,1),(1404,12,'Sarah',NULL,1),(1405,12,'Speluzzi',NULL,1),(1406,12,'Sta. Isabel',NULL,1),(1407,12,'Sta. Rosa',NULL,1),(1408,12,'Sta. Teresa',NULL,1),(1409,12,'Telén',NULL,1),(1410,12,'Toay',NULL,1),(1411,12,'Tomas M. de Anchorena',NULL,1),(1412,12,'Trenel',NULL,1),(1413,12,'Unanue',NULL,1),(1414,12,'Uriburu',NULL,1),(1415,12,'Veinticinco de Mayo',NULL,1),(1416,12,'Vertiz',NULL,1),(1417,12,'Victorica',NULL,1),(1418,12,'Villa Mirasol',NULL,1),(1419,12,'Winifreda',NULL,1),(1420,13,'Arauco',NULL,1),(1421,13,'Capital',NULL,1),(1422,13,'Castro Barros',NULL,1),(1423,13,'Chamical',NULL,1),(1424,13,'Chilecito',NULL,1),(1425,13,'Coronel F. Varela',NULL,1),(1426,13,'Famatina',NULL,1),(1427,13,'Gral. A.V.Peñaloza',NULL,1),(1428,13,'Gral. Belgrano',NULL,1),(1429,13,'Gral. J.F. Quiroga',NULL,1),(1430,13,'Gral. Lamadrid',NULL,1),(1431,13,'Gral. Ocampo',NULL,1),(1432,13,'Gral. San Martín',NULL,1),(1433,13,'Independencia',NULL,1),(1434,13,'Rosario Penaloza',NULL,1),(1435,13,'San Blas de Los Sauces',NULL,1),(1436,13,'Sanagasta',NULL,1),(1437,13,'Vinchina',NULL,1),(1438,14,'Capital',NULL,1),(1439,14,'Chacras de Coria',NULL,1),(1440,14,'Dorrego',NULL,1),(1441,14,'Gllen',NULL,1),(1442,14,'Godoy Cruz',NULL,1),(1443,14,'Gral. Alvear',NULL,1),(1444,14,'Guaymallén',NULL,1),(1445,14,'Junín',NULL,1),(1446,14,'La Paz',NULL,1),(1447,14,'Las Heras',NULL,1),(1448,14,'Lavalle',NULL,1),(1449,14,'Luján',NULL,1),(1450,14,'Luján De Cuyo',NULL,1),(1451,14,'Maipú',NULL,1),(1452,14,'Malargüe',NULL,1),(1453,14,'Rivadavia',NULL,1),(1454,14,'San Carlos',NULL,1),(1455,14,'San Martín',NULL,1),(1456,14,'San Rafael',NULL,1),(1457,14,'Sta. Rosa',NULL,1),(1458,14,'Tunuyán',NULL,1),(1459,14,'Tupungato',NULL,1),(1460,14,'Villa Nueva',NULL,1),(1461,15,'Alba Posse',NULL,1),(1462,15,'Almafuerte',NULL,1),(1463,15,'Apóstoles',NULL,1),(1464,15,'Aristóbulo Del Valle',NULL,1),(1465,15,'Arroyo Del Medio',NULL,1),(1466,15,'Azara',NULL,1),(1467,15,'Bdo. De Irigoyen',NULL,1),(1468,15,'Bonpland',NULL,1),(1469,15,'Caá Yari',NULL,1),(1470,15,'Campo Grande',NULL,1),(1471,15,'Campo Ramón',NULL,1),(1472,15,'Campo Viera',NULL,1),(1473,15,'Candelaria',NULL,1),(1474,15,'Capioví',NULL,1),(1475,15,'Caraguatay',NULL,1),(1476,15,'Cdte. Guacurarí',NULL,1),(1477,15,'Cerro Azul',NULL,1),(1478,15,'Cerro Corá',NULL,1),(1479,15,'Col. Alberdi',NULL,1),(1480,15,'Col. Aurora',NULL,1),(1481,15,'Col. Delicia',NULL,1),(1482,15,'Col. Polana',NULL,1),(1483,15,'Col. Victoria',NULL,1),(1484,15,'Col. Wanda',NULL,1),(1485,15,'Concepción De La Sierra',NULL,1),(1486,15,'Corpus',NULL,1),(1487,15,'Dos Arroyos',NULL,1),(1488,15,'Dos de Mayo',NULL,1),(1489,15,'El Alcázar',NULL,1),(1490,15,'El Dorado',NULL,1),(1491,15,'El Soberbio',NULL,1),(1492,15,'Esperanza',NULL,1),(1493,15,'F. Ameghino',NULL,1),(1494,15,'Fachinal',NULL,1),(1495,15,'Garuhapé',NULL,1),(1496,15,'Garupá',NULL,1),(1497,15,'Gdor. López',NULL,1),(1498,15,'Gdor. Roca',NULL,1),(1499,15,'Gral. Alvear',NULL,1),(1500,15,'Gral. Urquiza',NULL,1),(1501,15,'Guaraní',NULL,1),(1502,15,'H. Yrigoyen',NULL,1),(1503,15,'Iguazú',NULL,1),(1504,15,'Itacaruaré',NULL,1),(1505,15,'Jardín América',NULL,1),(1506,15,'Leandro N. Alem',NULL,1),(1507,15,'Libertad',NULL,1),(1508,15,'Loreto',NULL,1),(1509,15,'Los Helechos',NULL,1),(1510,15,'Mártires',NULL,1),(1511,15,'15',NULL,1),(1512,15,'Mojón Grande',NULL,1),(1513,15,'Montecarlo',NULL,1),(1514,15,'Nueve de Julio',NULL,1),(1515,15,'Oberá',NULL,1),(1516,15,'Olegario V. Andrade',NULL,1),(1517,15,'Panambí',NULL,1),(1518,15,'Posadas',NULL,1),(1519,15,'Profundidad',NULL,1),(1520,15,'Pto. Iguazú',NULL,1),(1521,15,'Pto. Leoni',NULL,1),(1522,15,'Pto. Piray',NULL,1),(1523,15,'Pto. Rico',NULL,1),(1524,15,'Ruiz de Montoya',NULL,1),(1525,15,'San Antonio',NULL,1),(1526,15,'San Ignacio',NULL,1),(1527,15,'San Javier',NULL,1),(1528,15,'San José',NULL,1),(1529,15,'San Martín',NULL,1),(1530,15,'San Pedro',NULL,1),(1531,15,'San Vicente',NULL,1),(1532,15,'Santiago De Liniers',NULL,1),(1533,15,'Santo Pipo',NULL,1),(1534,15,'Sta. Ana',NULL,1),(1535,15,'Sta. María',NULL,1),(1536,15,'Tres Capones',NULL,1),(1537,15,'Veinticinco de Mayo',NULL,1),(1538,15,'Wanda',NULL,1),(1539,16,'Aguada San Roque',NULL,1),(1540,16,'Aluminé',NULL,1),(1541,16,'Andacollo',NULL,1),(1542,16,'Añelo',NULL,1),(1543,16,'Bajada del Agrio',NULL,1),(1544,16,'Barrancas',NULL,1),(1545,16,'Buta Ranquil',NULL,1),(1546,16,'Capital',NULL,1),(1547,16,'Caviahué',NULL,1),(1548,16,'Centenario',NULL,1),(1549,16,'Chorriaca',NULL,1),(1550,16,'Chos Malal',NULL,1),(1551,16,'Cipolletti',NULL,1),(1552,16,'Covunco Abajo',NULL,1),(1553,16,'Coyuco Cochico',NULL,1),(1554,16,'Cutral Có',NULL,1),(1555,16,'El Cholar',NULL,1),(1556,16,'El Huecú',NULL,1),(1557,16,'El Sauce',NULL,1),(1558,16,'Guañacos',NULL,1),(1559,16,'Huinganco',NULL,1),(1560,16,'Las Coloradas',NULL,1),(1561,16,'Las Lajas',NULL,1),(1562,16,'Las Ovejas',NULL,1),(1563,16,'Loncopué',NULL,1),(1564,16,'Los Catutos',NULL,1),(1565,16,'Los Chihuidos',NULL,1),(1566,16,'Los Miches',NULL,1),(1567,16,'Manzano Amargo',NULL,1),(1568,16,'16',NULL,1),(1569,16,'Octavio Pico',NULL,1),(1570,16,'Paso Aguerre',NULL,1),(1571,16,'Picún Leufú',NULL,1),(1572,16,'Piedra del Aguila',NULL,1),(1573,16,'Pilo Lil',NULL,1),(1574,16,'Plaza Huincul',NULL,1),(1575,16,'Plottier',NULL,1),(1576,16,'Quili Malal',NULL,1),(1577,16,'Ramón Castro',NULL,1),(1578,16,'Rincón de Los Sauces',NULL,1),(1579,16,'San Martín de Los Andes',NULL,1),(1580,16,'San Patricio del Chañar',NULL,1),(1581,16,'Santo Tomás',NULL,1),(1582,16,'Sauzal Bonito',NULL,1),(1583,16,'Senillosa',NULL,1),(1584,16,'Taquimilán',NULL,1),(1585,16,'Tricao Malal',NULL,1),(1586,16,'Varvarco',NULL,1),(1587,16,'Villa Curí Leuvu',NULL,1),(1588,16,'Villa del Nahueve',NULL,1),(1589,16,'Villa del Puente Picún Leuvú',NULL,1),(1590,16,'Villa El Chocón',NULL,1),(1591,16,'Villa La Angostura',NULL,1),(1592,16,'Villa Pehuenia',NULL,1),(1593,16,'Villa Traful',NULL,1),(1594,16,'Vista Alegre',NULL,1),(1595,16,'Zapala',NULL,1),(1596,17,'Aguada Cecilio',NULL,1),(1597,17,'Aguada de Guerra',NULL,1),(1598,17,'Allén',NULL,1),(1599,17,'Arroyo de La Ventana',NULL,1),(1600,17,'Arroyo Los Berros',NULL,1),(1601,17,'Bariloche',NULL,1),(1602,17,'Calte. Cordero',NULL,1),(1603,17,'Campo Grande',NULL,1),(1604,17,'Catriel',NULL,1),(1605,17,'Cerro Policía',NULL,1),(1606,17,'Cervantes',NULL,1),(1607,17,'Chelforo',NULL,1),(1608,17,'Chimpay',NULL,1),(1609,17,'Chinchinales',NULL,1),(1610,17,'Chipauquil',NULL,1),(1611,17,'Choele Choel',NULL,1),(1612,17,'Cinco Saltos',NULL,1),(1613,17,'Cipolletti',NULL,1),(1614,17,'Clemente Onelli',NULL,1),(1615,17,'Colán Conhue',NULL,1),(1616,17,'Comallo',NULL,1),(1617,17,'Comicó',NULL,1),(1618,17,'Cona Niyeu',NULL,1),(1619,17,'Coronel Belisle',NULL,1),(1620,17,'Cubanea',NULL,1),(1621,17,'Darwin',NULL,1),(1622,17,'Dina Huapi',NULL,1),(1623,17,'El Bolsón',NULL,1),(1624,17,'El Caín',NULL,1),(1625,17,'El Manso',NULL,1),(1626,17,'Gral. Conesa',NULL,1),(1627,17,'Gral. Enrique Godoy',NULL,1),(1628,17,'Gral. Fernandez Oro',NULL,1),(1629,17,'Gral. Roca',NULL,1),(1630,17,'Guardia Mitre',NULL,1),(1631,17,'Ing. Huergo',NULL,1),(1632,17,'Ing. Jacobacci',NULL,1),(1633,17,'Laguna Blanca',NULL,1),(1634,17,'Lamarque',NULL,1),(1635,17,'Las Grutas',NULL,1),(1636,17,'Los Menucos',NULL,1),(1637,17,'Luis Beltrán',NULL,1),(1638,17,'Mainqué',NULL,1),(1639,17,'Mamuel Choique',NULL,1),(1640,17,'Maquinchao',NULL,1),(1641,17,'Mencué',NULL,1),(1642,17,'Mtro. Ramos Mexia',NULL,1),(1643,17,'Nahuel Niyeu',NULL,1),(1644,17,'Naupa Huen',NULL,1),(1645,17,'Ñorquinco',NULL,1),(1646,17,'Ojos de Agua',NULL,1),(1647,17,'Paso de Agua',NULL,1),(1648,17,'Paso Flores',NULL,1),(1649,17,'Peñas Blancas',NULL,1),(1650,17,'Pichi Mahuida',NULL,1),(1651,17,'Pilcaniyeu',NULL,1),(1652,17,'Pomona',NULL,1),(1653,17,'Prahuaniyeu',NULL,1),(1654,17,'Rincón Treneta',NULL,1),(1655,17,'Río Chico',NULL,1),(1656,17,'Río Colorado',NULL,1),(1657,17,'Roca',NULL,1),(1658,17,'San Antonio Oeste',NULL,1),(1659,17,'San Javier',NULL,1),(1660,17,'Sierra Colorada',NULL,1),(1661,17,'Sierra Grande',NULL,1),(1662,17,'Sierra Pailemán',NULL,1),(1663,17,'Valcheta',NULL,1),(1664,17,'Valle Azul',NULL,1),(1665,17,'Viedma',NULL,1),(1666,17,'Villa Llanquín',NULL,1),(1667,17,'Villa Mascardi',NULL,1),(1668,17,'Villa Regina',NULL,1),(1669,17,'Yaminué',NULL,1),(1670,18,'A. Saravia',NULL,1),(1671,18,'Aguaray',NULL,1),(1672,18,'Angastaco',NULL,1),(1673,18,'Animaná',NULL,1),(1674,18,'Cachi',NULL,1),(1675,18,'Cafayate',NULL,1),(1676,18,'Campo Quijano',NULL,1),(1677,18,'Campo Santo',NULL,1),(1678,18,'Capital',NULL,1),(1679,18,'Cerrillos',NULL,1),(1680,18,'Chicoana',NULL,1),(1681,18,'Col. Sta. Rosa',NULL,1),(1682,18,'Coronel Moldes',NULL,1),(1683,18,'El Bordo',NULL,1),(1684,18,'El Carril',NULL,1),(1685,18,'El Galpón',NULL,1),(1686,18,'El Jardín',NULL,1),(1687,18,'El Potrero',NULL,1),(1688,18,'El Quebrachal',NULL,1),(1689,18,'El Tala',NULL,1),(1690,18,'Embarcación',NULL,1),(1691,18,'Gral. Ballivian',NULL,1),(1692,18,'Gral. Güemes',NULL,1),(1693,18,'Gral. Mosconi',NULL,1),(1694,18,'Gral. Pizarro',NULL,1),(1695,18,'Guachipas',NULL,1),(1696,18,'Hipólito Yrigoyen',NULL,1),(1697,18,'Iruyá',NULL,1),(1698,18,'Isla De Cañas',NULL,1),(1699,18,'J. V. Gonzalez',NULL,1),(1700,18,'La Caldera',NULL,1),(1701,18,'La Candelaria',NULL,1),(1702,18,'La Merced',NULL,1),(1703,18,'La Poma',NULL,1),(1704,18,'La Viña',NULL,1),(1705,18,'Las Lajitas',NULL,1),(1706,18,'Los Toldos',NULL,1),(1707,18,'Metán',NULL,1),(1708,18,'Molinos',NULL,1),(1709,18,'Nazareno',NULL,1),(1710,18,'Orán',NULL,1),(1711,18,'Payogasta',NULL,1),(1712,18,'Pichanal',NULL,1),(1713,18,'Prof. S. Mazza',NULL,1),(1714,18,'Río Piedras',NULL,1),(1715,18,'Rivadavia Banda Norte',NULL,1),(1716,18,'Rivadavia Banda Sur',NULL,1),(1717,18,'Rosario de La Frontera',NULL,1),(1718,18,'Rosario de Lerma',NULL,1),(1719,18,'Saclantás',NULL,1),(1720,18,'18',NULL,1),(1721,18,'San Antonio',NULL,1),(1722,18,'San Carlos',NULL,1),(1723,18,'San José De Metán',NULL,1),(1724,18,'San Ramón',NULL,1),(1725,18,'Santa Victoria E.',NULL,1),(1726,18,'Santa Victoria O.',NULL,1),(1727,18,'Tartagal',NULL,1),(1728,18,'Tolar Grande',NULL,1),(1729,18,'Urundel',NULL,1),(1730,18,'Vaqueros',NULL,1),(1731,18,'Villa San Lorenzo',NULL,1),(1732,19,'Albardón',NULL,1),(1733,19,'Angaco',NULL,1),(1734,19,'Calingasta',NULL,1),(1735,19,'Capital',NULL,1),(1736,19,'Caucete',NULL,1),(1737,19,'Chimbas',NULL,1),(1738,19,'Iglesia',NULL,1),(1739,19,'Jachal',NULL,1),(1740,19,'Nueve de Julio',NULL,1),(1741,19,'Pocito',NULL,1),(1742,19,'Rawson',NULL,1),(1743,19,'Rivadavia',NULL,1),(1744,19,'19',NULL,1),(1745,19,'San Martín',NULL,1),(1746,19,'Santa Lucía',NULL,1),(1747,19,'Sarmiento',NULL,1),(1748,19,'Ullum',NULL,1),(1749,19,'Valle Fértil',NULL,1),(1750,19,'Veinticinco de Mayo',NULL,1),(1751,19,'Zonda',NULL,1),(1752,20,'Alto Pelado',NULL,1),(1753,20,'Alto Pencoso',NULL,1),(1754,20,'Anchorena',NULL,1),(1755,20,'Arizona',NULL,1),(1756,20,'Bagual',NULL,1),(1757,20,'Balde',NULL,1),(1758,20,'Batavia',NULL,1),(1759,20,'Beazley',NULL,1),(1760,20,'Buena Esperanza',NULL,1),(1761,20,'Candelaria',NULL,1),(1762,20,'Capital',NULL,1),(1763,20,'Carolina',NULL,1),(1764,20,'Carpintería',NULL,1),(1765,20,'Concarán',NULL,1),(1766,20,'Cortaderas',NULL,1),(1767,20,'El Morro',NULL,1),(1768,20,'El Trapiche',NULL,1),(1769,20,'El Volcán',NULL,1),(1770,20,'Fortín El Patria',NULL,1),(1771,20,'Fortuna',NULL,1),(1772,20,'Fraga',NULL,1),(1773,20,'Juan Jorba',NULL,1),(1774,20,'Juan Llerena',NULL,1),(1775,20,'Juana Koslay',NULL,1),(1776,20,'Justo Daract',NULL,1),(1777,20,'La Calera',NULL,1),(1778,20,'La Florida',NULL,1),(1779,20,'La Punilla',NULL,1),(1780,20,'La Toma',NULL,1),(1781,20,'Lafinur',NULL,1),(1782,20,'Las Aguadas',NULL,1),(1783,20,'Las Chacras',NULL,1),(1784,20,'Las Lagunas',NULL,1),(1785,20,'Las Vertientes',NULL,1),(1786,20,'Lavaisse',NULL,1),(1787,20,'Leandro N. Alem',NULL,1),(1788,20,'Los Molles',NULL,1),(1789,20,'Luján',NULL,1),(1790,20,'Mercedes',NULL,1),(1791,20,'Merlo',NULL,1),(1792,20,'Naschel',NULL,1),(1793,20,'Navia',NULL,1),(1794,20,'Nogolí',NULL,1),(1795,20,'Nueva Galia',NULL,1),(1796,20,'Papagayos',NULL,1),(1797,20,'Paso Grande',NULL,1),(1798,20,'Potrero de Los Funes',NULL,1),(1799,20,'Quines',NULL,1),(1800,20,'Renca',NULL,1),(1801,20,'Saladillo',NULL,1),(1802,20,'San Francisco',NULL,1),(1803,20,'San Gerónimo',NULL,1),(1804,20,'San Martín',NULL,1),(1805,20,'San Pablo',NULL,1),(1806,20,'Santa Rosa de Conlara',NULL,1),(1807,20,'Talita',NULL,1),(1808,20,'Tilisarao',NULL,1),(1809,20,'Unión',NULL,1),(1810,20,'Villa de La Quebrada',NULL,1),(1811,20,'Villa de Praga',NULL,1),(1812,20,'Villa del Carmen',NULL,1),(1813,20,'Villa Gral. Roca',NULL,1),(1814,20,'Villa Larca',NULL,1),(1815,20,'Villa Mercedes',NULL,1),(1816,20,'Zanjitas',NULL,1),(1817,21,'Calafate',NULL,1),(1818,21,'Caleta Olivia',NULL,1),(1819,21,'Cañadón Seco',NULL,1),(1820,21,'Comandante Piedrabuena',NULL,1),(1821,21,'El Calafate',NULL,1),(1822,21,'El Chaltén',NULL,1),(1823,21,'Gdor. Gregores',NULL,1),(1824,21,'Hipólito Yrigoyen',NULL,1),(1825,21,'Jaramillo',NULL,1),(1826,21,'Koluel Kaike',NULL,1),(1827,21,'Las Heras',NULL,1),(1828,21,'Los Antiguos',NULL,1),(1829,21,'Perito Moreno',NULL,1),(1830,21,'Pico Truncado',NULL,1),(1831,21,'Pto. Deseado',NULL,1),(1832,21,'Pto. San Julián',NULL,1),(1833,21,'Pto. 21',NULL,1),(1834,21,'Río Cuarto',NULL,1),(1835,21,'Río Gallegos',NULL,1),(1836,21,'Río Turbio',NULL,1),(1837,21,'Tres Lagos',NULL,1),(1838,21,'Veintiocho De Noviembre',NULL,1),(1839,22,'Aarón Castellanos',NULL,1),(1840,22,'Acebal',NULL,1),(1841,22,'Aguará Grande',NULL,1),(1842,22,'Albarellos',NULL,1),(1843,22,'Alcorta',NULL,1),(1844,22,'Aldao',NULL,1),(1845,22,'Alejandra',NULL,1),(1846,22,'Álvarez',NULL,1),(1847,22,'Ambrosetti',NULL,1),(1848,22,'Amenábar',NULL,1),(1849,22,'Angélica',NULL,1),(1850,22,'Angeloni',NULL,1),(1851,22,'Arequito',NULL,1),(1852,22,'Arminda',NULL,1),(1853,22,'Armstrong',NULL,1),(1854,22,'Arocena',NULL,1),(1855,22,'Arroyo Aguiar',NULL,1),(1856,22,'Arroyo Ceibal',NULL,1),(1857,22,'Arroyo Leyes',NULL,1),(1858,22,'Arroyo Seco',NULL,1),(1859,22,'Arrufó',NULL,1),(1860,22,'Arteaga',NULL,1),(1861,22,'Ataliva',NULL,1),(1862,22,'Aurelia',NULL,1),(1863,22,'Avellaneda',NULL,1),(1864,22,'Barrancas',NULL,1),(1865,22,'Bauer Y Sigel',NULL,1),(1866,22,'Bella Italia',NULL,1),(1867,22,'Berabevú',NULL,1),(1868,22,'Berna',NULL,1),(1869,22,'Bernardo de Irigoyen',NULL,1),(1870,22,'Bigand',NULL,1),(1871,22,'Bombal',NULL,1),(1872,22,'Bouquet',NULL,1),(1873,22,'Bustinza',NULL,1),(1874,22,'Cabal',NULL,1),(1875,22,'Cacique Ariacaiquin',NULL,1),(1876,22,'Cafferata',NULL,1),(1877,22,'Calchaquí',NULL,1),(1878,22,'Campo Andino',NULL,1),(1879,22,'Campo Piaggio',NULL,1),(1880,22,'Cañada de Gómez',NULL,1),(1881,22,'Cañada del Ucle',NULL,1),(1882,22,'Cañada Rica',NULL,1),(1883,22,'Cañada Rosquín',NULL,1),(1884,22,'Candioti',NULL,1),(1885,22,'Capital',NULL,1),(1886,22,'Capitán Bermúdez',NULL,1),(1887,22,'Capivara',NULL,1),(1888,22,'Carcarañá',NULL,1),(1889,22,'Carlos Pellegrini',NULL,1),(1890,22,'Carmen',NULL,1),(1891,22,'Carmen Del Sauce',NULL,1),(1892,22,'Carreras',NULL,1),(1893,22,'Carrizales',NULL,1),(1894,22,'Casalegno',NULL,1),(1895,22,'Casas',NULL,1),(1896,22,'Casilda',NULL,1),(1897,22,'Castelar',NULL,1),(1898,22,'Castellanos',NULL,1),(1899,22,'Cayastá',NULL,1),(1900,22,'Cayastacito',NULL,1),(1901,22,'Centeno',NULL,1),(1902,22,'Cepeda',NULL,1),(1903,22,'Ceres',NULL,1),(1904,22,'Chabás',NULL,1),(1905,22,'Chañar Ladeado',NULL,1),(1906,22,'Chapuy',NULL,1),(1907,22,'Chovet',NULL,1),(1908,22,'Christophersen',NULL,1),(1909,22,'Classon',NULL,1),(1910,22,'Cnel. Arnold',NULL,1),(1911,22,'Cnel. Bogado',NULL,1),(1912,22,'Cnel. Dominguez',NULL,1),(1913,22,'Cnel. Fraga',NULL,1),(1914,22,'Col. Aldao',NULL,1),(1915,22,'Col. Ana',NULL,1),(1916,22,'Col. Belgrano',NULL,1),(1917,22,'Col. Bicha',NULL,1),(1918,22,'Col. Bigand',NULL,1),(1919,22,'Col. Bossi',NULL,1),(1920,22,'Col. Cavour',NULL,1),(1921,22,'Col. Cello',NULL,1),(1922,22,'Col. Dolores',NULL,1),(1923,22,'Col. Dos Rosas',NULL,1),(1924,22,'Col. Durán',NULL,1),(1925,22,'Col. Iturraspe',NULL,1),(1926,22,'Col. Margarita',NULL,1),(1927,22,'Col. Mascias',NULL,1),(1928,22,'Col. Raquel',NULL,1),(1929,22,'Col. Rosa',NULL,1),(1930,22,'Col. San José',NULL,1),(1931,22,'Constanza',NULL,1),(1932,22,'Coronda',NULL,1),(1933,22,'Correa',NULL,1),(1934,22,'Crispi',NULL,1),(1935,22,'Cululú',NULL,1),(1936,22,'Curupayti',NULL,1),(1937,22,'Desvio Arijón',NULL,1),(1938,22,'Diaz',NULL,1),(1939,22,'Diego de Alvear',NULL,1),(1940,22,'Egusquiza',NULL,1),(1941,22,'El Arazá',NULL,1),(1942,22,'El Rabón',NULL,1),(1943,22,'El Sombrerito',NULL,1),(1944,22,'El Trébol',NULL,1),(1945,22,'Elisa',NULL,1),(1946,22,'Elortondo',NULL,1),(1947,22,'Emilia',NULL,1),(1948,22,'Empalme San Carlos',NULL,1),(1949,22,'Empalme Villa Constitucion',NULL,1),(1950,22,'Esmeralda',NULL,1),(1951,22,'Esperanza',NULL,1),(1952,22,'Estación Alvear',NULL,1),(1953,22,'Estacion Clucellas',NULL,1),(1954,22,'Esteban Rams',NULL,1),(1955,22,'Esther',NULL,1),(1956,22,'Esustolia',NULL,1),(1957,22,'Eusebia',NULL,1),(1958,22,'Felicia',NULL,1),(1959,22,'Fidela',NULL,1),(1960,22,'Fighiera',NULL,1),(1961,22,'Firmat',NULL,1),(1962,22,'Florencia',NULL,1),(1963,22,'Fortín Olmos',NULL,1),(1964,22,'Franck',NULL,1),(1965,22,'Fray Luis Beltrán',NULL,1),(1966,22,'Frontera',NULL,1),(1967,22,'Fuentes',NULL,1),(1968,22,'Funes',NULL,1),(1969,22,'Gaboto',NULL,1),(1970,22,'Galisteo',NULL,1),(1971,22,'Gálvez',NULL,1),(1972,22,'Garabalto',NULL,1),(1973,22,'Garibaldi',NULL,1),(1974,22,'Gato Colorado',NULL,1),(1975,22,'Gdor. Crespo',NULL,1),(1976,22,'Gessler',NULL,1),(1977,22,'Godoy',NULL,1),(1978,22,'Golondrina',NULL,1),(1979,22,'Gral. Gelly',NULL,1),(1980,22,'Gral. Lagos',NULL,1),(1981,22,'Granadero Baigorria',NULL,1),(1982,22,'Gregoria Perez De Denis',NULL,1),(1983,22,'Grutly',NULL,1),(1984,22,'Guadalupe N.',NULL,1),(1985,22,'Gödeken',NULL,1),(1986,22,'Helvecia',NULL,1),(1987,22,'Hersilia',NULL,1),(1988,22,'Hipatía',NULL,1),(1989,22,'Huanqueros',NULL,1),(1990,22,'Hugentobler',NULL,1),(1991,22,'Hughes',NULL,1),(1992,22,'Humberto 1º',NULL,1),(1993,22,'Humboldt',NULL,1),(1994,22,'Ibarlucea',NULL,1),(1995,22,'Ing. Chanourdie',NULL,1),(1996,22,'Intiyaco',NULL,1),(1997,22,'Ituzaingó',NULL,1),(1998,22,'Jacinto L. Aráuz',NULL,1),(1999,22,'Josefina',NULL,1),(2000,22,'Juan B. Molina',NULL,1),(2001,22,'Juan de Garay',NULL,1),(2002,22,'Juncal',NULL,1),(2003,22,'La Brava',NULL,1),(2004,22,'La Cabral',NULL,1),(2005,22,'La Camila',NULL,1),(2006,22,'La Chispa',NULL,1),(2007,22,'La Clara',NULL,1),(2008,22,'La Criolla',NULL,1),(2009,22,'La Gallareta',NULL,1),(2010,22,'La Lucila',NULL,1),(2011,22,'La Pelada',NULL,1),(2012,22,'La Penca',NULL,1),(2013,22,'La Rubia',NULL,1),(2014,22,'La Sarita',NULL,1),(2015,22,'La Vanguardia',NULL,1),(2016,22,'Labordeboy',NULL,1),(2017,22,'Laguna Paiva',NULL,1),(2018,22,'Landeta',NULL,1),(2019,22,'Lanteri',NULL,1),(2020,22,'Larrechea',NULL,1),(2021,22,'Las Avispas',NULL,1),(2022,22,'Las Bandurrias',NULL,1),(2023,22,'Las Garzas',NULL,1),(2024,22,'Las Palmeras',NULL,1),(2025,22,'Las Parejas',NULL,1),(2026,22,'Las Petacas',NULL,1),(2027,22,'Las Rosas',NULL,1),(2028,22,'Las Toscas',NULL,1),(2029,22,'Las Tunas',NULL,1),(2030,22,'Lazzarino',NULL,1),(2031,22,'Lehmann',NULL,1),(2032,22,'Llambi Campbell',NULL,1),(2033,22,'Logroño',NULL,1),(2034,22,'Loma Alta',NULL,1),(2035,22,'López',NULL,1),(2036,22,'Los Amores',NULL,1),(2037,22,'Los Cardos',NULL,1),(2038,22,'Los Laureles',NULL,1),(2039,22,'Los Molinos',NULL,1),(2040,22,'Los Quirquinchos',NULL,1),(2041,22,'Lucio V. Lopez',NULL,1),(2042,22,'Luis Palacios',NULL,1),(2043,22,'Ma. Juana',NULL,1),(2044,22,'Ma. Luisa',NULL,1),(2045,22,'Ma. Susana',NULL,1),(2046,22,'Ma. Teresa',NULL,1),(2047,22,'Maciel',NULL,1),(2048,22,'Maggiolo',NULL,1),(2049,22,'Malabrigo',NULL,1),(2050,22,'Marcelino Escalada',NULL,1),(2051,22,'Margarita',NULL,1),(2052,22,'Matilde',NULL,1),(2053,22,'Mauá',NULL,1),(2054,22,'Máximo Paz',NULL,1),(2055,22,'Melincué',NULL,1),(2056,22,'Miguel Torres',NULL,1),(2057,22,'Moisés Ville',NULL,1),(2058,22,'Monigotes',NULL,1),(2059,22,'Monje',NULL,1),(2060,22,'Monte Obscuridad',NULL,1),(2061,22,'Monte Vera',NULL,1),(2062,22,'Montefiore',NULL,1),(2063,22,'Montes de Oca',NULL,1),(2064,22,'Murphy',NULL,1),(2065,22,'Ñanducita',NULL,1),(2066,22,'Naré',NULL,1),(2067,22,'Nelson',NULL,1),(2068,22,'Nicanor E. Molinas',NULL,1),(2069,22,'Nuevo Torino',NULL,1),(2070,22,'Oliveros',NULL,1),(2071,22,'Palacios',NULL,1),(2072,22,'Pavón',NULL,1),(2073,22,'Pavón Arriba',NULL,1),(2074,22,'Pedro Gómez Cello',NULL,1),(2075,22,'Pérez',NULL,1),(2076,22,'Peyrano',NULL,1),(2077,22,'Piamonte',NULL,1),(2078,22,'Pilar',NULL,1),(2079,22,'Piñero',NULL,1),(2080,22,'Plaza Clucellas',NULL,1),(2081,22,'Portugalete',NULL,1),(2082,22,'Pozo Borrado',NULL,1),(2083,22,'Progreso',NULL,1),(2084,22,'Providencia',NULL,1),(2085,22,'Pte. Roca',NULL,1),(2086,22,'Pueblo Andino',NULL,1),(2087,22,'Pueblo Esther',NULL,1),(2088,22,'Pueblo Gral. San Martín',NULL,1),(2089,22,'Pueblo Irigoyen',NULL,1),(2090,22,'Pueblo Marini',NULL,1),(2091,22,'Pueblo Muñoz',NULL,1),(2092,22,'Pueblo Uranga',NULL,1),(2093,22,'Pujato',NULL,1),(2094,22,'Pujato N.',NULL,1),(2095,22,'Rafaela',NULL,1),(2096,22,'Ramayón',NULL,1),(2097,22,'Ramona',NULL,1),(2098,22,'Reconquista',NULL,1),(2099,22,'Recreo',NULL,1),(2100,22,'Ricardone',NULL,1),(2101,22,'Rivadavia',NULL,1),(2102,22,'Roldán',NULL,1),(2103,22,'Romang',NULL,1),(2104,22,'Rosario',NULL,1),(2105,22,'Rueda',NULL,1),(2106,22,'Rufino',NULL,1),(2107,22,'Sa Pereira',NULL,1),(2108,22,'Saguier',NULL,1),(2109,22,'Saladero M. Cabal',NULL,1),(2110,22,'Salto Grande',NULL,1),(2111,22,'San Agustín',NULL,1),(2112,22,'San Antonio de Obligado',NULL,1),(2113,22,'San Bernardo (N.J.)',NULL,1),(2114,22,'San Bernardo (S.J.)',NULL,1),(2115,22,'San Carlos Centro',NULL,1),(2116,22,'San Carlos N.',NULL,1),(2117,22,'San Carlos S.',NULL,1),(2118,22,'San Cristóbal',NULL,1),(2119,22,'San Eduardo',NULL,1),(2120,22,'San Eugenio',NULL,1),(2121,22,'San Fabián',NULL,1),(2122,22,'San Fco. de Santa Fé',NULL,1),(2123,22,'San Genaro',NULL,1),(2124,22,'San Genaro N.',NULL,1),(2125,22,'San Gregorio',NULL,1),(2126,22,'San Guillermo',NULL,1),(2127,22,'San Javier',NULL,1),(2128,22,'San Jerónimo del Sauce',NULL,1),(2129,22,'San Jerónimo N.',NULL,1),(2130,22,'San Jerónimo S.',NULL,1),(2131,22,'San Jorge',NULL,1),(2132,22,'San José de La Esquina',NULL,1),(2133,22,'San José del Rincón',NULL,1),(2134,22,'San Justo',NULL,1),(2135,22,'San Lorenzo',NULL,1),(2136,22,'San Mariano',NULL,1),(2137,22,'San Martín de Las Escobas',NULL,1),(2138,22,'San Martín N.',NULL,1),(2139,22,'San Vicente',NULL,1),(2140,22,'Sancti Spititu',NULL,1),(2141,22,'Sanford',NULL,1),(2142,22,'Santo Domingo',NULL,1),(2143,22,'Santo Tomé',NULL,1),(2144,22,'Santurce',NULL,1),(2145,22,'Sargento Cabral',NULL,1),(2146,22,'Sarmiento',NULL,1),(2147,22,'Sastre',NULL,1),(2148,22,'Sauce Viejo',NULL,1),(2149,22,'Serodino',NULL,1),(2150,22,'Silva',NULL,1),(2151,22,'Soldini',NULL,1),(2152,22,'Soledad',NULL,1),(2153,22,'Soutomayor',NULL,1),(2154,22,'Sta. Clara de Buena Vista',NULL,1),(2155,22,'Sta. Clara de Saguier',NULL,1),(2156,22,'Sta. Isabel',NULL,1),(2157,22,'Sta. Margarita',NULL,1),(2158,22,'Sta. Maria Centro',NULL,1),(2159,22,'Sta. María N.',NULL,1),(2160,22,'Sta. Rosa',NULL,1),(2161,22,'Sta. Teresa',NULL,1),(2162,22,'Suardi',NULL,1),(2163,22,'Sunchales',NULL,1),(2164,22,'Susana',NULL,1),(2165,22,'Tacuarendí',NULL,1),(2166,22,'Tacural',NULL,1),(2167,22,'Tartagal',NULL,1),(2168,22,'Teodelina',NULL,1),(2169,22,'Theobald',NULL,1),(2170,22,'Timbúes',NULL,1),(2171,22,'Toba',NULL,1),(2172,22,'Tortugas',NULL,1),(2173,22,'Tostado',NULL,1),(2174,22,'Totoras',NULL,1),(2175,22,'Traill',NULL,1),(2176,22,'Venado Tuerto',NULL,1),(2177,22,'Vera',NULL,1),(2178,22,'Vera y Pintado',NULL,1),(2179,22,'Videla',NULL,1),(2180,22,'Vila',NULL,1),(2181,22,'Villa Amelia',NULL,1),(2182,22,'Villa Ana',NULL,1),(2183,22,'Villa Cañas',NULL,1),(2184,22,'Villa Constitución',NULL,1),(2185,22,'Villa Eloísa',NULL,1),(2186,22,'Villa Gdor. Gálvez',NULL,1),(2187,22,'Villa Guillermina',NULL,1),(2188,22,'Villa Minetti',NULL,1),(2189,22,'Villa Mugueta',NULL,1),(2190,22,'Villa Ocampo',NULL,1),(2191,22,'Villa San José',NULL,1),(2192,22,'Villa Saralegui',NULL,1),(2193,22,'Villa Trinidad',NULL,1),(2194,22,'Villada',NULL,1),(2195,22,'Virginia',NULL,1),(2196,22,'Wheelwright',NULL,1),(2197,22,'Zavalla',NULL,1),(2198,22,'Zenón Pereira',NULL,1),(2199,23,'Añatuya',NULL,1),(2200,23,'Árraga',NULL,1),(2201,23,'Bandera',NULL,1),(2202,23,'Bandera Bajada',NULL,1),(2203,23,'Beltrán',NULL,1),(2204,23,'Brea Pozo',NULL,1),(2205,23,'Campo Gallo',NULL,1),(2206,23,'Capital',NULL,1),(2207,23,'Chilca Juliana',NULL,1),(2208,23,'Choya',NULL,1),(2209,23,'Clodomira',NULL,1),(2210,23,'Col. Alpina',NULL,1),(2211,23,'Col. Dora',NULL,1),(2212,23,'Col. El Simbolar Robles',NULL,1),(2213,23,'El Bobadal',NULL,1),(2214,23,'El Charco',NULL,1),(2215,23,'El Mojón',NULL,1),(2216,23,'Estación Atamisqui',NULL,1),(2217,23,'Estación Simbolar',NULL,1),(2218,23,'Fernández',NULL,1),(2219,23,'Fortín Inca',NULL,1),(2220,23,'Frías',NULL,1),(2221,23,'Garza',NULL,1),(2222,23,'Gramilla',NULL,1),(2223,23,'Guardia Escolta',NULL,1),(2224,23,'Herrera',NULL,1),(2225,23,'Icaño',NULL,1),(2226,23,'Ing. Forres',NULL,1),(2227,23,'La Banda',NULL,1),(2228,23,'La Cañada',NULL,1),(2229,23,'Laprida',NULL,1),(2230,23,'Lavalle',NULL,1),(2231,23,'Loreto',NULL,1),(2232,23,'Los Juríes',NULL,1),(2233,23,'Los Núñez',NULL,1),(2234,23,'Los Pirpintos',NULL,1),(2235,23,'Los Quiroga',NULL,1),(2236,23,'Los Telares',NULL,1),(2237,23,'Lugones',NULL,1),(2238,23,'Malbrán',NULL,1),(2239,23,'Matara',NULL,1),(2240,23,'Medellín',NULL,1),(2241,23,'Monte Quemado',NULL,1),(2242,23,'Nueva Esperanza',NULL,1),(2243,23,'Nueva Francia',NULL,1),(2244,23,'Palo Negro',NULL,1),(2245,23,'Pampa de Los Guanacos',NULL,1),(2246,23,'Pinto',NULL,1),(2247,23,'Pozo Hondo',NULL,1),(2248,23,'Quimilí',NULL,1),(2249,23,'Real Sayana',NULL,1),(2250,23,'Sachayoj',NULL,1),(2251,23,'San Pedro de Guasayán',NULL,1),(2252,23,'Selva',NULL,1),(2253,23,'Sol de Julio',NULL,1),(2254,23,'Sumampa',NULL,1),(2255,23,'Suncho Corral',NULL,1),(2256,23,'Taboada',NULL,1),(2257,23,'Tapso',NULL,1),(2258,23,'Termas de Rio Hondo',NULL,1),(2259,23,'Tintina',NULL,1),(2260,23,'Tomas Young',NULL,1),(2261,23,'Vilelas',NULL,1),(2262,23,'Villa Atamisqui',NULL,1),(2263,23,'Villa La Punta',NULL,1),(2264,23,'Villa Ojo de Agua',NULL,1),(2265,23,'Villa Río Hondo',NULL,1),(2266,23,'Villa Salavina',NULL,1),(2267,23,'Villa Unión',NULL,1),(2268,23,'Vilmer',NULL,1),(2269,23,'Weisburd',NULL,1),(2270,24,'Río Grande',NULL,1),(2271,24,'Tolhuin',NULL,1),(2272,24,'Ushuaia',NULL,1),(2273,25,'Acheral',NULL,1),(2274,25,'Agua Dulce',NULL,1),(2275,25,'Aguilares',NULL,1),(2276,25,'Alderetes',NULL,1),(2277,25,'Alpachiri',NULL,1),(2278,25,'Alto Verde',NULL,1),(2279,25,'Amaicha del Valle',NULL,1),(2280,25,'Amberes',NULL,1),(2281,25,'Ancajuli',NULL,1),(2282,25,'Arcadia',NULL,1),(2283,25,'Atahona',NULL,1),(2284,25,'Banda del Río Sali',NULL,1),(2285,25,'Bella Vista',NULL,1),(2286,25,'Buena Vista',NULL,1),(2287,25,'Burruyacú',NULL,1),(2288,25,'Capitán Cáceres',NULL,1),(2289,25,'Cevil Redondo',NULL,1),(2290,25,'Choromoro',NULL,1),(2291,25,'Ciudacita',NULL,1),(2292,25,'Colalao del Valle',NULL,1),(2293,25,'Colombres',NULL,1),(2294,25,'Concepción',NULL,1),(2295,25,'Delfín Gallo',NULL,1),(2296,25,'El Bracho',NULL,1),(2297,25,'El Cadillal',NULL,1),(2298,25,'El Cercado',NULL,1),(2299,25,'El Chañar',NULL,1),(2300,25,'El Manantial',NULL,1),(2301,25,'El Mojón',NULL,1),(2302,25,'El Mollar',NULL,1),(2303,25,'El Naranjito',NULL,1),(2304,25,'El Naranjo',NULL,1),(2305,25,'El Polear',NULL,1),(2306,25,'El Puestito',NULL,1),(2307,25,'El Sacrificio',NULL,1),(2308,25,'El Timbó',NULL,1),(2309,25,'Escaba',NULL,1),(2310,25,'Esquina',NULL,1),(2311,25,'Estación Aráoz',NULL,1),(2312,25,'Famaillá',NULL,1),(2313,25,'Gastone',NULL,1),(2314,25,'Gdor. Garmendia',NULL,1),(2315,25,'Gdor. Piedrabuena',NULL,1),(2316,25,'Graneros',NULL,1),(2317,25,'Huasa Pampa',NULL,1),(2318,25,'J. B. Alberdi',NULL,1),(2319,25,'La Cocha',NULL,1),(2320,25,'La Esperanza',NULL,1),(2321,25,'La Florida',NULL,1),(2322,25,'La Ramada',NULL,1),(2323,25,'La Trinidad',NULL,1),(2324,25,'Lamadrid',NULL,1),(2325,25,'Las Cejas',NULL,1),(2326,25,'Las Talas',NULL,1),(2327,25,'Las Talitas',NULL,1),(2328,25,'Los Bulacio',NULL,1),(2329,25,'Los Gómez',NULL,1),(2330,25,'Los Nogales',NULL,1),(2331,25,'Los Pereyra',NULL,1),(2332,25,'Los Pérez',NULL,1),(2333,25,'Los Puestos',NULL,1),(2334,25,'Los Ralos',NULL,1),(2335,25,'Los Sarmientos',NULL,1),(2336,25,'Los Sosa',NULL,1),(2337,25,'Lules',NULL,1),(2338,25,'M. García Fernández',NULL,1),(2339,25,'Manuela Pedraza',NULL,1),(2340,25,'Medinas',NULL,1),(2341,25,'Monte Bello',NULL,1),(2342,25,'Monteagudo',NULL,1),(2343,25,'Monteros',NULL,1),(2344,25,'Padre Monti',NULL,1),(2345,25,'Pampa Mayo',NULL,1),(2346,25,'Quilmes',NULL,1),(2347,25,'Raco',NULL,1),(2348,25,'Ranchillos',NULL,1),(2349,25,'Río Chico',NULL,1),(2350,25,'Río Colorado',NULL,1),(2351,25,'Río Seco',NULL,1),(2352,25,'Rumi Punco',NULL,1),(2353,25,'San Andrés',NULL,1),(2354,25,'San Felipe',NULL,1),(2355,25,'San Ignacio',NULL,1),(2356,25,'San Javier',NULL,1),(2357,25,'San José',NULL,1),(2358,25,'San Miguel de 25',NULL,1),(2359,25,'San Pedro',NULL,1),(2360,25,'San Pedro de Colalao',NULL,1),(2361,25,'Santa Rosa de Leales',NULL,1),(2362,25,'Sgto. Moya',NULL,1),(2363,25,'Siete de Abril',NULL,1),(2364,25,'Simoca',NULL,1),(2365,25,'Soldado Maldonado',NULL,1),(2366,25,'Sta. Ana',NULL,1),(2367,25,'Sta. Cruz',NULL,1),(2368,25,'Sta. Lucía',NULL,1),(2369,25,'Taco Ralo',NULL,1),(2370,25,'Tafí del Valle',NULL,1),(2371,25,'Tafí Viejo',NULL,1),(2372,25,'Tapia',NULL,1),(2373,25,'Teniente Berdina',NULL,1),(2374,25,'Trancas',NULL,1),(2375,25,'Villa Belgrano',NULL,1),(2376,25,'Villa Benjamín Araoz',NULL,1),(2377,25,'Villa Chiligasta',NULL,1),(2378,25,'Villa de Leales',NULL,1),(2379,25,'Villa Quinteros',NULL,1),(2380,25,'Yánima',NULL,1),(2381,25,'Yerba Buena',NULL,1),(2382,25,'Yerba Buena (S)',NULL,1);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Argentina',NULL,1);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documenttypes`
--

DROP TABLE IF EXISTS `documenttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documenttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documenttypes`
--

LOCK TABLES `documenttypes` WRITE;
/*!40000 ALTER TABLE `documenttypes` DISABLE KEYS */;
INSERT INTO `documenttypes` VALUES (1,'DNI','El DNI contiene información sobre su identidad. Pero, lo más importante es que este documento tiene un número personal. El número del DNI es necesario',1),(2,'PASAPORTE','PASAPORTE',1),(3,'L.C','Libreta Cívica',1),(4,'L.E.','Libreta de Enrolamiento',1);
/*!40000 ALTER TABLE `documenttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCountry` int(11) NOT NULL,
  `idProvince` int(11) NOT NULL,
  `idCity` int(11) NOT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Province_location` (`idProvince`),
  KEY `City_location` (`idCity`),
  KEY `Country_locations` (`idCountry`),
  KEY `Province_locations` (`idProvince`),
  KEY `City_locations` (`idCity`),
  KEY `Country_locationss` (`idCountry`),
  KEY `Province_locationss` (`idProvince`),
  KEY `City_locationss` (`idCity`),
  CONSTRAINT `City` FOREIGN KEY (`idCity`) REFERENCES `countries` (`id`),
  CONSTRAINT `Country` FOREIGN KEY (`idCountry`) REFERENCES `countries` (`id`),
  CONSTRAINT `Province` FOREIGN KEY (`idProvince`) REFERENCES `provinces` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (71,1,1,1,1),(72,1,1,1,1),(79,1,1,1,1);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phones`
--

DROP TABLE IF EXISTS `phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idBranch` int(11) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phones`
--

LOCK TABLES `phones` WRITE;
/*!40000 ALTER TABLE `phones` DISABLE KEYS */;
INSERT INTO `phones` VALUES (8,10,'32134',1);
/*!40000 ALTER TABLE `phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priceproducts`
--

DROP TABLE IF EXISTS `priceproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priceproducts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idproduct` int(11) NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `creationDate` date DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priceproducts`
--

LOCK TABLES `priceproducts` WRITE;
/*!40000 ALTER TABLE `priceproducts` DISABLE KEYS */;
/*!40000 ALTER TABLE `priceproducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCategory` int(11) NOT NULL,
  `idAccount` int(11) DEFAULT NULL,
  `productCode` varchar(50) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `imagen` longtext DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`idCategory`),
  CONSTRAINT `category` FOREIGN KEY (`idCategory`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provinces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCountry` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idCountry_idx` (`idCountry`),
  CONSTRAINT `idCountry` FOREIGN KEY (`idCountry`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinces`
--

LOCK TABLES `provinces` WRITE;
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;
INSERT INTO `provinces` VALUES (1,1,'Buenos Aires',NULL,1),(2,1,'Buenos Aires-GBA',NULL,1),(3,1,'Capital Federal',NULL,1),(4,1,'Catamarca',NULL,1),(5,1,'Chaco',NULL,1),(6,1,'Chubut',NULL,1),(7,1,'Córdoba',NULL,1),(8,1,'Corrientes',NULL,1),(9,1,'Entre Ríos',NULL,1),(10,1,'Formosa',NULL,1),(11,1,'Jujuy',NULL,1),(12,1,'La Pampa',NULL,1),(13,1,'La Rioja',NULL,1),(14,1,'Mendoza',NULL,1),(15,1,'Misiones',NULL,1),(16,1,'Neuquén',NULL,1),(17,1,'Río Negro',NULL,1),(18,1,'Salta',NULL,1),(19,1,'San Juan',NULL,1),(20,1,'San Luis',NULL,1),(21,1,'Santa Cruz',NULL,1),(22,1,'Santa Fe',NULL,1),(23,1,'Santiago del Estero',NULL,1),(24,1,'Tierra del Fuego',NULL,1),(25,1,'Tucumán',NULL,1);
/*!40000 ALTER TABLE `provinces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','Drecho en casi todo','2021-07-01 00:00:00',1);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeuserses`
--

DROP TABLE IF EXISTS `typeuserses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typeuserses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeuserses`
--

LOCK TABLES `typeuserses` WRITE;
/*!40000 ALTER TABLE `typeuserses` DISABLE KEYS */;
INSERT INTO `typeuserses` VALUES (1,'Business',1),(2,'User',1);
/*!40000 ALTER TABLE `typeuserses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idAccount` int(11) NOT NULL,
  `idLocation` int(11) NOT NULL,
  `idDocumentType` int(11) DEFAULT NULL,
  `docNumber` varchar(15) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `address` varchar(150) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idAccount_user` (`idAccount`),
  KEY `idLocation_idx` (`idLocation`),
  KEY `idLocation_user` (`idLocation`),
  KEY `idDocumentType_user` (`idDocumentType`),
  CONSTRAINT `Location_user` FOREIGN KEY (`idLocation`) REFERENCES `locations` (`id`),
  CONSTRAINT `idAccout` FOREIGN KEY (`idAccount`) REFERENCES `accounts` (`id`),
  CONSTRAINT `idDocumentType_user` FOREIGN KEY (`idDocumentType`) REFERENCES `documenttypes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (9,11,72,1,'19032740','4325678','Pradel','Eugene','Riccheri 132 piso 4 oficina D',1),(10,18,79,1,'19032740','32134','Pradel','Eugene','Ovidio Lagos 124',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'onlinedatabase'
--
/*!50003 DROP PROCEDURE IF EXISTS `createBusiness` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createBusiness`(
	in businessName varchar(200), in firstName varchar(50), in lastName varchar(50), 
	in address varchar(100),in addressuser varchar(150), in idDocumentType int, in docNumber varchar(20), in logo varchar(5000),
	in idCountry int, in idProvince int, in idCity int, in phoneBusiness varchar(20),
    in phoneuser varchar(20), in idRole int, in idCountryuser int, in idProvinceuser int, in idcityuser int, in userName varchar(50), 
    in userPass varchar(500), in postal_code varchar(15), in e_mail varchar(25), in cuit_cuil varchar(15), in e_mailaccount varchar(50))
begin
	declare idLocation int;
	declare idLocationuser int;
	declare idBusiness int;
	declare idBranch int;
	declare _idaccount int;
    DECLARE track_no INT DEFAULT 0;
   DECLARE EXIT HANDLER FOR SQLEXCEPTION, NOT FOUND, SQLWARNING
	BEGIN  
	GET DIAGNOSTICS CONDITION 1 @ERRNO = MYSQL_ERRNO, @MESSAGE_TEXT = MESSAGE_TEXT;
    SELECT '303' AS status,  @MESSAGE_TEXT AS message;
	ROLLBACK;
	END;

	START TRANSACTION;
	insert into locations(idCountry, idProvince,idCity,state)
    values(idCountry, idProvince, idCity,1);
    SET idLocation = (SELECT LAST_INSERT_ID());
    
    insert into businesses(businessName, cuit_cuil, logo, state)
    values(businessName, cuit_cuil, logo, 1);
    SET idBusiness = (SELECT LAST_INSERT_ID());
    
    insert into branches(idBusiness, idLocation, address, e_mail, postal_code, state)
    values(idBusiness,idLocation, address, e_mail, postal_code, 1);
    SET idBranch = (SELECT LAST_INSERT_ID());
    
    insert into accounts(idRole, idTypeUser, userName, userPass, e_mail, creationDate, state)
    values(idRole, 1, userName, userPass, e_mailaccount, CURDATE(), 1);
    SET _idaccount = (SELECT LAST_INSERT_ID());
    
    insert into branchusers(idBranch, idAccount, state)
    values(idBranch,_idaccount,1);
    
    insert into phones(idBranch, phonenumber, state)
    values(idBranch,phoneBusiness,1);
    
    insert into locations(idCountry, idProvince,idCity,state)
    values(idCountryuser, idProvinceuser, idCityuser,1);
    SET idLocationuser = (SELECT LAST_INSERT_ID());
    
    insert into users(idAccount, idLocation, phone, firstName, lastName, address, idDocumentType, docNumber, state)
    values(_idaccount, idLocationuser, phoneuser, firstName, lastName, addressuser, idDocumentType, docNumber, 1);
   
    SELECT '203' AS status, "El negocio fue guardo con exito" AS message;
   COMMIT;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createProduct`(
	in idCategory int, in idAccount int, in productCode varchar(50),
	in productName varchar(150), in description varchar(100), in stock int,
    in imagen longtext, in price decimal(18,2))
BEGIN
declare _idproduct int;
    DECLARE track_no INT DEFAULT 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION, NOT FOUND, SQLWARNING
	BEGIN  
	GET DIAGNOSTICS CONDITION 1 @ERRNO = MYSQL_ERRNO, @MESSAGE_TEXT = MESSAGE_TEXT;
    SELECT '303' AS status,  @MESSAGE_TEXT AS message;
	ROLLBACK;
	END;

	START TRANSACTION;
    
    insert into products(idCategory, idAccount, pruductCode, productName, stock, imagen, state)
    values(idCategory, idAccount, productCode, productName, productName, imagen,1);
    SET _idproduct = (SELECT LAST_INSERT_ID());
    
	insert into priceproducts(idProduct, price, creationDate, stock, state)
    values(_idproduct,price, CURDATE(), stock, 1);
    
	SELECT '203' AS status, "El product fue guardo con exito" AS message;
   COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createUser`(
	in phone varchar(20), in firstName varchar(50), in lastName varchar(50),
	in address varchar(150), in idDocumentType int, in docNumber varchar(20),
    in idRole int, in userName varchar(50), in userPass varchar(500),
    in idCountry int, in idProvince int, in idcity int, in e_mail varchar(25))
begin
	declare idLocation int;
	declare _idaccount int;
    DECLARE track_no INT DEFAULT 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION, NOT FOUND, SQLWARNING
	BEGIN  
	GET DIAGNOSTICS CONDITION 1 @ERRNO = MYSQL_ERRNO, @MESSAGE_TEXT = MESSAGE_TEXT;
    SELECT '303' AS status,  @MESSAGE_TEXT AS message;
	ROLLBACK;
	END;

	START TRANSACTION;
    
	insert into locations(idCountry, idProvince,idCity,state)
    values(idCountry, idProvince, idCity,1);
    SET idLocation = (SELECT LAST_INSERT_ID());
    
    insert into accounts(idRole, idTypeUser, userName, userPass, e_mail, creationDate, state)
    values(idRole, 2, userName, userPass, e_mail, CURDATE(), 1);
    SET _idaccount = (SELECT LAST_INSERT_ID());
    
    insert into users(idAccount, idLocation, phone, firstName, lastName, address, idDocumentType, docNumber, state)
    values(_idaccount, idLocation, phone, firstName, lastName, address, idDocumentType, docNumber, 1);    
      SELECT '203' AS status, "El usuario fue guardo con exito" AS message;
   COMMIT;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteBusiness` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteBusiness`(in id int)
begin
   DECLARE EXIT HANDLER FOR SQLEXCEPTION, NOT FOUND, SQLWARNING
	BEGIN  
	GET DIAGNOSTICS CONDITION 1 @ERRNO = MYSQL_ERRNO, @MESSAGE_TEXT = MESSAGE_TEXT;
    SELECT '303' AS status,  @MESSAGE_TEXT AS message;
	ROLLBACK;
	END;

	START TRANSACTION;
    SET SQL_SAFE_UPDATES = 0;
	update locations loc inner join branches bra on loc.id = bra.idLocation
    inner join businesses bus on bra.idBusiness = bus.id 
    inner join branchusers branusr on  bra.id = branusr.idBranch
    inner join accounts acc on acc.id = branusr.idAccount
    inner join phones ph on ph.idBranch = bra.id
    inner join users usr on usr.idAccount = acc.id
    inner join locations locusr on locusr.id = usr.idLocation
    set loc.state = 2, bra.state = 2, bus.state = 2, acc.state = 2, 
    branusr.state = 2, ph.state = 2, usr.state= 2, locusr.state = 2  where bra.idBusiness = id;
   
    SELECT '203' AS status, "El negocio fue eliminado con exito" AS message;
   COMMIT;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllAccount`(in _idPrincipal int)
begin
	select acc.userName, rol.name as rol, acc.creationDate, bra.address as sucursal from accounts acc
    inner join branchusers brauser on brauser.idAccount = acc.id
    inner join typeuserses typerusr on acc.idTypeUser = typerusr.id
    inner join branches bra on bra.id = brauser.idBranch
    inner join roles rol on rol.id = acc.idRole
    where bra.idBusiness = _idPrincipal;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `logginAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `logginAccount`(in userName varchar(50))
begin
	select acc.id as idAccount, bus.id as idPrincipal, acc.userName, acc.userPass,
    IF(acc.idTypeUser = 1, 'Business', acc.idTypeUser) as typeUser,
    rol.name as 'role', rol.id as idRole from accounts acc 
    inner join branchusers bruser on acc.id = bruser.idAccount
    inner join branches bra on bra.id = bruser.idBranch
    inner join businesses bus on bus.id = bra.idBusiness
    inner join roles rol on acc.idRole = rol.id
    where acc.userName = userName
    union    
    select acco.id as idAccount, usr.id as idPrincipal, acco.userName, acco.userPass,
    IF(acco.idTypeUser = 2, 'User', acco.idTypeUser) as typeUser,
    rol.name as 'role', rol.id as idRole from accounts acco
    inner join users usr on acco.id = usr.idAccount
    inner join roles rol on acco.idRole = rol.id
    where acco.userName = userName; 
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-17 18:46:46
