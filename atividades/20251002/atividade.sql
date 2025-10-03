-- Liste todos os produtos mais caros do que o produto mais barato da categoria "Eletrônicos".

SELECT produto,valor
FROM vendas 
WHERE valor > (SELECT MIN (valor)
FROM VENDAS 
WHERE categoria = 'Eletrônicos');

-- Mostre o vendedor que realizou a maior venda registrada na tabela.

SELECT produto,valor,vendedor
FROM VENDAS
WHERE valor = (SELECT MAX (valor) FROM vendas);

-- Liste as categorias que têm pelo menos um produto acima do preço médio geral.
SELECT produto, valor, categoria
FROM vendas
WHERE valor > (SELECT AVG (valor)FROM vendas)