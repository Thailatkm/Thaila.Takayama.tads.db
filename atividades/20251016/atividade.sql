--Liste o nome do cliente e o produto de cada venda, mostrando também a cidade.
SELECT
    v.produto,
    c.nome AS cliente,
    c.cidade
FROM VENDAS v
INNER JOIN CLIENTES c
    ON v.id_cliente = c.id_cliente;

-- Mostre o total de vendas por estado.
SELECT
    c.estado,
    SUM (v.valor) AS total_vendas
    FROM VENDAS v
    INNER JOIN CLIENTES c
    ON v.id_cliente = c.id_cliente 
    GROUP BY c.estado 

-- Quais cidades tiveram mais de R$ 2.000,00 em vendas no total?
SELECT
    c.estado,
    SUM (v.valor) AS total_vendas
    FROM VENDAS v
    INNER JOIN CLIENTES c
    ON v.id_cliente = c.id_cliente 
    GROUP BY c.estado 
    HAVING SUM (v.valor) >2000;