-- Exercício 1: Crie uma trigger que também registre logs quando houver UPDATE na tabela VENDAS.

CREATE OR REPLACE TRIGGER trg_log_insert_vendas
AFTER UPDATE ON VENDAS
FOR EACH ROW
BEGIN
    INSERT INTO LOG_VENDAS (
        operacao,
        id_venda,
        produto,
        vendedor,
        valor,
        usuario,
        data_hora,
        observacao
    ) VALUES (
        'INSERT',
        :NEW.id,
        :NEW.produto,
        :NEW.vendedor,
        :NEW.valor,
        USER,
        SYSDATE,
        'Nova venda inserida: ' || :NEW.produto || ' vendido por ' || :NEW.vendedor
    );
END;

--Exercício 2: Crie uma procedure chamada total_vendas_vendedor que recebe o nome do vendedor e retorna o total de vendas realizadas por ele.


CREATE OR REPLACE PROCEDURE total_vendas_vendedor
(
    p_vendedor IN VARCHAR2,  
    p_total OUT NUMBER       
)
IS
BEGIN
    
    SELECT NVL(SUM(valor), 0)
    INTO p_total
    FROM VENDAS
    WHERE vendedor = p_vendedor;

    
    DBMS_OUTPUT.PUT_LINE('Vendedor: ' || p_vendedor);
    DBMS_OUTPUT.PUT_LINE('Total de vendas: R$ ' || p_total);
END total_vendas_vendedor;


--Exercício 3: Crie uma trigger BEFORE INSERT que valide se o valor da venda é maior que zero antes de permitir a inserção.


CREATE OR REPLACE TRIGGER trg_valida_valor_venda
BEFORE INSERT
ON VENDAS
FOR EACH ROW
BEGIN
    IF :NEW.valor <= 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'O valor da venda deve ser maior que zero.');
    END IF;
END trg_valida_valor_venda;
/