-- File used for populating the database with test data.

/* ================================= CLIENTE ================================= */

-- Joao
INSERT INTO CLIENTE (CPF, EMAIL, DATA_INSCRICAO, NOME, TELEFONE, DATA_NASCIMENTO, SENHA, FOTO, AVALIACAO_GERAL)
    VALUES ('48487098819', 'joaoramosj@outlook.com', '2016-10-20 21:08:24-05', 'Joao Vitor Silva Ramos', '17996698335', '2000-08-06', 'senha123', './photos/joao.jpeg', NULL);
-- Vitor
INSERT INTO CLIENTE (CPF, EMAIL, DATA_INSCRICAO, NOME, TELEFONE, DATA_NASCIMENTO, SENHA, FOTO, AVALIACAO_GERAL)
    VALUES ('49061357810', 'vitorsan@bd.com', '2018-08-21 22:08:25-03', 'Vitor Santana Cordeiro', '11947836937', '2000-09-20', 'vamopobackvitao', './photos/vitor.jpeg', 4.5);
-- Marcelo 
INSERT INTO CLIENTE (CPF, EMAIL, DATA_INSCRICAO, NOME, TELEFONE, DATA_NASCIMENTO, SENHA, FOTO, AVALIACAO_GERAL)
    VALUES ('47495856882', 'marcelo@hotmail.com', '2016-09-22 22:05:12-03', 'Marcelo Moraes', '17996698335', '1999-07-15', 'fullstacko','./photos/marcelo.jpeg', 5.00);
-- Giovani
INSERT INTO CLIENTE (CPF, EMAIL, DATA_INSCRICAO, NOME, TELEFONE, DATA_NASCIMENTO, SENHA, FOTO, AVALIACAO_GERAL)
    VALUES ('46975897859', 'giovanilucafo@gmail.com', '2015-07-21 16:07:32-03', 'Giovani Decico Lucafo','19981216021','1900-09-26', 'coxinha26091997','./photos/giovani.jpeg', 4.20);
-- Craque Neto
INSERT INTO CLIENTE (CPF, EMAIL, DATA_INSCRICAO, NOME, TELEFONE, DATA_NASCIMENTO, SENHA, FOTO, AVALIACAO_GERAL)
    VALUES ('11111111111', 'craqueneto10@gmail.com', '2014-12-10 21:13:33-03', 'José Ferreira Neto','11999999999','1966-09-09', 'cabelodeboneca', './photos/craque_neto.jpeg', 2.0);


/* ================================= NEGOCIANTE ================================= */

-- Joao (Locador, Vendedor)
INSERT INTO NEGOCIANTE (CPF, EMAIL, DATA_INSCRICAO, NOME, TELEFONE, DATA_NASCIMENTO, SENHA, FOTO, AVALIACAO_GERAL, EH_PRESTADOR, EH_LOCADOR, EH_VENDEDOR)
    VALUES ('48487098819', 'joaoramosj@outlook.com', '2016-10-20 22:08:24-05', 'Joao Vitor Silva Ramos', '17996698335', '2000-08-06', 'senha123', './photos/joao.jpeg', NULL, FALSE, TRUE, TRUE);
-- Craque Neto (Locador, Vendedor)
INSERT INTO NEGOCIANTE (CPF, EMAIL, DATA_INSCRICAO, NOME, TELEFONE, DATA_NASCIMENTO, SENHA, FOTO, AVALIACAO_GERAL, EH_PRESTADOR, EH_LOCADOR, EH_VENDEDOR)
    VALUES ('11111111111', 'craqueneto10@gmail.com', '2014-12-10 21:50:53-03', 'José Ferreira Neto','11999999999','1966-09-09', 'cabelodeboneca', './photos/craque_neto.jpeg', 4.0, FALSE, TRUE, TRUE);
-- Kasalbe (Locador)
INSERT INTO NEGOCIANTE (CPF, EMAIL, DATA_INSCRICAO, NOME, TELEFONE, DATA_NASCIMENTO, SENHA, FOTO, AVALIACAO_GERAL, EH_PRESTADOR, EH_LOCADOR, EH_VENDEDOR)
    VALUES ('44455566677', 'kasalbe@usp.br', '2014-07-12 10:01:46-03', 'Otávio Polozzi Rodrigues', '1691234785', '1998-08-20', 'repsantacasa', './photos/kasalbe.jpeg', 3.8, FALSE, TRUE, FALSE);
-- Marcelo (Prestador, Locador, Vendedor)
INSERT INTO NEGOCIANTE (CPF, EMAIL, DATA_INSCRICAO, NOME, TELEFONE, DATA_NASCIMENTO, SENHA, FOTO, AVALIACAO_GERAL, EH_PRESTADOR, EH_LOCADOR, EH_VENDEDOR)
    VALUES ('47495856882', 'marcelo@hotmail.com', '2016-09-22 23:05:12-03', 'Marcelo Moraes', '17996698335', '1999-07-15', 'fullstacko','./photos/marcelo.jpeg', 1.00, TRUE, TRUE, TRUE);
