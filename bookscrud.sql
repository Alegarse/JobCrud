-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-03-2019 a las 13:22:56
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bookscrud`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `leidos`
--

CREATE TABLE `leidos` (
  `ISBN` bigint(20) NOT NULL,
  `Autor` text COLLATE utf8_spanish2_ci NOT NULL,
  `Titulo` text COLLATE utf8_spanish2_ci NOT NULL,
  `Sinopsis` longtext COLLATE utf8_spanish2_ci NOT NULL,
  `Fecha` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `leidos`
--

INSERT INTO `leidos` (`ISBN`, `Autor`, `Titulo`, `Sinopsis`, `Fecha`) VALUES
(9788497599313, 'Clive Cussler', 'Serpiente', 'En diversas partes del mundo se producen misteriosos asesinatos de arqueólogos. Todas las víctimas tienen un elemento en común: en el momento de los crímenes estaban reuniendo asombrosas pruebas de que Colón no fue el primer europeo en pisar las tierras del Nuevo Mundo. Sin embargo, no se trata de acciones aisladas de maníacos u obsesos. Muy al contrario, detrás de estos asesinatos hay una orquestada campaña que busca provocar un terrible conflicto bélico. Y sólo los investigadores de la NUMA, con la ayuda de una joven y bella científica, podrán impedir que el siniestro complot se consume. Ambientada en Marruecos, México y EE.UU., esta nueva novela de Clive Cussler, autor de 15 bestsellers consecutivos, deja a los lectores sin aliento, y no precisamente por hacer submarinismo... Una aventura no apta para cardíacos.', 2011),
(9788497933650, 'Clive Cussler', 'Dragón', 'Un acccidente nuclear en el Pacífico revela la existencia de un grupo ultranacionalista japonés cuyo objetivo es chantajear a Occidente bajo amenaza de colocar bombas atómicas en puntos neurálgicos, y asegurar la hegemonía comercial de Japón en todo el planeta. Sin embargo, Dirk Pitt se convertirá en el factor humano capaz de neutralizar el peligro que se cierne sobre el mundo.Dragón es una novela de alta tensión que no ofrece respiro al lector y que confirma a su autor como uno de los más altos exponentes del género de aventuras actual.', 2011);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `porleer`
--

CREATE TABLE `porleer` (
  `ISBN` bigint(20) NOT NULL,
  `Autor` text COLLATE utf8_spanish2_ci NOT NULL,
  `Titulo` text COLLATE utf8_spanish2_ci NOT NULL,
  `Sinopsis` longtext COLLATE utf8_spanish2_ci NOT NULL,
  `Fecha` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `porleer`
--

INSERT INTO `porleer` (`ISBN`, `Autor`, `Titulo`, `Sinopsis`, `Fecha`) VALUES
(9788497935234, 'Clive Cussler', 'La cueva de los Vikingos', 'Durante su viaje de inaguración, el Emerald Dolphin, un enorme y lujoso crucero, se incendia y se hunde súbitamente. Nadie sabe explicar las causas de esta tragedia. Dirk Pitt y la tripulación de su barco luchan para salvar a los pasajeros y empiezan a investigar el misterioso acontecimiento. ¿Por qué no funcionó el dispositivo contra incendios? ¿Cuál era el revolucionario combustible que activaba sus motores? En su investigación le ayuda la hija del desaparecido científico que inventó el combustible, y juntos se enfrentarán a un enemigo increíblemente poderoso.', 2003),
(9788497938778, 'Clive Cussler', 'El tesoro de Alejandría', 'El emperador bizantino Teodosio ordenó que la Biblioteca de Alejandría, una de las maravillas del mundo antiguo, fuera quemada. Afortunadamente, el conservador de la biblioteca logró poner a salvo las obras de mayor valor, ocultándolas en un barco.', 2006);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sugeridos`
--

CREATE TABLE `sugeridos` (
  `ISBN` bigint(20) NOT NULL,
  `Autor` text COLLATE utf8_spanish2_ci NOT NULL,
  `Titulo` text COLLATE utf8_spanish2_ci NOT NULL,
  `Sinopsis` longtext COLLATE utf8_spanish2_ci NOT NULL,
  `Fecha` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `leidos`
--
ALTER TABLE `leidos`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indices de la tabla `porleer`
--
ALTER TABLE `porleer`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indices de la tabla `sugeridos`
--
ALTER TABLE `sugeridos`
  ADD PRIMARY KEY (`ISBN`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
