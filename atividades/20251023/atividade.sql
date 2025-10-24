-- Exercício A: Liste todos os clientes e seus produtos comprados (mesmo que o cliente não tenha feito compras).
SELECT
c.nome AS cliente,
v.produto
FROM CLIENTES c
LEFT JOIN VENDAS v
ON c.id_cliente = v.id_cliente

-- Mostre os produtos vendidos, exibindo “Sem Cliente” para vendas sem cadastro.
SELECT
NVL (c.nome, 'sem clientes') AS clientes,
v.produto
FROM CLIENTES c
RIGHT JOIN VENDAS v
    ON c.id_cliente = v.id_cliente

--  Liste o nome e a cidade dos clientes sem nenhuma venda registrada.
SELECT
c.nome as clientes,
c.cidade
FROM CLIENTES c
LEFT JOIN VENDAS v
    ON c.id_cliente = v.id_cliente
    WHERE v.id IS NULL;
