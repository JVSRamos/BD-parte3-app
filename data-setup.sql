-- File used for populating the database with test data.

-- CLIENTE
-- Joao
INSERT INTO CLIENTE (CPF, EMAIL, DATA_INSCRICAO, NOME, TELEFONE, DATA_NASCIMENTO, SENHA, FOTO, AVALIACAO_GERAL)
    VALUES ('48487098819', 'joaoramosj@outlook.com', '2016-10-20 21:08:24-05', 'Joao Vitor Silva Ramos', '17996698335', '8/6/2000', 'senha123', './photos/joao.jpeg', NULL);
-- Vitor
INSERT INTO CLIENTE (CPF, EMAIL, DATA_INSCRICAO, NOME, TELEFONE, DATA_NASCIMENTO, SENHA, FOTO, AVALIACAO_GERAL)
    VALUES ('49061357810', 'vitorsan@bd.com', '2018-08-21 22:08:25-03', 'Vitor Santana Cordeiro', '11947836937', '9/20/2000', 'vamopobackvitao', './photos/vitor.jpeg', 4.5);
-- Marcelo Agiota
INSERT INTO CLIENTE (CPF, EMAIL, DATA_INSCRICAO, NOME, TELEFONE, DATA_NASCIMENTO, SENHA, FOTO, AVALIACAO_GERAL)
    VALUES ('47495856882', 'marcelo_agiota@hotmail.com', '2016-09-22 22:05:12-03', 'Marcelo Agiotao', '17996698335', '7/15/1999', 'fullstackagiotao','./photos/marcelo_agiotao.jpeg', 5.00);
-- Giovani
INSERT INTO CLIENTE (CPF, EMAIL, DATA_INSCRICAO, NOME, TELEFONE, DATA_NASCIMENTO, SENHA, FOTO, AVALIACAO_GERAL)
    VALUES ('46975897859', 'giovanilucafo@gmail.com', '2015-07-21 16:07:32-03', 'Giovani Decico Lucafo','19981216021','9/26/1900', 'coxinha26091997','./photos/giovani.jpeg', 4.20);
-- Craque Neto
INSERT INTO CLIENTE (CPF, EMAIL, DATA_INSCRICAO, NOME, TELEFONE, DATA_NASCIMENTO, SENHA, FOTO, AVALIACAO_GERAL)
    VALUES ('11111111111', 'craqueneto10@gmail.com', '2014-12-10 21:13:33-03', 'José Ferreira Neto','11999999999','9/9/1966', 'cabelodeboneca', './photos/craque_neto.jpeg', 2.0);

-- NEGOCIANTE
-- Joao
INSERT INTO NEGOCIANTE (CPF, EMAIL, DATA_INSCRICAO, NOME, TELEFONE, DATA_NASCIMENTO, SENHA, FOTO, AVALIACAO_GERAL, EH_PRESTADOR, EH_LOCADOR, EH_VENDEDOR)
    VALUES ('48487098819', 'joaoramosj@outlook.com', '2016-10-20 22:08:24-05', 'Joao Vitor Silva Ramos', '17996698335', '8/6/2000', 'senha123', './photos/joao.jpeg', NULL, FALSE, FALSE, TRUE);
-- Craque neto
INSERT INTO NEGOCIANTE (CPF, EMAIL, DATA_INSCRICAO, NOME, TELEFONE, DATA_NASCIMENTO, SENHA, FOTO, AVALIACAO_GERAL, EH_PRESTADOR, EH_LOCADOR, EH_VENDEDOR)
    VALUES ('11111111111', 'craqueneto10@gmail.com', '2014-12-10 21:50:53-03', 'José Ferreira Neto','11999999999','9/9/1966', 'cabelodeboneca', './photos/craque_neto.jpeg', 4.0, FALSE, TRUE, TRUE);
-- Kasalbe
INSERT INTO NEGOCIANTE (CPF, EMAIL, DATA_INSCRICAO, NOME, TELEFONE, DATA_NASCIMENTO, SENHA, FOTO, AVALIACAO_GERAL, EH_PRESTADOR, EH_LOCADOR, EH_VENDEDOR)
    VALUES ('44455566677', 'kasalbe@usp.br', '2014-07-12 10:01:46-03', 'Otávio Polozzi Rodrigues', '1691234785', '8/20/1998', 'repsantacasa', './photos/kasalbe.jpeg', 3.8, FALSE, TRUE, FALSE);