-- Carlos Bife (Prestador)
INSERT INTO NEGOCIANTE (CPF, EMAIL, DATA_INSCRICAO, NOME, TELEFONE, DATA_NASCIMENTO, SENHA, FOTO, AVALIACAO_GERAL, EH_PRESTADOR, EH_LOCADOR, EH_VENDEDOR)
    VALUES ('48121548421', 'carlosbife@hotmail.com', '2010-01-30 23:04:59-03', 'Carlos Bife', '19855515658', '1982-04-22', 'truco','./photos/bife.jpeg', 2.55, TRUE, FALSE, FALSE);
-- Jorjao Montador (Prestador, Locador, Vendedor)
INSERT INTO NEGOCIANTE (CPF, EMAIL, DATA_INSCRICAO, NOME, TELEFONE, DATA_NASCIMENTO, SENHA, FOTO, AVALIACAO_GERAL, EH_PRESTADOR, EH_LOCADOR, EH_VENDEDOR)
    VALUES ('22222222222', 'jorjao_mont@uol.com', '2009-05-24 23:04:59-03', 'Jorjão Montador', '19866614557', '1968-04-02', 'truco','./photos/jorjao_montador.jpeg', 3, TRUE, TRUE, TRUE);
-- Joao2 (Vendedor) 
INSERT INTO NEGOCIANTE (CPF, EMAIL, DATA_INSCRICAO, NOME, TELEFONE, DATA_NASCIMENTO, SENHA, FOTO, AVALIACAO_GERAL, EH_PRESTADOR, EH_LOCADOR, EH_VENDEDOR)
    VALUES ('33333333333', 'joao2@uol.com', '2009-05-24 23:04:59-03', 'Joao Vitor Silva Ramos', '19866614557', '1968-04-02', 'novasenha','./photos/joao2.jpeg', 4.5, FALSE, FALSE, TRUE);


/* ================================= AVALIACAO ================================= */

-- Cliente [?] Negociante: direcao da avaliacao definida pelo booleano "VEM_DO_CLIENTE" 

-- Joao -> Carlos Bife
INSERT INTO AVALIACAO (CLIENTE, NEGOCIANTE, DATA_HORA, TEXTO, RESPOSTA, VEM_DO_CLIENTE, NOTA)
    VALUES ('48487098819', '48121548421', '2019-07-21 16:07:32-03', 'Queria mudar de casa e contratei o Carlos, mas ele demorou muito pra realizar o serviço. Além disso, vi ele jogando truco no posto no horário do serviço','O que vem de baixo nao me atinge seu esquerdista, impedindo que eu me divirta, vai pra cuba se nao quer vida boa', TRUE, 1.00); 
-- Giovani -> Marcelo 
INSERT INTO AVALIACAO (CLIENTE, NEGOCIANTE, DATA_HORA, TEXTO, RESPOSTA, VEM_DO_CLIENTE, NOTA)
    VALUES ('46975897859', '47495856882', '2019-10-21 16:10:42-03', 'Contratei o marcelo para arrumar meu armário, porém descobri depois que ele era  e ele veio com uns papo de pagar umas conta pra mim meio estranho, e no fim das contas meu armario fico tudo torto', 'Logico, vc me deve 30k em emprestimos, ja se esqueceu que sua hillux nao veio do suor do seu trabalho?', TRUE, 0.5);
-- Marcelo -> Joao
INSERT INTO AVALIACAO (CLIENTE, NEGOCIANTE, DATA_HORA, TEXTO, RESPOSTA, VEM_DO_CLIENTE, NOTA)
    VALUES ('47495856882', '48487098819', '2019-10-09 22:08:24-05', 'Esse joao é muito ruim, queria comprar um liquidificador dele, porém ele mora mais longe que onde o judas perdeu as botas','Calunia! Fernandopolis eh a metropole do futuro', TRUE, 2.40);
-- Vitor -> Craque Neto   
INSERT INTO AVALIACAO (CLIENTE, NEGOCIANTE, DATA_HORA, TEXTO, RESPOSTA, VEM_DO_CLIENTE, NOTA)
    VALUES ('49061357810', '11111111111', '2018-10-22 20:10:12-03', 'Esse Craque Neto é um zé ruela!! Um oreiúdo!!! Ele num corre! VAI PERDER O CAMPEONATO PRO PALMEIRAAAS!!!!!', 'CÊ TÁ DE BRINCADEIRA!!!', TRUE, 0.0);
-- Vitor <- Craque Neto    
INSERT INTO AVALIACAO (CLIENTE, NEGOCIANTE, DATA_HORA, TEXTO, RESPOSTA, VEM_DO_CLIENTE, NOTA)
    VALUES ('49061357810', '11111111111', '2018-10-23 20:11:10-03', 'ESSE CABELU DI BUNECA ME AVALIOU MAL!! COLOCOU 0 ESTRELAS PRA MIM SENDO QUE EU FIZ O SERVIÇO CERTINHO! PALHAÇADA!!!', 'Para de chorar, Neto! Você fez um serviço horrível, se liga! Isso só mostra o quanto você é infantil', FALSE, 0.0);
