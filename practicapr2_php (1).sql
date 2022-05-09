-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-05-2022 a las 11:14:03
-- Versión del servidor: 8.0.28
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `practicapr2_php`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `claves`
--

CREATE TABLE `claves` (
  `idClave` int NOT NULL,
  `codigoClave` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `ivaAplicableClave` int NOT NULL,
  `cantidadDisponibleClave` int NOT NULL,
  `precioCompraClave` int NOT NULL,
  `precioVentaClave` int NOT NULL,
  `idWebFK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `claves`
--

INSERT INTO `claves` (`idClave`, `codigoClave`, `ivaAplicableClave`, `cantidadDisponibleClave`, `precioCompraClave`, `precioVentaClave`, `idWebFK`) VALUES
(1, '1784728FWE232', 21, 5, 13, 20, 1),
(2, '4237FN7U3D2', 21, 100, 7, 15, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofertas`
--

CREATE TABLE `ofertas` (
  `idOferta` int NOT NULL,
  `porcentajeDescuentoOferta` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `ofertas`
--

INSERT INTO `ofertas` (`idOferta`, `porcentajeDescuentoOferta`) VALUES
(1, 15),
(2, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tener`
--

CREATE TABLE `tener` (
  `idTener` int NOT NULL,
  `idWebFK` int NOT NULL,
  `idOfertaFK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tener`
--

INSERT INTO `tener` (`idTener`, `idWebFK`, `idOfertaFK`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuarios` int NOT NULL,
  `nombreUsuario` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `claveUsuario` varchar(265) COLLATE utf8_spanish2_ci NOT NULL,
  `tipoUsuario` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuarios`, `nombreUsuario`, `claveUsuario`, `tipoUsuario`) VALUES
(1, 'basico', 'basico', 0),
(2, 'admin', 'admin', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `webs`
--

CREATE TABLE `webs` (
  `idWebs` int NOT NULL,
  `nombreWeb` varchar(45) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `webs`
--

INSERT INTO `webs` (`idWebs`, `nombreWeb`) VALUES
(1, 'Steam'),
(2, 'Epic');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `claves`
--
ALTER TABLE `claves`
  ADD PRIMARY KEY (`idClave`),
  ADD KEY `idWebFK` (`idWebFK`);

--
-- Indices de la tabla `ofertas`
--
ALTER TABLE `ofertas`
  ADD PRIMARY KEY (`idOferta`);

--
-- Indices de la tabla `tener`
--
ALTER TABLE `tener`
  ADD PRIMARY KEY (`idTener`),
  ADD KEY `idWebFK` (`idWebFK`),
  ADD KEY `idOfertaFK` (`idOfertaFK`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuarios`);

--
-- Indices de la tabla `webs`
--
ALTER TABLE `webs`
  ADD PRIMARY KEY (`idWebs`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `claves`
--
ALTER TABLE `claves`
  MODIFY `idClave` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ofertas`
--
ALTER TABLE `ofertas`
  MODIFY `idOferta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tener`
--
ALTER TABLE `tener`
  MODIFY `idTener` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuarios` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `webs`
--
ALTER TABLE `webs`
  MODIFY `idWebs` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `claves`
--
ALTER TABLE `claves`
  ADD CONSTRAINT `claves_ibfk_1` FOREIGN KEY (`idWebFK`) REFERENCES `webs` (`idWebs`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `tener`
--
ALTER TABLE `tener`
  ADD CONSTRAINT `tener_ibfk_1` FOREIGN KEY (`idWebFK`) REFERENCES `webs` (`idWebs`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tener_ibfk_2` FOREIGN KEY (`idOfertaFK`) REFERENCES `ofertas` (`idOferta`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
