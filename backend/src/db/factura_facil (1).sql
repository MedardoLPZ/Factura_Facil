-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 03-12-2023 a las 22:43:19
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `factura_facil`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id_categories` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `descripcion_cate` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id_categories`, `name`, `descripcion_cate`) VALUES
(1, 'Carrocería', 'La carrocería de un vehículo es su estructura externa que envuelve y protege el chasis, motor y pasajeros.'),
(2, 'Herramientas', 'Las herramientas para carro abarcan una variedad de utensilios especializados para el mantenimiento y reparación de vehículos.'),
(3, 'Fricciones', 'En un carro, las fricciones se manifiestan principalmente en el sistema de frenos, donde las pastillas ejercen presión contra los discos para reducir la velocidad.'),
(4, 'Accesorios', 'Los accesorios para carros son complementos que mejoran la funcionalidad y apariencia de un vehículo.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE `detalle` (
  `id_detalle` int NOT NULL,
  `id_fact` int NOT NULL,
  `id_prod` int NOT NULL,
  `cantidad_deta` int NOT NULL,
  `sub` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle`
--

INSERT INTO `detalle` (`id_detalle`, `id_fact`, `id_prod`, `cantidad_deta`, `sub`) VALUES
(11, 25, 7, 3, '1200.00'),
(12, 25, 12, 1, '1400.00'),
(13, 25, 19, 5, '2225.00'),
(14, 25, 20, 7, '2400.00'),
(15, 25, 17, 1, '2400.00'),
(16, 25, 11, 4, '3720.00'),
(17, 25, 5, 4, '7120.00'),
(18, 30, 4, 5, '2050.00'),
(19, 40, 6, 5, '270.00'),
(20, 42, 6, 5, '225.00'),
(21, 43, 4, 3, '1230.00'),
(22, 44, 4, 2, '820.00'),
(23, 45, 4, 2, '800.00'),
(24, 45, 4, 3, '1230.00'),
(25, 47, 4, 2, '820.00'),
(26, 47, 6, 2, '920.00'),
(27, 48, 4, 2, '800.00'),
(28, 48, 14, 2, '200.00'),
(29, 49, 7, 2, '800.00'),
(30, 49, 15, 2, '400.00'),
(31, 50, 4, 5, '2050.00'),
(32, 50, 15, 5, '1150.00'),
(33, 51, 4, 5, '2050.00'),
(34, 52, 5, 2, '1700.00'),
(35, 53, 1, 2, '640.00'),
(36, 53, 5, 2, '1600.00'),
(37, 54, 6, 2, '800.00'),
(38, 55, 7, 2, '880.00'),
(39, 55, 2, 4, '140.00'),
(40, 55, 12, 6, '1200.00'),
(41, 56, 7, 2, '900.00'),
(42, 57, 4, 2, '820.00'),
(43, 58, 7, 2, '800.00'),
(44, 59, 14, 2, '170.00'),
(45, 61, 1, 3, '960.00'),
(46, 61, 15, 2, '460.00'),
(47, 61, 15, 5, '1150.00'),
(48, 61, 8, 4, '2000.00'),
(49, 63, 4, 2, '880.00'),
(50, 64, 6, 1, '460.00'),
(51, 65, 6, 3, '1380.00'),
(52, 65, 3, 2, '800.00'),
(53, 65, 18, 7, '700.00'),
(54, 66, 6, 3, '1380.00'),
(55, 67, 4, 4, '1640.00'),
(56, 68, 4, 2, '820.00'),
(57, 68, 5, 2, '1700.00'),
(58, 69, 3, 2, '800.00'),
(59, 69, 18, 6, '600.00'),
(60, 69, 17, 3, '525.00'),
(61, 70, 4, 5, '2050.00'),
(62, 71, 6, 5, '2300.00'),
(63, 71, 18, 5, '500.00'),
(64, 71, 15, 2, '460.00'),
(65, 71, 16, 1, '830.00'),
(66, 71, 11, 4, '1320.00'),
(67, 71, 17, 3, '525.00'),
(68, 71, 1, 4, '1280.00'),
(69, 71, 14, 8, '680.00'),
(70, 72, 9, 1, '350.00'),
(71, 72, 1, 2, '640.00'),
(72, 72, 10, 4, '1720.00'),
(73, 72, 7, 5, '2250.00'),
(74, 72, 4, 6, '2460.00'),
(75, 72, 3, 8, '3200.00'),
(76, 73, 9, 1, '360.00'),
(77, 73, 1, 2, '600.00'),
(78, 73, 14, 6, '510.00'),
(79, 73, 4, 5, '2050.00'),
(80, 73, 15, 3, '690.00'),
(81, 73, 12, 5, '1050.00'),
(82, 73, 2, 5, '175.00'),
(83, 73, 11, 5, '1650.00'),
(84, 73, 18, 3, '300.00'),
(85, 74, 5, 2, '1700.00'),
(86, 74, 5, 5, '4250.00'),
(87, 74, 5, 1, '850.00'),
(88, 74, 20, 2, '50.00'),
(89, 74, 5, 5, '4250.00'),
(90, 74, 14, 2, '170.00'),
(91, 74, 5, 2, '1700.00'),
(92, 74, 15, 2, '460.00'),
(93, 75, 4, 1, '410.00'),
(94, 75, 15, 2, '460.00'),
(95, 75, 18, 1, '100.00'),
(96, 75, 7, 2, '900.00'),
(97, 75, 18, 3, '300.00'),
(98, 75, 4, 2, '820.00'),
(99, 75, 14, 1, '85.00'),
(100, 76, 6, 2, '920.00'),
(101, 76, 15, 3, '690.00'),
(102, 76, 7, 1, '450.00'),
(103, 76, 15, 1, '230.00'),
(104, 76, 2, 1, '35.00'),
(105, 76, 12, 1, '210.00'),
(106, 76, 15, 1, '230.00'),
(107, 76, 12, 1, '210.00'),
(108, 76, 17, 1, '175.00'),
(109, 76, 19, 1, '165.00'),
(110, 78, 6, 2, '920.00'),
(111, 79, 7, 1, '450.00'),
(112, 80, 6, 1, '460.00'),
(113, 80, 6, 2, '920.00'),
(114, 80, 2, 2, '70.00'),
(115, 80, 18, 2, '200.00'),
(116, 80, 12, 2, '420.00'),
(117, 80, 17, 2, '350.00'),
(118, 80, 19, 2, '330.00'),
(119, 80, 16, 2, '1660.00'),
(120, 82, 6, 1, '460.00'),
(121, 82, 1, 1, '320.00'),
(122, 84, 4, 1, '410.00'),
(123, 84, 16, 1, '830.00'),
(124, 84, 2, 1, '35.00'),
(125, 84, 19, 1, '165.00'),
(126, 84, 19, 1, '165.00'),
(127, 84, 16, 1, '830.00'),
(128, 84, 15, 1, '230.00'),
(129, 84, 12, 1, '210.00'),
(130, 85, 6, 3, '1380.00'),
(131, 85, 18, 2, '200.00'),
(132, 86, 4, 2, '820.00'),
(133, 86, 17, 2, '350.00'),
(134, 86, 17, 3, '525.00'),
(135, 86, 20, 1, '25.00'),
(136, 86, 15, 1, '230.00'),
(137, 86, 18, 1, '100.00'),
(138, 86, 12, 1, '210.00'),
(139, 86, 19, 1, '165.00'),
(140, 86, 14, 9, '540.00'),
(141, 86, 12, 1, '210.00'),
(142, 86, 10, 1, '430.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id_fact` int NOT NULL,
  `id_user` int NOT NULL,
  `fecha_fact` date NOT NULL,
  `cliente` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `isv` decimal(10,2) DEFAULT NULL,
  `sub` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`id_fact`, `id_user`, `fecha_fact`, `cliente`, `isv`, `sub`, `total`) VALUES
