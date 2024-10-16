-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 15, 2024 at 07:55 AM
-- Server version: 10.11.9-MariaDB
-- PHP Version: 8.3.12

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

-- --------------------------------------------------------

--
-- Table structure for table `avaliacoes_notas`
--

CREATE TABLE `avaliacoes_notas` (
  `curso_id` int(10) UNSIGNED NOT NULL,
  `cadeira_id` bigint(20) UNSIGNED NOT NULL,
  `ano` int(4) NOT NULL,
  `estudante_id` bigint(20) UNSIGNED NOT NULL,
  `nome_avaliacao` varchar(255) NOT NULL,
  `nota` float NOT NULL DEFAULT 0,
  `peso` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
  `departamento_id` mediumint(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Lista de cadeiras presentes no sistema';

--
-- Dumping data for table `cadeiras`
--

INSERT INTO `cadeiras` (`id`, `nome`, `departamento_id`) VALUES
(21, 'Análise Matemática 1', 1),
(22, 'Matemática Discreta 1', 1),
(23, 'Física', 1),
(24, 'Álgebra Linear e Geometria Analítica', 1),
(25, 'Análise Matemática 2', 1),
(26, 'Análise de Circuitos', 2),
(27, 'Introdução à Programação', 2),
(28, 'Instrumentação e Medidas', 1),
(29, 'Matemática Discreta 2', 1),
(30, 'Desennho Auxiliado por Computador', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cadeira_curso`
--

CREATE TABLE `cadeira_curso` (
  `cadeira_id` bigint(20) UNSIGNED NOT NULL,
  `curso_id` int(10) UNSIGNED NOT NULL,
  `precendencia` int(10) UNSIGNED DEFAULT NULL,
  `entrou_em_vigor` int(4) NOT NULL,
  `saiu_do_vigor` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cadeira_curso`
--

INSERT INTO `cadeira_curso` (`cadeira_id`, `curso_id`, `precendencia`, `entrou_em_vigor`, `saiu_do_vigor`) VALUES
(21, 3, NULL, 2024, NULL),
(22, 3, NULL, 2024, NULL),
(23, 3, NULL, 2024, NULL),
(24, 3, NULL, 2024, NULL),
(25, 3, NULL, 2024, NULL),
(26, 3, NULL, 2024, NULL),
(27, 3, NULL, 2024, NULL),
(28, 3, NULL, 2024, NULL),
(29, 3, NULL, 2024, NULL),
(30, 3, NULL, 2024, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cursos`
--

CREATE TABLE `cursos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departamento_id` mediumint(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Cursos que a universidade oferece';

--
-- Dumping data for table `cursos`
--

INSERT INTO `cursos` (`id`, `nome`, `descricao`, `departamento_id`, `created_at`, `updated_at`) VALUES
(3, 'Engenharia Informática', NULL, 2, '2024-10-12 19:48:42', '2024-10-12 19:48:42'),
(4, 'Engenharia Electrónica', NULL, 2, '2024-10-12 19:48:42', '2024-10-12 19:48:42');

-- --------------------------------------------------------

--
-- Table structure for table `departamentos`
--

CREATE TABLE `departamentos` (
  `id` mediumint(10) UNSIGNED NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `departamentos`
--

INSERT INTO `departamentos` (`id`, `nome`, `descricao`) VALUES
(1, 'Cadeiras Gerais', NULL),
(2, 'Electrotécnica', NULL);

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
(73, 20202101, 3, '2024-10-17', '2030-10-17', NULL, NULL),
(76, 20202101, 3, '2024-10-17', '2030-10-17', NULL, NULL),
(77, 20202101, 3, '2024-10-17', '2030-10-17', NULL, NULL),
(78, 20202101, 3, '2024-10-17', '2030-10-17', NULL, NULL),
(79, 20202101, 3, '2024-10-17', '2030-10-17', NULL, NULL),
(81, 20202101, 3, '2024-10-17', '2030-10-17', NULL, NULL),
(82, 20202101, 3, '2024-10-17', '2030-10-17', NULL, NULL),
(88, 20202101, 3, '2024-10-17', '2030-10-17', NULL, NULL),
(90, 20202101, 3, '2024-10-17', '2030-10-17', NULL, NULL),
(92, 20202101, 3, '2024-10-17', '2030-10-17', NULL, NULL),
(94, 20202101, 3, '2024-10-17', '2030-10-17', NULL, NULL);

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
  `media` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `medias`
--

INSERT INTO `medias` (`curso_id`, `cadeira_id`, `estudante_id`, `ano`, `media`) VALUES
(3, 21, 73, 2024, 0),
(3, 21, 76, 2024, 0),
(3, 21, 78, 2024, 0),
(3, 21, 79, 2024, 0),
(3, 21, 81, 2024, 0),
(3, 21, 82, 2024, 0),
(3, 21, 88, 2024, 0),
(3, 21, 90, 2024, 0),
(3, 21, 92, 2024, 0),
(3, 21, 94, 2024, 0);

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
(4, 'super admin', 'Papel para deenvolvedores, com todas as permissões do sistema', '2024-10-07 22:00:00', '2024-10-07 22:00:00');

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
(4, 18, NULL, NULL),
(4, 19, NULL, NULL),
(4, 20, NULL, NULL),
(4, 21, NULL, NULL),
(4, 22, NULL, NULL),
(4, 23, NULL, NULL),
(4, 24, NULL, NULL),
(4, 25, NULL, NULL),
(4, 26, NULL, NULL),
(4, 27, NULL, NULL),
(4, 28, NULL, NULL),
(4, 29, NULL, NULL),
(4, 30, NULL, NULL),
(4, 31, NULL, NULL),
(4, 32, NULL, NULL),
(4, 33, NULL, NULL),
(4, 34, NULL, NULL),
(4, 43, NULL, NULL),
(4, 44, NULL, NULL),
(4, 45, NULL, NULL),
(4, 46, NULL, NULL);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissoes`
--

INSERT INTO `permissoes` (`id`, `nome`, `descricao`, `created_at`, `updated_at`) VALUES
(1, 'ver_estudante', 'Ver dados de um estudante', NULL, NULL),
(2, 'adicionar_estudante', 'Matricular estudante', NULL, NULL),
(3, 'eliminar_estudante', 'Eliminar estudante', NULL, NULL),
(4, 'editar_estudante', 'Editar dados do estudante', NULL, NULL),
(5, 'ver_docente', 'Ver dados de um docente', NULL, NULL),
(6, 'adicionar_docente', 'adicionar docente', NULL, NULL),
(7, 'eliminar_docente', 'Eliminar Docente', NULL, NULL),
(8, 'editar_docente', 'Editar dados do docente', NULL, NULL),
(9, 'ver_curso', 'Ver dados de um curso', NULL, NULL),
(10, 'adicionar_curso', 'adicionar um novo curso', NULL, NULL),
(11, 'eliminar_curso', 'Eliminar curso', NULL, NULL),
(12, 'editar_curso', 'Editar dados do curso', NULL, NULL),
(13, 'ver_departamento', 'Ver dados de um departamento', NULL, NULL),
(14, 'adicionar_departamento', 'adicionar departamento', NULL, NULL),
(15, 'eliminar_departamento', 'Eliminar departamento', NULL, NULL),
(16, 'editar_departamento', 'Editar dados do departamento', NULL, NULL),
(17, 'ver_cadeira_no_ano_lectivo', 'Ver dados de uma cadeira num ano lectivo', NULL, NULL),
(18, 'adicionar_cadeira_no_ano_lectivo', 'Adicionar cadeira a um ano lectivo', NULL, NULL),
(19, 'adicionar_assistente', 'Adicionar assistentes de uma cadeira num ano lectivo', NULL, NULL),
(20, 'ver_assistente', 'Ver a lista assistentes de uma cadeira num ano lectivo', NULL, NULL),
(21, 'eliminar_assistente', 'Eliminar assistente de uma cadeira num ano lectivo', NULL, NULL),
(22, 'adicionar_avaliação', '‘Adicionar Avaliação’', NULL, NULL),
(23, 'ver_avaliação', 'Ver lista e dados das avaliações numa cadeira num ano lectivo', NULL, NULL),
(24, 'editar_avaliacao', 'Editar os dados de uma avaliação', NULL, NULL),
(25, 'lancar_nota', 'Lançar nota de um aluno numa determinada avaliaçao', NULL, NULL),
(26, 'ver_nota', 'Ver  a nota de um aluno numa determinada avaliaçao', NULL, NULL),
(27, 'editar_nota', 'Editar a nota de um aluno numa determinada avaliaçao', NULL, NULL),
(28, 'ver_media', 'Ver a média de todas as cadeiras feitas aprovadas, reprovadas e', NULL, NULL),
(29, 'adicionar_inscricao', 'Inscrever um estudante a uma cadeira num ano', NULL, NULL),
(30, 'remover_inscricao', 'Remover a inscricao de um estudante a cadeira', NULL, NULL),
(31, 'listar_estudantes_da_turma', 'Listar todos estudantes de uma de um curso inscritos numa cadeira num determinado ano', NULL, NULL),
(32, 'ver_pauta', 'Listar as médias de todos os estudantes inscritos de um curso inscritos numa cadeira', NULL, NULL),
(33, 'adicionar_assistente', 'Adicionar docente asssistente da cadeira numa turma', NULL, NULL),
(34, 'remover_assistente', 'Remover docente asssistente da cadeira numa turma', NULL, NULL),
(43, 'adicionar_usuario', 'Adicionar um usuário, sem necessariamente criar a tabela de estudante ou docente correspondente, provavelmente só será usada em ambientes de teste', NULL, NULL),
(44, 'ver_usuario', 'Ver os dados pessoas de um usuário, o papel e as permissões', NULL, NULL),
(45, 'editar_usuario', 'Editar dados pessoais do usuário e os dados relacionados ao papel', NULL, NULL),
(46, 'eliminar_usuario', 'Eliminar um usuário da base de dados', NULL, NULL);

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
('9JaS1aUdQ1YvThyVOhhb8fE8ocOIqAtK9zHdFE5T', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64; rv:131.0) Gecko/20100101 Firefox/131.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYnZFTnpCMDJWNXFKcWU3dGUzSUo2QTlpTFp5eFRaOTdKR3VtRzVwRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHA6Ly9hcGkubWlzaWdlLmxvY2FsIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1728580807),
('A4qnYiRDcjmZ7phwQBfK4rcdR3FuFE9Q0kr4i4fA', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64; rv:131.0) Gecko/20100101 Firefox/131.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaDVMUVkyNXFNZlBIM1YxZ2JoNXNZMjhwaEl5VnBwdUpsa2ZyVlVEYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728918519),
('cMPFBDNqb4mVakcfoAvprpCeatjYIyXGz9HIDYaN', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64; rv:131.0) Gecko/20100101 Firefox/131.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUZyS2llcnhlRWFXcDNJemdjMlVKMXY3SDhEMkVibE82SkVpNzhvdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728335742),
('Il400CmnbO0PaytDqM3Qa58cKj9r1ezi8yFYQ0kX', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTJYZVVjeXpZSFR3Vk10RmV4YlZsSE9nbTJLakhtWUFxa09oUXF3WCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728384414),
('nIelDxIL1lRbsfz30qC0rGcJhPUH58hvZmWDDWmN', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64; rv:131.0) Gecko/20100101 Firefox/131.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2lZakwwM3RMcFNzNEZFRWE3TE1XeWJyQ3pVellUc1NqY1ByM0FxWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91c2VycyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728376597),
('OpCg8l1Qpe1LtPlaqduHyR6hOf4zSM89hhE2W1az', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3dWUkNzYTNia010WGNlTU9jbDNGRWF2RjByYVhSa2YzUkpRZmhmTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdXRoL3VzZXJzIjt9fQ==', 1728860328),
('SK6lejFSCUCS2jFPi7zA4hO8YHuICDh3Dz50nYkf', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64; rv:131.0) Gecko/20100101 Firefox/131.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1p4ZVlXTElCZ1VqMzZHaUw2b0ZJRFB0RGN3bE9sQ09VMFY4bWxHRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728918520);

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
(3, 21, 2024, NULL),
(3, 22, 2024, NULL),
(3, 23, 2024, NULL),
(3, 24, 2024, NULL),
(3, 25, 2024, NULL),
(3, 26, 2024, NULL),
(3, 27, 2024, NULL),
(3, 28, 2024, NULL),
(3, 29, 2024, NULL),
(3, 30, 2024, NULL);

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
(132, 'Aiyana Hand', 'jacques.goyette@example.com', NULL, '$2y$12$YBvYVNbQgOUxMe2QhOcHWuHHu.YufYBWfD2xqnWC47DyjpW7gxyq6', '99589576', '51848822', '44894296', '38092062', 1, NULL, '2024-10-12 13:05:35', '2024-10-12 13:05:35');

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
-- Indexes for table `avaliacoes_notas`
--
ALTER TABLE `avaliacoes_notas`
  ADD PRIMARY KEY (`curso_id`,`cadeira_id`,`ano`,`estudante_id`,`nome_avaliacao`);

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
-- Indexes for table `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_curos_departamento_id` (`departamento_id`);

