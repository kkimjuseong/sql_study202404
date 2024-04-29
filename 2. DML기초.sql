
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
    (1, '선풍기', 120000, SYSDATE);
    
INSERT INTO goods
    (id, goods_name, price, reg_date)
VALUES 
    (2, '세탁기', 2000000, SYSDATE);
    
INSERT INTO goods
    (id, goods_name, reg_date)
VALUES 
    (3, '달고나', SYSDATE);
    
INSERT INTO goods
    (id, goods_name)
VALUES 
    (4, '계란');

INSERT INTO goods
    (goods_name, id, reg_date, price)
VALUES 
    ('점퍼', 5, SYSDATE, '49000');
    
-- 컬럼명 생략시 테이블구조 순서대로 자동 기입.
INSERT INTO goods

VALUES 
    (6, '냉장고', 1000000, SYSDATE);
    
SELECT * FROM goods;

-- UPDATE
-- id를 설정하지 않고 name만 바꾸게 되면 전체가 수정이 됨 조심!!
UPDATE goods
SET goods_name = '에어컨'
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
SET goods_name = '청바지', 
    price = 299000
WHERE id = 3;

-- DELETE
-- 조건없이 delete하면 전체삭제가 됨 복구는 가능.
DELETE FROM goods
WHERE id = 11;
-- TRUNCATE TABLE goods; 복구가 불가능한 삭제기능
-- DROP TABLE goods;     복구 불가능에 테이블까지 삭제 위험함.


SELECT * FROM goods;



-- SELECT 기본
SELECT
    certi_cd, 
    certi_nm, 
    issue_insti_nm
FROM tb_certi
;

-- 컬럼 순서를 바꿔서 조회하는건 상관없음.
SELECT ALL
    certi_nm,
    issue_insti_nm
FROM tb_certi
;

-- 중복제거 DISTINCT 원래 all이 있는데 생략이 가능하기 때문에 안써도 됨.
SELECT DISTINCT
    issue_insti_nm
FROM tb_certi
;

-- * 은 all의 뜻도 가지고있어 전체조회
SELECT
    *
FROM tb_certi
;

-- 열 별칭 부여
SELECT
    emp_nm AS "사원명",
    addr AS "주소"
FROM tb_emp
;

-- AS는 생략이 가능함.
SELECT
    emp_nm "사원명",
    addr "주소"
FROM tb_emp
;

-- "" 생략 가능함
SELECT
    emp_nm 사원명,
    addr 주소
FROM tb_emp
;

-- 띄어쓰기 있을경우 ""생략 불가능
SELECT
    emp_nm 사원명,
    addr "거주지 주소"
FROM tb_emp
;

-- 문자열 결합하기 +가 아니라 ||로 연결시킬 수 있다.
SELECT 
    '자격증: ' || certi_nm AS "자격증 정보"
FROM tb_certi;

SELECT
    certi_nm || ' (' || issue_insti_nm || ')' AS "자격증"
FROM tb_certi
;