-- Vitor <- Carlos Bife
INSERT INTO AVALIACAO (CLIENTE, NEGOCIANTE, DATA_HORA, TEXTO, RESPOSTA, VEM_DO_CLIENTE, NOTA)
    VALUES ('49061357810', '48121548421', '2019-10-20 20:08:12-05', 'Eu fui so fazer um trabalhinho na casa do vitor e ele nao parava de falar que ele era um estudante global sla.. acabou que o trabalho fico muito bem feito mas eu tava mesmo era com vtd de xinga ele', NULL, FALSE, 3.0);
-- Vitor <- Carlos Bife
INSERT INTO AVALIACAO (CLIENTE, NEGOCIANTE, DATA_HORA, TEXTO, RESPOSTA, VEM_DO_CLIENTE, NOTA)
    VALUES ('49061357810', '48121548421', '2019-08-20 20:08:12-05', 'O vitor se mostrou super atencioso! Foi otimo fazer servico com ele', 'Valeu Bifão!! Tamo junto :)', FALSE, 5.0);
-- Vitor -> Kasalbe
INSERT INTO AVALIACAO (CLIENTE, NEGOCIANTE, DATA_HORA, TEXTO, RESPOSTA, VEM_DO_CLIENTE, NOTA)
    VALUES ('49061357810', '44455566677', '2019-11-02 20:10:12-03', 'Aluguei uma vaga da Rep. Santa Casa com o Kasalbé e ele foi muito atencioso! Mandou tudo certinho e agilizou bastante o processo! Nota 100 :)', 'Obrigado Vitão!! Um prazer fazer negócios com você.', TRUE, 5.0);
-- Giovani -> Kasalbe
INSERT INTO AVALIACAO (CLIENTE, NEGOCIANTE, DATA_HORA, TEXTO, RESPOSTA, VEM_DO_CLIENTE, NOTA)
    VALUES ('46975897859', '44455566677', '2019-11-02 20:10:12-03', 'Aluguei uma vaga da Rep. Santa Casa com o Kasalbé e ele foi muito atencioso! Mandou tudo certinho e agilizou bastante o processo! Nota 100 :)', 'Obrigado Vitão!! Um prazer fazer negócios com você.', TRUE, 4.5);

/* ================================= DENUNCIA ================================= */

-- Cliente [?] Negociante: direcao da avaliacao definida pelo booleano "VEM_DO_CLIENTE" 

-- Marcelo <- Joao
INSERT INTO DENUNCIA (CLIENTE, NEGOCIANTE, DATA_HORA, TEXTO, RESPOSTA, VEM_DO_CLIENTE)
    VALUES ('47495856882', '48487098819','2019-08-20 16:07:32-03', 'Não pagou meus produtos, é um pilantra', 'Vai cair dia 15 o salário, eu vou te pagar ;)', FALSE);
-- Vitor -> Craque Neto
INSERT INTO DENUNCIA (CLIENTE, NEGOCIANTE, DATA_HORA, TEXTO, RESPOSTA, VEM_DO_CLIENTE)
    VALUES ('49061357810', '11111111111', '2018-10-24 12:15:30-03', 'É um safado. Me vendeu um produto e depois me avaliou mal porque falei umas verdades na cara dele! Um usuário ridículo, deveria ser banido.', NULL, TRUE);
-- Joao -> Marcelo 
INSERT INTO DENUNCIA (CLIENTE, NEGOCIANTE, DATA_HORA, TEXTO, RESPOSTA, VEM_DO_CLIENTE)
    VALUES ('48487098819', '47495856882', '2018-8-10 8:45:23-03', 'Esse joao me roubou, comprou a minha cadeira de praia favorita mas nao me pagou!', 'Achado nao eh roubado :)', FALSE);
-- Giovani -> Carlos Bife    
INSERT INTO DENUNCIA (CLIENTE, NEGOCIANTE, DATA_HORA, TEXTO, RESPOSTA, VEM_DO_CLIENTE)
    VALUES ('46975897859', '48121548421', '2019-1-30 11:11:11-03', 'Esse cara é um machista, fico contando umas historia dessa vida porca dele no meio do serviço e eu senti a obrigação de expor esse palhaço', NULL, TRUE);


/* ================================= CONVERSA ================================= */

-- Joao e Carlos Bife
INSERT INTO CONVERSA (CLIENTE, NEGOCIANTE, DATA_HORA, LOG_CONVERSA)
    VALUES ('48487098819', '48121548421', '2019-07-17 16:07:32-03', './chat_logs/2019-07-17_16:07:32-03.log');
-- Vitor e Craque Neto
INSERT INTO CONVERSA (CLIENTE, NEGOCIANTE, DATA_HORA, LOG_CONVERSA)
    VALUES ('49061357810', '11111111111', '2018-10-28 22:08:10-03', './chat_logs/2018-10-28_22:08:10-03.log');