--
-- Indexes for table `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estudantes`
--
ALTER TABLE `estudantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_estudante_curso_id` (`curso_id`);

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
  ADD KEY `fk_media_estudante` (`estudante_id`);

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` mediumint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `estudantes`
--
ALTER TABLE `estudantes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissoes`
--
ALTER TABLE `permissoes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

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
-- Constraints for table `avaliacoes_notas`
--
ALTER TABLE `avaliacoes_notas`
  ADD CONSTRAINT `avaliacoes_notas_ibfk_1` FOREIGN KEY (`curso_id`,`cadeira_id`,`ano`,`estudante_id`) REFERENCES `medias` (`curso_id`, `cadeira_id`, `ano`, `estudante_id`);

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
-- Constraints for table `medias`
--
ALTER TABLE `medias`
  ADD CONSTRAINT `fk_media_estudante` FOREIGN KEY (`estudante_id`) REFERENCES `estudantes` (`id`),
  ADD CONSTRAINT `fk_media_turma` FOREIGN KEY (`curso_id`,`cadeira_id`,`ano`) REFERENCES `turmas` (`curso_id`, `cadeira_id`, `ano`);

--
-- Constraints for table `papel_permissao`
--
ALTER TABLE `papel_permissao`
  ADD CONSTRAINT `papel_permissao_papelid_foreign` FOREIGN KEY (`papel_id`) REFERENCES `papeis` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `papel_permissao_permisaoid_foreign` FOREIGN KEY (`permissao_id`) REFERENCES `permissoes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
