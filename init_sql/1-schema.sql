﻿-- File used for constructing the database schema.

CREATE TABLE CLIENTE (

	CPF CHAR(11),
	EMAIL VARCHAR(40) NOT NULL,
	-- Data e tempo 
	DATA_INSCRICAO TIMESTAMP DEFAULT NOW(),
	NOME VARCHAR(40) NOT NULL,
	-- DDD + numero
	TELEFONE VARCHAR(15),
	DATA_NASCIMENTO DATE,
	SENHA VARCHAR(64) NOT NULL,
	-- PATH da foto
	FOTO VARCHAR(100),
	AVALIACAO_GERAL FLOAT(2),

	CONSTRAINT PK_CLIENTE PRIMARY KEY (CPF),
	CONSTRAINT UNIQUE_CLIENTE UNIQUE(EMAIL),
	CONSTRAINT CK_AVALIACAO CHECK(AVALIACAO_GERAL BETWEEN 0.0 AND 5.0)
	
);

CREATE TABLE NEGOCIANTE (

	CPF CHAR(11),
	EMAIL VARCHAR(40) NOT NULL,
	-- Data e tempo 
	DATA_INSCRICAO TIMESTAMP DEFAULT NOW(),
	NOME VARCHAR(40) NOT NULL,
	-- DDD + numero
	TELEFONE VARCHAR(15),
	DATA_NASCIMENTO DATE,
	SENHA VARCHAR(64) NOT NULL,
	-- PATH da foto
	FOTO VARCHAR(100),
	AVALIACAO_GERAL FLOAT(2),
	EH_PRESTADOR BOOLEAN,
	EH_LOCADOR BOOLEAN,
	EH_VENDEDOR BOOLEAN,

	CONSTRAINT PK_NEGOCIANTE PRIMARY KEY (CPF),
	CONSTRAINT UNIQUE_NEGOCIANTE UNIQUE(EMAIL),
	CONSTRAINT CK_AVALIACAO CHECK(AVALIACAO_GERAL BETWEEN 0.0 AND 5.0)

);

CREATE TABLE AVALIACAO (

	CLIENTE CHAR(11),
	NEGOCIANTE CHAR(11),
	DATA_HORA TIMESTAMP DEFAULT NOW(),
	-- Normalmente nos sites é até 500
	TEXTO VARCHAR(500), 
	-- A palavra "Replica" é reservada no Postgres, então decidimos trocar o nome 
  -- do atributo por "Resposta" (que fica até melhor, na verdade)
	RESPOSTA VARCHAR(500),
	-- Decidimos trocar o nome desse atributo (que era "Remetente") por "Vem Do Cliente", 
  -- já que o último representa melhor a ideia que tinhamos para ele 
  -- (além de ficar mais semântico e, portanto, mais fácil de ler)
  -- Se for true, a avaliação é do cliente para o negociante
	VEM_DO_CLIENTE BOOLEAN NOT NULL,
	NOTA FLOAT(2) NOT NULL,

	CONSTRAINT PK_AVALIACAO PRIMARY KEY (CLIENTE, NEGOCIANTE, DATA_HORA),
	CONSTRAINT FK_AVALIACAO_CLIENTE FOREIGN KEY (CLIENTE) REFERENCES CLIENTE (CPF)
	 ON DELETE CASCADE, 
	CONSTRAINT FK_AVALIACAO_NEGOCIANTE FOREIGN KEY (NEGOCIANTE) REFERENCES NEGOCIANTE (CPF)
	 ON DELETE CASCADE,
	CONSTRAINT CK_NOTA CHECK(NOTA BETWEEN 0.0 AND 5.0)

);

