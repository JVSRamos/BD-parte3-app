-- File used for making medium/high complexity queries to our database,
-- following directives given in the specification.

-- Q1:
/*
-> Consultar a média do número de vendas de um vendedor ESPECIFICO pelo nome por mês, em um período de tempo especificado
    EXEMPLO DE ENTRADA - VENDEDOR 'JOAO VITOR SILVA RAMOS' ENTRE '2019' E '2020' 

    Ideia da consulta: Esta consulta tem por objetivo facilitar a visualização da média de vendas feitas por um vendedor.
    Estruturas utilizadas:  
        * Inner Join  [(Produto e Venda) e Negociante] 
        * GROUPBY (Nome do Negociante, CPF do Negociante, Mês da Venda) 

*/
SELECT COUNT(*) AS NUM_VENDAS, N.CPF, N.NOME, EXTRACT(MONTH FROM V.DATA_HORA) AS MES 
    FROM VENDA V JOIN PRODUTO P ON V.PRODUTO = P.ID        --Inner join de venda com produto       
                 JOIN NEGOCIANTE N ON P.VENDEDOR = N.CPF   --Inner join com negociante
        -- '2019' e '2020' tem que ser TIMESTAMP na entrada
        WHERE (UPPER(N.NOME) = 'JOAO VITOR SILVA RAMOS' AND V.DATA_HORA BETWEEN TO_TIMESTAMP('2019', 'YYYY') AND TO_TIMESTAMP('2020', 'YYYY'))   
        GROUP BY N.NOME, N.CPF, EXTRACT(MONTH FROM V.DATA_HORA)


-- Q2:
/*
-> Consultar todos os negociantes que tiveram pelo menos uma denuncia e tem uma AVALIACAO_GERAL superior a 4
    Ideia da consulta: Esta consulta tem como objetivo avaliar a eficácia de análise da Avaliação Geral para determinar a qualidade dos negociantes.
    Estruturas utilizadas: 
        * Inner Join (Negociante e denuncia)
        * GROUPBY(Negociante)
        * Função de Agrupamento: Count()

*/
SELECT N.NOME, N.CPF, COUNT(*) AS NUM_DENUNCIAS
    FROM NEGOCIANTE N JOIN DENUNCIA D ON N.CPF = D.NEGOCIANTE
        WHERE (N.AVALIACAO_GERAL >= 4.0 AND D.VEM_DO_CLIENTE = TRUE) --Apenas para negociantes com avaliacao geral >=4 e denuncias feitas do clientes aos negociantes
    GROUP BY (N.NOME, N.CPF)
        HAVING (COUNT(*) > 0);


-- Q3:    
/*   
-> Consultar todos os vendedores que possuem tanto mobílias quanto eletrodomesticos em estoque.
    Ideia da consulta: Verificar quais são os vendedores que possuem um estoque mais amplo para facilitar na compra de vários produtos
        com um mesmo negociante, ajudando, por exemplo, um cliente à mobiliar melhor a casa negociando com uma mesma pessoa.
    Estruturas utilizadas:
        * Inner Join (Produto e Negociante)
        * Consultas Aninhadas Correlacionadas
        * GROUPBY (Tipo do produto(eletrodomestico ou mobilia))
        * Função de Agrupamento: Count()

*/
SELECT N1.NOME, N1.CPF
FROM NEGOCIANTE N1
WHERE (
    SELECT COUNT(AUX) FROM
    (
        SELECT COUNT(*) AS NUM_TIPO
        FROM PRODUTO P JOIN NEGOCIANTE N2 ON (N2.CPF = P.VENDEDOR AND N2.CPF = N1.CPF)
        GROUP BY(P.TIPO)
    ) AS AUX
) = 2;  --Se COUNT(AUX) = 2 entao quer dizer que o vendedor tem tanto mobilias quanto eletrodomesticos


-- Q4:
/*
-> Consultar todos os imóveis no bairro X que tenham a soma do número de vagas disponíveis
     e de vagas alugadas MENOR OU IGUAL o dobro do número de quartos da casa.  
    
    Ideia da consulta: Esta consulta ajuda o cliente na busca de vagas em repúblicas, por exemplo, que possuam poucas vagas por
        quarto, a fim de se estabelecer em um quarto com mais espaço. Esta consulta é realizada em um bairro especificado.
    
-- EXEMPLO DE ENTRADA - BAIRRO 'JARDIM LUTFALLA'

    Estruturas utilizadas:
        * Inner Join (Imovel e Vaga)
        * GROUPBY (ID do imovel desta vaga, Rua do imovel, Numero do Imovel, Numero de Quartos do Imovel, Complemento do Imovel)  
        * Função Agrupadora: Count()
*/

