-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-03-2019 a las 19:20:23
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
(9788466338257, 'Clive Cussler', 'El enigma del faraón', 'En esta decimotercera entrega de la serie de aventuras trepidantes «Archivos NUMA» Kurt Austin y su equipo deberán enfrentarse a un peligro con más de tres mil años de antigüedad.Ciudad de los muertos, Egipto, 1353 a.C.Tras prohibirse la adoración a la diosa de la resurrección Osiris, unos sacerdotes prometen a un matrimonio devolver la vida a sus hijos haciendo uso de un antiguo elixir, un secreto enterrado bajo las arenas del desierto. El único precio, matar al faraón Akenatón...Lampedusa, actualidad.Cerca de una remota isla del Mediterráneo, un misterioso barco emana un humo, un veneno mortal. Minutos después, todos los habitantes de la isla parecen haber muerto. Respondiendo a una llamada de socorro, Kurt Austi n y el equipo de NUMA se adentrarán en las causas de la catástrofe.Kurt deberá desvelar la verdad tras las leyendas, aprender los secretos del pasado para salvar las vidas del futuro. Una desesperada carrera contrarreloj en la que se enfrentará a un enemigo que no se detiene ante nada ni ante nadie.Reseña:«El más intrigante, salvaje, imaginativo y entretenido thriller de la serie\"Archivos NUMA\". ¡Los fans de Cussler se pelearán por él.»Library Journal', 2017),
(9788491291893, 'Elisabet Benavent', 'Toda la verdad sobre las mentiras', '¿Puede mantenerse una amistad a pesar de las mentiras? Una despedida de soltera en autocaravana. Un grupo de amigos... ...y muchos secretos. Elísabet Benavent, @Betacoqueta, con 1.000.000 de ejemplares vendidos vuelve con una novela original, una propuesta diferente que aborda las contradicciones de un grupo de amigos que se ve obligado a mentir para dejar de sentir. Un road trip divertido, surrealista, donde todo puede suceder. Una aventura en carretera que habla de la verdad que se esconde detrás de todas las mentiras. Los lectores han dichosobre Elísabet Benavent... «Como siempre @BetaCoqueta ha escrito una gran novela. Sabía que me gustaría desde el principio. Me tuvo enganchada toda la historia y el final me pareció espectacular.» «Elísabet nos da las mejores historias, esas que te hacen vivir el libro de forma intensa. Algo que consigue en todas y cada una de sus novelas.» «¡Me ha encantado! Elísabet tiene una forma de escribir muy personal. Siempre conecta con los lectores al presentar historias reales y cotidianas.» «La lectura de este libro ha sido un torrente de emociones. Un historia intensa de las que encoge el corazón.»', 2019),
(9788497599313, 'Clive Cussler', 'Serpiente', 'En diversas partes del mundo se producen misteriosos asesinatos de arqueólogos. Todas las víctimas tienen un elemento en común: en el momento de los crímenes estaban reuniendo asombrosas pruebas de que Colón no fue el primer europeo en pisar las tierras del Nuevo Mundo. Sin embargo, no se trata de acciones aisladas de maníacos u obsesos. Muy al contrario, detrás de estos asesinatos hay una orquestada campaña que busca provocar un terrible conflicto bélico. Y sólo los investigadores de la NUMA, con la ayuda de una joven y bella científica, podrán impedir que el siniestro complot se consume. Ambientada en Marruecos, México y EE.UU., esta nueva novela de Clive Cussler, autor de 15 bestsellers consecutivos, deja a los lectores sin aliento, y no precisamente por hacer submarinismo... Una aventura no apta para cardíacos.', 2010),
(9788497933650, 'Clive Cussler', 'Dragón', 'Un acccidente nuclear en el Pacífico revela la existencia de un grupo ultranacionalista japonés cuyo objetivo es chantajear a Occidente bajo amenaza de colocar bombas atómicas en puntos neurálgicos, y asegurar la hegemonía comercial de Japón en todo el planeta. Sin embargo, Dirk Pitt se convertirá en el factor humano capaz de neutralizar el peligro que se cierne sobre el mundo.Dragón es una novela de alta tensión que no ofrece respiro al lector y que confirma a su autor como uno de los más altos exponentes del género de aventuras actual.', 2011),
(9788497933674, 'Clive Cussler', 'Vixen 03', 'En 1954, el vuelo Vixen 03 y su mortífero cargamento, un arma ultrasecreta, no llegan a su misterioso destino. La investigación oficial dictamina que el avión ha caído en el océano. En 1988, Dirk Pitt descubre restos del Vixen 03 en las heladas aguas de un río de Colorado. Parte de su cargamento ha sido sustraído por un grupo terrorista africano con intenciones de provocar una catástrofe en Washington. Pero ni siquiera los terroristas conocen las terribles consecuencias que podrían provocar con su actitud, porque muy pocas personas saben la verdad sobre el cargamento del Vixen 03.', 2011);

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
(9788420432458, 'Arturo Pérez Reverte', 'Sabotaje', 'El 3 de octubre regresa Arturo Pérez Reverte con la tercera aventura de Lorenzo Falcó «La luz declinante de la ventana y su efecto óptico en el cristal daban una tenue pátina rojiza al enorme lienzo; como si éste, antes de ser realidad, ya empezase a ensangrentarse lentamente. Y de pronto, todo adquirió sentido. -Se llamará Guernica -dijo Picasso.» Mayo de 1937. La Guerra Civil sigue su sangriento curso en España, pero también lejos de los campos de batalla se combate entre las sombras. Una doble misión lleva a Lorenzo Falcó hasta París con el objetivo de intentar, de cualquier forma posible, que el Guernica que está pintando Pablo Picasso no llegue nunca a la Exposición Universal donde la República pretende conseguir apoyo internacional. Aunque ya se adivinan en Europa los vientos de la nueva guerra que asolará el continente, la música alegre sigue sonando, y el arte, los negocios, la vida frívola ocupan todavía a intelectuales, refugiados y activistas. Acostumbrado al peligro y a las situaciones límite, Falcó debe enfrentarse esta vez a un mundo en el que la lucha de ideas pretende imponerse sobre la acción. Un mundo que a él le es ajeno, y al que aplicará sus propios métodos. Arturo Pérez-Reverte construye en Sabotaje una trama magistral que envuelve al lector hasta la última página, y completa con esta novela la trilogía protagonizada por Falcó, el personaje literario más fascinante de los últimos tiempos.', 2018),
(9788420474694, 'Arturo Pérez Reverte', 'La sombra del águila', 'La sombra del águila narra una historia ficticia basada en un hecho real: Durante la campaña de Rusia de 1812, en un combate adverso para las tropas napoleónicas, un batallón de antiguos prisioneros españoles, enrolados a la fuerza en el ejército francés, intenta desertar, pasándose a los rusos. Interpretando erróneamente el movimiento, el Emperador lo toma por un acto de heroísmo y ordena en su auxilio una carga de caballería que tendrá imprevisibles consecuencias. Este relato breve fue publicado en el diario El País en agosto de 1993, mientras Arturo Pérez-Reverte cubría, como reportero, el conflicto de Bosnia. Bajo su tono desgarrado, lúcido, divertido y trágico a un tiempo, el autor desvela una descarnada y mordaz vis ión de la guerra y la condición humana.', 2017),
(9788466343039, 'Arturo Pérez Reverte', 'Falcó', 'Violencia, tramas de poder, suspense, lealtad y pasión conforman esta extraordinaria novela de lectura adictiva.«El mundo de Falcó era otro, y allí los bandos estaban perfectamente definidos: de una parte él, y de la otra todos los demás.»La Europa turbulenta de los años treinta y cuarenta del siglo XX es el escenario de las andanzas de Lorenzo Falcó, ex contrabandista de armas, espía sin escrúpulos, agente de los servicios de inteligencia.', 2018),
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
-- Volcado de datos para la tabla `sugeridos`
--

