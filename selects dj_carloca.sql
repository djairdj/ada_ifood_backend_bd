use djCarloca;

--  2 - As cores de carro disponiveis são apenas branco, preto e prata.
INSERT INTO tb_carro (`id_carro`, `locado`, `quilometragem_atual`, `enum_cor`, `id_modelo`)
  VALUES (default, 1, '5000', 'azul', 1)
;

--  3 - Existem várias categorias de veiculos (hatch, sedam compacto, sedam médio, SUV, etc...).
SELECT `descricao` FROM `tb_categoria`;

--  4 - Um cliente pode alugar um carro somente na modalidade "diária".
INSERT INTO tb_aluguel VALUES (DEFAULT, '2023-12-20', 'outraModalidade', DEFAULT, (SELECT quilometragem_atual from tb_carro where id_carro = 1 ), default , 2, 1, 1, 1);

--  Quantidade de carros alugados pelo id do cliente
SELECT C.nome, COUNT(A.id_carro) AS 'Quantidade de Carros Alugados'
  FROM tb_cliente C
  LEFT JOIN tb_aluguel A ON C.id_cliente = A.id_cliente
  LEFT JOIN tb_carro CR ON A.id_carro = CR.id_carro
  WHERE CR.locado = 1 AND C.id_cliente = 2
  GROUP BY C.id_cliente, C.nome
;

--  6 - Enquanto um carro estiver locado por um cliente não pode ser ofertado para outro.
--  Ao locar o carro, abaixo na própria query de insert, já existe o update do carro para locado.
--  Ao devolver o carro:
UPDATE tb_aluguel SET quilometragem_final = (SELECT quilometragem_atual FROM tb_carro WHERE id_carro = 1)
  WHERE id_aluguel = 1
;

-- Redefinindo o carro para não locado
UPDATE tb_carro SET locado = 0 WHERE id_carro = 1;

-- 7 - O sistema deve manter o histórico dos clientes que locaram determinado carro.
SELECT c.id_carro, m.nome AS nome_modelo, GROUP_CONCAT(c_cli.nome ORDER BY a.data_retirada) AS clientes_alugaram
  FROM tb_carro c
  JOIN tb_aluguel a ON c.id_carro = a.id_carro
  JOIN tb_cliente c_cli ON a.id_cliente = c_cli.id_cliente
  JOIN tb_modelo m ON c.id_modelo = m.id_modelo
  GROUP BY c.id_carro, m.nome
;

-- 8 - O sistema deve manter o histórico de quantos quilômetros o cliente rodou com o carro bem como a quilometragem atual de cada um dos carros.
SELECT c.id_cliente, c.nome AS Cliente,
  SUM(a.quilometragem_final - a.quilometragem_inicial) AS 'Total Rodado'
  FROM  tb_cliente c
  JOIN tb_aluguel a ON c.id_cliente = a.id_cliente
  GROUP BY c.id_cliente
;
SELECT md.nome, c.quilometragem_atual AS 'KM Total' FROM tb_modelo AS md
  JOIN tb_carro AS c ON c.quilometragem_atual
  WHERE c.id_modelo = md.id_modelo
;
-- Quantidade de carros alugados no momento por cliente
SELECT C.nome, COUNT(A.id_carro) AS 'N carros alugados'
  FROM tb_cliente AS C
  LEFT JOIN tb_aluguel A ON C.id_cliente = A.id_cliente
  LEFT JOIN tb_carro CR ON A.id_carro = CR.id_carro
  WHERE CR.locado = 1
  GROUP BY C.id_cliente, C.nome
;