-- Marcelo Agiota
INSERT INTO NEGOCIANTE (CPF, EMAIL, DATA_INSCRICAO, NOME, TELEFONE, DATA_NASCIMENTO, SENHA, FOTO, AVALIACAO_GERAL, EH_PRESTADOR, EH_LOCADOR, EH_VENDEDOR)
    VALUES ('47495856882', 'marcelo_agiota@hotmail.com', '2016-09-22 23:05:12-03', 'Marcelo Agiotao', '17996698335', '7/15/1999', 'fullstackagiotao','./photos/marcelo_agiotao.jpeg', 1.00, TRUE, TRUE, TRUE);
-- Carlos Bife
INSERT INTO NEGOCIANTE (CPF, EMAIL, DATA_INSCRICAO, NOME, TELEFONE, DATA_NASCIMENTO, SENHA, FOTO, AVALIACAO_GERAL, EH_PRESTADOR, EH_LOCADOR, EH_VENDEDOR)
    VALUES ('48121548421', 'carlosbife@hotmail.com', '2010-01-30 23:04:59-03', 'Carlos Bife', '19855515658', '4/22/1982', 'truco','./photos/bife.jpeg', 2.55, TRUE, FALSE, FALSE);

-- AVALIACAO
-- Joao -> Carlos Bife
INSERT INTO AVALIACAO (CLIENTE, NEGOCIANTE, DATA_HORA, TEXTO, RESPOSTA, VEM_DO_CLIENTE, NOTA)
    VALUES ('48487098819', '48121548421', '2019-07-21 16:07:32-03', 'Queria mudar de casa e contratei o Carlos, mas ele demorou muito pra realizar o serviço. Além disso, vi ele jogando truco no posto no horário do serviço','O que vem de baixo nao me atinge seu esquerdista, impedindo que eu me divirta, vai pra cuba se nao quer vida boa', TRUE, 1.00); 
-- Giovani -> Marcelo Agiota
INSERT INTO AVALIACAO (CLIENTE, NEGOCIANTE, DATA_HORA, TEXTO, RESPOSTA, VEM_DO_CLIENTE, NOTA)
    VALUES ('46975897859', '47495856882', '2019-10-21 16:10:42-03', 'Contratei o marcelo para arrumar meu armário, porém descobri depois que ele era agiota e ele veio com uns papo de pagar umas conta pra mim meio estranho, e no fim das contas meu armario fico tudo torto', 'Logico, vc me deve 30k em emprestimos, ja se esqueceu que sua hillux nao veio do suor do seu trabalho?', TRUE, 0.5);
-- Marcelo Agiota -> Joao
INSERT INTO AVALIACAO (CLIENTE, NEGOCIANTE, DATA_HORA, TEXTO, RESPOSTA, VEM_DO_CLIENTE, NOTA)
    VALUES ('47495856882', '48487098819', '2019-10-09 22:08:24-05', 'Esse joao é muito ruim, queria comprar um liquidificador dele, porém ele mora mais longe que onde o judas perdeu as botas','Calunia! Fernandopolis eh a metropole do futuro', TRUE, 2.40);
-- Vitor -> Craque Neto   
INSERT INTO AVALIACAO (CLIENTE, NEGOCIANTE, DATA_HORA, TEXTO, RESPOSTA, VEM_DO_CLIENTE, NOTA)
    VALUES ('49061357810', '11111111111', '2018-10-22 20:10:12-03', 'Esse Craque Neto é um zé ruela!! Um oreiúdo!!! Ele num corre! VAI PERDER O CAMPEONATO PRO PALMEIRAAAS!!!!!', 'CÊ TÁ DE BRINCADEIRA!!!', TRUE, 0.0);
-- Vitor <- Craque Neto    
INSERT INTO AVALIACAO (CLIENTE, NEGOCIANTE, DATA_HORA, TEXTO, RESPOSTA, VEM_DO_CLIENTE, NOTA)
    VALUES ('49061357810', '11111111111', '2018-10-23 20:11:10-03', 'ESSE CABELU DI BUNECA ME AVALIOU MAL!! COLOCOU 0 ESTRELAS PRA MIM SENDO QUE EU FIZ O SERVIÇO CERTINHO! PALHAÇADA!!!', 'Para de chorar, Neto! Você fez um serviço horrível, se liga! Isso só mostra o quanto você é infantil', FALSE, 0.0);
-- Carlos Bife <- Vitor
INSERT INTO AVALIACAO (CLIENTE, NEGOCIANTE, DATA_HORA, TEXTO, RESPOSTA, VEM_DO_CLIENTE, NOTA)
    VALUES ('48121548421', '49061357810', '2019-10-20 20:08:12-05', 'Eu fui so fazer um trabalhinho na casa do vitor e ele nao parava de falar que ele era um estudante global sla.. acabou que o trabalho fico muito bem feito mas eu tava mesmo era com vtd de xinga ele', NULL, FALSE, 4.0);
