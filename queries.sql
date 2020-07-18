-- File used for making medium/high complexity queries to our database,
-- following directives given in the specification.

/* APAGAR DEPOIS

    Não é necessário implementar todas as consultas previstas na Parte 1, mas é
    requisito a elaboração de consultas de complexidade média e alta (ref: as últimas
    consultas da Prática 3 tinham complexidade média). A quantidade mínima de consultas
    passa a ser 10 (DEZ), considerando consultas diversificadas (junções internas e externas,
    agrupamentos, consultas aninhadas correlacionadas e não correlacionadas, ... ). As
    consultas devem ser documentadas e justificadas no relatório, considerando o contexto do
    projeto. E devem ser eficientes!
        a. dentre as 10 consultas mínimas, é obrigatório a implementação de 1 consulta
        envolvendo DIVISÃO.
*/

/* =================================================================

GroupBy (GB)
Inner/Outer Join (IJ/OJ)
Correlated Nested Query (CNQ) 
Non-correlated Nested Query (NCNQ)
Divide (DIV)

IDEIAS PARA CONSULTAS:
- V [ALTA] Retornar o Nome, Email e Telefone de TODOS os Clientes E Negociantes que tenham TODAS as avaliações individuais >= 4.5 --> IJ pro Cliente UNION ALL IJ pro Negociante --> Media
- V [MEDIA] Pegar a média do número de vendas de UM ESPECIFICO vendedor por mês, em um período de tempo especificado --> IJ (Produto e Venda) GROUPBY (DataHora) --> Média
- [BAIXA], POSSIVEL MEDIA/ALTA] Me retorna todos os prestadores de serviço que são tanto transportadores quanto montadores (quero fazer um pacote de serviços) *que fizeram no minimo 2 serviços de cada por mes* --> Baixa 
- V [MEDIA], POSSIVEL ALTA] Me retorna todos os negociantes que tiveram mais de 3 denuncias e tem uma AVALIACAO_GERAL superior a 4 (quero saber o quanto as notas dos usuarios realmente sao um bom parametro) --> IJ(Negociante e denuncia) e GROUPBY(Negociante) + Count, fazer where com Avaliacao Geral --> Media
- [MEDIA] Me retorna todas as denuncias dos locadores que estão oferecendo um imóvel ou vaga na minha regiao (bairro x) --> OJ Imovel, Vaga + IJ Denuncia
- [ALTA] Me retorna todos os pares (cliente, negociante) que antes de fecharem pelos menos um negocio (venda, aluguel ou serviço) tiveram pelo menos uma conversa --> IJ negociante
- [MEDIA] Me retorna todos os imoveis que tenham uma media de preço de vagas menor do que X e tenham no minimo 5 quartos --> GB, average + IJ
- V [MEDIA/ALTA] Me retorna todos os vendedores que possuem tanto mobilias quanto eletrodomesticos em estoque (quero fazer um bem-bolado para comprar mais barato) --> CNQ Negociante e Produto  / GB Vendedor, Tipo --> AND com COUNT dos dois lados
- V [MEDIA/ALTA] Me retorna todos os imoveis no bairro X que tenham o numero de vagas disponiveis + alugadas <= numero de quartos da casa * 2 (não quero dividir quarto com mais do que 1 pessoa) --> GB IdIMovel, Count -> IJ Imovel WHERE Bairro AND Condicao quartos 
- V [GOSTEI DESSA] Me retorna todos os locadores não-proprietarios que estejam anunciando vagas tal que se voce pegar o preco total de todas essas vagas fica X vezes maior do que o preço do aluguel daquele imovel (ou seja, o cara da rep ta cobrando MUITO caro por vaga e é um mal negócio pra mim)
- V [MÉDIA] Pegar todos os vendedores com avaliação geral maior que X e que a média do preço dos produtos vendidos é menor que Y
- X [BAIXA/MEDIA] Me retorna todos os transportadores que tenham pelo menos um veiculo que tenha uma capacidade superior a X
- [MEDIA] Me retorna todos negociantes que responderam a TODAS as denuncias feitas a ele e tenha uma avaliação geral superior a X (esse cara é atencioso para resolvers problemas e tem uma boa nota, provalvemente vou querer fazer negocio com ele)
- [MEDIA 2 IJ E SE PAH UM CNQ OU GROUPBY] Consultar todos os donos de republica (nao proprietarios do imovel) que estão oferecendo x vagas, que possuem avaliação geral maior que 4, e que sejam do bairro y.
- V [MEDIA/ALTA] Tempo médio de um serviço feito por todos os prestadores que trabalham APENAS como uma categoria(OU montador OU transportador) e com tempo de experiencia menor que 1 ano.
- [MEDIA] Pegar todos os produtos de todos os vendedores que não tenham denuncias e que tenham avaliação geral maior que X -> IJ NEGOCIANTE,DENUNCIA -> IJ PRODUTO
- V [MEDIA/ALTA] Todas as vendas de eletrodomesticos feitas a partir de 2019 com eficiencia energetica x por vendedores com avaliacao media maior que 4.
- [MEDIA ?] Um cliente poderá consultar todas as denúncias feitas para todos os locadores que possuem imóveis/vagas em uma determinada rua/bairro.
- [DUVIDA: DA PRA FAZER FICA PICA, SE PA] Um cliente poderá consultar transportadores/montadores com maior tempo de experiência.

--- POSSIVEIS DIVIDES ---

ATRIBUTO / TABELAS

DataHora / Servico - Denuncia - Acordo(DataInicio) - Aluguel(DataInicio) - Venda - Avaliacao

IDEIAS:
- [DEMONIACO] Me retorna todos os clientes que avaliaram o locador de vaga SEMPRE no mesmo dia em que fecharam o acordo (seria útil para o negociante, pois ele poderia ver com quais clientes ele conseguiria uma avaliação mais rapidamente, aumentando sua popularidade no app)

*/