-- Marcelo e Carlos Bife
INSERT INTO CONVERSA (CLIENTE, NEGOCIANTE, DATA_HORA, LOG_CONVERSA)
    VALUES ('47495856882', '48121548421', '2018-02-11 09:12:43-03', './chat_logs/2018-02-11_09:12:43-03.log');
-- Giovani e Kazalbe  
INSERT INTO CONVERSA (CLIENTE, NEGOCIANTE, DATA_HORA, LOG_CONVERSA)
    VALUES ('46975897859' , '44455566677', '2019-12-12 11:11:11-03', './chat_logs/2019-12-12_11:11:11-03.log');


/* ================================= IMOVEL ================================= */

-- Marcelo - Proprietario
INSERT INTO IMOVEL (RUA, NUMERO, COMPLEMENTO, BAIRRO, CEP, CIDADE, LOCADOR, EH_PROPRIETARIO, PRECO, AREA, NRO_QUARTOS, NRO_SALAS, NRO_BANHEIROS, DESCRICAO_GERAL) 
    VALUES ('Rua Jacinto Favoreto', 573, 'apto 13', 'Jardim Lutfalla', '13560515', 'São Carlos', '47495856882', TRUE, 900.0, 100.0, 2, 1, 1, 'Apartamento primeiro andar, ótimo estado e com mobília. Vem com vaga no térreo');
-- Carlos Bife - Proprietario
INSERT INTO IMOVEL (RUA, NUMERO, COMPLEMENTO, BAIRRO, CEP, CIDADE, LOCADOR, EH_PROPRIETARIO, PRECO, AREA, NRO_QUARTOS, NRO_SALAS, NRO_BANHEIROS, DESCRICAO_GERAL)
    VALUES ('Rua Jacinto Favoreto', 512, 'Apto 51', 'Jardim Lutfalla', '13560515','São Carlos','48121548421',TRUE, 1400.0, 90.0, 2, 1, 1, 'Apartamento novo, ultimo andar, de frente com o Campus I da USP de São Carlos, vem com vaga de garagem e sem mobília');
-- Craque Neto - Não proprietario
INSERT INTO IMOVEL (RUA, NUMERO, COMPLEMENTO, BAIRRO, CEP, CIDADE, LOCADOR, EH_PROPRIETARIO, PRECO, AREA, NRO_QUARTOS, NRO_SALAS, NRO_BANHEIROS, DESCRICAO_GERAL)
    VALUES ('Rua Jacinto Favoreto', 512, 'Apto 51', 'Jardim Lutfalla', '13560515','São Carlos','11111111111',FALSE, 1400.0, 90.0, 2, 1, 1, 'Apartamento novo, com duas vagas. Dois quartos muito bons para estudantes devido a otima localização.');
-- Kasalbe - Proprietario    
INSERT INTO IMOVEL (RUA, NUMERO, COMPLEMENTO, BAIRRO, CEP, CIDADE, LOCADOR, EH_PROPRIETARIO, PRECO, AREA, NRO_QUARTOS, NRO_SALAS, NRO_BANHEIROS, DESCRICAO_GERAL)
    VALUES ('Rua Episcopal', 2220, NULL, 'Centro', '11111111', 'São Carlos','44455566677', TRUE, 2399.99, 108.9, 4, 2, 2, 'Casa historica reformada para abrigar uma nova familia! Otimo estado e mobilias recem compradas! Venha morar na historia!');
-- Joao - Não proprietario
INSERT INTO IMOVEL (RUA, NUMERO, COMPLEMENTO, BAIRRO, CEP, CIDADE, LOCADOR, EH_PROPRIETARIO, PRECO, AREA, NRO_QUARTOS, NRO_SALAS, NRO_BANHEIROS, DESCRICAO_GERAL)
    VALUES ('Rua Episcopal', 2220, NULL, 'Centro', '11111111', 'São Carlos','48487098819', FALSE, 2399.99, 108.9, 4, 2, 2, 'Nova Republica Saint Charles: Casa com bastante espaço, 4 quartos com um cachorro, o flasco #MoreEmRep');


/* ================================= FOTO_IMOVEL ================================= */

-- Formato do Path (./photos/imovel/[idimovel].[numero_foto]) 

-- Imovel do Marcelo
INSERT INTO FOTO_IMOVEL (ID_IMOVEL, PATH_FOTO) 
    VALUES (1,'./photos/imovel/1.1');
-- Imovel do Marcelo
INSERT INTO FOTO_IMOVEL (ID_IMOVEL, PATH_FOTO) 
    VALUES (1,'./photos/imovel/1.2');
-- Imovel do Marcelo
INSERT INTO FOTO_IMOVEL (ID_IMOVEL, PATH_FOTO) 
    VALUES (1,'./photos/imovel/1.3');
-- Imovel do Carlos Bife
INSERT INTO FOTO_IMOVEL (ID_IMOVEL, PATH_FOTO) 
    VALUES (2,'./photos/imovel/2.1');
