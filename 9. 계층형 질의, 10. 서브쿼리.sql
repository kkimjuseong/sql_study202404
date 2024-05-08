-- ������ ���� 
-- START WITH : ������ ù �ܰ踦 ��� ������ �������� ���� ����
-- CONNECT BY PRIOR �ڽ� = �θ�  -> ������ Ž��
-- CONNECT BY �ڽ� = PRIOR �θ�  -> ������ Ž��
-- ORDER SIBLINGS BY : ���� ���������� ������ ����.
-- where ���� ������ ������ �� ���� ������ ���͸��� ��.

-- PRIOR�� �տ� ������ ������
SELECT 
    LEVEL AS LVL,
    LPAD(' ', 4*(LEVEL-1)) || emp_no || '(' || emp_nm || ')' AS "�����ο�",
    A.dept_cd,
    B.dept_nm,
    A.emp_no,
    A.direct_manager_emp_no,
    CONNECT_BY_ISLEAF
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd
 START WITH A.direct_manager_emp_no IS NULL 
 -- ���� 1�� ������ �Ұ��� ���ϴ°� start with
-- START WITH A.EMP_NO = '1000000037'
CONNECT BY PRIOR A.emp_no = A.direct_manager_emp_no
ORDER SIBLINGS BY A.emp_no DESC
-- SIBLINGS �������� ����
;

SELECT
    emp_no,
    emp_nm,
    direct_manager_emp_no
FROM tb_emp
;


-- PRIOR �� �ڿ������� ������
SELECT 
    LEVEL AS LVL,
    LPAD(' ', 4*(LEVEL-1)) || emp_no || '(' || emp_nm || ')' AS "�����ο�",
    A.dept_cd,
    B.dept_nm,
    A.emp_no,
    A.direct_manager_emp_no,
    CONNECT_BY_ISLEAF
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd
 START WITH A.direct_manager_emp_no IS NULL 
 -- ���� 1�� ������ �Ұ��� ���ϴ°� start with
-- START WITH A.EMP_NO = '1000000037'
CONNECT BY A.emp_no = PRIOR  A.direct_manager_emp_no
ORDER SIBLINGS BY A.emp_no DESC
;


-- # ���� ���� : SQL�ȿ� SQL�� ���Ե� ����
-- ## ������ �������� : ��ȸ ����� 1������

-- �μ� �ڵ尡 100004���� �μ��� ����� ���� ��ȸ
SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp
WHERE dept_cd = '100004'
;

-- �̳��� ���� �μ��� ��� ������� ��ȸ
-- 1. �̳���� �μ��ڵ尡 �����?
-- 2. �� �μ��ڵ�� ��� ����� ��ȸ�ض�
SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp
WHERE dept_cd = (
    SELECT
        dept_cd
    FROM tb_emp
    WHERE emp_nm = '�̳���'
)
;

SELECT
    dept_cd
FROM tb_emp
WHERE emp_nm = '�̰���'
;

-- ���� 2���ΰ��� �ȵ�~ '�̰���'�� ���� �μ��ڵ尡 2���� �� ��ģ���� �ȵȴٰ�
-- ����̸��� �̰����� ����� ���� �ִ� �μ��� ������� ��ȸ
-- ������ �񱳿�����(=, <>, >, >=, <, <=)�� ������ ���������θ� ���ؾ� ��.
SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp
WHERE dept_cd = (
    SELECT
        dept_cd
    FROM tb_emp
    WHERE emp_nm = '�̰���'
)
;


-- 20200525�� ���� �޿��� ȸ����ü�� 20200525�� 
-- ��ü ��� �޿����� ���� ������� ����(���, �̸�, �޿�������, �����޿��׼�) ��ȸ

-- 1. ȸ�� ��ü 20200525 ��ձ޿� ���
-- 2. �� ��պ��� ���� ��� ��ȸ
SELECT
    E.emp_no,
    E.emp_nm,
    S.pay_de,
    S.pay_amt
FROM tb_emp E
JOIN tb_sal_his S
ON E.emp_no = S.emp_no
WHERE S.pay_de = '20200525'
    AND S.pay_amt >= (
        SELECT
            AVG(pay_amt)
        FROM tb_sal_his
        WHERE pay_de = '20200525'
    )
;

-- 20200525 ȸ����ü ��ձ޿�
SELECT
    AVG(pay_amt)
FROM tb_sal_his
WHERE pay_de = '20200525'
;




-- # ������ ��������
-- ���������� ��ȸ �Ǽ��� 0�� �̻��� ��
-- ## ������ ������
-- 1. IN : ���������� �������� �������� ����߿� �ϳ��� ��ġ�ϸ� ��
--    ex )  salary IN (200, 300, 400)
--            250 ->  200, 300, 400 �߿� �����Ƿ� false
-- 2. ANY, SOME : ���������� �������� ���������� �˻���� �� �ϳ� �̻� ��ġ�ϸ� ��
--    ex )  salary > ANY (200, 300, 400)
--            250 ->  200���� ũ�Ƿ� true

