use djCarloca;

INSERT INTO `tb_versao` (`id_versao`, `descricao`) VALUES
(1, 'Sport'),
(2, 'Executive'),
(3, 'Eco'),
(4, 'Turbo'),
(5, 'Limited Edition'),
(6, 'Urban'),
(7, 'Adventure'),
(8, 'Deluxe'),
(9, 'GT'),
(10, 'XE'),
(11, 'LX'),
(12, 'S-Line'),
(13, 'Hybrid'),
(14, 'Performance'),
(15, 'Tech Edition')
;

INSERT INTO `tb_endereco` (`id_endereco`, `numero`, `rua`, `bairro`, `cidade`, `estado`) VALUES
(1, '123', 'Rua das Flores', 'Jardim Primavera', 'São Paulo', 'SP'),
(2, '456', 'Avenida Central', 'Centro', 'Rio de Janeiro', 'RJ'),
(3, '789', 'Travessa dos Pássaros', 'Bela Vista', 'Porto Alegre', 'RS'),
(4, '101', 'Rua da Amizade', 'América', 'Belo Horizonte', 'MG'),
(5, '202', 'Avenida das Palmeiras', 'Palm Springs', 'Fortaleza', 'CE'),
(6, '303', 'Rua do Sol', 'Sol Nascente', 'Recife', 'PE'),
(7, '404', 'Alameda dos Anjos', 'Anjo Dourado', 'Curitiba', 'PR'),
(8, '505', 'Avenida do Mar', 'Mar Azul', 'Salvador', 'BA'),
(9, '606', 'Rua das Estrelas', 'Estrela do Norte', 'Manaus', 'AM'),
(10, '707', 'Praça da Liberdade', 'Liberdade', 'Brasília', 'DF'),
(11, '808', 'Avenida da Lua', 'Lua Cheia', 'Natal', 'RN'),
(12, '909', 'Rua dos Ventos', 'Vento Soprante', 'Florianópolis', 'SC'),
(13, '111', 'Travessa das Águas', 'Água Viva', 'Porto Velho', 'RO'),
(14, '222', 'Avenida dos Coqueiros', 'Coqueiral', 'Maceió', 'AL'),
(15, '333', 'Praça do Cerrado', 'Cerrado Verde', 'Goiânia', 'GO'),
(16, '444', 'Rua das Montanhas', 'Monte Verde', 'Vitória', 'ES'),
(17, '555', 'Avenida das Cachoeiras', 'Cachoeira Linda', 'Cuiabá', 'MT'),
(18, '666', 'Travessa das Pedras', 'Pedra Brilhante', 'Teresina', 'PI'),
(19, '777', 'Rua dos Rios', 'Rio Claro', 'Campo Grande', 'MS'),
(20, '888', 'Alameda das Dunas', 'Dunas Douradas', 'João Pessoa', 'PB')
;

INSERT INTO `tb_montadora` (`id_montadora`, `nome`) VALUES
(1, 'Fiat'),
(2, 'Volkswagen'),
(3, 'Chevrolet'),
(4, 'Ford'),
(5, 'Honda'),
(6, 'Toyota'),
(7, 'Hyundai'),
(8, 'Renault'),
(9, 'Nissan'),
(10, 'Mercedes-Benz')
;

INSERT INTO `tb_categoria` (`id_categoria`, `descricao`) VALUES
(1, 'Hatch Compacto'),
(2, 'Hatch Médio'),
(3, 'Sedã Compacto'),
(4, 'Sedã Médio'),
(5, 'SUV Compacto'),
(6, 'SUV Médio'),
(7, 'Picape Compacta'),
(8, 'Picape Média'),
(9, 'SUV Grande'),
(10, 'Crossover'),
(11, 'Minivan'),
(12, 'Van de Passageiros'),
(13, 'Carro Elétrico'),
(14, 'Carro Híbrido'),
(15, 'Esportivo'),
(16, 'Carro de Luxo'),
(17, 'Carro Popular'),
(18, 'Conversível'),
(19, 'Caminhonete'),
(20, 'Caminhão Leve')
;

INSERT INTO `tb_modelo` (`id_modelo`, `id_categoria`, `id_montadora`, `id_versao`, `nome`) VALUES
(1, 1, 1, 1, 'Argo'),
(2, 2, 2, 2, 'Perro'),
(3, 3, 3, 3, 'Eco'),
(4, 4, 4, 4, 'FordTurbo'),
(5, 5, 5, 5, 'HRV'),
(6, 6, 6, 6, 'SuvMedio'),
(7, 7, 7, 7, 'AdventureHyundai'),
(8, 8, 8, 8, 'DeluxeRenaultMedia'),
(9, 9, 9, 9, 'GT Nissan SUV'),
;

INSERT INTO `tb_unidade` (`id_unidade`, `nome`, `id_endereco`) VALUES
(1, 'Garanhuns', 6),
(2, 'Potiguar', 11)
;

INSERT INTO `tb_cliente` (`id_cliente`, `nome`, `cpf`, `id_endereco`) VALUES
(1, 'Maria Silva', '123.456.789-01', 1),
(2, 'João Oliveira', '987.654.321-00', 1),
(3, 'Ana Santos', '456.789.012-34', 2),
(4, 'Carlos Lima', '321.098.765-43', 3),
(5, 'Patrícia Rocha', '111.222.333-44', 4)
;

INSERT INTO `tb_carro` (`id_carro`, `locado`, `quilometragem_atual`, `enum_cor`, `id_modelo`) VALUES
(1, 1, '5000', 'branca', 1),
(2, 0, '3000', 'prata', 2),
(3, 1, '2000', 'preta', 3),
(4, 1, '4000', 'branca', 4),
(5, 0, '3000', 'preta', 5)
;

INSERT INTO `tb_aluguel` (`id_aluguel`, `data_retirada`, `modalidade`, `data_devolucao`, `quilometragem_inicial`,
`quilometragem_final`, `id_unidade_locacao`, `id_carro`, `id_cliente`, `id_unidade_devolucao`)
VALUES (default, '2023-12-12', default, '2023-12-22', (select `quilometragem_atual` from `tb_carro` where `id_carro` = 1), 10000, 1, 1, 1, 2);
UPDATE `tb_carro` SET `locado` = 1 WHERE `id_carro` = 1;
INSERT INTO `tb_aluguel` (`id_aluguel`, `data_retirada`, `modalidade`, `data_devolucao`, `quilometragem_inicial`,
`quilometragem_final`, `id_unidade_locacao`, `id_carro`, `id_cliente`, `id_unidade_devolucao`)
VALUES (default, '2023-12-12', default, '2023-12-13', (select `quilometragem_atual` from `tb_carro` where `id_carro` = 2), 11000, 2, 2, 2, 2);
UPDATE `tb_carro` SET `locado` = 1 WHERE `id_carro` = 2;
INSERT INTO `tb_aluguel` (`id_aluguel`, `data_retirada`, `modalidade`, `data_devolucao`, `quilometragem_inicial`,
`quilometragem_final`, `id_unidade_locacao`, `id_carro`, `id_cliente`, `id_unidade_devolucao`)
VALUES (default, '2023-12-21', default, '2023-12-22', (select `quilometragem_atual` from `tb_carro` where `id_carro` = 3), 12000, 1, 3, 2, 2);
UPDATE `tb_carro` SET `locado` = 1 WHERE `id_carro` = 3;
;
