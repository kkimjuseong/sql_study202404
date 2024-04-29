
CREATE TABLE goods (
    id NUMBER(6) PRIMARY KEY,
    goods_name VARCHAR2(10) NOT NULL,
    price NUMBER (10) DEFAULT 1000,
    reg_date DATE
); 

-- INSERT
INSERT INTO goods
    (id, goods_name, price, reg_date)
VALUES 
    (1, '��ǳ��', 120000, SYSDATE);
    
INSERT INTO goods
    (id, goods_name, price, reg_date)
VALUES 
    (2, '��Ź��', 2000000, SYSDATE);
    
INSERT INTO goods
    (id, goods_name, reg_date)
VALUES 
    (3, '�ް�', SYSDATE);
    
INSERT INTO goods
    (id, goods_name)
VALUES 
    (4, '���');

INSERT INTO goods
    (goods_name, id, reg_date, price)
VALUES 
    ('����', 5, SYSDATE, '49000');
    
-- �÷��� ������ ���̺��� ������� �ڵ� ����.
INSERT INTO goods

VALUES 
    (6, '�����', 1000000, SYSDATE);
    
SELECT * FROM goods;

-- UPDATE
-- id�� �������� �ʰ� name�� �ٲٰ� �Ǹ� ��ü�� ������ �� ����!!
UPDATE goods
SET goods_name = '������'
WHERE id = 1
;

UPDATE goods
SET price = 9999;

UPDATE tbl_user
SET age = age + 1;

UPDATE goods
SET id = 11
WHERE id = 4;

UPDATE goods
SET price = null
WHERE id = 3;

UPDATE goods
SET goods_name = 'û����', 
    price = 299000
WHERE id = 3;

-- DELETE
-- ���Ǿ��� delete�ϸ� ��ü������ �� ������ ����.
DELETE FROM goods
WHERE id = 11;
-- TRUNCATE TABLE goods; ������ �Ұ����� �������
-- DROP TABLE goods;     ���� �Ұ��ɿ� ���̺���� ���� ������.


SELECT * FROM goods;



-- SELECT �⺻
SELECT
    certi_cd, 
    certi_nm, 
    issue_insti_nm
FROM tb_certi
;

-- �÷� ������ �ٲ㼭 ��ȸ�ϴ°� �������.
SELECT ALL
    certi_nm,
    issue_insti_nm
FROM tb_certi
;

-- �ߺ����� DISTINCT ���� all�� �ִµ� ������ �����ϱ� ������ �Ƚᵵ ��.
SELECT DISTINCT
    issue_insti_nm
FROM tb_certi
;

-- * �� all�� �浵 �������־� ��ü��ȸ
SELECT
    *
FROM tb_certi
;

-- �� ��Ī �ο�
SELECT
    emp_nm AS "�����",
    addr AS "�ּ�"
FROM tb_emp
;

-- AS�� ������ ������.
SELECT
    emp_nm "�����",
    addr "�ּ�"
FROM tb_emp
;

-- "" ���� ������
SELECT
    emp_nm �����,
    addr �ּ�
FROM tb_emp
;

-- ���� ������� ""���� �Ұ���
SELECT
    emp_nm �����,
    addr "������ �ּ�"
FROM tb_emp
;

-- ���ڿ� �����ϱ� +�� �ƴ϶� ||�� �����ų �� �ִ�.
SELECT 
    '�ڰ���: ' || certi_nm AS "�ڰ��� ����"
FROM tb_certi;

SELECT
    certi_nm || ' (' || issue_insti_nm || ')' AS "�ڰ���"
FROM tb_certi
;