-- 3. ALL : ���������� �������� ���������� �˻������ ��� ��ġ�ϸ� ��
--    ex )  salary > ALL (200, 300, 400)
--            250 ->  200���ٴ� ũ���� 300, 400���ٴ� ũ�� �����Ƿ� false
-- 4. EXISTS : ���������� �������� ���������� ��� �� 
--				�����ϴ� ���� �ϳ��� �����ϸ� ��

-- IN ��  =ANY , =SOME �̶� ����
SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp
WHERE dept_cd = SOME (
    SELECT
        dept_cd
    FROM tb_emp
    WHERE emp_nm = '�̰���'
)
;

-- �ѱ������ͺ��̽���������� �߱��� �ڰ����� ������ �ִ�
-- ����� �����ȣ�� ����̸��� �ش� ����� �ѱ������ͺ��̽���������� 
-- �߱��� �ڰ��� ������ ��ȸ
SELECT
    E.emp_no,
    E.emp_nm,
    COUNT(S.certi_cd) "�ڰ��� ����"
FROM tb_emp E
INNER JOIN tb_emp_certi S
ON E.emp_no = S.emp_no
WHERE S.certi_cd IN (
    SELECT
        certi_cd
    FROM tb_certi
    WHERE issue_insti_nm = '�ѱ������ͺ��̽������'
)
GROUP BY E.emp_no, E.emp_nm
ORDER BY E.emp_no
;

-- �� �� �Ʒ��� ���� ���� �� IN �� =ANY�� ���ٰ�!

SELECT
    E.emp_no,
    E.emp_nm,
    COUNT(S.certi_cd) "�ڰ��� ����"
FROM tb_emp E
INNER JOIN tb_emp_certi S
ON E.emp_no = S.emp_no
WHERE S.certi_cd = ANY (
    SELECT
        certi_cd
    FROM tb_certi
    WHERE issue_insti_nm = '�ѱ������ͺ��̽������'
)
GROUP BY E.emp_no, E.emp_nm
ORDER BY E.emp_no
;


-- EXISTS�� : ���������� �������� ���������� ��� ��  (exists �����ϴ�)
--           �����ϴ� ���� �ϳ��� �����ϸ� ��
-- �ּҰ� ������ �������� �ٹ��ϰ� �ִ� �μ������� ��ȸ (�μ��ڵ�, �μ���)
SELECT
    dept_cd,
    dept_nm
FROM tb_dept
WHERE dept_cd EXISTS (
    SELECT
        dept_cd
    FROM tb_emp
    WHERE addr LIKE '%����%'
)
;

SELECT
    dept_cd,
    dept_nm
FROM tb_dept D
WHERE EXISTS (
    SELECT
        dept_cd -- emp_nm���� ��Ī�ص� �Ȱ��� �� ���� * �ᵵ�ǰ� �ƹ��ų� �ᵵ �������
    FROM tb_emp E
    WHERE addr LIKE '%����%'
        AND D.dept_cd = E.dept_cd
)
;

SELECT
    dept_cd
FROM tb_emp E
WHERE addr LIKE '%����%'
;


SELECT
    dept_cd, emp_nm, addr
FROM tb_emp
WHERE addr LIKE '%����%'
;




SELECT
    emp_nm
FROM tb_emp
;

SELECT
    COUNT(emp_nm)
FROM tb_emp
;

SELECT
    DISTINCT(emp_nm)
    -- �̰����� 2�����´ٴϱ�?
FROM tb_emp
;

SELECT
    COUNT(DISTINCT(emp_nm))
FROM tb_emp
;

SELECT
    COUNT(DISTINCT emp_no || emp_nm)
FROM tb_emp
;



-- # ���� �÷� ��������
--  : ���������� ��ȸ �÷��� 2�� �̻��� ��������

-- �μ����� 2�� �̻��� �μ� �߿��� �� �μ��� 
-- ���� �������� ����� �̸� ������ϰ� �μ��ڵ带 ��ȸ

SELECT 
    A.emp_no, A.emp_nm, A.birth_de, A.dept_cd, B.dept_nm
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd
WHERE (A.dept_cd, A.birth_de) IN (
                        SELECT 
                            dept_cd, MIN(birth_de)
                        FROM tb_emp
                        GROUP BY dept_cd
                        HAVING COUNT(*) >= 2
                    )
ORDER BY A.emp_no
;



-- �ζ��� �� ��������
-- FROM���� ���� ��������

-- �� ����� ����� �̸��� ��ձ޿������� �˰�;�~
SELECT
    E.emp_no,
    E.emp_nm,
    AVG(S.pay_amt)
FROM tb_emp E
JOIN (
    SELECT
        emp_no, AVG(pay_amt) AS pay_avg
    FROM tb_sal_his
    GROUP BY emp_no
) S
ON E.emp_no = S.emp_no
ORDER BY E.emp_no
;


-- ��Į�� �������� (SELECT, INSERT, UPDATE���� ���� ��������)

-- ����� ���, �����, �μ���, �������, �����ڵ带 ��ȸ
SELECT
    E.emp_no,
    E.emp_nm,
    (SELECT dept_nm FROM tb_dept D WHERE E.dept_cd = D.dept_cd) AS dept_nm,
    E.birth_de,
    E.sex_cd
FROM tb_emp E
;



SELECT
    COUNT(0)
FROM tb_emp
;