SELECT I.RUA, I.NUMERO, I.NRO_QUARTOS, I.COMPLEMENTO
    FROM IMOVEL I JOIN VAGA V ON I.ID = V.ID_IMOVEL
    WHERE (UPPER(I.BAIRRO) = 'JARDIM LUTFALLA' AND NOT I.EH_PROPRIETARIO)
    GROUP BY(V.ID_IMOVEL, I.RUA, I.NUMERO, I.NRO_QUARTOS, I.COMPLEMENTO)
        HAVING (COUNT(*) <= 2 * I.NRO_QUARTOS) --Se a contagem do numero de vagas for menor ou igual ao dobro de num quartos da casa 


-- Q5:
/*
-> Consultar o Tempo médio de um serviço feito por todos os prestadores que trabalham APENAS 
    como uma categoria (OU montador OU transportador). 

    Ideia da consulta: Esta consulta tem por finalidade, mostrar o tempo médio de serviço feito por pessoas com maior foco em
        tal atividade, assim, dando uma melhor noção para o cliente do tempo estimado da realização de um determinado serviço.
    
    Estruturas Utilizadas:
        * Case em cima do tipo do prestador(Se a unica funcao exercida eh montador ou transportador)
        * Inner Join ((Prestador e Negociante) e Servico)
        * GROUPBY (Nome do negociante, CPF do negociante, Tipo de servico que o Prestador exerce)

*/

SELECT N.NOME, N.CPF,   CASE WHEN P.EH_MONTADOR = TRUE 
                            THEN 'Montador'
                            ELSE 'Transportador'
                        END AS TIPO, AVG(S.TEMPO_ESTIMADO) AS TEMPO_MEDIO
    FROM PRESTADOR_SERVICO P JOIN NEGOCIANTE N ON P.NEGOCIANTE = N.CPF
                             JOIN SERVICO S ON N.CPF = S.PRESTADOR_SERVICO
    WHERE ((P.EH_MONTADOR AND P.CNH IS NULL) OR (NOT P.EH_MONTADOR AND P.CNH IS NOT NULL)) --Se ele eh apenas Montador OU Transportador 
    GROUP BY (N.NOME, N.CPF, TIPO);


-- Q6
/*
-> Consultar todas as vendas de eletrodomesticos feitas a partir de 2019 com Eficiência Energética X por 
    vendedores com avaliacão media maior que 4.

    Ideia da consulta: Esta consulta tem por finalidade ajudar o cliente a verificar todas as vendas feitas a 
        partir de 2019 (aumento de preço e surgimento de novos eletrodomésticos) por negociantes bem avaliados.
        
-- EXEMPLO DE ENTRADA: TO_TIMESTAMP('2019', 'YYYY') E A EFICIENCIA 'A'

    Estruturas Utilizadas:
        * Inner Join ((Venda e Produto) e Negociante)

*/

SELECT P.NOME, P.MARCA, P.EFICIENCIA_ENERGETICA
    FROM VENDA V JOIN PRODUTO P ON V.PRODUTO = P.ID
                 JOIN NEGOCIANTE N ON P.VENDEDOR = N.CPF
    WHERE(V.DATA_HORA >= TO_TIMESTAMP('2019', 'YYYY') AND N.AVALIACAO_GERAL > 4.0 AND P.EFICIENCIA_ENERGETICA = 'A'); --Apenas eletrodomesticos vendidos em 2019 por negociantes com avaliacao > 4 e Eficiencia A


-- Q7
/* 
-> Consultar o Nome, Email e Telefone de TODOS os Clientes E Negociantes que tenham TODAS as avaliações individuais maior ou igual á 4.5 
    
    Ideia da consulta: Esta consulta tem por objetivo visualizar as principais informações dos Usuários com melhores avaliações do sistema.
    
    Estruturas Utilizadas:
        * Except entre consultas de para obter apenas os clientes e negociantes que tenham TODAS as avaliacoes maiores ou iguais à 4.5
        * Union All entre o resultado da consulta dos clientes e da consulta dos negociantes
        * Inner Join (Cliente e Avaliacao), (Negociante e Avaliacao)
*/