INSERT INTO `sugeridos` (`ISBN`, `Autor`, `Titulo`, `Sinopsis`, `Fecha`) VALUES
(9788401328510, 'Ken Follet', 'Los pilares de la tierra', 'El gran maestro de la narrativa de acción y suspense nos transporta a la Edad Media, a un fascinante mundo de reyes, damas, caballeros, pugnas feudales, castillos y ciudades amuralladas. El amor y la muerte se entrecruzan vibrantemente en este magistral tapiz cuyo centro es la construcción de una catedral gótica. La historia se inicia con el ahorcamiento público de un inocente y finaliza con la humillación de un rey. Los pilares de la Tierra es la obra maestra de Ken Follett y constituye una excepcional evocación de una época de violentas pasiones.', 2017),
(9788408176459, 'Carlos Ruiz Zafón', 'La sombra del viento', 'Un amanecer de 1945 un muchacho es conducido por su padre a un misterioso lugar oculto en el corazón de la ciudad vieja: El Cementerio de los Libros Olvidados. Allí, Daniel Sempere encuentra un libro maldito que cambiará el rumbo de su vida y le arrastrará a un laberinto de intrigas y secretos enterrados en el alma oscura de la ciudad.  La Sombra del Viento es un misterio literario ambientado en la Barcelona de la primera mitad del siglo XX, desde los últimos esplendores del Modernismo a las tinieblas de la posguerra.', 2001),
(9788415156062, 'Stephen Harrigan', 'Las puertas de el Álamo', 'Una novela enorme, fascinante y profundamente desarrollada acerca de asedio y caída de El Álamo en 1836, un  acontecimiento clave en la formación y desarrollo de los Estados Unidos, y que marca un hito en la historia moderna.  Las Puertas de El Álamo sigue las vidas de tres personas cuyos destinos se ven ligados al fuerte tejano: Edmund  McGowan, un talentoso naturalista que ve amenazado el trabajo de su vida por la guerra contra Méjico; la intrépida  Mary Mott; y su hijo adolescente Terrell, cuya primera y desastrosa experiencia con el amor los aboca a la guerra y al  crisol del El Álamo. La historia se despliega con una vívida inmediatez y describe la crucial batalla desde la perspectiva  de los atacantes mejicanos y lo s defensores norteamericanos. Llena de escenas dramáticas y poblada de personajes  ficticios e históricos (entre ellos James Bowie, David Crockett, William Travis y el general Santa Ana) Las puertas de  El Álamo nos envuelve en la historia y durante toda la memorable y apasionada narración nos permite sumergirnos  en este legendario episodio histórico.', 2010),
(9788417305659, 'Soren Sveistrup', 'El caso hartung', 'El primer martes de Octubre, Rosa Hartung vuelve a su trabajo como ministra de asuntos sociales después de un año de ausencia, al haber vivido una situación dramática: la desaparición de su hija de 12 años. Linus Berger, un joven que sufre de una enfermedad mental, confesó haber matado a la chica, pero es incapaz de recordar donde quemó las varias partes del cadáver, que fue desmembrado. Hay una correlación entre el caso de la hija de la ministra y esta serie de asesinatos.  El mismo día que Rosa vuelve al parlamento, se encuentra el cadáver de una joven madre soltera, que ha sido brutalmente asesinada en su casa, en un suburbio de Copenhague – ha sido torturada y le han cortado una mano.  La joven investigadora Naia Thulin es informada al respecto, y junto con Mark Hess, que acaba de ser expulsado de la sede de Europol en La Haya, son enviados a investigar el caso. Al llegar al lugar del crimen, encuentran una figura de un hombrecito hecha con castañas. Parece que el muñeco está ocultando un secreto, aunque esto se atribuye a una coincidencia. Cuando otra mujer es asesinada –y en este caso, el cadáver de la víctima se encuentra con ambas manos cortadas- y a su vez se encuentra en el lugar del crimen otro muñeco hecho con castañas, Thulin y Hess empiezan a sospechar que hay una conexión entre el caso Hartung, las mujeres asesinadas y un asesino que está extendiendo el miedo a lo largo del país.  Empieza entonces una carrera contra el tiempo, ya que todo apunta a que el asesino cumple una misión que está lejos de terminar.', 2019),
(9788498724615, 'Isaac Bashevis Singer', 'Sombras sobre el Hudson', 'En Nueva York, un grupo de judíos polacos huidos del nazismo se reúne periódicamente en casa del próspero Boris Makaver. Algunos apenas han superado la experiencia de la guerra; otros, más jóvenes, perciben un futuro esperanzador en un país en el que echar raíces. Los defensores del comunismo discuten con los partidarios del capitalismo, mientras que las opiniones divergen con respecto a si conservar o no las antiguas tradiciones. Isaac Bashevis Singer muestra una galería de personajes -místicos, pragmáticos, filósofos, comerciantes, aprovechados, generosos y comprensivos- y entrelaza sus vidas en esta obra rica en matices y observaciones sobre la condición humana.', 2011);

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