CREATE TABLE DENUNCIA (

	CLIENTE CHAR(11),
	NEGOCIANTE CHAR(11),
	DATA_HORA TIMESTAMP DEFAULT NOW(),
	-- Normalmente nos sites é até 500
	TEXTO VARCHAR(500), 
	-- A palavra "Replica" é reservada no Postgres, então decidimos trocar o nome 
  -- do atributo por "Resposta" (que fica até melhor, na verdade)
	RESPOSTA VARCHAR(500),
  -- Decidimos trocar o nome desse atributo (que era "Remetente") por "Vem Do Cliente", 
  -- já que o último representa melhor a ideia que tinhamos para ele 
  -- (além de ficar mais semântico e, portanto, mais fácil de ler)
  -- Se for true, a denúncia é do cliente para o negociante
	VEM_DO_CLIENTE BOOLEAN NOT NULL,

	CONSTRAINT PK_DENUNCIA PRIMARY KEY (CLIENTE, NEGOCIANTE, DATA_HORA),
	CONSTRAINT FK_DENUNCIA_CLIENTE FOREIGN KEY (CLIENTE) REFERENCES CLIENTE (CPF)
	 ON DELETE CASCADE, 
	CONSTRAINT FK_DENUNCIA_NEGOCIANTE FOREIGN KEY (NEGOCIANTE) REFERENCES NEGOCIANTE (CPF)
	 ON DELETE CASCADE

);

CREATE TABLE CONVERSA (

	CLIENTE CHAR(11),
	NEGOCIANTE CHAR(11),
	-- TEM A DATA E A HORA 
	DATA_HORA TIMESTAMP DEFAULT NOW(),
	LOG_CONVERSA VARCHAR(100) NOT NULL,
	
	CONSTRAINT PK_CONVERSA PRIMARY KEY (CLIENTE, NEGOCIANTE, DATA_HORA),
	CONSTRAINT FK_CONVERSA_CLIENTE FOREIGN KEY (CLIENTE) REFERENCES CLIENTE (CPF)
	 ON DELETE CASCADE, 
	CONSTRAINT FK_CONVERSA_NEGOCIANTE FOREIGN KEY (NEGOCIANTE) REFERENCES NEGOCIANTE (CPF)
	 ON DELETE CASCADE

);

CREATE TABLE IMOVEL (

	ID SERIAL,
	RUA VARCHAR(20) NOT NULL,
	NUMERO INTEGER NOT NULL,
	COMPLEMENTO VARCHAR(10),
	BAIRRO VARCHAR(20) NOT NULL,
	CEP CHAR(8) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	LOCADOR CHAR(11) NOT NULL,
	EH_PROPRIETARIO BOOLEAN,
	PRECO FLOAT(2),
	AREA FLOAT,
	NRO_QUARTOS INTEGER,
	NRO_SALAS INTEGER,
	NRO_BANHEIROS INTEGER,
	DESCRICAO_GERAL VARCHAR(1024),

	CONSTRAINT PK_IMOVEL PRIMARY KEY (ID),
	CONSTRAINT FK_IMOVEL FOREIGN KEY (LOCADOR) REFERENCES NEGOCIANTE (CPF)
	 ON DELETE CASCADE,
	CONSTRAINT UNIQUE_IMOVEL UNIQUE (RUA, NUMERO, COMPLEMENTO, BAIRRO, CEP, CIDADE, LOCADOR)
	
);

CREATE TABLE FOTO_IMOVEL (

	ID_IMOVEL INTEGER,
	PATH_FOTO VARCHAR(100),

	CONSTRAINT PK_FOTO_IMOVEL PRIMARY KEY (ID_IMOVEL, PATH_FOTO),
	CONSTRAINT FK_FOTO_IMOVEL FOREIGN KEY (ID_IMOVEL) REFERENCES IMOVEL (ID)
	 ON DELETE CASCADE

);