-- Trabalho separadamente com as avaliações feitas ao Cliente
SELECT C.NOME, C.EMAIL, C.TELEFONE
    FROM CLIENTE C JOIN AVALIACAO A ON C.CPF = A.CLIENTE
	WHERE (A.VEM_DO_CLIENTE = FALSE)
EXCEPT -- Fazer uma diferença entre todos os Clientes e os Clientes que possuem alguma nota individual menor que 4.5
SELECT C.NOME, C.EMAIL, C.TELEFONE
    FROM CLIENTE C JOIN AVALIACAO A ON C.CPF = A.CLIENTE
    WHERE (A.VEM_DO_CLIENTE = FALSE AND A.NOTA < 4.5)
UNION ALL
-- Trabalho separadamente com as avaliações feitas ao Negociante
SELECT N.NOME, N.EMAIL, N.TELEFONE
    FROM NEGOCIANTE JOIN AVALIACAO A ON N.CPF = A.NEGOCIANTE
	WHERE (A.VEM_DO_CLIENTE = TRUE)
EXCEPT  -- Fazer uma diferença entre todos os Negociantes e os Negociantes que possuem alguma nota individual menor que 4.5
SELECT N.NOME, N.EMAIL, N.TELEFONE
    FROM NEGOCIANTE N JOIN AVALIACAO A ON N.CPF = A.NEGOCIANTE
    WHERE (A.VEM_DO_CLIENTE = TRUE AND A.NOTA < 4.5);


-- Q8
/*
-> Consultar todos os locadores não-proprietarios que estejam anunciando vagas, tal que se voce pegar o preço total de todas
    essas vagas fica três vezes maior do que o preço do aluguel daquele imóvel.
    
    Ideia da consulta: Esta consulta tem por objetivo mostrar ao cliente quais locadores estão oferecendo vaga com preço
        muito acima do normal, avaliando pelo lucro que o locador está obtendo.
        
    Estruturas Utilizadas: 
        * Inner Join ((Imovel e Vaga) e Negociante)
        * GROUPBY (Locador do Imovel, Preco do Imovel, Nome do Locador, Email do negociante)
*/

SELECT N.NOME, N.EMAIL
FROM IMOVEL IMV JOIN VAGA V ON IMV.ID = V.ID_IMOVEL
	JOIN NEGOCIANTE N ON N.CPF = IMV.LOCADOR
GROUP BY IMV.LOCADOR, IMV.PRECO, N.NOME, N.EMAIL
	HAVING SUM(V.PRECO) > 3*IMV.PRECO;   --Apenas para republicas em que o preco de suas vagas sejam 3 * maiores que o dono da republica paga para o proprietario original da casa


-- Q9
/* 
-> Consultar todos os vendedores com avaliação geral maior igual que X e que a média do preço dos produtos vendidos é menor que Y.

    Ideia da consulta: Esta consulta tem como objetivo mostrar os melhores vendedores com os preços mais baratos.
    Estruturas Utilizadas:
        * Inner Join (Negociante e Produto)
        * GROUPBY (Vendedor do produto, Nome do Vendedor, Email do Vendedor, Telefone do Vendedor, Avaliacao geral do vendedor)
*/

SELECT N.NOME, N.EMAIL, N.TELEFONE, N.AVALIACAO_GERAL, AVG(P.PRECO) AS MEDIA_PRECO
FROM NEGOCIANTE N JOIN PRODUTO P ON N.CPF = P.VENDEDOR
GROUP BY P.VENDEDOR, N.NOME, N.EMAIL, N.TELEFONE, N.AVALIACAO_GERAL
	HAVING (AVG(P.PRECO) < 500 AND N.AVALIACAO_GERAL >= 4.5);       --Apenas para vendedores que o preco medio de seus produtos seja < 500 e sua avaliacao >= 4.5


-- Q10
/* 
-> Consultar todos os transportadores que tenham pelo menos um veiculo que tenha uma capacidade superior a X
   
    Ideia da consulta: Esta consulta tem como objetivo mostrar quais transportadores tem pelo menos um veículo com capacidade 
        suficiente para um serviço desejado pelo cliente.
    Estruturas Utilizadas:
        * Inner Join ((Negociante e Veiculo) e Veiculo_Info [Natural Join])
*/

