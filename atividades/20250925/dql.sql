--Liste todos os produtos vendidos por “Ana”, ordenados por data.

SELECT produto, valor, data_venda, vendedor
FROM VENDAS
WHERE vendedor = 'Ana'
ORDER BY data_venda;

--Mostre o valor total vendido na categoria “Eletrônicos”.

SELECT SUM (valor) AS total_eletronicos 
FROM VENDAS 
WHERE categoria = 'Eletrônicos'; 

-- Quais produtos custam entre R$200 e R$1000? Mostre nome e valor.
SELECT valor,produto FROM VENDAS WHERE valor BETWEEN 200 and 1000;

--Mostre quantas vendas cada vendedor realizou e o valor total vendido por ele, ordenado do maior para o menor faturamento.

SELECT vendedor, 
    COUNT (id) AS id_quantidade,  
    SUM (valor) AS valor_total 
    FROM VENDAS  GROUP BY vendedor ORDER BY valor_total DESC;