-- Possiveis ideias para o app
-- [BAIXA DESCONTANDO A PARTE DE INSERCAO] Um usuário poderá consultar todas as avaliações e denúncias feitas a ele e inserir uma réplica a cada uma.


-- LINHA 27:
-- Pegar a média do número de vendas de UM ESPECIFICO vendedor pelo nome por mês, em um período de tempo especificado --> IJ (Produto e Venda) GROUPBY (DataHora) --> Média
-- EXEMPLO DE ENTRADA - VENDEDOR 'MARCELO' ENTRE '2018' E '2019' 

-- INSERIR MAIS DE UMA PESSOA COM O MSM NOME VENDENDOR (JOAO2) E CPF DIFERENTE
-- INSERIR MAIS DE UMA VENDA PRO NEGOCIANTE (JOAO1) E EM MÊSES DIFERENTES E PARA O MESMO MÊS TBM
-- DEU BOM 
SELECT COUNT(*) AS NUM_VENDAS, N.CPF, N.NOME, EXTRACT(MONTH FROM V.DATA_HORA) AS MES 
    FROM VENDA V JOIN PRODUTO P ON V.PRODUTO = P.ID        --Inner join de venda com produto       
                 JOIN NEGOCIANTE N ON P.VENDEDOR = N.CPF   --Inner join com negociante
        -- '2018' e '2019' tem que ser TIMESTAMP na entrada
        WHERE (UPPER(N.NOME) = 'JOAO VITOR SILVA RAMOS' AND V.DATA_HORA BETWEEN TO_TIMESTAMP('2019', 'YYYY') AND TO_TIMESTAMP('2020', 'YYYY'))   
        GROUP BY N.NOME, N.CPF, EXTRACT(MONTH FROM V.DATA_HORA)


-- LINHA 29
-- Me retorna todos os negociantes que tiveram mais de 3 denuncias e tem uma AVALIACAO_GERAL superior a 4
--> IJ(Negociante e denuncia) e GROUPBY(Negociante) + Count, fazer where com Avaliacao Geral
-- DEU BOM
-- TALVEZ COLOCAR MAIS DENUNCIAS
SELECT N.NOME, N.CPF, COUNT(*) AS NUM_DENUNCIAS
    FROM NEGOCIANTE N JOIN DENUNCIA D ON N.CPF = D.NEGOCIANTE
        WHERE (N.AVALIACAO_GERAL >= 4.0 AND D.VEM_DO_CLIENTE = TRUE) 
    GROUP BY (N.NOME, N.CPF)
        HAVING (COUNT(*) > 0);


-- LINHA 33       
-- Me retorna todos os vendedores que possuem tanto mobilias quanto eletrodomesticos em estoque
--> CNQ Negociante e Produto  / GB Vendedor, Tipo --> AND com COUNT dos dois lados
-- DEU BOM, MAS PESADAOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO, REVER!!!
SELECT N1.NOME, N1.CPF
    FROM NEGOCIANTE N1
    WHERE (
        SELECT COUNT(AUX) FROM
        (
            SELECT COUNT(*) AS NUM_TIPO
            FROM PRODUTO P JOIN NEGOCIANTE N2 ON (N2.CPF = P.VENDEDOR AND N2.CPF = N1.CPF)
            GROUP BY(P.TIPO)
        ) AS AUX
    ) = 2;

-- LINHA 34
--Me retorna todos os imoveis no bairro X que tenham o numero de vagas disponiveis + alugadas <= numero de quartos da casa * 2 
--> GB IdIMovel, Count -> IJ Imovel WHERE Bairro AND Condicao quartos 

-- EXEMPLO DE ENTRADA - BAIRRO 'JARDIM LUTFALLA'
-- DEU BOM 
SELECT I.RUA, I.NUMERO, I.NRO_QUARTOS, I.COMPLEMENTO
    FROM IMOVEL I JOIN VAGA V ON I.ID = V.ID_IMOVEL
    WHERE (UPPER(I.BAIRRO) = 'JARDIM LUTFALLA' AND NOT I.EH_PROPRIETARIO)
    GROUP BY(V.ID_IMOVEL, I.RUA, I.NUMERO, I.NRO_QUARTOS, I.COMPLEMENTO)
        HAVING (COUNT(*) < 2 * I.NRO_QUARTOS)

