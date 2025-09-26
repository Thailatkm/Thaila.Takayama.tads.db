1) Inserindo dados de clientes

INSERT INTO CLIENTES (nome, email) VALUES ('Thaila','Thailatakayama@gmail.com');
INSERT INTO CLIENTES (nome, email) VALUES ('Gabriela','Gabrielapalmos@gmail.com');
INSERT INTO CLIENTES (nome, email) VALUES ('Bruno','Brunoterra@gmail.com');

2) Atualizando preços de produtos
UPDATE PRODUTOS SET preco = preco*1.10 WHERE tipo = 'Notebook';

3) Removendo pedidos cancelados
DELETE FROM PEDIDOS WHERE status = 'CANCELADO';

4) Usando MERGE para atualizar clientes
MERGE INTO CLIENTES a
USING CLIENTES_STG b
ON (a.email=b.email)
WHEN MATCHED THEN 
    UPDATE SET a.nome = b.nome
WHEN NOT MATCHED THEN 
    INSERT (nome,email)
    VALUES (b.nome,b.email);