(25, 3, '2023-11-28', 'osman', '1068.00', '7120.00', '8188.00'),
(26, 3, '2023-11-28', 'eduardo', NULL, NULL, NULL),
(27, 3, '2023-11-28', 'eduardo', NULL, NULL, NULL),
(28, 3, '2023-11-28', 'a', NULL, NULL, NULL),
(29, 3, '2023-11-28', 'a', NULL, NULL, NULL),
(30, 3, '2023-11-28', 'a', NULL, NULL, NULL),
(31, 3, '2023-11-28', 'a', NULL, NULL, NULL),
(32, 3, '2023-11-28', 'a', NULL, NULL, NULL),
(33, 3, '2023-11-28', 'e', NULL, NULL, NULL),
(34, 3, '2023-11-28', 'a', NULL, NULL, NULL),
(35, 3, '2023-11-28', 'a', NULL, NULL, NULL),
(36, 3, '2023-11-28', 'e', NULL, NULL, NULL),
(37, 3, '2023-11-28', 'a', NULL, NULL, NULL),
(38, 3, '2023-11-28', 'a', NULL, NULL, NULL),
(39, 3, '2023-11-28', 'a', NULL, NULL, NULL),
(40, 3, '2023-11-28', 'z', NULL, NULL, NULL),
(41, 3, '2023-11-28', 'a', NULL, NULL, NULL),
(42, 3, '2023-11-28', 'a', NULL, NULL, NULL),
(43, 3, '2023-11-28', 'a', NULL, NULL, NULL),
(44, 3, '2023-11-28', 'q', NULL, NULL, NULL),
(45, 3, '2023-11-28', 'd', '184.50', '1230.00', '1414.50'),
(46, 3, '2023-11-28', 'c', NULL, NULL, NULL),
(47, 3, '2023-11-28', 'g', '261.00', '1740.00', '2001.00'),
(48, 3, '2023-11-28', 'd', '150.00', '1000.00', '1150.00'),
(49, 3, '2023-11-28', 'd', '180.00', '1200.00', '1380.00'),
(50, 3, '2023-11-28', 'a', '480.00', '3200.00', '3680.00'),
(51, 3, '2023-11-28', 'd', '307.50', '2050.00', '2357.50'),
(52, 3, '2023-11-28', 'd', '255.00', '1700.00', '1955.00'),
(53, 3, '2023-11-28', 'pruea factura', '336.00', '2240.00', '2576.00'),
(54, 3, '2023-11-28', 'a', '120.00', '800.00', '920.00'),
(55, 3, '2023-11-28', 'josfran', '333.00', '2220.00', '2553.00'),
(56, 3, '2023-11-28', 'a', '135.00', '900.00', '1035.00'),
(57, 3, '2023-11-28', 'prueb formato', '123.00', '820.00', '943.00'),
(58, 3, '2023-11-28', 'a', '120.00', '800.00', '920.00'),
(59, 3, '2023-11-28', 'ultima', '25.50', '170.00', '195.50'),
(60, 3, '2023-11-28', 'a', NULL, NULL, NULL),
(61, 3, '2023-11-28', 'daniel', '685.50', '4570.00', '5255.50'),
(62, 3, '2023-11-28', 'p', NULL, NULL, NULL),
(63, 3, '2023-11-30', 'a', '132.00', '880.00', '1012.00'),
(64, 3, '2023-11-30', 'hola', '69.00', '460.00', '529.00'),
(65, 3, '2023-11-30', 'prueba 2', '432.00', '2880.00', '3312.00'),
(66, 3, '2023-11-30', 'prueba 3', '207.00', '1380.00', '1587.00'),
(67, 3, '2023-11-30', 'prueba 5', '246.00', '1640.00', '1886.00'),
(68, 3, '2023-11-30', 'prueba 6', '378.00', '2520.00', '2898.00'),
(69, 3, '2023-11-30', 'prueba 7 ', '288.75', '1925.00', '2213.75'),
(70, 3, '2023-11-30', 'prueba  8', '307.50', '2050.00', '2357.50'),
(71, 3, '2023-11-30', 'Prueba 12', '1184.25', '7895.00', '9079.25'),
(72, 3, '2023-11-30', 'prueba 12 + 1', '1593.00', '10620.00', '12213.00'),
(73, 3, '2023-11-30', 'prueba 14', '1107.75', '7385.00', '8492.75'),
(74, 3, '2023-11-30', 'prueba mil', '2014.50', '13430.00', '15444.50'),
(75, 3, '2023-11-30', 'prueba 15', '461.25', '3075.00', '3536.25'),
(76, 3, '2023-11-30', 'no se', '255.75', '1705.00', '1960.75'),
(77, 3, '2023-11-30', 'a', NULL, NULL, NULL),
(78, 3, '2023-11-30', 'no se', '138.00', '920.00', '1058.00'),
(79, 3, '2023-11-30', 'a', '67.50', '450.00', '517.50'),
(80, 3, '2023-11-30', 'a', '592.50', '3950.00', '4542.50'),
(81, 3, '2023-11-30', 'a', NULL, NULL, NULL),
(82, 3, '2023-11-30', 'a', '48.00', '320.00', '368.00'),
(83, 3, '2023-11-30', 'a', NULL, NULL, NULL),
(84, 3, '2023-11-30', 'a', '465.75', '3105.00', '3570.75'),
(85, 3, '2023-12-01', 'kener', '237.00', '1580.00', '1817.00'),
(86, 3, '2023-12-01', 'denis', '286.50', '1910.00', '2196.50'),
(87, 3, '2023-12-01', 'pruba', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_prod` int NOT NULL,
  `nombre_prod` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `detalle_prod` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `precio_prod` decimal(10,2) NOT NULL,
  `stock_prod` decimal(10,2) NOT NULL,
  `img_prod` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `img_prod2` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_categoria` int NOT NULL,
  `id_provee` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_prod`, `nombre_prod`, `detalle_prod`, `precio_prod`, `stock_prod`, `img_prod`, `img_prod2`, `id_categoria`, `id_provee`) VALUES
(1, 'Abridor exterior Toyota Hilux 84-88', 'Cromado, funciona para ambas puertas del vehiculo, larga durabilidad ', '320.00', '6.00', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700699596749?alt=media&token=38323fb4-548a-4b8e-b9a7-3ac4d563c8f8', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700699597714?alt=media&token=38323fb4-548a-4b8e-b9a7-3ac4d563c8f8', 1, 1),
(2, 'Llave 10 mm', 'Compacta y versátil, se utiliza comúnmente para apretar o aflojar pernos y tuercas de tamaño estándar en vehículos, muebles y otros proyectos', '35.00', '8.00', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700700194956?alt=media&token=38323fb4-548a-4b8e-b9a7-3ac4d563c8f8', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700700195406?alt=media&token=38323fb4-548a-4b8e-b9a7-3ac4d563c8f8', 2, 2),
(3, 'Fricciones D537', 'Pastillas de Freno Trasera: Honda Accord - 90/07, Honda Civic - 2002/2015, Honda CR-V - 2011/2015', '400.00', '4.00', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700717008152?alt=media&token=16c59b21-45dd-4d88-9f88-6b7d4df02d71', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700717005743?alt=media&token=16c59b21-45dd-4d88-9f88-6b7d4df02d71', 3, 3),
(4, 'Fricciones D320', 'Pastillas delanteras para los carros: Mazda B2000 - 86/87, Mazda B2000200 - 87/93', '410.00', '3.00', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700717666288?alt=media&token=16c59b21-45dd-4d88-9f88-6b7d4df02d71', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700717667081?alt=media&token=16c59b21-45dd-4d88-9f88-6b7d4df02d71', 3, 3),
(5, 'Fricciones S704', 'Zapata de freno: Ford Ranger 95/2009, Mazda B2500 98/2001, Mazda B2300 95/2009', '850.00', '1.00', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700718462197?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700718463020?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 3, 3),
(6, 'Fricciones D430', 'Pastillas delanteras: Nissan Maxima 89/90, Nissan Sentra 00/06', '460.00', '3.00', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700718793564?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700718794099?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 3, 3),
(7, 'Fricciones D266', 'Pastillas delanteras: Nissan D21 Pickup 86/94, Nissan Pickup 95/97, Nissan Stanza 86/89', '450.00', '3.00', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700718952154?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700718952443?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 3, 3),
(8, 'Stop Nissan D21', 'Izquierdo, De 3 colores, Largo, Años que abarca: 86-97.', '500.00', '3.00', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700719714331?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700719714860?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 1, 1),
(9, 'Abridor compuerta Mazda B2200', 'Abridor compuerta trasera, color negro y abarca desde el: 87-93', '360.00', '3.00', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700720029604?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700720030067?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 1, 1),
(10, 'Abridor exterior Toyota Tacoma', 'Izquierdo, abridor exterior, color negro y abarca desde el: 95-04', '430.00', '1.00', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700720250754?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700720251029?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 1, 1),
(11, 'Vía esquina Toyota Hilux', 'Izquierdo, vía esquina, 1 solo color, orilla negra y abarca desde el: 84-88', '330.00', '2.00', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700720369288?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700720369557?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 1, 1),
(12, 'Maneral con ratch de 3/8” Wadfow', 'Utilizable con todo los cubos de 3/8”, de alta calidad y durabilidad.', '210.00', '2.00', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700797962391?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700797963119?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 2, 4),
(13, 'Maneral de 1/2” Total', 'Utilizable con todos los cubos de 1/2” y de alta resistencia.', '390.00', '3.00', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700798064473?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700798064768?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 2, 4),
(14, 'Extintor ', 'Un extintor para carros es un dispositivo portátil y compacto diseñado para combatir incendios en vehículos.', '85.00', '2.00', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700799284127?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700799284616?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 4, 5),
(15, 'Insignia Tonon Toyota', 'Insignia para parte delantera del carro, metálica y resistente.', '230.00', '2.00', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700799412633?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700799412922?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 4, 5),
(16, 'Ventilador', 'Un ventilador pequeño para carro es un dispositivo compacto diseñado para proporcionar circulación de aire adicional en el interior del vehículo.', '830.00', '1.00', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700799707634?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700799708165?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 4, 5),
(17, 'Portaplaca Mitsubishi Plástico', 'Un portaplacas para carro es un accesorio diseñado para sostener y mostrar la placa de matrícula del vehículo de manera segura y visible.', '175.00', '10.00', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700799849803?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700799850108?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 4, 5),
(18, 'Llavero Jeep', 'Los llaveros de carro son accesorios prácticos y decorativos diseñados para contener las llaves del vehículo.', '100.00', '3.00', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700800237484?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700800238045?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 4, 5),
(19, 'Tenaza Total', 'Con mandíbulas fuertes y un diseño ergonómico, facilitan la sujeción y manipulación de objetos con firmeza.', '165.00', '4.00', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700802182101?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700802183056?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 2, 5),
(20, 'Destornillador Plano Vikingo', 'El desarmador plano es una herramienta manual con una hoja plana y puntiaguda, diseñada para ajustar o aflojar tornillos de ranura lineal.', '25.00', '4.00', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700802604542?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1700802605005?alt=media&token=bed827c4-dd1e-4903-901b-24a1df296fbb', 2, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_provee` int NOT NULL,
  `nombres_prove` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telefono_prove` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email_prove` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `direccion_prove` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_provee`, `nombres_prove`, `telefono_prove`, `email_prove`, `direccion_prove`) VALUES
(1, 'Parrillas One', '96108588', 'ParrillasOne@gmail.com', 'San Pedro sula'),
(2, 'Agencia Global', '98287621', 'AgenciaGlobal@gmail.com', 'San Pedro Sula'),
(3, 'Inversiones Benitez', '90902134', 'InversionesBenitez@gmail.com', 'San Pedro Sula'),
(4, 'La mundial', '98760098', 'lamundial@gmail.com', 'San Pedro Sula'),
(5, 'DiForza International', '98989009', 'difrozainternational@gmail.com', 'San Pedro Sula');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `name` varchar(180) NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `route` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `image`, `route`) VALUES
(1, 'EMPLEADO', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/empleado.png?alt=media&token=30bbb935-6269-4122-9d7c-4c63a04a8026&_gl=1*d3zdac*_ga*NzQyMTU5NzExLjE2OTkxNDI4NzM.*_ga_CW55HF8NVT*MTY5OTQyMzcxNi4xMC4xLjE2OTk0MjM3MjEuNTUuMC4w', '/store/home'),
(2, 'CLIENTE ', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/cliente.png?alt=media&token=8d771243-bc26-4408-949c-5c5dc365211d&_gl=1*d1j3h1*_ga*NzQyMTU5NzExLjE2OTkxNDI4NzM.*_ga_CW55HF8NVT*MTY5OTMwMzA0My45LjEuMTY5OTMwNTU4Ny4xMS4wLjA.', '/client/home');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lastname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `lastname`, `phone`, `image`, `password`) VALUES
(3, 'prueba3@gmail.com', 'tercera', 'prueba', '909832', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1699304144725?alt=media&token=a2e7814b-8f48-4986-9798-8e89dbfb2fa2', '$2a$10$UocKCim.OKooM20lO34pr.H7ErJ6u2Dtg.w6MvW29KLqobfch06..'),
(4, 'prueba4@gmail.com', 'prueba mil', 'actulizar ', '90987900', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1699585932994?alt=media&token=e24a286d-f70b-4a58-a982-b4fb02b82fbd', '$2a$10$qzBtTpMkzHFRmyd/2B7oFOSXeQMbUqtIBnA3jZO3AxgQqo0cUR50C'),
(5, 'Danie@gmail.coml', 'Ganiel Edgardo', 'medegia', '9854128', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1701032964723?alt=media&token=1f6ec0a8-9fc6-4ff1-9af1-f3e9deb49e8c', '$2a$10$map50CgmfjhUZlHZHloDvOsPSv43lvPGHuO.qDzFB9dZzTPPFRWZy'),
(6, 'prueba6@gmail.com', 'pureba', '6', '00000', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1701039464135?alt=media&token=1f6ec0a8-9fc6-4ff1-9af1-f3e9deb49e8c', '$2a$10$UnpUkEM.z9Y2cUDQuO54K.Eq4f8asB.knKYTeypL.9jzNs/9xEHZe'),
(7, 'prueba123@gmail.com', 'dsd', 'sds', '5807', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1701060582375?alt=media&token=59bd6a88-11fc-46c9-82ea-dfd7c8270289', '$2a$10$MGrA2dhukuVNaJrEAhebaOW5xYcohrqlaN3Ws.h64Y1.fQFDDV03.'),
(8, 'jose.cabrera@gmail.com', 'Jose', 'Cabrera', '0000000', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1701235394341?alt=media&token=931c011f-a0ec-4e31-b235-2163c0bc43c9', '$2a$10$BmNtlRAhVHKM2PsY6deRx.aY7qw.3BtNNOJMepVuMyXnUQEHlcWEq'),
(9, 'leivakener9@gmail.com', 'Kener', 'Leiva', '98622606', 'https://firebasestorage.googleapis.com/v0/b/factura-facil-95b37.appspot.com/o/image_1701470459551?alt=media&token=4248390d-1b41-414d-87d9-85a27fd78c6b', '$2a$10$XtPAiDoxxyYhFX8X/43xnOqa.HgFSlFOjYIXy1sh0pNwaPoIl0qfO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_has_roles`
--

CREATE TABLE `user_has_roles` (
  `id_user` int DEFAULT NULL,
  `id_rol` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `user_has_roles`
--

INSERT INTO `user_has_roles` (`id_user`, `id_rol`) VALUES
(3, 2),
(3, 1),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_categories`);

--
-- Indices de la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `FK_detalle_id_fact` (`id_fact`),
  ADD KEY `FK_detalle_id_prod` (`id_prod`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id_fact`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_prod`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_provee` (`id_provee`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_provee`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user_has_roles`
--
ALTER TABLE `user_has_roles`
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id_categories` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalle`
--
ALTER TABLE `detalle`
  MODIFY `id_detalle` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id_fact` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_prod` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_provee` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD CONSTRAINT `FK_detalle_id_fact` FOREIGN KEY (`id_fact`) REFERENCES `facturas` (`id_fact`),
  ADD CONSTRAINT `FK_detalle_id_prod` FOREIGN KEY (`id_prod`) REFERENCES `producto` (`id_prod`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categories` (`id_categories`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`id_provee`) REFERENCES `proveedores` (`id_provee`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `user_has_roles`
--
ALTER TABLE `user_has_roles`
  ADD CONSTRAINT `user_has_roles_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `user_has_roles_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