-- Imovel do Carlos Bife
INSERT INTO FOTO_IMOVEL (ID_IMOVEL, PATH_FOTO) 
    VALUES (2,'./photos/imovel/2.2');
-- Imovel do Carlos Bife
INSERT INTO FOTO_IMOVEL (ID_IMOVEL, PATH_FOTO) 
    VALUES (2,'./photos/imovel/2.3');
-- Imovel do Carlos Bife
INSERT INTO FOTO_IMOVEL (ID_IMOVEL, PATH_FOTO) 
    VALUES (2,'./photos/imovel/2.4');
-- Imovel do Craque Neto
INSERT INTO FOTO_IMOVEL (ID_IMOVEL, PATH_FOTO) 
    VALUES (3,'./photos/imovel/3.1');
-- Imovel do Craque Neto
INSERT INTO FOTO_IMOVEL (ID_IMOVEL, PATH_FOTO) 
    VALUES (3,'./photos/imovel/3.2');
-- Imovel do Kasalbe
INSERT INTO FOTO_IMOVEL (ID_IMOVEL, PATH_FOTO)
    VALUES (4,'./photos/imovel/4.1');
-- Imovel do Kasalbe
INSERT INTO FOTO_IMOVEL (ID_IMOVEL, PATH_FOTO)
    VALUES (4,'./photos/imovel/4.2');
-- Imovel do Kasalbe
INSERT INTO FOTO_IMOVEL (ID_IMOVEL, PATH_FOTO)
    VALUES (4,'./photos/imovel/4.3');
-- Imovel do Joao
INSERT INTO FOTO_IMOVEL (ID_IMOVEL, PATH_FOTO)
    VALUES (5,'./photos/imovel/5.1');
-- Imovel do Joao
INSERT INTO FOTO_IMOVEL (ID_IMOVEL, PATH_FOTO)
    VALUES (5,'./photos/imovel/5.2');
-- Imovel do Joao
INSERT INTO FOTO_IMOVEL (ID_IMOVEL, PATH_FOTO)
    VALUES (5,'./photos/imovel/5.3');
-- Imovel do Joao
INSERT INTO FOTO_IMOVEL (ID_IMOVEL, PATH_FOTO)
    VALUES (5,'./photos/imovel/5.4');
-- Imovel do Joao
INSERT INTO FOTO_IMOVEL (ID_IMOVEL, PATH_FOTO)
    VALUES (5,'./photos/imovel/5.5');


/* ================================= ALUGUEL ================================= */

-- Giovani alugando APARTAMENTO de Marcelo (proprietario)
INSERT INTO ALUGUEL (CLIENTE, ID_IMOVEL, DATA_INICIO, DATA_TERMINO, DURACAO, DESCRICAO, CUSTO_RESCISAO_INTEGRAL) 
    VALUES ('46975897859', 1, '2018-10-01 07:12:10-03', '2019-10-01 07:12:10-03', 'P1Y', 'Aluguel - Minimo 1 ano de aluguel - 900 reais/mes incluso gás',10800.0);
-- Craque Neto alugando APARTAMENTO de Carlos Bife (proprietario)
INSERT INTO ALUGUEL (CLIENTE, ID_IMOVEL, DATA_INICIO, DATA_TERMINO, DURACAO, DESCRICAO, CUSTO_RESCISAO_INTEGRAL) 
    VALUES ('11111111111', 2, '2018-02-02 04:05:05-03', NULL, NULL, 'Aluguel - Minimo 1 ano de aluguel - 1400 reais/mes incluso gás',20000.0);
-- Joao alugando APARTAMENTO de Kasalbe (proprietario)
INSERT INTO ALUGUEL (CLIENTE, ID_IMOVEL, DATA_INICIO, DATA_TERMINO, DURACAO, DESCRICAO, CUSTO_RESCISAO_INTEGRAL) 
    VALUES ('48487098819', 4, '2018-02-02 04:05:05-03', NULL, NULL, 'Aluguel - Minimo 1 ano de aluguel - 2399.99 reais/mes incluso gás',400000);


/* =================================== VAGA =================================== */

-- Craque Neto anunciando Vaga[1] do APARTAMENTO que alugou de Carlos Bife
INSERT INTO VAGA (ID_IMOVEL, NUMERO_VAGA, DESCRICAO, PRECO)
    VALUES(3, 1, 'Primeiro quarto à esquerda no corredor principal - possui uma cama', 1300.0);
-- Craque Neto anunciando Vaga[2] do APARTAMENTO que alugou de Carlos Bife
INSERT INTO VAGA (ID_IMOVEL, NUMERO_VAGA, DESCRICAO, PRECO)
    VALUES(3, 2, 'Primeiro quarto à direita no corredor principal - possui uma cama e um armario',1400.0);