CREATE TABLE ALUGUEL (

	CLIENTE CHAR(11),
	ID_IMOVEL INTEGER,
	DATA_INICIO TIMESTAMP,
	DATA_TERMINO TIMESTAMP,
	DURACAO INTERVAL,
	DESCRICAO VARCHAR(1024),
	CUSTO_RESCISAO_INTEGRAL FLOAT,

	CONSTRAINT PK_ALUGUEL PRIMARY KEY (CLIENTE, ID_IMOVEL, DATA_INICIO),
	CONSTRAINT FK_ALUGUEL_CLIENTE FOREIGN KEY (CLIENTE) REFERENCES CLIENTE (CPF)
	 ON DELETE CASCADE,
	CONSTRAINT FK_ALUGUEL_ID_IMOVEL FOREIGN KEY (ID_IMOVEL) REFERENCES IMOVEL (ID)
	 ON DELETE CASCADE
	
);

CREATE TABLE VAGA (

	ID_IMOVEL INTEGER,
	NUMERO_VAGA INTEGER,
	DESCRICAO VARCHAR(1024),
	PRECO FLOAT(2),

	CONSTRAINT PK_VAGA PRIMARY KEY (ID_IMOVEL, NUMERO_VAGA),
	CONSTRAINT FK_VAGA FOREIGN KEY (ID_IMOVEL) REFERENCES IMOVEL (ID)
	 ON DELETE CASCADE

);

CREATE TABLE FOTO_VAGA (

	ID_IMOVEL INTEGER,
	NUMERO_VAGA INTEGER,
	PATH_FOTO VARCHAR(100),

	CONSTRAINT PK_FOTO_VAGA PRIMARY KEY (ID_IMOVEL, NUMERO_VAGA, PATH_FOTO),
	CONSTRAINT FK_FOTO_VAGA FOREIGN KEY (ID_IMOVEL, NUMERO_VAGA) REFERENCES VAGA (ID_IMOVEL, NUMERO_VAGA)
	 ON DELETE CASCADE

);

CREATE TABLE ACORDO (

	CLIENTE CHAR(11),
	ID_IMOVEL INTEGER,
	NUMERO_VAGA INTEGER,
	DATA_INICIO TIMESTAMP,
	DATA_TERMINO TIMESTAMP,
	DURACAO INTERVAL,
	TERMOS TEXT,
	CUSTO_RECISAO_ORIGINAL FLOAT(2),

	CONSTRAINT PK_ACORDO PRIMARY KEY (CLIENTE, ID_IMOVEL, NUMERO_VAGA, DATA_INICIO),
	CONSTRAINT FK_ACORDO_CLIENTE FOREIGN KEY (CLIENTE) REFERENCES CLIENTE (CPF)
	 ON DELETE CASCADE,
	CONSTRAINT FK_ACORDO_VAGA FOREIGN KEY (ID_IMOVEL, NUMERO_VAGA) REFERENCES VAGA (ID_IMOVEL, NUMERO_VAGA)
	 ON DELETE CASCADE
	
);

CREATE TABLE PRESTADOR_SERVICO (

	NEGOCIANTE CHAR(11),
	CNH CHAR(11),
	EH_MONTADOR BOOLEAN,
	TEMPO_EXP_MONT INTERVAL,
	TEMPO_EXP_TRANSP INTERVAL,

	CONSTRAINT PK_PRESTADOR_SERVICO PRIMARY KEY (NEGOCIANTE),
	CONSTRAINT FK_PRESTADOR_SERVICO FOREIGN KEY (NEGOCIANTE) REFERENCES NEGOCIANTE (CPF)
	 ON DELETE CASCADE,
	CONSTRAINT UNIQUE_PRESTADOR_SERVICO UNIQUE (CNH)

);

CREATE TABLE SERVICO (

	CLIENTE CHAR(11),
	PRESTADOR_SERVICO CHAR(11),
	DATA_HORA TIMESTAMP,
	TEMPO_ESTIMADO INTERVAL,

	CONSTRAINT PK_SERVICO PRIMARY KEY (CLIENTE, PRESTADOR_SERVICO, DATA_HORA),
	CONSTRAINT FK_SERVICO_CLIENTE FOREIGN KEY (CLIENTE) REFERENCES CLIENTE (CPF)
	 ON DELETE CASCADE,
	CONSTRAINT FK_SERVICO_PRESTADOR FOREIGN KEY (PRESTADOR_SERVICO) REFERENCES PRESTADOR_SERVICO (NEGOCIANTE)
	 ON DELETE CASCADE

);

