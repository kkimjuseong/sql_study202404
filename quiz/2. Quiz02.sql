-- 1. employees ���̺��� ��� ����� first_name�� �빮�ڷ� ��ȯ�Ͽ� ����ϼ���.
SELECT
    UPPER(first_name)
FROM employees
;

-- 2. employees ���̺��� ��� ����� last_name�� �ҹ��ڷ� ��ȯ�Ͽ� ����ϼ���.
SELECT
    LOWER(last_name)
FROM employees
;

-- 3. employees ���̺��� �� ����� hire_date�� ������ �����Ͽ� ����ϼ���.
-- TO_NUMBER ����ϸ� ���ڿ��� ����
SELECT
    TO_NUMBER(TO_CHAR(hire_date, 'YYYY'))
--    EXTRACT(YEAR FROM hire_date)  -- �����ϴ�...
FROM employees
;

-- 4. employees ���̺��� �� ����� hire_date�� ���� ���� �����Ͽ� ����ϼ���. ��: MM-DD ����.
SELECT
    TO_CHAR(hire_date, 'MM-DD')
FROM employees
;

-- 5. departments ���̺��� ��� �μ��� department_name�� �� �� ���ڸ� ����ϼ���.
SELECT
    SUBSTR(department_name, 1, 2)
FROM departments
;

-- 6. employees ���̺��� manager_id�� NULL�� ����� �̸��� ��å�� ����ϼ���.
SELECT
    first_name, 
    job_ID 
FROM employees 
    WHERE manager_id IS NULL
;
    
-- 7. jobs ���̺��� job_title�� ���̸� ����Ͽ� ����ϼ���.
SELECT
    LENGTH(job_title)
FROM jobs
;

-- 8. employees ���̺��� ����� �̸��� ���� �̸����� ������ ���� '��', '�̸�' ��Ī���� ����ϼ���.
SELECT
    last_name AS ��, 
    first_name AS �̸� 
FROM employees
;

-- 9. employees ���̺��� �� ����� ���� ù ���ڿ� �̸��� �����Ͽ� ����ϼ���.
SELECT
    CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 20))
--    SUBSTR(last_name, 1, 1) || first_name
--    CONCAT(SUBSTR(last_name, 1, 1), first_name) 
FROM employees
;

-- 10. locations ���̺��� city�� �̸��� ������ ����ϼ���. 
-- ������ ���縵�� �Ｍ�� �ٲ��
SELECT
    REVERSE(city)
FROM locations
; 

-- 11. employees ���̺��� �� ����� salary�� 100�޷� ������ �ø��Ͽ� ����ϼ���.
-- 100�޷� ������ �ø� 12570 -> 12600 , 8748 -> 8800 ����
SELECT
    CEIL(salary / 100) * 100
FROM employees
;

-- 12. employees ���̺��� �� ����� commission_pct�� NULL�� ���, 0���� ǥ���Ͽ� ����ϼ���.
SELECT
    first_name,
    NVL(commission_pct, '0')
FROM employees
;

-- 13. employees ���̺��� �� ����� �̸��� ù ���ڿ� ���� ù ���ڸ� �����Ͽ� ����ϼ���.
SELECT
     CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 1))
FROM employees
;

-- 14. employees ���̺��� �� ����� salary�� ���� 10% �λ��� �ݾ��� ����Ͽ� ����ϼ���.
SELECT
    salary * 1.1
FROM employees
;

-- 15. countries ���̺��� �� ������ �̸��� �� ���ڷ� �ٿ��� ����ϼ���.
SELECT
    SUBSTR(country_name, 1, 3)
FROM countries
;

-- 16. employees ���̺��� �� ����� last_name�� �� ��° ���ڸ� '*'�� �����Ͽ� ����ϼ���
SELECT
    CONCAT(SUBSTR(last_name, 1, 1) , '*') || SUBSTR(last_name, 3) 
FROM employees
;

-- 17. employees ���̺��� job_id�� it_prog�� ����� first_name�� salary�� ����ϼ���.
SELECT
    --RPAD(first_name, 10, '!')  ���ڼ��� 10���ڷ� �÷����� �� ������ !�� ��½�Ŵ
    RPAD(SUBSTR(first_name, 1, 3), LENGTH(first_name), '*') AS name,
--    CONCAT(SUBSTR(first_name, 1, 3), '*') AS name,
    salary
FROM employees
    WHERE LOWER(job_id) = 'it_prog'
;
-- ����1 ) ���ϱ� ���� ���� �ҹ��ڷ� �Է��� ��!
-- ����2 ) �̸��� �� 3���ڱ����� ����ϰ� �������� *�� ��ŷ�� ��. 
-- �� ���� ��Ī�� name�Դϴ�.