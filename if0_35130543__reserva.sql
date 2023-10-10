-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql106.infinityfree.com
-- Tempo de geração: 07/10/2023 às 10:30
-- Versão do servidor: 10.4.17-MariaDB
-- Versão do PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `if0_35130543__reserva`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `periodo`
--

CREATE TABLE `periodo` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=4096 DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `periodo`
--

INSERT INTO `periodo` (`id`, `nome`) VALUES
(1, 'Manhã'),
(2, 'Tarde'),
(3, 'Noite');

-- --------------------------------------------------------

--
-- Estrutura para tabela `reserva`
--

CREATE TABLE `reserva` (
  `id` int(11) NOT NULL,
  `sala_id` int(11) NOT NULL,
  `periodo_id` int(11) NOT NULL,
  `dia` date NOT NULL,
  `professor_desc` varchar(255) DEFAULT NULL,
  `disciplina_desc` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1 reservada, 2 confirmada, 3 cancelada ',
  `observacao` text DEFAULT NULL,
  `data_final` date DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=4096 DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `reserva`
--

INSERT INTO `reserva` (`id`, `sala_id`, `periodo_id`, `dia`, `professor_desc`, `disciplina_desc`, `status`, `observacao`, `data_final`) VALUES
(59, 1, 1, '2023-10-02', 'Nairo', 'Informática Fundamental', 1, '40 cadeiras', '0000-00-00'),
(60, 1, 2, '2023-10-02', 'João Muniz ', '', 2, 'Lógica de programação ', NULL),
(61, 1, 2, '2023-10-09', 'João Muniz ', '', 2, 'Lógica de programação ', NULL),
(62, 1, 2, '2023-10-16', 'João Muniz ', '', 2, 'Lógica de programação ', NULL),
(63, 1, 2, '2023-10-23', 'João Muniz ', '', 2, 'Lógica de programação ', NULL),
(64, 1, 2, '2023-10-30', 'João Muniz ', '', 2, 'Lógica de programação ', NULL),
(65, 1, 2, '2023-10-04', 'João Muniz ', 'Lógica de programação 4499', 2, '', NULL),
(66, 1, 2, '2023-10-11', 'João Muniz ', 'Lógica de programação 4499', 2, '', NULL),
(67, 1, 2, '2023-10-18', 'João Muniz ', 'Lógica de programação 4499', 2, '', NULL),
(68, 1, 2, '2023-10-25', 'João Muniz ', 'Lógica de programação 4499', 2, '', NULL),
(69, 1, 2, '2023-11-01', 'João Muniz ', 'Lógica de programação 4499', 2, '', NULL),
(70, 1, 2, '2023-10-06', 'João Muniz ', 'Lógica de programação 4499', 2, '', NULL),
(71, 1, 2, '2023-10-13', 'João Muniz ', 'Lógica de programação 4499', 2, '', NULL),
(72, 1, 2, '2023-10-20', 'João Muniz ', 'Lógica de programação 4499', 2, '', NULL),
(73, 1, 2, '2023-10-27', 'João Muniz ', 'Lógica de programação 4499', 2, '', NULL),
(74, 1, 2, '2023-11-03', 'João Muniz ', 'Lógica de programação 4499', 2, '', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `sala`
--

CREATE TABLE `sala` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=2048 DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `sala`
--

INSERT INTO `sala` (`id`, `nome`) VALUES
(1, 'Lab 101'),
(2, 'Sala 102'),
(3, 'Sala 103'),
(4, 'Lab 104'),
(5, 'Sala 203'),
(6, 'Sala 204'),
(10, 'Lab 209'),
(11, 'Lab 209'),
(12, 'Lab 205');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `senha` varchar(32) DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `email`, `senha`) VALUES
(3, 'Senac', 'senac@gmail.com', '5aa8cd90d7f70cee9eb45c23202c808c');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `periodo`
--
ALTER TABLE `periodo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_periodo_id` (`id`);

--
-- Índices de tabela `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_reserva_id` (`id`),
  ADD UNIQUE KEY `UK_reserva` (`sala_id`,`periodo_id`,`dia`),
  ADD KEY `IDX_reserva_dia` (`dia`),
  ADD KEY `IDX_reserva_status` (`status`),
  ADD KEY `FK_reserva_periodo_id` (`periodo_id`);

--
-- Índices de tabela `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_sala_id` (`id`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_usuario_id` (`id`),
  ADD UNIQUE KEY `UK_usuario_email` (`email`(15));

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `periodo`
--
ALTER TABLE `periodo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT de tabela `sala`
--
ALTER TABLE `sala`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `FK_reserva_periodo_id` FOREIGN KEY (`periodo_id`) REFERENCES `periodo` (`id`),
  ADD CONSTRAINT `FK_reserva_sala_id` FOREIGN KEY (`sala_id`) REFERENCES `sala` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