-- LINHA 40
-- Tempo médio de um serviço feito por todos os prestadores que trabalham APENAS 
-- como uma categoria(OU montador OU transportador).
-- DEU BOM 
SELECT N.NOME, N.CPF,   CASE WHEN P.EH_MONTADOR = TRUE 
                            THEN 'Montador'
                            ELSE 'Transportador'
                        END AS TIPO, AVG(S.TEMPO_ESTIMADO) AS TEMPO_MEDIO
    FROM PRESTADOR_SERVICO P JOIN NEGOCIANTE N ON P.NEGOCIANTE = N.CPF
                             JOIN SERVICO S ON N.CPF = S.PRESTADOR_SERVICO
    WHERE ((P.EH_MONTADOR AND P.CNH IS NULL) OR (NOT P.EH_MONTADOR AND P.CNH IS NOT NULL))
    GROUP BY (N.NOME, N.CPF, TIPO);

-- LINHA 42
-- Todas as vendas de eletrodomesticos feitas a partir de 2019 com eficiencia energetica x por 
-- vendedores com avaliacao media maior que 4..
-- EXEMPLO DE ENTRADA: TO_TIMESTAMP('2019', 'YYYY') E A EFICIENCIA 'A'
-- DEU BOM, POREM PARECE MUIIITOOO FACIL!

SELECT P.NOME, P.MARCA, P.EFICIENCIA_ENERGETICA
    FROM VENDA V JOIN PRODUTO P ON V.PRODUTO = P.ID
                 JOIN NEGOCIANTE N ON P.VENDEDOR = N.CPF
    WHERE(V.DATA_HORA >= TO_TIMESTAMP('2019', 'YYYY') AND N.AVALIACAO_GERAL > 4.0 AND P.EFICIENCIA_ENERGETICA = 'A');

-- LINHA 26
-- Retornar o Nome, Email e Telefone de TODOS os Clientes E Negociantes que tenham TODAS as avaliações individuais >= 4.5 

-- Trabalho separadamento com as avaliações feitas ao Cliente
SELECT C.NOME, C.EMAIL, C.TELEFONE
    FROM CLIENTE C JOIN AVALIACAO A ON C.CPF = A.CLIENTE
	WHERE (A.VEM_DO_CLIENTE = FALSE)
EXCEPT
SELECT C.NOME, C.EMAIL, C.TELEFONE
    FROM CLIENTE C JOIN AVALIACAO A ON C.CPF = A.CLIENTE
    WHERE (A.VEM_DO_CLIENTE = FALSE AND A.NOTA < 4.5)
UNION ALL
-- Trabalho separadamente com as avaliações feitas ao Negociante
SELECT N.NOME, N.EMAIL, N.TELEFONE
    FROM NEGOCIANTE JOIN AVALIACAO A ON N.CPF = A.NEGOCIANTE
	WHERE (A.VEM_DO_CLIENTE = TRUE)
EXCEPT
SELECT N.NOME, N.EMAIL, N.TELEFONE
    FROM NEGOCIANTE N JOIN AVALIACAO A ON N.CPF = A.NEGOCIANTE
    WHERE (A.VEM_DO_CLIENTE = TRUE AND A.NOTA < 4.5);


-- LINHA 35
-- Me retorna todos os locadores não-proprietarios que estejam anunciando vagas tal que se voce pegar o preco total de todas essas vagas fica 3 vezes maior do que o preço do aluguel daquele imovel (ou seja, o cara da rep ta cobrando MUITO caro por vaga e é um mal negócio pra mim)

SELECT N.NOME, N.EMAIL
FROM IMOVEL IMV JOIN VAGA V ON IMV.ID = V.ID_IMOVEL
	JOIN NEGOCIANTE N ON N.CPF = IMV.LOCADOR
GROUP BY IMV.LOCADOR, IMV.PRECO, N.NOME, N.EMAIL
	HAVING SUM(V.PRECO) > 3*IMV.PRECO;

-- LINHA 36
-- Pegar todos os vendedores com avaliação geral maior igual que X e que a média do preço dos produtos vendidos é menor que Y

SELECT N.NOME, N.EMAIL, N.TELEFONE, N.AVALIACAO_GERAL, AVG(P.PRECO) AS MEDIA_PRECO
FROM NEGOCIANTE N JOIN PRODUTO P ON N.CPF = P.VENDEDOR
GROUP BY P.VENDEDOR, N.NOME, N.EMAIL, N.TELEFONE, N.AVALIACAO_GERAL
	HAVING (AVG(P.PRECO) < 500 AND N.AVALIACAO_GERAL >= 4.5);

-- LINHA 37
-- Me retorna todos os transportadores que tenham pelo menos um veiculo que tenha uma capacidade superior a X

SELECT MODELO, ANO, CAPACIDADE, N.NOME, N.EMAIL, N.TELEFONE 
FROM NEGOCIANTE N JOIN VEICULO V ON N.CPF = V.PRESTADOR
	NATURAL JOIN VEICULO_INFO
WHERE CAPACIDADE > 90;

