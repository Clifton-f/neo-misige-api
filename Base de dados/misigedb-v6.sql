-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: Oct 31, 2024 at 05:59 PM
-- Server version: 11.5.2-MariaDB-ubu2404
-- PHP Version: 8.2.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `misige`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `iniciarSemestre` (IN `semestre_lectivo` ENUM('1','2'), IN `ano_lectivo` INT(4), OUT `resposta` VARCHAR(200))   BEGIN 
DECLARE row_cadeira_curso ROW TYPE OF cadeira_curso;
  DECLARE done int DEFAULT 0;
 
DECLARE cur_cadeira_curso CURSOR FOR
Select
  *
from
  cadeira_curso
Where
  saiu_do_vigor is NULL
  AND semestre = semestre_lectivo;
   DECLARE CONTINUE HANDLER FOR NOT FOUND
SET
  done = 1;
OPEN cur_cadeira_curso;
  inserirTurma: 
 LOOP FETCH cur_cadeira_curso INTO row_cadeira_curso;
 IF done = 1 THEN LEAVE inserirTurma;END IF;
INSERT INTO
  turmas(curso_id, cadeira_id, ano)
values
  (
    row_cadeira_curso.curso_id,
    row_cadeira_curso.cadeira_id,
    ano_lectivo
  );END LOOP inserirTurma; 
  CLOSE 
  cur_cadeira_curso;
  END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `simpleproc2` (OUT `param1` CHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_bin')   BEGIN
  SELECT CONCAT('a'),f1 INTO param1 FROM t;
 END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `administradores`
--

CREATE TABLE `administradores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Subtabela de users com info dos administradores';

-- --------------------------------------------------------

--
-- Table structure for table `assistentes`
--

CREATE TABLE `assistentes` (
  `assistente_id` bigint(20) UNSIGNED NOT NULL,
  `curso_id` int(10) UNSIGNED NOT NULL,
  `cadeira_id` bigint(20) UNSIGNED NOT NULL,
  `ano` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `avaliacao_nota`
--

CREATE TABLE `avaliacao_nota` (
  `curso_id` int(10) UNSIGNED NOT NULL,
  `cadeira_id` bigint(20) UNSIGNED NOT NULL,
  `ano` int(4) NOT NULL,
  `estudante_id` bigint(20) UNSIGNED NOT NULL,
  `nome_avaliacao` varchar(255) NOT NULL,
  `nota` float NOT NULL DEFAULT 0,
  `peso` float NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `avaliacao_nota`
--

INSERT INTO `avaliacao_nota` (`curso_id`, `cadeira_id`, `ano`, `estudante_id`, `nome_avaliacao`, `nota`, `peso`, `updated_at`) VALUES
(3, 21, 2020, 73, 'teste teste 2', 15, 0.7, '2024-10-31 14:01:11'),
(3, 21, 2024, 73, 'teste trigger criarAvaliacoes', 0, 0.3, NULL),
(3, 21, 2024, 76, 'teste trigger criarAvaliacoes', 0, 0.3, NULL),
(3, 21, 2024, 78, 'teste trigger criarAvaliacoes', 0, 0.3, NULL),
(3, 21, 2024, 79, 'teste trigger criarAvaliacoes', 0, 0.3, NULL),
(3, 21, 2024, 81, 'teste trigger criarAvaliacoes', 0, 0.3, NULL),
(3, 21, 2024, 82, 'teste trigger criarAvaliacoes', 0, 0.3, NULL),
(3, 21, 2024, 88, 'teste trigger criarAvaliacoes', 0, 0.3, NULL),
(3, 21, 2024, 90, 'teste trigger criarAvaliacoes', 0, 0.3, NULL),
(3, 21, 2024, 92, 'teste trigger criarAvaliacoes', 0, 0.3, NULL),
(3, 21, 2024, 94, 'teste trigger criarAvaliacoes', 0, 0.3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `avaliacoes`
--

CREATE TABLE `avaliacoes` (
  `curso_id` int(11) NOT NULL,
  `cadeira_id` int(11) NOT NULL,
  `ano` int(11) NOT NULL,
  `nome_avaliacao` varchar(255) NOT NULL,
  `peso` float DEFAULT 0,
  `exame_normal` tinyint(1) NOT NULL DEFAULT 0,
  `exame_recorrencia` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Nesta tabela são ';

--
-- Dumping data for table `avaliacoes`
--

INSERT INTO `avaliacoes` (`curso_id`, `cadeira_id`, `ano`, `nome_avaliacao`, `peso`, `exame_normal`, `exame_recorrencia`, `created_at`, `updated_at`) VALUES
(3, 21, 2020, 'teste teste 2', 0.7, 0, 0, NULL, NULL),
(3, 21, 2020, 'TESTE testes', 0.35, 0, 0, NULL, NULL),
(3, 21, 2024, 'teste trigger criarAvaliacoes', 0.3, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cadeiras`
--

CREATE TABLE `cadeiras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `departamento_id` mediumint(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Lista de cadeiras presentes no sistema';

--
-- Dumping data for table `cadeiras`
--

INSERT INTO `cadeiras` (`id`, `nome`, `departamento_id`, `created_at`, `updated_at`) VALUES
(21, 'Análise Matemática 1', 1, NULL, NULL),
(22, 'Matemática Discreta I', 1, NULL, NULL),
(23, 'Física', 1, NULL, NULL),
(24, 'Álgebra Linear e Geometria Analítica', 1, NULL, NULL),
(25, 'Análise Matemática II', 1, NULL, NULL),
(26, 'Análise de Circuitos', 2, NULL, NULL),
(27, 'Introdução à Programação', 2, NULL, NULL),
(28, 'Instrumentação e Medidas', 1, NULL, NULL),
(29, 'Matemática Discreta II', 1, NULL, NULL),
(30, 'Desennho Auxiliado por Computador', 1, NULL, NULL),
(31, 'Análise Matemática III', 1, NULL, NULL),
(32, 'Probabilidade e Métodos Estatísticos', 1, NULL, NULL),
(33, 'Electónica Aplicada', 1, NULL, NULL),
(34, 'Programação Orientada a Objectos I', 2, NULL, NULL),
(35, 'Base de Dados I', 2, NULL, NULL),
(36, 'Linguagens de Programação', 2, NULL, NULL),
(37, 'Métodos Numéricos', 2, NULL, NULL),
(38, 'Estrutura de Dados e Algoritmos', 2, NULL, NULL),
(39, 'Sistemas de Multimédia', 2, NULL, NULL),
(40, 'Programação Orientada a Objectos II', 2, NULL, NULL),
(41, 'Base de Dados II', 2, NULL, NULL),
(42, 'Electrónica Digital', 2, NULL, NULL),
(43, 'Sistemas Operativos e Programação Concorrente', 2, NULL, NULL),
(44, 'Microprocessadores', 2, NULL, NULL),
(45, 'Redes de Computadores I', 2, NULL, NULL),
(46, 'Programação Web e Sistemas de Gestão de Conteúdos', 2, NULL, NULL),
(47, 'Inglês', 1, NULL, NULL),
(48, 'Gestão Empresarial', 1, NULL, NULL),
(49, 'Hardware de Computadores', 2, NULL, NULL),
(50, 'Rede de Computadores II', 2, NULL, NULL),
(51, 'Engenharia de Software II', 2, NULL, NULL),
(52, 'Inteligência Artificial I', 2, NULL, NULL),
(53, 'Investigação Operacional', 1, NULL, NULL),
(54, 'Inglês II', 1, NULL, NULL),
(55, 'Inteligência Artificial II', 2, NULL, NULL),
(56, 'Criptografia e Segurança de Dados', 2, NULL, NULL),
(57, 'Administração e Segurança de Sistemas de Computadores', 2, NULL, NULL),
(58, 'Compiladores', 2, NULL, NULL),
(59, 'Oficinas de Informática', 2, NULL, NULL),
(60, 'Segurança, Saúde e Ambiente', 1, NULL, NULL),
(61, 'Avaliação Económica de Projectos', 1, NULL, NULL),
(62, 'Computaçao Gráfica', 2, NULL, NULL),
(63, 'Sistemas Distribuídos', 2, NULL, NULL),
(64, 'Projecto Integrado de Aplicativos', 2, NULL, NULL),
(65, 'Direito Informático', 2, NULL, NULL),
(66, 'Estágio Profissional', 1, NULL, NULL),
(67, 'Trabalho de Licenciatura', 1, NULL, NULL),
(71, 'Informática', 1, NULL, NULL),
(72, 'Introdução à Engenharia', 1, NULL, NULL),
(73, 'Matemática Discreta I', 1, NULL, NULL),
(74, 'Oficinas Gerais', 3, '2024-10-31 11:14:13', '2024-10-31 11:14:13');

-- --------------------------------------------------------

--
-- Table structure for table `cadeira_curso`
--

CREATE TABLE `cadeira_curso` (
  `cadeira_id` bigint(20) UNSIGNED NOT NULL,
  `curso_id` int(10) UNSIGNED NOT NULL,
  `precendencia` int(10) UNSIGNED DEFAULT NULL,
  `entrou_em_vigor` int(4) NOT NULL,
  `saiu_do_vigor` int(4) DEFAULT NULL,
  `semestre` enum('1','2') DEFAULT NULL,
  `ano` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cadeira_curso`
--

INSERT INTO `cadeira_curso` (`cadeira_id`, `curso_id`, `precendencia`, `entrou_em_vigor`, `saiu_do_vigor`, `semestre`, `ano`) VALUES
(21, 3, NULL, 2024, NULL, '1', 1),
(22, 3, NULL, 2024, NULL, '1', 1),
(23, 3, NULL, 2024, NULL, '1', 1),
(24, 3, NULL, 2024, NULL, '1', 1),
(25, 3, NULL, 2024, NULL, '2', 1),
(26, 3, NULL, 2024, NULL, '2', 1),
(27, 3, NULL, 2024, NULL, '2', 1),
(28, 3, NULL, 2024, NULL, '2', 1),
(29, 3, NULL, 2024, NULL, '2', 1),
(30, 3, NULL, 2024, NULL, '2', 1),
(31, 3, NULL, 2015, NULL, '1', 2),
(32, 3, NULL, 2015, NULL, '1', 2),
(33, 3, NULL, 2015, NULL, '1', 2),
(34, 3, NULL, 2015, NULL, '1', 2),
(35, 3, NULL, 2015, NULL, '1', 2),
(36, 3, NULL, 2015, NULL, '1', 2),
(37, 3, NULL, 2015, NULL, '1', 2),
(38, 3, NULL, 2015, NULL, '1', 2),
(39, 3, NULL, 3, NULL, '1', 2),
(40, 3, NULL, 2015, NULL, '2', 2),
(41, 3, NULL, 2015, NULL, '2', 2),
(42, 3, NULL, 2015, NULL, '2', 2),
(43, 3, NULL, 2015, NULL, '1', 3),
(45, 3, NULL, 2015, NULL, '1', 3),
(46, 3, NULL, 2015, NULL, '1', 3),
(47, 3, NULL, 2015, NULL, '1', 3),
(48, 3, NULL, 2015, NULL, '2', 3),
(49, 3, NULL, 2015, NULL, '2', 3),
(50, 3, NULL, 2015, NULL, '2', 3),
(51, 3, NULL, 2015, NULL, '2', 3),
(52, 3, NULL, 2015, NULL, '2', 3),
(53, 3, NULL, 2015, NULL, '2', 3),
(54, 3, NULL, 2015, NULL, '2', 3),
(55, 3, NULL, 2015, NULL, '1', 4),
(56, 3, NULL, 2015, NULL, '1', 4),
(57, 3, NULL, 2015, NULL, '1', 4),
(58, 3, NULL, 2015, NULL, '1', 4),
(59, 3, NULL, 2015, NULL, '1', 4),
(60, 3, NULL, 2015, NULL, '2', 4),
(61, 3, NULL, 2015, NULL, '2', 4),
(62, 3, NULL, 2015, NULL, '2', 4),
(63, 3, NULL, 2015, NULL, '2', 4),
(64, 3, NULL, 2015, NULL, '2', 4),
(65, 3, NULL, 2015, NULL, '2', 4),
(67, 3, NULL, 2015, NULL, '1', 5),
(71, 3, NULL, 2015, NULL, '1', 1),
(72, 3, NULL, 2015, NULL, '1', 1),
(73, 3, NULL, 2015, NULL, '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categoria_permissao`
--

CREATE TABLE `categoria_permissao` (
  `categoria` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `categoria_permissao`
--

INSERT INTO `categoria_permissao` (`categoria`) VALUES
('Avaliacao'),
('Cadeira'),
('Catálogo'),
('Curso'),
('Departamento'),
('Docente'),
('Estudante'),
('Inscricao'),
('Matricula'),
('Media'),
('Papel'),
('Turma'),
('Usuario');

-- --------------------------------------------------------

--
-- Table structure for table `cursos`
--

CREATE TABLE `cursos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duracao_minima` float NOT NULL DEFAULT 4,
  `duracao_maxima` float NOT NULL DEFAULT 6,
  `departamento_id` mediumint(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Cursos que a universidade oferece';

--
-- Dumping data for table `cursos`
--

INSERT INTO `cursos` (`id`, `nome`, `descricao`, `duracao_minima`, `duracao_maxima`, `departamento_id`, `created_at`, `updated_at`) VALUES
(3, 'Engenharia Informática', NULL, 4, 6, 2, '2024-10-12 19:48:42', '2024-10-12 19:48:42'),
(4, 'Engenharia Electrónica', NULL, 4, 6, 2, '2024-10-12 19:48:42', '2024-10-12 19:48:42'),
(5, 'Engenharia Mecânica', 'O nível de Licenciatura em Engenharia Mecânica na UEM tem como propósito a formação de Engenheiros Mecânicos com uma forte co mponente de implantação e operacionalização de projectos industriais bem como de gestão e operacionalização de program as de manutenção – técnicos de nível universitário com uma sólida base científica, com conhecimentos abarcando a generalidade dos domínios tradicionais da Engenha ria Mecânica e com preparação para um constante progresso e adaptação às imprevisíveis evoluções da ciência, da técnica e do meio socio-económico.', 4.5, 7, 3, '2024-10-31 10:56:53', '2024-10-31 10:56:53');

-- --------------------------------------------------------

--
-- Table structure for table `curso_periodo`
--

CREATE TABLE `curso_periodo` (
  `id` tinyint(1) UNSIGNED NOT NULL,
  `nome` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `curso_periodo`
--

INSERT INTO `curso_periodo` (`id`, `nome`) VALUES
(1, 'laboral'),
(2, 'pós-laboral');

-- --------------------------------------------------------

--
-- Table structure for table `departamentos`
--

CREATE TABLE `departamentos` (
  `id` mediumint(10) UNSIGNED NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(1000) DEFAULT NULL,
  `faculdade_id` int(3) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `departamentos`
--

INSERT INTO `departamentos` (`id`, `nome`, `descricao`, `faculdade_id`, `created_at`, `updated_at`) VALUES
(1, 'Cadeiras Gerais', NULL, 1, NULL, NULL),
(2, 'Electrotécnica', NULL, 1, NULL, NULL),
(3, 'Mecânica', 'Cadeiras e cursos relacionados com mecanica de fluidos, metalurgia, etc', 1, '2024-10-31 10:56:15', '2024-10-31 10:56:15');

-- --------------------------------------------------------

--
-- Table structure for table `docentes`
--

CREATE TABLE `docentes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `formacao` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Subtabela de users com info dos docentes';

--
-- Dumping data for table `docentes`
--

INSERT INTO `docentes` (`id`, `created_at`, `updated_at`, `formacao`) VALUES
(150, '2024-10-29 22:41:08', '2024-10-29 22:41:08', 'Cambridge somethin'),
(151, '2024-10-29 22:46:03', '2024-10-29 22:46:03', 'Cambridge somethin'),
(152, '2024-10-29 22:52:57', '2024-10-29 22:52:57', 'Cambridge somethin'),
(153, '2024-10-29 22:54:12', '2024-10-29 22:54:12', 'Cambridge somethin'),
(154, '2024-10-29 22:55:02', '2024-10-29 22:55:02', 'Cambridge somethin'),
(155, '2024-10-29 22:56:19', '2024-10-29 22:56:19', 'Cambridge somethin');

-- --------------------------------------------------------

--
-- Table structure for table `estado_cadeira`
--

CREATE TABLE `estado_cadeira` (
  `id` tinyint(2) UNSIGNED NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `estado_cadeira`
--

INSERT INTO `estado_cadeira` (`id`, `nome`) VALUES
(1, 'Aprovado'),
(4, 'Aprovado à recorrência'),
(3, 'Aprovado ao exame normal'),
(5, 'Dispensado'),
(2, 'Reprovado');

-- --------------------------------------------------------

--
-- Table structure for table `estudantes`
--

CREATE TABLE `estudantes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `numero_estudante` int(10) NOT NULL,
  `curso_id` int(10) UNSIGNED NOT NULL,
  `data_entrada` date NOT NULL,
  `data_saida` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Subtabela de users com info dos estudantes';

--
-- Dumping data for table `estudantes`
--

INSERT INTO `estudantes` (`id`, `numero_estudante`, `curso_id`, `data_entrada`, `data_saida`, `updated_at`, `created_at`) VALUES
(73, 20202101, 3, '2020-10-17', '2030-10-17', NULL, NULL),
(76, 20202102, 3, '2020-10-17', '2030-10-17', NULL, NULL),
(77, 20202103, 3, '2020-10-17', '2030-10-17', NULL, NULL),
(78, 20202105, 3, '2020-10-17', '2030-10-17', NULL, NULL),
(79, 20202106, 3, '2020-10-17', '2030-10-17', NULL, NULL),
(81, 20202107, 3, '2020-10-17', '2030-10-17', NULL, NULL),
(82, 20202108, 3, '2024-10-17', '2030-10-17', NULL, NULL),
(88, 20202109, 3, '2024-10-17', '2030-10-17', NULL, NULL),
(90, 20202110, 3, '2024-10-17', '2030-10-17', NULL, NULL),
(92, 20202111, 3, '2024-10-17', '2030-10-17', NULL, NULL),
(94, 20202112, 3, '2024-10-17', '2030-10-17', NULL, NULL),
(140, 20240001, 3, '2024-10-27', NULL, '2024-10-27 06:41:43', '2024-10-27 06:41:43'),
(141, 20240002, 3, '2024-10-27', NULL, '2024-10-27 07:37:56', '2024-10-27 07:37:56');

-- --------------------------------------------------------

--
-- Table structure for table `faculdades`
--

CREATE TABLE `faculdades` (
  `id` int(3) UNSIGNED NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `director` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `faculdades`
--

INSERT INTO `faculdades` (`id`, `nome`, `director`, `created_at`, `updated_at`) VALUES
(1, 'Faculdade de Engenharia', 75, NULL, NULL),
(2, 'Faculdade de Veterinária', 76, NULL, NULL),
(3, 'Faculdade de Medicina', 81, '2024-10-31 17:59:15', '2024-10-31 17:59:15');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medias`
--

CREATE TABLE `medias` (
  `curso_id` int(10) UNSIGNED NOT NULL,
  `cadeira_id` bigint(20) UNSIGNED NOT NULL,
  `estudante_id` bigint(20) UNSIGNED NOT NULL,
  `ano` int(4) NOT NULL,
  `media` float NOT NULL DEFAULT 0,
  `estado_id` tinyint(2) UNSIGNED NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `medias`
--

INSERT INTO `medias` (`curso_id`, `cadeira_id`, `estudante_id`, `ano`, `media`, `estado_id`, `created_at`, `updated_at`) VALUES
(3, 21, 76, 2016, 10, 1, NULL, NULL),
(3, 21, 73, 2020, 7, 2, NULL, NULL),
(3, 21, 73, 2024, 0, 2, NULL, NULL),
(3, 21, 76, 2024, 0, 2, NULL, NULL),
(3, 21, 78, 2024, 0, 2, NULL, NULL),
(3, 21, 79, 2024, 0, 2, NULL, NULL),
(3, 21, 81, 2024, 0, 2, NULL, NULL),
(3, 21, 82, 2024, 0, 2, NULL, NULL),
(3, 21, 88, 2024, 0, 2, NULL, NULL),
(3, 21, 90, 2024, 0, 2, NULL, NULL),
(3, 21, 92, 2024, 0, 2, NULL, NULL),
(3, 21, 94, 2024, 0, 2, NULL, NULL),
(3, 22, 76, 2016, 12, 1, NULL, NULL),
(3, 22, 73, 2024, 0, 2, '2024-10-27 13:22:53', '2024-10-27 13:22:53'),
(3, 23, 76, 2016, 15, 1, NULL, NULL),
(3, 23, 76, 2024, 0, 2, '2024-10-29 07:28:53', '2024-10-29 07:28:53'),
(3, 23, 77, 2024, 0, 2, '2024-10-29 07:37:25', '2024-10-29 07:37:25'),
(3, 24, 76, 2016, 13, 1, NULL, NULL),
(3, 24, 76, 2024, 0, 2, '2024-10-29 07:28:54', '2024-10-29 07:28:54'),
(3, 24, 77, 2024, 0, 2, '2024-10-29 07:37:25', '2024-10-29 07:37:25'),
(3, 25, 76, 2016, 17, 1, NULL, NULL),
(3, 25, 76, 2024, 0, 2, '2024-10-29 07:28:54', '2024-10-29 07:28:54'),
(3, 25, 77, 2024, 0, 2, '2024-10-29 07:37:25', '2024-10-29 07:37:25'),
(3, 26, 76, 2016, 13, 1, NULL, NULL),
(3, 26, 76, 2024, 0, 2, '2024-10-29 07:28:54', '2024-10-29 07:28:54'),
(3, 26, 77, 2024, 0, 2, '2024-10-29 07:37:26', '2024-10-29 07:37:26'),
(3, 27, 76, 2016, 16, 5, NULL, NULL),
(3, 28, 76, 2016, 19, 5, NULL, NULL),
(3, 29, 76, 2016, 11, 1, NULL, NULL),
(3, 30, 76, 2016, 14, 1, NULL, NULL),
(3, 31, 76, 2016, 16, 1, NULL, NULL),
(3, 32, 76, 2016, 12, 1, NULL, NULL),
(3, 33, 76, 2016, 15, 1, NULL, NULL),
(3, 34, 76, 2016, 13, 1, NULL, NULL),
(3, 35, 76, 2016, 11, 1, NULL, NULL),
(3, 36, 76, 2016, 19, 1, NULL, NULL),
(3, 37, 78, 2016, 13, 1, NULL, NULL),
(3, 38, 76, 2016, 16, 1, NULL, NULL),
(3, 39, 76, 2016, 10, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_09_24_200118_create_personal_access_tokens_table', 1),
(5, '2024_09_24_214138_create_docentes_table', 1),
(6, '2024_09_24_214208_create_estudantes_table', 1),
(7, '2024_09_24_214219_create_administradors_table', 1),
(8, '2024_09_24_222335_create_permissaos_table', 2),
(9, '2024_09_24_235841_create_papels_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `papeis`
--

CREATE TABLE `papeis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Lista de posições ou roles que podem ser assumidos no sistema';

--
-- Dumping data for table `papeis`
--

INSERT INTO `papeis` (`id`, `nome`, `descricao`, `created_at`, `updated_at`) VALUES
(1, 'estudante', 'estudante da universidade', '2024-09-24 22:23:25', '2024-09-24 22:23:25'),
(2, 'docete', 'docente na universidade', '2024-09-24 22:34:41', '2024-09-24 22:34:41'),
(3, 'admin', 'administrador do sistema', '2024-09-24 22:35:01', '2024-09-24 22:35:01'),
(4, 'super admin', 'Papel para deenvolvedores, com todas as permissões do sistema', '2024-10-07 22:00:00', '2024-10-07 22:00:00'),
(5, 'Assistente', 'Docente que apoia o Regentee', '2024-10-16 09:10:42', '2024-10-16 09:10:42'),
(6, 'Lider', 'Docente que apoia o Regentee', '2024-10-17 05:51:53', '2024-10-17 05:51:53'),
(9, 'TesteInput', 'Teste. Se3rá eliminado', '2024-10-17 13:16:21', '2024-10-17 13:16:21');

-- --------------------------------------------------------

--
-- Table structure for table `papel_permissao`
--

CREATE TABLE `papel_permissao` (
  `papel_id` bigint(20) UNSIGNED NOT NULL,
  `permissao_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `papel_permissao`
--

INSERT INTO `papel_permissao` (`papel_id`, `permissao_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-10-08 21:30:28', '2024-10-08 21:30:28'),
(1, 4, '2024-10-08 21:30:28', '2024-10-08 21:30:28'),
(1, 26, '2024-10-08 21:34:09', '2024-10-08 21:34:09'),
(3, 1, NULL, NULL),
(3, 2, NULL, NULL),
(3, 3, NULL, NULL),
(3, 4, NULL, NULL),
(4, 1, NULL, NULL),
(4, 2, NULL, NULL),
(4, 3, NULL, NULL),
(4, 5, NULL, NULL),
(4, 6, NULL, NULL),
(4, 7, NULL, NULL),
(4, 8, NULL, NULL),
(4, 9, NULL, NULL),
(4, 10, NULL, NULL),
(4, 11, NULL, NULL),
(4, 12, NULL, NULL),
(4, 13, NULL, NULL),
(4, 15, NULL, NULL),
(4, 16, NULL, NULL),
(4, 17, NULL, NULL),
(4, 19, NULL, NULL),
(4, 20, NULL, NULL),
(4, 21, NULL, NULL),
(4, 22, NULL, NULL),
(4, 23, NULL, NULL),
(4, 24, NULL, NULL),
(4, 25, NULL, NULL),
(4, 26, NULL, NULL),
(4, 28, NULL, NULL),
(4, 29, NULL, NULL),
(4, 30, NULL, NULL),
(4, 31, NULL, NULL),
(4, 32, NULL, NULL),
(4, 43, NULL, NULL),
(4, 44, NULL, NULL),
(4, 45, NULL, NULL),
(4, 46, NULL, NULL),
(4, 48, NULL, NULL),
(4, 57, NULL, NULL),
(4, 58, NULL, NULL),
(4, 59, NULL, NULL),
(4, 60, NULL, NULL),
(4, 61, NULL, NULL),
(4, 62, NULL, NULL),
(4, 63, NULL, NULL),
(4, 64, NULL, NULL),
(9, 1, '2024-10-17 13:16:21', '2024-10-17 13:16:21'),
(9, 2, '2024-10-17 13:16:21', '2024-10-17 13:16:21'),
(9, 3, '2024-10-17 13:16:21', '2024-10-17 13:16:21'),
(9, 4, '2024-10-17 13:16:21', '2024-10-17 13:16:21'),
(9, 5, '2024-10-17 13:16:21', '2024-10-17 13:16:21'),
(9, 6, '2024-10-17 13:16:21', '2024-10-17 13:16:21');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissoes`
--

CREATE TABLE `permissoes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `categoria` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissoes`
--

INSERT INTO `permissoes` (`id`, `nome`, `descricao`, `categoria`, `created_at`, `updated_at`) VALUES
(1, 'ver_estudante', 'Ver dados de um estudante', 'Estudante', NULL, NULL),
(2, 'adicionar_estudante', 'Matricular estudante', 'Estudante', NULL, NULL),
(3, 'eliminar_estudante', 'Eliminar estudante', 'Estudante', NULL, NULL),
(4, 'editar_estudante', 'Editar dados do estudante', 'Estudante', NULL, NULL),
(5, 'ver_docente', 'Ver dados de um docente', 'Docente', NULL, NULL),
(6, 'adicionar_docente', 'adicionar docente', 'Docente', NULL, NULL),
(7, 'eliminar_docente', 'Eliminar Docente', 'Docente', NULL, NULL),
(8, 'editar_docente', 'Editar dados do docente', 'Docente', NULL, NULL),
(9, 'ver_curso', 'Ver dados de um curso', 'Curso', NULL, NULL),
(10, 'adicionar_curso', 'adicionar um novo curso', 'Curso', NULL, NULL),
(11, 'eliminar_curso', 'Eliminar curso', 'Curso', NULL, NULL),
(12, 'editar_curso', 'Editar dados do curso', 'Curso', NULL, NULL),
(13, 'ver_departamento', 'Ver dados de um departamento', 'Departamento', NULL, NULL),
(14, 'adicionar_departamento', 'adicionar departamento', 'Departamento', NULL, NULL),
(15, 'eliminar_departamento', 'Eliminar departamento', 'Departamento', NULL, NULL),
(16, 'editar_departamento', 'Editar dados do departamento', 'Departamento', NULL, NULL),
(17, 'ver_turma', 'Ver dados de uma turma. Ou seja de uma cadeira num curso num ano lectivo', 'Turma', NULL, NULL),
(19, 'adicionar_assistente', 'Adicionar assistentes de uma turma', 'Turma', NULL, NULL),
(20, 'ver_assistente', 'Ver a lista assistentes de uma turma', 'Turma', NULL, NULL),
(21, 'eliminar_assistente', 'Eliminar assistente de uma turma', 'Turma', NULL, NULL),
(22, 'adicionar_avaliação', '‘Adicionar Avaliação’', 'Avaliacao', NULL, NULL),
(23, 'ver_avaliação', 'Ver lista e dados das avaliações numa cadeira num ano lectivo', 'Avaliacao', NULL, NULL),
(24, 'editar_avaliacao', 'Editar os dados de uma avaliação', 'Avaliacao', NULL, NULL),
(25, 'lancar_nota', 'Lançar nota de um aluno numa determinada avaliaçao', 'Avaliacao', NULL, NULL),
(26, 'ver_nota', 'Ver  a nota de um aluno numa determinada avaliaçao', 'Avaliacao', NULL, NULL),
(28, 'ver_media', 'Ver a média de todas as cadeiras feitas aprovadas, reprovadas e', 'Media', NULL, NULL),
(29, 'adicionar_inscricao', 'Inscrever um estudante a uma turma. Ou seja, uma cadeira num ano', 'Inscricao', NULL, NULL),
(30, 'remover_inscricao', 'Remover a inscricao de um estudante a cadeira', 'Inscricao', NULL, NULL),
(31, 'listar_estudantes_da_turma', 'Listar todos estudantes de uma de um curso inscritos numa cadeira num determinado ano', 'Turma', NULL, NULL),
(32, 'ver_pauta', 'Listar as médias de todos os estudantes inscritos de um curso inscritos numa cadeira', 'Turma', NULL, NULL),
(43, 'adicionar_usuario', 'Adicionar um usuário, sem necessariamente criar a tabela de estudante ou docente correspondente, provavelmente só será usada em ambientes de teste', 'Usuario', NULL, NULL),
(44, 'ver_usuario', 'Ver os dados pessoas de um usuário, o papel e as permissões', 'Usuario', NULL, NULL),
(45, 'editar_usuario', 'Editar dados pessoais do usuário e os dados relacionados ao papel', 'Usuario', NULL, NULL),
(46, 'eliminar_usuario', 'Eliminar um usuário da base de dados', 'Usuario', NULL, NULL),
(48, 'editar_nota', 'Editar a Nota que um estudante teve num teste', 'Avaliacao', NULL, NULL),
(57, 'ver_cadeiras', 'Ver dados das cadeiras', 'Cadeira', NULL, NULL),
(58, 'editar_cadeira', '', 'Cadeira', NULL, NULL),
(59, 'eliminar_cadeira', '', 'Cadeira', NULL, NULL),
(60, 'adicionar_cadeira', '', 'Cadeira', NULL, NULL),
(61, 'ver_papel', '', 'Papel', NULL, NULL),
(62, 'editar_papel', '', 'Papel', NULL, NULL),
(63, 'eliminar_papel', '', 'Papel', NULL, NULL),
(64, 'adicionar_papel', '', 'Papel', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(3, 'App\\Models\\User', 1, 'Clifton Fonseca', 'cd283bdf145e5b4955e3783a539656ee1e0d93fe18ededea802cce27fb9a4103', '[\"*\"]', NULL, NULL, '2024-09-26 16:52:40', '2024-09-26 16:52:40'),
(4, 'App\\Models\\User', 1, 'Clifton Fonseca', 'd48c02444901a7627f27d8b9792eff4986acdefd4bd5708a8d6477ef883f02fa', '[\"*\"]', '2024-10-07 13:56:35', NULL, '2024-09-30 10:23:49', '2024-10-07 13:56:35'),
(5, 'App\\Models\\User', 1, 'Clifton Fonseca', '5ec1c8516cd856386780479ef882c4cd22dbe35969ad7c94dbde129336e24347', '[\"*\"]', NULL, NULL, '2024-10-03 16:42:10', '2024-10-03 16:42:10'),
(6, 'App\\Models\\User', 1, 'Clifton Fonseca', '726044e5ddc0326edc459d29f3034a0764f90edb84c755c3e8b30e74673a36cd', '[\"ver_estudante\",\"adicionar_estudante\",\"eliminar_estudante\",\"editar_estudante\"]', NULL, NULL, '2024-10-06 17:23:25', '2024-10-06 17:23:25'),
(7, 'App\\Models\\User', 1, 'Clifton Fonseca', '59e1cbe1b05db9668b61aecdd8fe93b6fe0aa7e3a515c966555dccaa10852d88', '[\"ver_estudante\",\"adicionar_estudante\",\"eliminar_estudante\",\"editar_estudante\"]', NULL, NULL, '2024-10-06 17:24:04', '2024-10-06 17:24:04'),
(8, 'App\\Models\\User', 1, 'Clifton Fonseca', 'f45a86ea2b519d1ad091a99d60e5324b52917c2612a20b123c6a381a38342257', '[\"ver_estudante\",\"adicionar_estudante\",\"eliminar_estudante\",\"editar_estudante\"]', '2024-10-06 17:40:58', NULL, '2024-10-06 17:25:05', '2024-10-06 17:40:58'),
(9, 'App\\Models\\User', 1, 'Clifton Fonseca', '8efea84196af5a21a971d8afab542d3e5447d4fc324d0ffe6b9accca52bca0c7', '[\"ver_estudante\",\"adicionar_estudante\",\"eliminar_estudante\",\"editar_estudante\"]', NULL, NULL, '2024-10-06 17:46:09', '2024-10-06 17:46:09'),
(10, 'App\\Models\\User', 2, 'Administrador', 'ebd1c1a44269a2879610888afdde1582fe625fa2cd49db5c3c256111644c73b1', '[\"ver_estudante\",\"adicionar_estudante\",\"eliminar_estudante\",\"editar_estudante\"]', NULL, NULL, '2024-10-07 23:23:24', '2024-10-07 23:23:24'),
(11, 'App\\Models\\User', 2, 'Administrador', 'ab8f8fb84a602fe46a84342eb95da113bd90b80b72252e918fd08e8f24b2d6a8', '[\"ver_estudante\",\"adicionar_estudante\",\"eliminar_estudante\",\"editar_estudante\"]', NULL, NULL, '2024-10-07 23:26:09', '2024-10-07 23:26:09'),
(12, 'App\\Models\\User', 2, 'Administrador', '6981dc53c8edac7d386919c7ee90018155aae6e22fad937270c3830293fca64c', '[\"ver_estudante\",\"adicionar_estudante\",\"eliminar_estudante\",\"editar_estudante\"]', NULL, NULL, '2024-10-07 23:27:33', '2024-10-07 23:27:33'),
(13, 'Modules\\Auth\\Models\\user', 2, 'Administrador', '848654e74b334507ffe9326afb4577844108e7aee6729d7c75dc9b9273021a94', '[\"ver_estudante\",\"adicionar_estudante\",\"eliminar_estudante\",\"editar_estudante\"]', NULL, NULL, '2024-10-08 07:53:49', '2024-10-08 07:53:49'),
(14, 'Modules\\Auth\\Models\\user', 2, 'Administrador', '19a3f18a0dd07466a9b0c7b5884a77c1248c48c3b2f15d53da3df73056da7173', '[\"ver_estudante\",\"adicionar_estudante\",\"eliminar_estudante\",\"editar_estudante\"]', NULL, NULL, '2024-10-08 08:09:52', '2024-10-08 08:09:52'),
(15, 'Modules\\Auth\\Models\\User', 2, 'Administrador', '16c2ebbfaddfd5e92c2a9356dbce62b12cbbc8af6eed3e58e61b5715b2513993', '[\"ver_estudante\",\"adicionar_estudante\",\"eliminar_estudante\",\"editar_estudante\"]', '2024-10-08 08:57:25', NULL, '2024-10-08 08:56:50', '2024-10-08 08:57:25'),
(16, 'Modules\\Auth\\Models\\User', 2, 'Administrador', '9e700504b41840ccc2f965a4b7fa297e94bbc4698f1d3da1315e72389e4fae96', '[\"ver_estudante\",\"adicionar_estudante\",\"eliminar_estudante\",\"editar_estudante\"]', '2024-10-10 15:21:12', NULL, '2024-10-08 08:57:55', '2024-10-10 15:21:12'),
(17, 'Modules\\Auth\\Models\\User', 2, 'Administrador', 'eed140dbbd0dded111afff3c6ee84747738a04048a0f458359c535bdd4707b4b', '[\"ver_estudante\",\"adicionar_estudante\",\"eliminar_estudante\",\"editar_estudante\"]', '2024-10-08 08:58:17', NULL, '2024-10-08 08:58:07', '2024-10-08 08:58:17'),
(18, 'Modules\\Auth\\Models\\User', 2, 'Administrador', 'e6b6cfbe21967109a1745c32b9734a9d653255bcacc1adcae4419465a1ea1e12', '[\"ver_estudante\",\"adicionar_estudante\",\"eliminar_estudante\",\"editar_estudante\"]', '2024-10-08 09:08:04', NULL, '2024-10-08 08:58:50', '2024-10-08 09:08:04'),
(19, 'Modules\\Auth\\Models\\User', 2, 'Administrador', 'f50604b8aa120731711fc8cfa56fe10ab681a253d8b6bfa4707dc545559ca2f7', '[\"ver_estudante\",\"adicionar_estudante\",\"eliminar_estudante\",\"ver_docente\",\"adicionar_docente\",\"eliminar_docente\",\"editar_docente\",\"ver_curso\",\"adicionar_curso\",\"eliminar_curso\",\"editar_curso\",\"ver_departamento\",\"eliminar_departamento\",\"editar_departamento\",\"ver_cadeira_no_ano_lectivo\",\"adicionar_cadeira_no_ano_lectivo\",\"adicionar_assistente\",\"ver_assistente\",\"eliminar_assistente\",\"adicionar_avalia\\u00e7\\u00e3o\",\"ver_avalia\\u00e7\\u00e3o\",\"editar_avaliacao\",\"lancar_nota\",\"ver_nota\",\"editar_nota\",\"ver_media\",\"adicionar_inscricao\",\"remover_inscricao\",\"listar_estudantes_da_turma\",\"ver_pauta\",\"adicionar_assistente\",\"remover_assistente\"]', NULL, NULL, '2024-10-10 15:25:36', '2024-10-10 15:25:36'),
(20, 'Modules\\Auth\\Models\\User', 2, 'Administrador', 'a4236416b5f1d58c38ebc95e9603538390a079863c5447a2e08c92c35ae0f0c9', '[\"ver_estudante\",\"adicionar_estudante\",\"eliminar_estudante\",\"ver_docente\",\"adicionar_docente\",\"eliminar_docente\",\"editar_docente\",\"ver_curso\",\"adicionar_curso\",\"eliminar_curso\",\"editar_curso\",\"ver_departamento\",\"eliminar_departamento\",\"editar_departamento\",\"ver_cadeira_no_ano_lectivo\",\"adicionar_cadeira_no_ano_lectivo\",\"adicionar_assistente\",\"ver_assistente\",\"eliminar_assistente\",\"adicionar_avalia\\u00e7\\u00e3o\",\"ver_avalia\\u00e7\\u00e3o\",\"editar_avaliacao\",\"lancar_nota\",\"ver_nota\",\"editar_nota\",\"ver_media\",\"adicionar_inscricao\",\"remover_inscricao\",\"listar_estudantes_da_turma\",\"ver_pauta\",\"adicionar_assistente\",\"remover_assistente\"]', NULL, NULL, '2024-10-10 15:25:57', '2024-10-10 15:25:57'),
(21, 'App\\Models\\User', 2, 'Administrador', 'c096a26a780b7511134a70eb0162fcf97418ab40d0ef4c949350cecce2e321de', '[\"ver_estudante\",\"adicionar_estudante\",\"eliminar_estudante\",\"ver_docente\",\"adicionar_docente\",\"eliminar_docente\",\"editar_docente\",\"ver_curso\",\"adicionar_curso\",\"eliminar_curso\",\"editar_curso\",\"ver_departamento\",\"eliminar_departamento\",\"editar_departamento\",\"ver_cadeira_no_ano_lectivo\",\"adicionar_cadeira_no_ano_lectivo\",\"adicionar_assistente\",\"ver_assistente\",\"eliminar_assistente\",\"adicionar_avalia\\u00e7\\u00e3o\",\"ver_avalia\\u00e7\\u00e3o\",\"editar_avaliacao\",\"lancar_nota\",\"ver_nota\",\"editar_nota\",\"ver_media\",\"adicionar_inscricao\",\"remover_inscricao\",\"listar_estudantes_da_turma\",\"ver_pauta\",\"adicionar_assistente\",\"remover_assistente\",\"adicionar_usuario\",\"ver_usuario\",\"editar_usuario\",\"eliminar_usuario\"]', NULL, NULL, '2024-10-13 19:05:16', '2024-10-13 19:05:16'),
(22, 'Modules\\Auth\\Models\\User', 2, 'Administrador', '8f4615f4b1d37104d65cc22ee9d67390a6ebff6569fcbea7b7f75de17cc42669', '[\"ver_estudante\",\"adicionar_estudante\",\"eliminar_estudante\",\"ver_docente\",\"adicionar_docente\",\"eliminar_docente\",\"editar_docente\",\"ver_curso\",\"adicionar_curso\",\"eliminar_curso\",\"editar_curso\",\"ver_departamento\",\"eliminar_departamento\",\"editar_departamento\",\"ver_cadeira_no_ano_lectivo\",\"adicionar_cadeira_no_ano_lectivo\",\"adicionar_assistente\",\"ver_assistente\",\"eliminar_assistente\",\"adicionar_avalia\\u00e7\\u00e3o\",\"ver_avalia\\u00e7\\u00e3o\",\"editar_avaliacao\",\"lancar_nota\",\"ver_nota\",\"editar_nota\",\"ver_media\",\"adicionar_inscricao\",\"remover_inscricao\",\"listar_estudantes_da_turma\",\"ver_pauta\",\"adicionar_assistente\",\"remover_assistente\",\"adicionar_usuario\",\"ver_usuario\",\"editar_usuario\",\"eliminar_usuario\"]', NULL, NULL, '2024-10-13 21:01:26', '2024-10-13 21:01:26'),
(23, 'Modules\\Auth\\Models\\User', 2, 'Administrador', '852c935db0690738600c2df548369ed0f154e9d5a74770f1f809ecb1cc49db94', '[\"ver_estudante\",\"adicionar_estudante\",\"eliminar_estudante\",\"ver_docente\",\"adicionar_docente\",\"eliminar_docente\",\"editar_docente\",\"ver_curso\",\"adicionar_curso\",\"eliminar_curso\",\"editar_curso\",\"ver_departamento\",\"eliminar_departamento\",\"editar_departamento\",\"ver_cadeira_no_ano_lectivo\",\"adicionar_cadeira_no_ano_lectivo\",\"adicionar_assistente\",\"ver_assistente\",\"eliminar_assistente\",\"adicionar_avalia\\u00e7\\u00e3o\",\"ver_avalia\\u00e7\\u00e3o\",\"editar_avaliacao\",\"lancar_nota\",\"ver_nota\",\"editar_nota\",\"ver_media\",\"adicionar_inscricao\",\"remover_inscricao\",\"listar_estudantes_da_turma\",\"ver_pauta\",\"adicionar_assistente\",\"remover_assistente\",\"adicionar_usuario\",\"ver_usuario\",\"editar_usuario\",\"eliminar_usuario\"]', NULL, NULL, '2024-10-14 16:15:36', '2024-10-14 16:15:36'),
(24, 'Modules\\Auth\\Models\\User', 2, 'Administrador', 'd72999cd734825e0248548aa16e0b18e4da34e43231ddaec5e0af43d4889dc18', '[\"ver_estudante\",\"adicionar_estudante\",\"eliminar_estudante\",\"ver_docente\",\"adicionar_docente\",\"eliminar_docente\",\"editar_docente\",\"ver_curso\",\"adicionar_curso\",\"eliminar_curso\",\"editar_curso\",\"ver_departamento\",\"eliminar_departamento\",\"editar_departamento\",\"ver_cadeira_no_ano_lectivo\",\"adicionar_cadeira_no_ano_lectivo\",\"adicionar_assistente\",\"ver_assistente\",\"eliminar_assistente\",\"adicionar_avalia\\u00e7\\u00e3o\",\"ver_avalia\\u00e7\\u00e3o\",\"editar_avaliacao\",\"lancar_nota\",\"ver_nota\",\"editar_nota\",\"ver_media\",\"adicionar_inscricao\",\"remover_inscricao\",\"listar_estudantes_da_turma\",\"ver_pauta\",\"adicionar_assistente\",\"remover_assistente\",\"adicionar_usuario\",\"ver_usuario\",\"editar_usuario\",\"eliminar_usuario\"]', '2024-10-14 17:56:54', NULL, '2024-10-14 17:56:05', '2024-10-14 17:56:54'),
(25, 'Modules\\Auth\\Models\\User', 2, 'Administrador', '85b696a757f5f220da2573a0e08fe1d0187c2619637314fd5c76dfb587969fea', '[\"ver_estudante\",\"adicionar_estudante\",\"eliminar_estudante\",\"ver_docente\",\"adicionar_docente\",\"eliminar_docente\",\"editar_docente\",\"ver_curso\",\"adicionar_curso\",\"eliminar_curso\",\"editar_curso\",\"ver_departamento\",\"eliminar_departamento\",\"editar_departamento\",\"ver_cadeira_no_ano_lectivo\",\"adicionar_cadeira_no_ano_lectivo\",\"adicionar_assistente\",\"ver_assistente\",\"eliminar_assistente\",\"adicionar_avalia\\u00e7\\u00e3o\",\"ver_avalia\\u00e7\\u00e3o\",\"editar_avaliacao\",\"lancar_nota\",\"ver_nota\",\"editar_nota\",\"ver_media\",\"adicionar_inscricao\",\"remover_inscricao\",\"listar_estudantes_da_turma\",\"ver_pauta\",\"adicionar_assistente\",\"remover_assistente\",\"adicionar_usuario\",\"ver_usuario\",\"editar_usuario\",\"eliminar_usuario\"]', NULL, NULL, '2024-10-14 17:56:18', '2024-10-14 17:56:18');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('5zC9wlTZPAeocEayojUhjtjyHDywD9onASBDSdAO', NULL, '172.16.10.41', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmhTOTk0bHRGeUlBcUdBaFBsSGJJb0pyT3ozVzZzNkl1dXY0R0FUViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly8xNzIuMTYuMTUuMTk1OjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1730272069),
('8pehvYYHo3iQPvwiXGUEGBdlXJLl6Qmvhc1yW2cr', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64; rv:131.0) Gecko/20100101 Firefox/131.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1FBSGVNYlVRb3lCT09PVGhOek5Od3dxNWlTTk1TZWZnRVFsNjVLayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730240229),
('DHFm92hnFItj1LdoR4p6MU7KiKmnn9dG7yoPCQWY', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64; rv:131.0) Gecko/20100101 Firefox/131.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN3Q0bldZd3YzcEk0akVhRW85QUpmbVpqcEpuaFpkWG5JVUNFckczSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730192048),
('dqO0Uo4WL6b1ZC8dE7VCYvNsbaXCYrJSaTa8HBpM', NULL, '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64; rv:131.0) Gecko/20100101 Firefox/131.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTHI2V3gySHF3d3VCVWtTTGRlQVRQSXBROWkxdUNjNnlRMnRETW5SbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730382378),
('dzateZjeCOWnKngTHAQF0Nnf4O29W5jGo8nDCY1S', NULL, '172.16.10.204', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT2YyNXVacGJmZ2tQZklzd2ZyMUZmbmh2ZDZLRXlSdkJnZFI4VE5HTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly8xNzIuMTYuMTUuMTk1OjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1730275666),
('HFxa3JZBuVSjW5bfvZCjTAnfax7rbO1pMftCj0oT', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib3JzaXpyU0JLbThxM0V3ank5dldtdTdkWkhwQnBYTHY3azZCaGJrTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730027737),
('iBau3GutLUnuCjj4fvKj8op3AI2McsVaXWE4QLD7', NULL, '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64; rv:131.0) Gecko/20100101 Firefox/131.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT2VWVUgyVzBVSWZTeGMxVW9Qb3lKOUg4d0t1TUxnR1pNa3RCcVRMQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730271886),
('K3G9fKtciOR5pIoKpDQfIrI0QnlVtsMPehCDTdfh', NULL, '172.16.11.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNDRNNWRZajR2V3JvOHlSUlE5VGtvendkUEVUckRHUlBRSUtRcTZ4UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly8xNzIuMTYuMTUuMTk1OjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1730268723),
('kZ8ztk8sAA9tiKfZnvLlCWhKJN6AivEMIgQg4grO', NULL, '172.16.10.41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2lncW1mN0ttbUFwdDBhNExES0F0OERHbG9wV280WlZXTGdUaDRrYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly8xNzIuMTYuMTUuMTk1OjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1730268720),
('l3cOigcn8IUWeCVGqM02ii01stD8EBXNvxixzKaV', 2, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2MxSkZ3eFdaQ1RlcHdpQWtNZWI0Z3lNcnpOQUUwTmZOV1had242TiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730243337),
('q1k75DUy2cycqBkbJKNJyO10WrDXLrdiBE7cL4Gb', NULL, '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64; rv:131.0) Gecko/20100101 Firefox/131.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieW5WT1ZHZ25DaGxmaFM2dURYU3VHS2FEcVV6d29VZVRXYjRydmI5YiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730288353),
('q23BQlMT5yuL2HyRvY8IWPLR4zo9k7at7JhWxvLQ', NULL, '172.16.11.161', 'Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101 Firefox/78.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic3prV0JkempmdWRzOW5aVXh2QWxsQUJCWVFkRzVhcmRsRllBVXdIayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly8xNzIuMTYuMTUuMTk1OjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1730274477),
('RyZEiCYtEoUCNh3wOrTGhvoaRDmozqt2NLCkoVXq', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidnA1U25jaXprZzFuRDJJRGJEeGtOTE8xSVV5TEthTFFkTk5DZW5keiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730190876),
('UNhqyAQ79kCB3gl0KlEYtNRLWwtn6lbUDLMgRTBQ', NULL, '172.16.10.204', 'GuzzleHttp/7', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMnZFT2sxMWRJeFdyekNvQWZ6bGw2WTQ0N2hHYXB1ZGpmVm45THVLQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly8xNzIuMTYuMTUuMTk1OjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1730276032),
('zpWwVnjoY4Toz9G7WMcvP4hUGd6Xm947q3R8lsTr', NULL, '172.20.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU21EaUdRUm11VndkTHFURjdBVk1qcVZVOTBJZHJ0eFlhV1hhZjF1VyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730370905);

-- --------------------------------------------------------

--
-- Table structure for table `turmas`
--

CREATE TABLE `turmas` (
  `curso_id` int(10) UNSIGNED NOT NULL,
  `cadeira_id` bigint(20) UNSIGNED NOT NULL,
  `ano` int(4) NOT NULL,
  `regente_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `turmas`
--

INSERT INTO `turmas` (`curso_id`, `cadeira_id`, `ano`, `regente_id`) VALUES
(3, 21, 2016, NULL),
(3, 21, 2020, NULL),
(3, 21, 2024, NULL),
(3, 22, 2016, NULL),
(3, 22, 2020, NULL),
(3, 22, 2024, NULL),
(3, 23, 2016, NULL),
(3, 23, 2020, NULL),
(3, 23, 2024, NULL),
(3, 24, 2016, NULL),
(3, 24, 2020, NULL),
(3, 24, 2024, NULL),
(3, 25, 2024, NULL),
(3, 26, 2024, NULL),
(3, 27, 2024, NULL),
(3, 28, 2024, NULL),
(3, 29, 2024, NULL),
(3, 30, 2024, NULL),
(3, 31, 2016, NULL),
(3, 32, 2016, NULL),
(3, 33, 2016, NULL),
(3, 34, 2016, NULL),
(3, 35, 2016, NULL),
(3, 36, 2016, NULL),
(3, 37, 2016, NULL),
(3, 38, 2016, NULL),
(3, 39, 2016, NULL),
(3, 43, 2016, NULL),
(3, 45, 2016, NULL),
(3, 46, 2016, NULL),
(3, 47, 2016, NULL),
(3, 55, 2016, NULL),
(3, 56, 2016, NULL),
(3, 57, 2016, NULL),
(3, 58, 2016, NULL),
(3, 59, 2016, NULL),
(3, 67, 2016, NULL),
(3, 71, 2016, NULL),
(3, 72, 2016, NULL),
(3, 73, 2016, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `BI` varchar(255) NOT NULL,
  `NUIT` varchar(255) NOT NULL,
  `contacto_1` varchar(11) NOT NULL,
  `contacto_2` varchar(11) DEFAULT NULL,
  `papel_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Tabela geral de usuários';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nome`, `email`, `email_verified_at`, `password`, `BI`, `NUIT`, `contacto_1`, `contacto_2`, `papel_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Clifton Fonseca', 'clifton@admin.com', NULL, '$2y$12$o/FnJ4sIPZW1knDAvGD40esXRQtG/GZi.W1k9mJVWbM.pZMOxVnZK', '3333', '3333', '3333', '4444', 3, NULL, '2024-09-25 06:06:52', '2024-09-25 06:06:52'),
(2, 'Administrador', 'admin@admin.com', NULL, '$2y$12$fJGWto4ybAEuD.ynBEU4O.ZyqI6IPXpXw281srRsjmFD4IiqP/OT6', '123456789P', '123456789', '821345678', '8412345678', 4, NULL, '2024-10-07 13:56:19', '2024-10-07 13:56:19'),
(73, 'Destinee Nitzsche Jr.', 'gbecker@example.com', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '38822816', '88071467', '39022170', '89745849', 1, NULL, '2024-10-12 13:05:32', '2024-10-12 13:05:32'),
(74, 'Mr. Wendell Jerde II', 'nbeier@example.net', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '24515332', '92807731', '70372864', '80455703', 2, NULL, '2024-10-12 13:05:32', '2024-10-12 13:05:32'),
(75, 'Ashtyn Spinka Sr.', 'bjacobson@example.net', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '3083401', '10188782', '54093619', '34238773', 2, NULL, '2024-10-12 13:05:32', '2024-10-12 13:05:32'),
(76, 'Brianne O\'Connell DVM', 'schmeler.kellie@example.com', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '98569631', '93162070', '78223542', '51743393', 1, NULL, '2024-10-12 13:05:32', '2024-10-12 13:05:32'),
(77, 'Florencio Mitchell I', 'frami.joany@example.net', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '87218368', '90737967', '18166796', '55799776', 1, NULL, '2024-10-12 13:05:32', '2024-10-12 13:05:32'),
(78, 'Karl Johnston MD', 'beahan.sofia@example.com', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '32411513', '51150221', '90567380', '94122835', 1, NULL, '2024-10-12 13:05:32', '2024-10-12 13:05:32'),
(79, 'Mr. Stevie Marquardt PhD', 'judson14@example.com', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '10558137', '39213784', '94833540', '58129663', 1, NULL, '2024-10-12 13:05:32', '2024-10-12 13:05:32'),
(80, 'Prof. Savannah Runolfsson III', 'raphael.christiansen@example.net', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '32424288', '77637477', '72571672', '78691617', 2, NULL, '2024-10-12 13:05:32', '2024-10-12 13:05:32'),
(81, 'Heaven Dickinson', 'sedrick.kunze@example.net', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '9886124', '11158564', '63539313', '57088986', 1, NULL, '2024-10-12 13:05:32', '2024-10-12 13:05:32'),
(82, 'Javon Cruickshank', 'alysha49@example.net', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '93504475', '65077309', '77622398', '81806704', 1, NULL, '2024-10-12 13:05:32', '2024-10-12 13:05:32'),
(83, 'Kyleigh Vandervort MD', 'eliseo.wisoky@example.org', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '22521590', '72385229', '501250', '95746527', 2, NULL, '2024-10-12 13:05:32', '2024-10-12 13:05:32'),
(84, 'Gaylord Will', 'dessie62@example.net', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '15108342', '43161785', '96490907', '22901871', 2, NULL, '2024-10-12 13:05:32', '2024-10-12 13:05:32'),
(85, 'Kolby Denesik', 'rhyatt@example.net', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '91605838', '47393629', '43251396', '15671620', 2, NULL, '2024-10-12 13:05:33', '2024-10-12 13:05:33'),
(86, 'Scarlett Dickens', 'rogahn.elliot@example.net', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '20912725', '63822543', '85910159', '91264723', 1, NULL, '2024-10-12 13:05:33', '2024-10-12 13:05:33'),
(87, 'Terry Dietrich', 'gabriella.mueller@example.net', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '5279554', '68013139', '1562757', '84594368', 2, NULL, '2024-10-12 13:05:33', '2024-10-12 13:05:33'),
(88, 'Dr. Manuela Feil II', 'gina.hagenes@example.org', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '85218335', '37227387', '86883865', '18180592', 1, NULL, '2024-10-12 13:05:33', '2024-10-12 13:05:33'),
(89, 'Hallie Nicolas', 'rconn@example.net', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '99847580', '93156894', '33320661', '64248925', 2, NULL, '2024-10-12 13:05:33', '2024-10-12 13:05:33'),
(90, 'Estrella Kiehn', 'jhand@example.net', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '60132332', '80083088', '50511959', '87474578', 1, NULL, '2024-10-12 13:05:33', '2024-10-12 13:05:33'),
(91, 'Dr. Jackson Paucek II', 'owilkinson@example.org', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '29101224', '24106411', '94106', '50080373', 2, NULL, '2024-10-12 13:05:33', '2024-10-12 13:05:33'),
(92, 'Deanna Senger', 'adolfo73@example.net', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '44765407', '13486768', '68809307', '21633830', 1, NULL, '2024-10-12 13:05:33', '2024-10-12 13:05:33'),
(93, 'Green Durgan MD', 'cohara@example.org', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '89731134', '20496566', '95958027', '45984689', 2, NULL, '2024-10-12 13:05:33', '2024-10-12 13:05:33'),
(94, 'Vernice Treutel', 'kirstin.crona@example.com', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '82187861', '78924892', '23782740', '89052457', 1, NULL, '2024-10-12 13:05:33', '2024-10-12 13:05:33'),
(95, 'Celestine Legros', 'kilback.brenda@example.net', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '90894104', '30542284', '36334053', '24086254', 2, NULL, '2024-10-12 13:05:33', '2024-10-12 13:05:33'),
(96, 'Prof. Drake Bauch PhD', 'berniece68@example.org', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '60665866', '19104205', '79344093', '13653011', 2, NULL, '2024-10-12 13:05:33', '2024-10-12 13:05:33'),
(97, 'Audrey D\'Amore', 'feest.candida@example.com', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '13327236', '77307005', '22541045', '22623779', 1, NULL, '2024-10-12 13:05:33', '2024-10-12 13:05:33'),
(98, 'Katrine Lesch', 'kuphal.estelle@example.com', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '32277968', '57687753', '80655018', '40597372', 2, NULL, '2024-10-12 13:05:33', '2024-10-12 13:05:33'),
(99, 'Delta Lowe', 'gbechtelar@example.org', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '39985781', '48536234', '72910174', '91577954', 2, NULL, '2024-10-12 13:05:33', '2024-10-12 13:05:33'),
(100, 'Malvina Schowalter I', 'yparker@example.com', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '70845235', '14586888', '55583516', '66046863', 2, NULL, '2024-10-12 13:05:33', '2024-10-12 13:05:33'),
(101, 'Dr. Santa Botsford', 'modesta.wisoky@example.net', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '74720762', '76536921', '85668336', '17248373', 2, NULL, '2024-10-12 13:05:33', '2024-10-12 13:05:33'),
(102, 'Victoria Oberbrunner I', 'vryan@example.com', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '88685769', '5894123', '96784719', '75809224', 1, NULL, '2024-10-12 13:05:33', '2024-10-12 13:05:33'),
(103, 'Lavern O\'Conner V', 'adriana21@example.net', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '63201754', '97560944', '31204712', '29438581', 2, NULL, '2024-10-12 13:05:33', '2024-10-12 13:05:33'),
(104, 'Isabell Gibson', 'brock.pfeffer@example.org', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '98031462', '75292397', '66776111', '9151230', 1, NULL, '2024-10-12 13:05:34', '2024-10-12 13:05:34'),
(105, 'Prof. Fritz Hagenes DDS', 'maverick56@example.net', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '9715011', '41710409', '53943927', '53636318', 1, NULL, '2024-10-12 13:05:34', '2024-10-12 13:05:34'),
(106, 'Ada Hettinger', 'celestino29@example.net', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '19858850', '45205327', '61085550', '27172055', 2, NULL, '2024-10-12 13:05:34', '2024-10-12 13:05:34'),
(107, 'Mr. Allan Spencer', 'maia18@example.org', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '61371875', '89400164', '59988639', '14429309', 1, NULL, '2024-10-12 13:05:34', '2024-10-12 13:05:34'),
(108, 'Percy Hoppe', 'phayes@example.org', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '19887504', '59712318', '82338651', '34258834', 2, NULL, '2024-10-12 13:05:34', '2024-10-12 13:05:34'),
(109, 'Dr. Jean Williamson MD', 'ejacobi@example.net', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '2258386', '69656515', '86810338', '50706178', 1, NULL, '2024-10-12 13:05:34', '2024-10-12 13:05:34'),
(110, 'Mckenzie Gorczany', 'barton.brigitte@example.net', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '38670090', '75405961', '42173206', '53221831', 1, NULL, '2024-10-12 13:05:34', '2024-10-12 13:05:34'),
(111, 'Stacey Streich Jr.', 'kdibbert@example.net', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '28042359', '20254036', '93890897', '3480941', 2, NULL, '2024-10-12 13:05:34', '2024-10-12 13:05:34'),
(112, 'Geo Reichert', 'botsford.eda@example.org', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '40984531', '74841952', '13955925', '33282164', 2, NULL, '2024-10-12 13:05:34', '2024-10-12 13:05:34'),
(113, 'Mr. Lavon Hackett', 'shuels@example.net', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '25188161', '69068892', '26943614', '71390400', 2, NULL, '2024-10-12 13:05:34', '2024-10-12 13:05:34'),
(114, 'Delia Pacocha', 'johann.langworth@example.com', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '12874472', '7050839', '84641300', '19776351', 2, NULL, '2024-10-12 13:05:34', '2024-10-12 13:05:34'),
(115, 'Delphine Greenfelder Sr.', 'armstrong.eliane@example.com', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '67930024', '72857711', '54880810', '39454320', 2, NULL, '2024-10-12 13:05:34', '2024-10-12 13:05:34'),
(116, 'Kassandra Purdy', 'jeanette57@example.org', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '97556255', '53322941', '16499830', '88215371', 1, NULL, '2024-10-12 13:05:34', '2024-10-12 13:05:34'),
(117, 'Maci Bernhard', 'kristy52@example.net', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '45328240', '30445220', '25888753', '92999511', 2, NULL, '2024-10-12 13:05:34', '2024-10-12 13:05:34'),
(118, 'Laisha Senger Jr.', 'schultz.madelynn@example.com', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '31386607', '12193491', '83781679', '76424436', 1, NULL, '2024-10-12 13:05:34', '2024-10-12 13:05:34'),
(119, 'Shakira Runte', 'cblanda@example.org', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '1047228', '93083785', '23990269', '1613519', 2, NULL, '2024-10-12 13:05:34', '2024-10-12 13:05:34'),
(120, 'Elroy Beier', 'nitzsche.rosalyn@example.net', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '60805577', '68690494', '66471020', '45930983', 1, NULL, '2024-10-12 13:05:34', '2024-10-12 13:05:34'),
(121, 'Jacinthe Franecki', 'qkoch@example.com', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '54352997', '75870127', '37262541', '49684038', 2, NULL, '2024-10-12 13:05:34', '2024-10-12 13:05:34'),
(122, 'Kale Reinger', 'jedediah02@example.org', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '25267352', '34330854', '56845240', '60798660', 2, NULL, '2024-10-12 13:05:35', '2024-10-12 13:05:35'),
(123, 'Sheridan Waelchi', 'verna.boehm@example.org', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '28022168', '21061651', '61692300', '92520589', 1, NULL, '2024-10-12 13:05:35', '2024-10-12 13:05:35'),
(124, 'Brandy Price', 'hillard.frami@example.net', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '44047840', '31959406', '24202482', '17148922', 1, NULL, '2024-10-12 13:05:35', '2024-10-12 13:05:35'),
(125, 'Dr. Josh Huel MD', 'dicki.lonie@example.org', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '63862548', '56906766', '34631242', '89360557', 2, NULL, '2024-10-12 13:05:35', '2024-10-12 13:05:35'),
(126, 'Prof. Daisy Gleason III', 'ross.mante@example.net', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '45365224', '68639046', '88281588', '99155386', 2, NULL, '2024-10-12 13:05:35', '2024-10-12 13:05:35'),
(127, 'Astrid Doyle', 'vkuvalis@example.org', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '37740956', '57678401', '62870459', '51922620', 2, NULL, '2024-10-12 13:05:35', '2024-10-12 13:05:35'),
(128, 'Gerard Gottlieb', 'ilynch@example.com', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '88460764', '99113508', '34814590', '8691004', 1, NULL, '2024-10-12 13:05:35', '2024-10-12 13:05:35'),
(129, 'Drew Effertz', 'watsica.tressa@example.com', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '72348842', '54705407', '59144660', '81402185', 1, NULL, '2024-10-12 13:05:35', '2024-10-12 13:05:35'),
(130, 'Kianna Gibson', 'jerrold79@example.com', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '57002433', '73547857', '71419782', '24650371', 2, NULL, '2024-10-12 13:05:35', '2024-10-12 13:05:35'),
(131, 'Marlen Green', 'iliana.cruickshank@example.org', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '69603991', '2929344', '15537600', '62660351', 1, NULL, '2024-10-12 13:05:35', '2024-10-12 13:05:35'),
(132, 'Aiyana Hand', 'jacques.goyette@example.com', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '99589576', '51848822', '44894296', '38092062', 1, NULL, '2024-10-12 13:05:35', '2024-10-12 13:05:35'),
(140, 'Jorge Estudante+', 'teste@estudante.com', NULL, '$2y$12$slzTZJbQ0rujJPEjb.g6Zur06/ibV/hS1WY.PAuPxWAgM7ysWH8Ba', 'BI', 'NUIT', 'contacto_1', 'contacto_2', NULL, NULL, '2024-10-27 06:41:43', '2024-10-27 06:41:43'),
(141, 'Jorge Estudante', 'teste@as.com', NULL, '$2y$12$mct5VS8Peqauezr8FWG5z.zRFjm9Pq/Kn35FYOvk3S/C1Mrrx4c5G', 'Bu', 'NU', 'contacto_1', 'contacto_2', NULL, NULL, '2024-10-27 07:37:56', '2024-10-27 07:37:56'),
(142, 'Jorge Estudante', 'jorge@estudante.com', NULL, '$2y$12$YlLtWVXRPObYZg/pShNyOOBThxKNOd/YfGiRawGGtNQeNQ/Rg/1g2', 'BIM', 'NUI', 'contacto_1', 'contacto_2', NULL, NULL, '2024-10-27 07:51:21', '2024-10-27 07:51:21'),
(143, 'Jorge Estudante', 'jorgee@estudante.com', NULL, '$2y$12$A8WfrlE0hO3fOp49SpuxleR/SVvju8cXO9Gv2eUVlXg7VW1a2ZV3C', 'BMI', 'NiU', 'contacto_1', 'contacto_2', NULL, NULL, '2024-10-27 07:51:55', '2024-10-27 07:51:55'),
(145, 'Jorge permissões', 'email@34a3mp4e.com', NULL, '$2y$12$gCZYPMeVty/FwDRsOCwsXuE1NRanBtFEAAF0GG9ujPWBU/cR1OTeC', 'requi4BIred', 'N4U4IT', 'contacto_1', 'contacto_2', NULL, NULL, '2024-10-27 10:19:16', '2024-10-27 10:19:16'),
(146, 'Jorge permissões', 'email@3a3mp4e.com', NULL, '$2y$12$nJE7/zHP2kqZve2of1j86.0KMEwUZHQG.7Vj4XiLWFCG5E2ZR4o9m', 'req4BIred', '4IT', 'contacto_1', 'contacto_2', NULL, NULL, '2024-10-27 10:19:55', '2024-10-27 10:19:55'),
(147, 'Jorge permissões', 'email@3a4e.com', NULL, '$2y$12$eg0ZygT/W.875ndJegGuveYOJrSb4hs2yR4PPov9SaBpCK5aat7aK', 'req4Bd', '4I', 'contacto_1', 'contacto_2', NULL, NULL, '2024-10-27 10:20:35', '2024-10-27 10:20:35'),
(148, 'Jorge permissões', 'email@3ae.com', NULL, '$2y$12$Mayp80DLRUNrm12cTT1Ase0mlyA9C3CszLWJLc08LkeYtiheUxb6m', 'reqBd', 'I', 'contacto_1', 'contacto_2', NULL, NULL, '2024-10-27 10:34:30', '2024-10-27 10:34:30'),
(149, 'Antonio Docente', 'antonio@docente.com', NULL, '$2y$12$WpdGc0I02MXWO.Ob0CflOu0udCbN/8V8b4QtwnDHaNlSwCDrBrvNe', 'BIMdocente', 'NUIdocente', '8922122', 'contacto_2', 2, NULL, '2024-10-29 22:40:15', '2024-10-29 22:40:15'),
(150, 'Antonio Docente', 'antonio@docnte.com', NULL, '$2y$12$WL/9OZyDp5rRq8QRdB87ceRuwHKJs67AtvpK/XWnRiaXvGVUrkjfC', 'BIMdocene', 'NUIdocene', '8922122', 'contacto_2', 2, NULL, '2024-10-29 22:41:08', '2024-10-29 22:41:08'),
(151, 'Antonio Docente', 'antonio@docne.com', NULL, '$2y$12$dfX8NwoN1EPCfMMWmFo3iONkOO.iEWFnCWrlmZOI61b/J0CrKjDW6', 'BIMdocne', 'NUIdocne', '8922122', 'contacto_2', 2, NULL, '2024-10-29 22:46:03', '2024-10-29 22:46:03'),
(152, 'Antonio Docente', 'antonio@dcne.com', NULL, '$2y$12$U8xaFe4Zg84Z7Aj1lV8/zeTuwGXSXrsFRwnnwn4X4DHYhHnLokzHq', 'BIMdoce', 'NUIdoce', '8922122', 'contacto_2', 2, NULL, '2024-10-29 22:52:57', '2024-10-29 22:52:57'),
(153, 'Antonio Docente', 'antoo@dcne.com', NULL, '$2y$12$OnaKzMfnGpE3zeGdRHn39Oal827MifBgJ8sefYYkmhyZyib.lTE3q', 'BIdoce', 'NUdoce', '8922122', 'contacto_2', 2, NULL, '2024-10-29 22:54:11', '2024-10-29 22:54:11'),
(154, 'Antonio Docente', 'antoo@cne.com', NULL, '$2y$12$G8gwntsEbiIkCYj0/JLxdOuErcsyeyA78N63JBqGcl.jDPedhQeTK', 'BIdoc', 'Ndoce', '8922122', 'contacto_2', 2, NULL, '2024-10-29 22:55:02', '2024-10-29 22:55:02'),
(155, 'Antonio Docente', 'antoo@ce.com', NULL, '$2y$12$YyVk2wRggBjwtO7Pqwm96OoQELNoFY1/3.aFOARMVTUTPruf/CkCu', 'BIoc', 'Ndce', '8922122', 'contacto_2', 2, NULL, '2024-10-29 22:56:19', '2024-10-29 22:56:19');

-- --------------------------------------------------------

--
-- Table structure for table `user_papel`
--

CREATE TABLE `user_papel` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `papel_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `user_papel`
--

INSERT INTO `user_papel` (`user_id`, `papel_id`, `created_at`, `updated_at`) VALUES
(2, 2, NULL, NULL),
(2, 4, NULL, NULL),
(73, 1, '2024-10-27 08:44:56', '2024-10-27 08:44:56'),
(76, 1, '2024-10-27 08:44:56', '2024-10-27 08:44:56'),
(77, 1, '2024-10-27 08:44:56', '2024-10-27 08:44:56'),
(78, 1, '2024-10-27 08:44:56', '2024-10-27 08:44:56'),
(79, 1, '2024-10-27 08:44:56', '2024-10-27 08:44:56'),
(81, 1, '2024-10-27 08:44:56', '2024-10-27 08:44:56'),
(82, 1, '2024-10-27 08:44:56', '2024-10-27 08:44:56'),
(88, 1, '2024-10-27 08:44:56', '2024-10-27 08:44:56'),
(90, 1, '2024-10-27 08:44:56', '2024-10-27 08:44:56'),
(92, 1, '2024-10-27 08:44:56', '2024-10-27 08:44:56'),
(94, 1, '2024-10-27 08:44:56', '2024-10-27 08:44:56'),
(140, 1, '2024-10-27 06:41:43', '2024-10-27 06:41:43'),
(141, 1, '2024-10-27 07:37:56', '2024-10-27 07:37:56'),
(142, 1, '2024-10-27 07:51:21', '2024-10-27 07:51:21'),
(143, 1, '2024-10-27 07:51:55', '2024-10-27 07:51:55'),
(147, 3, '2024-10-27 10:20:36', '2024-10-27 10:20:36'),
(148, 3, '2024-10-27 10:34:30', '2024-10-27 10:34:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assistentes`
--
ALTER TABLE `assistentes`
  ADD PRIMARY KEY (`assistente_id`,`curso_id`,`cadeira_id`,`ano`),
  ADD KEY `fk_assistente_turma_id` (`curso_id`,`cadeira_id`,`ano`);

--
-- Indexes for table `avaliacao_nota`
--
ALTER TABLE `avaliacao_nota`
  ADD PRIMARY KEY (`curso_id`,`cadeira_id`,`ano`,`estudante_id`,`nome_avaliacao`);

--
-- Indexes for table `avaliacoes`
--
ALTER TABLE `avaliacoes`
  ADD PRIMARY KEY (`curso_id`,`cadeira_id`,`ano`,`nome_avaliacao`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cadeiras`
--
ALTER TABLE `cadeiras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cadeira_departamento` (`departamento_id`);

--
-- Indexes for table `cadeira_curso`
--
ALTER TABLE `cadeira_curso`
  ADD PRIMARY KEY (`cadeira_id`,`curso_id`),
  ADD KEY `fk_cadeira_curso_curso_id` (`curso_id`);

--
-- Indexes for table `categoria_permissao`
--
ALTER TABLE `categoria_permissao`
  ADD PRIMARY KEY (`categoria`);

--
-- Indexes for table `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_curos_departamento_id` (`departamento_id`);

--
-- Indexes for table `curso_periodo`
--
ALTER TABLE `curso_periodo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_curso_periodo` (`nome`);

--
-- Indexes for table `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_faculdade_id` (`faculdade_id`);

--
-- Indexes for table `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estado_cadeira`
--
ALTER TABLE `estado_cadeira`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_estado_cadeira_nome` (`nome`);

--
-- Indexes for table `estudantes`
--
ALTER TABLE `estudantes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_numero_estudante` (`numero_estudante`),
  ADD KEY `fk_estudante_curso_id` (`curso_id`);

--
-- Indexes for table `faculdades`
--
ALTER TABLE `faculdades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`),
  ADD KEY `fk_faculdades_directo` (`director`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medias`
--
ALTER TABLE `medias`
  ADD PRIMARY KEY (`curso_id`,`cadeira_id`,`ano`,`estudante_id`),
  ADD KEY `fk_media_estudante` (`estudante_id`),
  ADD KEY `fk_estado_cadeira` (`estado_id`),
  ADD KEY `fk_media_turma` (`cadeira_id`,`curso_id`,`ano`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `papeis`
--
ALTER TABLE `papeis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `papel_permissao`
--
ALTER TABLE `papel_permissao`
  ADD PRIMARY KEY (`papel_id`,`permissao_id`),
  ADD KEY `papel_permissao_permisaoid_foreign` (`permissao_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissoes`
--
ALTER TABLE `permissoes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_nome` (`nome`),
  ADD KEY `fk_permissoes_categoria` (`categoria`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `turmas`
--
ALTER TABLE `turmas`
  ADD PRIMARY KEY (`curso_id`,`cadeira_id`,`ano`),
  ADD KEY `fk_turmas_cadeira_curso` (`cadeira_id`,`curso_id`),
  ADD KEY `fk_turmas_regente` (`regente_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_papelid` (`papel_id`);

--
-- Indexes for table `user_papel`
--
ALTER TABLE `user_papel`
  ADD PRIMARY KEY (`user_id`,`papel_id`),
  ADD KEY `fk_user_papel_papel_id` (`papel_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cadeiras`
--
ALTER TABLE `cadeiras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `curso_periodo`
--
ALTER TABLE `curso_periodo`
  MODIFY `id` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` mediumint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `estado_cadeira`
--
ALTER TABLE `estado_cadeira`
  MODIFY `id` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `estudantes`
--
ALTER TABLE `estudantes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `faculdades`
--
ALTER TABLE `faculdades`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `papeis`
--
ALTER TABLE `papeis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `permissoes`
--
ALTER TABLE `permissoes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assistentes`
--
ALTER TABLE `assistentes`
  ADD CONSTRAINT `fk_assistente_assistente_id` FOREIGN KEY (`assistente_id`) REFERENCES `docentes` (`id`),
  ADD CONSTRAINT `fk_assistente_turma_id` FOREIGN KEY (`curso_id`,`cadeira_id`,`ano`) REFERENCES `turmas` (`curso_id`, `cadeira_id`, `ano`);

--
-- Constraints for table `avaliacao_nota`
--
ALTER TABLE `avaliacao_nota`
  ADD CONSTRAINT `avaliacao_nota_ibfk_1` FOREIGN KEY (`curso_id`,`cadeira_id`,`ano`,`estudante_id`) REFERENCES `medias` (`curso_id`, `cadeira_id`, `ano`, `estudante_id`);

--
-- Constraints for table `cadeiras`
--
ALTER TABLE `cadeiras`
  ADD CONSTRAINT `fk_cadeira_departamento` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`);

--
-- Constraints for table `cadeira_curso`
--
ALTER TABLE `cadeira_curso`
  ADD CONSTRAINT `fk_cadeira_curso_cadeira_id` FOREIGN KEY (`cadeira_id`) REFERENCES `cadeiras` (`id`),
  ADD CONSTRAINT `fk_cadeira_curso_curso_id` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`);

--
-- Constraints for table `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `fk_curos_departamento_id` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_curso_departamento_id` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`);

--
-- Constraints for table `departamentos`
--
ALTER TABLE `departamentos`
  ADD CONSTRAINT `fk_faculdade_id` FOREIGN KEY (`faculdade_id`) REFERENCES `faculdades` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `docentes`
--
ALTER TABLE `docentes`
  ADD CONSTRAINT `fk_docente_id` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `estudantes`
--
ALTER TABLE `estudantes`
  ADD CONSTRAINT `fk_estudante_curso_id` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_student_id` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `faculdades`
--
ALTER TABLE `faculdades`
  ADD CONSTRAINT `fk_faculdades_directo` FOREIGN KEY (`director`) REFERENCES `users` (`id`);

--
-- Constraints for table `medias`
--
ALTER TABLE `medias`
  ADD CONSTRAINT `fk_estado_cadeira` FOREIGN KEY (`estado_id`) REFERENCES `estado_cadeira` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_media_estudante` FOREIGN KEY (`estudante_id`) REFERENCES `estudantes` (`id`),
  ADD CONSTRAINT `fk_media_turma` FOREIGN KEY (`cadeira_id`,`curso_id`,`ano`) REFERENCES `turmas` (`cadeira_id`, `curso_id`, `ano`);

--
-- Constraints for table `papel_permissao`
--
ALTER TABLE `papel_permissao`
  ADD CONSTRAINT `papel_permissao_papelid_foreign` FOREIGN KEY (`papel_id`) REFERENCES `papeis` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `papel_permissao_permisaoid_foreign` FOREIGN KEY (`permissao_id`) REFERENCES `permissoes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permissoes`
--
ALTER TABLE `permissoes`
  ADD CONSTRAINT `fk_permissoes_categoria` FOREIGN KEY (`categoria`) REFERENCES `categoria_permissao` (`categoria`) ON UPDATE CASCADE;

--
-- Constraints for table `turmas`
--
ALTER TABLE `turmas`
  ADD CONSTRAINT `fk_turma_cadeira_id` FOREIGN KEY (`cadeira_id`) REFERENCES `cadeiras` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_turma_curso_id` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_turmas_cadeira_curso` FOREIGN KEY (`cadeira_id`,`curso_id`) REFERENCES `cadeira_curso` (`cadeira_id`, `curso_id`),
  ADD CONSTRAINT `fk_turmas_curso_id` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`),
  ADD CONSTRAINT `fk_turmas_regente` FOREIGN KEY (`regente_id`) REFERENCES `docentes` (`id`),
  ADD CONSTRAINT `fk_turmas_regente_id` FOREIGN KEY (`regente_id`) REFERENCES `docentes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_papelid` FOREIGN KEY (`papel_id`) REFERENCES `papeis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `user_papel`
--
ALTER TABLE `user_papel`
  ADD CONSTRAINT `fk_user_papel_papel_id` FOREIGN KEY (`papel_id`) REFERENCES `papeis` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_papel_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