-- Craque Neto anunciando Vaga[3] do APARTAMENTO que alugou de Carlos Bife
INSERT INTO VAGA (ID_IMOVEL, NUMERO_VAGA, DESCRICAO, PRECO)
    VALUES(3, 3, 'Segundo quarto à direita no corredor principal - possui uma cama e um console', 1600.0);
-- Joao anunciando Vaga[1] da CASA que alugou de Kasalbe
INSERT INTO VAGA (ID_IMOVEL, NUMERO_VAGA, DESCRICAO, PRECO)
    VALUES(5, 1, 'Quarto localizado na parte externa da casa, perto da chorrasqueira', 600.0);
-- Joao anunciando Vaga[2] da CASA que alugou de Kasalbe
INSERT INTO VAGA (ID_IMOVEL, NUMERO_VAGA, DESCRICAO, PRECO)
    VALUES(5, 2, 'Quarto localizado na parte interna da casa, perto da cozinha', 600.0);


/* ================================= FOTO_VAGA ================================= */

-- Formato do Path (./photos/vaga/[idimovel].[numerovaga].[numero_foto])

--Imovel[3] - Vaga[1] - 2 fotos
INSERT INTO FOTO_VAGA ( ID_IMOVEL, NUMERO_VAGA, PATH_FOTO)
    VALUES(3, 1,'./photos/vaga/3.1.1');
INSERT INTO FOTO_VAGA ( ID_IMOVEL, NUMERO_VAGA, PATH_FOTO)
    VALUES(3, 1,'./photos/vaga/3.1.2');

--Imovel[3] - Vaga[2] - 2 fotos
INSERT INTO FOTO_VAGA ( ID_IMOVEL, NUMERO_VAGA, PATH_FOTO)
    VALUES(3, 2,'./photos/vaga/3.2.1');
INSERT INTO FOTO_VAGA ( ID_IMOVEL, NUMERO_VAGA, PATH_FOTO)
    VALUES(3, 2,'./photos/vaga/3.2.2');

-- Imovel[5] - Vaga[1] - 3 fotos
INSERT INTO FOTO_VAGA ( ID_IMOVEL, NUMERO_VAGA, PATH_FOTO)
    VALUES(5, 1,'./photos/vaga/5.1.1');
INSERT INTO FOTO_VAGA ( ID_IMOVEL, NUMERO_VAGA, PATH_FOTO)
    VALUES(5, 1,'./photos/vaga/5.1.2');
INSERT INTO FOTO_VAGA ( ID_IMOVEL, NUMERO_VAGA, PATH_FOTO)
    VALUES(5, 1,'./photos/vaga/5.1.3');

-- Imovel[5] - Vaga[2] - 1 foto
INSERT INTO FOTO_VAGA ( ID_IMOVEL, NUMERO_VAGA, PATH_FOTO)
    VALUES(3, 2,'./photos/vaga/5.2.1');


/* ================================= ACORDO ================================== */

-- Vitor alugando VAGA [1] de Craque Neto
INSERT INTO ACORDO ( CLIENTE, ID_IMOVEL, NUMERO_VAGA, DATA_INICIO, DATA_TERMINO, DURACAO, TERMOS, CUSTO_RECISAO_ORIGINAL)
    VALUES('49061357810', 3, 1, '2019-12-02 01:01:01-03', '2020-01-02 01:01:01-03', 'P1M' ,'Manter a limpeza do proprio quarto e respeitar as regras da republica', NULL);
-- Marcelo alugando VAGA [2] de Craque Neto
INSERT INTO ACORDO ( CLIENTE, ID_IMOVEL, NUMERO_VAGA, DATA_INICIO, DATA_TERMINO, DURACAO, TERMOS, CUSTO_RECISAO_ORIGINAL)
    VALUES('47495856882', 3, 2, '2020-01-01 01:01:01-03', '2020-03-11 01:01:01-03', 'P2M10D' ,'Manter a limpeza do proprio quarto, respeitar as regras da republica e acima de tudo que o alcool esteja com voce', NULL); 


/* ============================= PRESTADOR_SERVICO ============================= */

-- Jorjao, Marcelo e Carlos Bife

--Jorjao cadastrado como MONTADOR só
INSERT INTO PRESTADOR_SERVICO ( NEGOCIANTE, CNH, EH_MONTADOR, TEMPO_EXP_MONT, TEMPO_EXP_TRANSP)
    VALUES('22222222222', NULL, TRUE, 'P20Y' , NULL);

--Marcelo cadastrado como TRANSPORTADOR só
INSERT INTO PRESTADOR_SERVICO ( NEGOCIANTE, CNH, EH_MONTADOR, TEMPO_EXP_MONT, TEMPO_EXP_TRANSP)
    VALUES('47495856882', '12345678910', FALSE, NULL, 'P2Y');

--Carlos Bife cadastrado como TRANSPORTADOR e MONTADOR
INSERT INTO PRESTADOR_SERVICO ( NEGOCIANTE, CNH, EH_MONTADOR, TEMPO_EXP_MONT, TEMPO_EXP_TRANSP)
    VALUES('48121548421','62849698919', TRUE, 'P10Y10M24D', 'P5Y6M');