CREATE TABLE VEICULO_INFO (

	MODELO VARCHAR(42),
	ANO INTEGER,
	NRO_EIXOS INTEGER,
	CAPACIDADE FLOAT,

	CONSTRAINT PK_VEICULO_INFO PRIMARY KEY (MODELO, ANO)

);

CREATE TABLE VEICULO (

	PLACA CHAR(7),
	PRESTADOR CHAR(11) NOT NULL,
	MARCA VARCHAR(10),
	MODELO VARCHAR(42) NOT NULL,
	ANO INTEGER NOT NULL,
	FOTO1 VARCHAR(100) NOT NULL,
	FOTO2 VARCHAR(100),
	FOTO3 VARCHAR(100),
	FOTO4 VARCHAR(100),

	CONSTRAINT PK_VEICULO PRIMARY KEY (PLACA),
	CONSTRAINT FK_VEICULO_PRESTADOR FOREIGN KEY (PRESTADOR) REFERENCES PRESTADOR_SERVICO (NEGOCIANTE)
	 ON DELETE CASCADE,
	CONSTRAINT FK_VEICULO_MODELO FOREIGN KEY (MODELO, ANO) REFERENCES VEICULO_INFO (MODELO, ANO)
	 ON DELETE CASCADE
	
);

CREATE TABLE PRODUTO (

	ID SERIAL,
	VENDEDOR CHAR(11) NOT NULL,
	NOME VARCHAR(40) NOT NULL,
	MARCA VARCHAR(50) NOT NULL,
	TIPO CHAR(15),
	QTD_ESTOQUE INTEGER,
	PRECO FLOAT(2),
	TEMPO_USO INTERVAL,
	ESTADO VARCHAR(20),
	DESCRICAO_GERAL VARCHAR(1024),
	MATERIAL VARCHAR(30),
	REVESTIMENTO VARCHAR(30),
	VOLTAGEM INTEGER,
	POTENCIA INTEGER,
	VIDA_UTIL INTERVAL,
	EFICIENCIA_ENERGETICA CHAR(1),
	FOTO1 VARCHAR(100) NOT NULL,
	FOTO2 VARCHAR(100),
	FOTO3 VARCHAR(100),
	FOTO4 VARCHAR(100),
	
	CONSTRAINT PK_PRODUTO PRIMARY KEY (ID),
	CONSTRAINT FK_PRODUTO FOREIGN KEY (VENDEDOR) REFERENCES NEGOCIANTE (CPF)
	 ON DELETE CASCADE,
	CONSTRAINT UNIQUE_PRODUTO UNIQUE (VENDEDOR, NOME, MARCA),
	CONSTRAINT CK_PRODUTO_TIPO CHECK(UPPER(TIPO) = 'MOBILIA' OR UPPER(TIPO) = 'ELETRODOMESTICO'),
	CONSTRAINT CK_PRODUTO_EFICIENCIA CHECK(UPPER(EFICIENCIA_ENERGETICA) IN ('A','B','C','D','E','F','G'))
	
);

CREATE TABLE VENDA (
	
	CLIENTE CHAR(11),
	PRODUTO INTEGER,
	DATA_HORA TIMESTAMP DEFAULT NOW(),
	QUANTIDADE INTEGER,
	VALOR_TOTAL FLOAT(2),

	CONSTRAINT PK_VENDA PRIMARY KEY (CLIENTE, PRODUTO, DATA_HORA),
	CONSTRAINT FK_VENDA_CLIENTE FOREIGN KEY (CLIENTE) REFERENCES CLIENTE (CPF)
	 ON DELETE CASCADE,
	CONSTRAINT FK_VENDA_PRODUTO FOREIGN KEY (PRODUTO) REFERENCES PRODUTO (ID)
	 ON DELETE CASCADE

);