-- Vitao-> Kazalbe
INSERT INTO AVALIACAO (CLIENTE, NEGOCIANTE, DATA_HORA, TEXTO, RESPOSTA, VEM_DO_CLIENTE, NOTA)
    VALUES ('49061357810', '44455566677', '2019-11-02 20:10:12-03', 'Aluguei uma vaga da Rep. Santa Casa com o Kasalbé e ele foi muito atencioso! Mandou tudo certinho e agilizou bastante o processo! Nota 100 :)', 'Obrigado Vitão!! Um prazer fazer negócios com você.', TRUE, 5.0);

-- DENUNCIA 
-- Marcelo Agiota -> Joao
INSERT INTO DENUNCIA (CLIENTE, NEGOCIANTE, DATA_HORA, TEXTO, RESPOSTA, VEM_DO_CLIENTE)
    VALUES ('47495856882', '48487098819','2019-08-20 16:07:32-03', 'Não pagou meus produtos, é um pilantra', 'Vai cair dia 15 o salário, eu vou te pagar ;)', FALSE);
-- Vitor -> Craque Neto
INSERT INTO DENUNCIA (CLIENTE, NEGOCIANTE, DATA_HORA, TEXTO, RESPOSTA, VEM_DO_CLIENTE)
    VALUES ('49061357810', '11111111111', '2018-10-24 12:15:30-03', 'É um safado. Me vendeu um produto e depois me avaliou mal porque falei umas verdades na cara dele! Um usuário ridículo, deveria ser banido.', NULL, TRUE);
-- Joao -> Marcelo Agiota
INSERT INTO DENUNCIA (CLIENTE, NEGOCIANTE, DATA_HORA, TEXTO, RESPOSTA, VEM_DO_CLIENTE)
    VALUES ('48487098819', '47495856882', '2018-8-10 8:45:23-03', 'Esse joao me roubou, comprou a minha cadeira de praia favorita mas nao me pagou!', 'Achado nao eh roubado :)', FALSE);
-- Giovani -> Carlos Bife    
INSERT INTO DENUNCIA (CLIENTE, NEGOCIANTE, DATA_HORA, TEXTO, RESPOSTA, VEM_DO_CLIENTE)
    VALUES ('46975897859', '48121548421', '2019-1-30 11:11:11-03', 'Esse cara é um machista, fico contando umas historia dessa vida porca dele no meio do serviço e eu senti a obrigação de expor esse palhaço', NULL, TRUE);

-- CONVERSA
-- Joao e Carlos Bife
INSERT INTO CONVERSA (CLIENTE, NEGOCIANTE, DATA_HORA, LOG_CONVERSA)
    VALUES ('48487098819', '48121548421', '2019-07-17 16:07:32-03', './chat_logs/2019-07-17_16:07:32-03.log');
-- Vitor e Craque Neto
INSERT INTO CONVERSA (CLIENTE, NEGOCIANTE, DATA_HORA, LOG_CONVERSA)
    VALUES ('49061357810', '11111111111', '2018-10-28 22:08:10-03', './chat_logs/2018-10-28_22:08:10-03.log');
-- Marcelo Agiota e Carlos Bife
INSERT INTO CONVERSA (CLIENTE, NEGOCIANTE, DATA_HORA, LOG_CONVERSA)
    VALUES ('47495856882', '48121548421', '2018-02-11 09:12:43-03', './chat_logs/2018-02-11_09:12:43-03.log');
-- Giovani e Kazalbe  
INSERT INTO CONVERSA (CLIENTE, NEGOCIANTE, DATA_HORA, LOG_CONVERSA)
    VALUES ('46975897859' , '44455566677', '2019-12-12 11:11:11-03', './chat_logs/2019-12-12_11:11:11-03.log');

-- IMOVEL
-- Marcelo Agiota - Proprietario
INSERT INTO IMOVEL (RUA, NUMERO, COMPLEMENTO, BAIRRO, CEP, CIDADE, LOCADOR, EH_PROPRIETARIO, PRECO, AREA, NRO_QUARTOS, NRO_SALAS, NRO_BANHEIROS, DESCRICAO_GERAL) 
    VALUES ('Rua Jacinto Favoreto', 573, 'apto13', 'Lutfalla', '13560515', 'São Carlos', '47495856882', TRUE, 900.0, 100.0, 2, 1, 1, 'Apartamento primeiro andar, ótimo estado e com mobília. Vem com vaga no térreo');