/* ================================= SERVICO ================================= */

-- Joao contratou serviço de Carlos Bife
INSERT INTO SERVICO (CLIENTE, PRESTADOR_SERVICO, DATA_HORA, TEMPO_ESTIMADO)
    VALUES('48487098819', '48121548421','2019-07-21 14:07:32-03', 'PT1H');
-- Giovani contratou servico de Marcelo
INSERT INTO SERVICO (CLIENTE, PRESTADOR_SERVICO, DATA_HORA, TEMPO_ESTIMADO)
    VALUES('46975897859', '47495856882', '2019-10-21 10:10:42-03', 'PT2H');
-- Vitor contratou servico de Jorjao Montador
INSERT INTO SERVICO (CLIENTE, PRESTADOR_SERVICO, DATA_HORA, TEMPO_ESTIMADO)
    VALUES('49061357810', '22222222222', '2020-05-08 01:01:01-03', 'PT1H');
-- TESTE LINHA 40
-- Vitor contratou servico de Jorjao Montador
INSERT INTO SERVICO (CLIENTE, PRESTADOR_SERVICO, DATA_HORA, TEMPO_ESTIMADO)
    VALUES('49061357810', '22222222222', '2020-06-08 01:01:01-03', 'PT2H');


/* ============================= VEICULO_INFO ================================ */

INSERT INTO VEICULO_INFO (MODELO, ANO, NRO_EIXOS, CAPACIDADE)
    VALUES('Gol', 2000, 2, 150.0);
INSERT INTO VEICULO_INFO (MODELO, ANO, NRO_EIXOS, CAPACIDADE)
    VALUES('Uno Mile', 1999, 1, 100.0);
INSERT INTO VEICULO_INFO (MODELO, ANO, NRO_EIXOS, CAPACIDADE)
    VALUES('Fusca', 1980, 1, 80.0);
    
    
/* ================================ VEICULO ================================== */

-- Formato do Path (./photos/vehicles/[Placa_veiculo]-[Numero_foto].jpeg)

-- Veiculo do Marcelo (Transportador)
INSERT INTO VEICULO (PLACA, PRESTADOR, MARCA, MODELO, ANO, FOTO1, FOTO2, FOTO3, FOTO4)
    VALUES('ADE9123','47495856882', 'Volkswagen', 'Gol', 2000, './photos/vehicles/ade9123-1.jpeg', './photos/vehicles/ade9123-2.jpeg', './photos/vehicles/ade9123-3.jpeg', './photos/vehicles/ade9123-4.jpeg');
-- Veiculo do Carlos Bife (Transportador)
INSERT INTO VEICULO (PLACA, PRESTADOR, MARCA, MODELO, ANO, FOTO1)
    VALUES('DEF8458', '48121548421', 'Fiat', 'Uno Mile', 1999, './photos/vehicles/def8458-1.jpeg');
-- Veiculo do Carlos Bife (Transportador)
INSERT INTO VEICULO (PLACA, PRESTADOR, MARCA, MODELO, ANO, FOTO1, FOTO2)
    VALUES('CAB1283', '48121548421', 'Volkswagen', 'Fusca', 1980, './photos/vehicles/cab1283-1.jpeg','./photos/vehicles/cab1283-2.jpeg');    


/* ================================= PRODUTO ================================= */

-- Joao
INSERT INTO PRODUTO (VENDEDOR, NOME, MARCA, TIPO, QTD_ESTOQUE, PRECO, TEMPO_USO, ESTADO, DESCRICAO_GERAL, MATERIAL, REVESTIMENTO, VOLTAGEM, POTENCIA, VIDA_UTIL, EFICIENCIA_ENERGETICA, FOTO1, FOTO2, FOTO3, FOTO4)
    VALUES('48487098819', 'Geladeira', 'Brastemp', 'Eletrodomestico', 5, 500.00, 'P1Y', 'NOVO', 'Geladeira 2 portas, com freezer', NULL, NULL, 100, 200,'P5Y', 'E', './photos/products/joao/1', NULL, NULL, NULL);
-- Joao
INSERT INTO PRODUTO (VENDEDOR, NOME, MARCA, TIPO, QTD_ESTOQUE, PRECO, TEMPO_USO, ESTADO, DESCRICAO_GERAL, MATERIAL, REVESTIMENTO, VOLTAGEM, POTENCIA, VIDA_UTIL, EFICIENCIA_ENERGETICA, FOTO1, FOTO2, FOTO3, FOTO4)
    VALUES('48487098819', 'Mesa', 'Marabras', 'Mobilia', 5, 500.00, 'P1Y', 'NOVO', 'Mesa de carvalho esculpida à mão', 'Carvalho', NULL, NULL, NULL, NULL, NULL, './photos/products/joao/2', NULL, NULL, NULL);
