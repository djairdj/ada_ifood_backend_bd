create database djCarloca;

use djCarloca;

CREATE TABLE `tb_versao` (
  `id_versao` INT AUTO_INCREMENT NOT NULL,
  `descricao` VARCHAR(20) NOT NULL,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id_versao`)
);

CREATE TABLE `tb_endereco` (
  `id_endereco` INT AUTO_INCREMENT NOT NULL,
  `numero` VARCHAR(6) NOT NULL,
  `rua` VARCHAR(100) NOT NULL,
  `bairro` VARCHAR(100) NOT NULL,
  `cidade` VARCHAR(100) NOT NULL,
  `estado` VARCHAR(100) NOT NULL,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id_endereco`)
);

CREATE TABLE `tb_montadora` (
  `id_montadora` INT AUTO_INCREMENT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id_montadora`)
);

CREATE TABLE `tb_categoria` (
  `id_categoria` INT AUTO_INCREMENT NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id_categoria`)
);

CREATE TABLE `tb_modelo` (
  `id_modelo` INT AUTO_INCREMENT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `id_categoria` INT NOT NULL,
  `id_montadora` INT NOT NULL,
  `id_versao` INT NOT NULL,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id_modelo`)
);
ALTER TABLE `tb_modelo` ADD CONSTRAINT `tb_categoria_tb_modelo_fk` FOREIGN KEY (`id_categoria`) REFERENCES `tb_categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `tb_modelo` ADD CONSTRAINT `tb_montadora_tb_modelo_fk` FOREIGN KEY (`id_montadora`) REFERENCES `tb_montadora` (`id_montadora`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `tb_modelo` ADD CONSTRAINT `tb_versao_tb_modelo_fk` FOREIGN KEY (`id_versao`) REFERENCES `tb_versao` (`id_versao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE `tb_unidade` (
  `id_unidade` INT AUTO_INCREMENT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `id_endereco` INT NOT NULL,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id_unidade`)
);
ALTER TABLE `tb_unidade` ADD CONSTRAINT `tb_endereco_tb_unidade_fk` FOREIGN KEY (`id_endereco`) REFERENCES `tb_endereco` (`id_endereco`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE `tb_cliente` (
  `id_cliente` INT AUTO_INCREMENT NOT NULL,
  `id_endereco` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `cpf` VARCHAR(14) NOT NULL,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id_cliente`),
  CONSTRAINT `unique_cpf` UNIQUE (`cpf`)
);
ALTER TABLE `tb_cliente` ADD CONSTRAINT `tb_endereco_tb_cliente_fk` FOREIGN KEY (`id_endereco`) REFERENCES `tb_endereco` (`id_endereco`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE `tb_carro` (
  `id_carro` INT AUTO_INCREMENT NOT NULL,
  `locado` BOOLEAN NOT NULL DEFAULT FALSE ,
  `quilometragem_atual` BIGINT NOT NULL,
  `enum_cor` ENUM ('branca', 'prata', 'preta') NOT NULL,
  `id_modelo` INT NOT NULL,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id_carro`)
);
ALTER TABLE `tb_carro` ADD CONSTRAINT `tb_modelo_tb_carro_fk` FOREIGN KEY (`id_modelo`) REFERENCES `tb_modelo` (`id_modelo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE `tb_aluguel` (
  `id_aluguel` INT AUTO_INCREMENT NOT NULL,
  `data_retirada` DATE NOT NULL,
  `modalidade` ENUM ('diaria')NOT NULL DEFAULT 'diaria',
  `data_devolucao` DATE NULL,
  `quilometragem_inicial` BIGINT NOT NULL,
  `quilometragem_final` BIGINT NULL,
  `id_unidade_locacao` INT NOT NULL,
  `id_carro` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_unidade_devolucao` INT NULL,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id_aluguel`)
);
ALTER TABLE `tb_aluguel` ADD CONSTRAINT `tb_carro_tb_aluguel_fk` FOREIGN KEY (`id_carro`) REFERENCES `tb_carro` (`id_carro`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `tb_aluguel` ADD CONSTRAINT `tb_cliente_tb_aluguel_fk` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `tb_aluguel` ADD CONSTRAINT `tb_unidade_devolucao_tb_aluguel_fk` FOREIGN KEY (`id_unidade_devolucao`) REFERENCES `tb_unidade` (`id_unidade`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `tb_aluguel` ADD CONSTRAINT `tb_unidade_tb_aluguel_fk` FOREIGN KEY (`id_unidade_locacao`) REFERENCES `tb_unidade` (`id_unidade`) ON DELETE NO ACTION ON UPDATE NO ACTION;