-- Carlos Bife - Proprietário
INSERT INTO IMOVEL (RUA, NUMERO, COMPLEMENTO, BAIRRO, CEP, CIDADE, LOCADOR, EH_PROPRIETARIO, PRECO, AREA, NRO_QUARTOS, NRO_SALAS, NRO_BANHEIROS, DESCRICAO_GERAL)
    VALUES ('Rua Jacinto Favoreto', 512, 'Apto 51', 'Jardim Lutfalla', '13560515','Sao Carlos','48121548421',TRUE, 1400.0, 90.0, 2, 1, 1, 'Apartamento novo, ultimo andar, de frente com o Campus I da USP de São Carlos, vem com vaga de garagem e sem mobília');
-- 
INSERT INTO IMOVEL (RUA, NUMERO, COMPLEMENTO, BAIRRO, CEP, CIDADE, LOCADOR, EH_PROPRIETARIO, PRECO, AREA, NRO_QUARTOS, NRO_SALAS, NRO_BANHEIROS, DESCRICAO_GERAL)
    VALUES ('Rua Jacinto Favoreto', 512, 'Apto 51', 'Jardim Lutfalla', '13560515','Sao Carlos','48487098819',FALSE, 1400.0, 90.0, 2, 1, 1, 'Apartamento novo, com duas vagas. Dois quartos muito bons para estudantes devido a otima localização.');

-- FOTO_IMOVEL

INSERT INTO FOTO_ALUGUEL (ID_IMOVEL, PATH_FOTO) 
    VALUES (1,'.\photos/imovel/1.1');

INSERT INTO FOTO_ALUGUEL (ID_IMOVEL, PATH_FOTO) 
    VALUES (1,'.\photos/imovel/1.2');

INSERT INTO FOTO_ALUGUEL (ID_IMOVEL, PATH_FOTO) 
    VALUES (1,'.\photos/imovel/1.3');

INSERT INTO FOTO_ALUGUEL (ID_IMOVEL, PATH_FOTO) 
    VALUES (2,'.\photos/imovel/2.1');

INSERT INTO FOTO_ALUGUEL (ID_IMOVEL, PATH_FOTO) 
    VALUES (2,'.\photos/imovel/2.2');

INSERT INTO FOTO_ALUGUEL (ID_IMOVEL, PATH_FOTO) 
    VALUES (2,'.\photos/imovel/2.3');

INSERT INTO FOTO_ALUGUEL (ID_IMOVEL, PATH_FOTO) 
    VALUES (2,'.\photos/imovel/2.4');

INSERT INTO FOTO_ALUGUEL (ID_IMOVEL, PATH_FOTO) 
    VALUES (3,'.\photos/imovel/3.1');

INSERT INTO FOTO_ALUGUEL (ID_IMOVEL, PATH_FOTO) 
    VALUES (3,'.\photos/imovel/3.2');

-- ALUGUEL 

INSERT INTO ALUGUEL (CLIENTE, ID_IMOVEL, DATA_INICIO, DATA_TERMINO, DURACAO, DESCRICAO, CUSTO_RESCISAO_INTEGRAL) 
    VALUES ()

-- VAGA

INSERT INTO VAGA (ID_IMOVEL, NUMERO_VAGA, DESCRICAO, PRECO)
    VALUES()

-- FOTO_VAGA

INSERT INTO FOTO_VAGA ( ID_IMOVEL, NUMERO_VAGA, PATH_FOTO)
    VALUES()

-- ACORDO

INSERT INTO ACORDO ( CLIENTE, ID_IMOVEL, NUMERO_VAGA, DATA_INICIO, DATA_TERMINO, DURACAO, TERMOS, CUSTO_RECISAO_ORIGINAL)
    VALUES()

-- PRESTADOR_SERVICO

INSERT INTO PRESTADOR_SERVICO ( NEGOCIANTE, CNH, EH_MONTADOR, TEMPO_EXP_MONT, TEMPO_EXP_TRANSP)
    VALUES()

-- SERVICO

INSERT INTO SERVICO (CLIENTE, PRESTADOR_SERVICO, DATA_HORA, TEMPO_ESTIMADO)
    VALUES()

-- VEICULO

INSERT INTO VEICULO (PLACA, PRESTADOR, MARCA, MODELO, ANO, NRO_EIXOS, CAPACIDADE, FOTO1, FOTO2, FOTO3, FOTO4)
    VALUES()

-- PRODUTO

INSERT INTO PRODUTO (ID, VENDEDOR, NOME, MARCA, TIPO, QTD_ESTOQUE, PRECO, TEMPO_USO, ESTADO, DESCRICAO_GERAL, MATERIAL, REVESTIMENTO, VOLTAGEM, POTENCIA, VIDA_UTIL, EFICIENCIA_ENERGETICA, FOTO1, FOTO2, FOTO3, FOTO4)
    VALUES()

-- VENDA

INSERT INTO VENDA (CLIENTE, PRODUTO, DATA_HORA, QUANTIDADE, VALOR_TOTAL)
    VALUES()