-- Craque Neto    
INSERT INTO PRODUTO (VENDEDOR, NOME, MARCA, TIPO, QTD_ESTOQUE, PRECO, TEMPO_USO, ESTADO, DESCRICAO_GERAL, MATERIAL, REVESTIMENTO, VOLTAGEM, POTENCIA, VIDA_UTIL, EFICIENCIA_ENERGETICA, FOTO1, FOTO2, FOTO3, FOTO4)
    VALUES('11111111111', 'Armario2', 'Casas Bahia', 'Mobilia', 2, 500.00, 'P1M', 'NOVO', 'Armario com 10 gavetas', 'Pau Brasil', NULL, NULL, NULL, NULL, NULL, './photos/products/craqueneto/1', NULL, NULL, NULL);
-- Craque Neto
INSERT INTO PRODUTO (VENDEDOR, NOME, MARCA, TIPO, QTD_ESTOQUE, PRECO, TEMPO_USO, ESTADO, DESCRICAO_GERAL, MATERIAL, REVESTIMENTO, VOLTAGEM, POTENCIA, VIDA_UTIL, EFICIENCIA_ENERGETICA, FOTO1, FOTO2, FOTO3, FOTO4)
    VALUES('11111111111', 'Armario', 'Casas Bahia', 'Mobilia', 2, 500.00, 'P1M', 'NOVO', 'Armario com 10 gavetas', 'Pau Brasil', NULL, NULL, NULL, NULL, NULL, './photos/products/craqueneto/1', NULL, NULL, NULL);
-- Joao2
INSERT INTO PRODUTO (VENDEDOR, NOME, MARCA, TIPO, QTD_ESTOQUE, PRECO, TEMPO_USO, ESTADO, DESCRICAO_GERAL, MATERIAL, REVESTIMENTO, VOLTAGEM, POTENCIA, VIDA_UTIL, EFICIENCIA_ENERGETICA, FOTO1, FOTO2, FOTO3, FOTO4)
    VALUES('33333333333', 'Geladeira', 'Brastemp', 'Eletrodomestico', 5, 500.00, 'P1Y', 'NOVO', 'Geladeira 2 portas, com freezer', NULL, NULL, 100, 200,'P5Y', 'E', './photos/products/joao/1', NULL, NULL, NULL);
-- Joao2
INSERT INTO PRODUTO (VENDEDOR, NOME, MARCA, TIPO, QTD_ESTOQUE, PRECO, TEMPO_USO, ESTADO, DESCRICAO_GERAL, MATERIAL, REVESTIMENTO, VOLTAGEM, POTENCIA, VIDA_UTIL, EFICIENCIA_ENERGETICA, FOTO1, FOTO2, FOTO3, FOTO4)
    VALUES('33333333333', 'Microondas', 'Brastemp', 'Eletrodomestico', 3, 300.00, 'P1M', 'NOVO', 'Microondas novo funciona normal', NULL, NULL, 220, 100,'P10Y', 'A', './photos/products/joao/3', NULL, NULL, NULL);



/* =================================== VENDA =================================== */

-- CLIENTES
-- Vitor
INSERT INTO VENDA (CLIENTE, PRODUTO, DATA_HORA, QUANTIDADE, VALOR_TOTAL)
    VALUES('49061357810', 1, '2019-07-21 14:07:32-03', 1, 500.0);
-- Giovani
INSERT INTO VENDA (CLIENTE, PRODUTO, DATA_HORA, QUANTIDADE, VALOR_TOTAL)
    VALUES('46975897859', 2, '2019-07-22 14:07:32-03', 1, 400.0);
-- Vitor
INSERT INTO VENDA (CLIENTE, PRODUTO, DATA_HORA, QUANTIDADE, VALOR_TOTAL)
    VALUES('49061357810', 1, '2019-06-21 14:07:32-03', 1, 500.0);
-- Vitor
INSERT INTO VENDA (CLIENTE, PRODUTO, DATA_HORA, QUANTIDADE, VALOR_TOTAL)
    VALUES('49061357810', 1, '2019-08-21 14:07:32-03', 1, 500.0);
-- Vitor
INSERT INTO VENDA (CLIENTE, PRODUTO, DATA_HORA, QUANTIDADE, VALOR_TOTAL)
    VALUES('49061357810', 1, '2019-10-21 14:07:32-03', 1, 500.0);
-- Vitor
INSERT INTO VENDA (CLIENTE, PRODUTO, DATA_HORA, QUANTIDADE, VALOR_TOTAL)
    VALUES('49061357810', 1, '2019-11-21 14:07:32-03', 1, 500.0);
-- Vitor
INSERT INTO VENDA (CLIENTE, PRODUTO, DATA_HORA, QUANTIDADE, VALOR_TOTAL)
    VALUES('49061357810', 3, '2019-11-21 14:07:32-03', 1, 500.0);
-- Vitor
INSERT INTO VENDA (CLIENTE, PRODUTO, DATA_HORA, QUANTIDADE, VALOR_TOTAL)
    VALUES('49061357810', 6, '2019-11-21 14:07:32-03', 1, 300.0);