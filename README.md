# Scripts 'Carloca'

## O presente respositório visa expor scripts que podem nortear preliminarmente a confecção de uma base de dados de um sistema de aluguel de carros. O mesmo foi solicitado como requisito para finalização do módulo de _Banco de dados_ do curso de _back-end_ ministrado pela [ADA](https://ada.tech/) em parceria com [iFood](https://www.ifood.com.br/)

### Requisitos para executar a aplicação

Para executar os scripts corretamente, certifique-se que possui acesso de gravação um banco de dados mysql, no qual será gravada uma nova base de dados.

O ambiente foi testado utilizando o cliente DbGate.

Para criar a base de dados, execute o script do arquivo [create_base](create_base_carloca.sql).

### Sobre o projeto

#### Os requisitos do projeto foram originalmente definidos como

- [x] 1 - O carro possui modelo, montadora, cor e versão;
- [x] 2 - As cores de carro disponiveis são apenas branco, preto e prata.
- [x] 3 - Existem várias categorias de veiculos (hatch, sedam compacto, sedam médio, SUV, etc...).
- [x] 4 - Um cliente pode alugar um carro somente na modalidade "diária".
- [ ] 5 - Um cliente não pode alugar mais de um carro.
- [x] 6 - Enquanto um carro estiver locado por um cliente não pode ser ofertado para outro.
- [x] 7 - O sistema deve manter o histórico dos clientes que locaram determinado carro.
- [X] 8 - O sistema deve manter o histórico de quantos quilometros o cliente rodou com o carro bem como a quilometragem atual de cada um dos carros.
- [x] 9 - Existem várias unidades da fraquia CARLOCA o sistema deve saber onde o carro foi locado e onde foi devolvido cada veículo.

#### Requisitos  não funcionais

- [x] 1 - Devem ser gerados inserts e selects que possibilitem validar cada um dos requisitos acima.
- [ ] 2 - O exercicio deve ser desenvolvido considerando todos os principios de normalização de dados.

### Observações ao professor

- O segundo _requisito não funcional_ não foi atendido pois algumas tabelas como por exemplo `tb_endereco` seriam largamente decompostas e optei por simpificar o processo nesse projeto aqui, mas sabendo sim, que a forma normal estabelece que um campo não chave não pode depender de outro campo não chave.
- Não consegui aplicar uma espécie de constraint que restringisse via banco a inserção de uma nova alocação para um cliente que já tem um carro alugado;
- Os scripts foram testados e revisados, todavia, certamente pode ocorrer alguma incongruência no meio do caminho do desenvolvimento.

#### Linkedin: [Djair Alves](https://www.linkedin.com/in/djairdj)