SELECT MODELO, ANO, CAPACIDADE, N.NOME, N.EMAIL, N.TELEFONE 
FROM NEGOCIANTE N JOIN VEICULO V ON N.CPF = V.PRESTADOR
	NATURAL JOIN VEICULO_INFO
WHERE CAPACIDADE > 90;  --So se a capacidade do veiculo for maior que 90

-- Q11 (OPERACAO DIVIDE)
/*
-> Consultar TODOS os clientes que compraram produtos de TODOS os vendedores 

    Ideia da consulta: Esta consulta tem por objetivo mostrar os clientes mais ativos na área de compra de produtos.
    Estruturas Utilizadas:
        * Inner Join entre tabelas e consultas
        * Except entre consultas
    Obs: Nesta consulta, foi utilizado a ideia de DIVIDE para poder verificar quais clientes compraram de todos os vendedores.   
*/

-- Todos os clientes que ja compraram algum produto
SELECT C.CPF, C.NOME, C.EMAIL, C.TELEFONE
FROM CLIENTE C
JOIN (
    -- Clientes que compraram
	SELECT CLIENTE
	FROM VENDA
	EXCEPT
    -- Clientes que não compraram com todos
	SELECT CLIENTE FROM (
        -- Produto Cartesiano de clientes e vendedores
		SELECT V.CLIENTE, P.VENDEDOR
		FROM VENDA V, PRODUTO P
		EXCEPT
        -- Tabel real de clientes e vendedores
		SELECT V.CLIENTE, P.VENDEDOR
		FROM VENDA V JOIN PRODUTO P ON V.PRODUTO = P.ID
	) AS CNC -- Clientes que nao compraram
) AS CC -- Clientes que compraram
ON C.CPF = CC.CLIENTE;


-- Q12
/* 
-> Consultar todos os clientes e, para aqueles que fizeram pelo menos uma compra, retornar 
    também o quanto que eles gastaram no total.

    Ideia da consulta: Esta consulta tem como objetivo mostrar todos os clientes e disponibilizar a informação do gasto total 
        deles no app.
    Estruturas Utilizadas:
        * Outer join do tipo Left entre Cliente e Venda
        * CASE
        * GROUPBY (Nome do cliente, CPF do cliente)
        * Funções agrupadoras: Sum() e Count()
*/

SELECT C.NOME, C.CPF, CASE WHEN SUM(V.VALOR_TOTAL) IS NOT NULL 
                            THEN COUNT(*)
                            ELSE 0              --Se a soma dos valores de Produtos comprados for NULL entao o numero de produtos comprados eh igual a 0
                        END AS NRO_COMPRAS, SUM(V.VALOR_TOTAL) AS GASTO_TOTAL
    FROM CLIENTE C LEFT JOIN VENDA V ON C.CPF = V.CLIENTE                       --Left Join para pegar ate os clientes que nao compraram nenhum produto
    GROUP BY (C.NOME, C.CPF);



-- Q13
/*
-> Selecione todos os prestadores de servico que possuem idade acima da idade media
    
    Ideia da consulta: Esta consulta tem como objetivo verificar quais são os prestadores de serviços mais velhos, para o cliente poder
        por exemplo, buscar prestadores com mais experiencia de vida, ou com mais necessidade de dinheiro (por serem mais velhos).

    Estruturas utilizadas:
        * Inner Join (Prestador_servico, Negociante)
        * NCNQ (Consultas aninhadas Não-Correlacionadas)
*/

SELECT N.NOME, N.EMAIL, N.TELEFONE, EXTRACT(YEAR FROM AGE(NOW(), N.DATA_NASCIMENTO)) AS IDADE
    FROM PRESTADOR_SERVICO P JOIN NEGOCIANTE N ON P.NEGOCIANTE = N.CPF
    WHERE AGE(NOW(), N.DATA_NASCIMENTO) > (
        SELECT AVG(AGE(NOW(), N2.DATA_NASCIMENTO)) 
            FROM NEGOCIANTE N2 JOIN PRESTADOR_SERVICO P2 ON N2.CPF = P2.NEGOCIANTE
    );


