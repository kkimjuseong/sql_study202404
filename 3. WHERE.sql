

-- WHERE 조건절
-- 조회 행을 제한한다.
SELECT
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM tb_emp
WHERE sex_cd = 2
;

-- pk(primary key)로 필터링 하면 무조건 1건 이하가 조회가 됨
SELECT
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM tb_emp
WHERE emp_no = 1000000003
;



-- 비교 연산자
SELECT
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM tb_emp
WHERE sex_cd != 2
;

SELECT
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM tb_emp
WHERE sex_cd <> 2
;

SELECT
    emp_no,
    emp_nm,
    addr,
    birth_de
FROM tb_emp
WHERE birth_de >= '19800101'
    AND birth_de <= '19891231'
;

SELECT
    emp_no,
    emp_nm,
    addr,
    birth_de
FROM tb_emp
WHERE NOT birth_de >= '19800101'
;


-- BETWEEN 연산자
SELECT 
    emp_no,
    emp_nm,
    birth_de
FROM tb_emp
WHERE birth_de BETWEEN '19900101' AND '19991231'
;

SELECT 
    emp_no,
    emp_nm,
    birth_de
FROM tb_emp
WHERE birth_de NOT BETWEEN '19900101' AND '19991231'
;

-- IN 연산 : OR 연산
SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp
WHERE dept_cd = 100002
    OR dept_cd = 100007
;


-- IN 연산
SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp
WHERE dept_cd IN (100002, 100007, 100008)
;


-- LIKE 
-- 검색에서 사용
-- 와일드카드 매핑 (%: 0글자이상 , _ : 딱 1글자)

SELECT 
    emp_no, 
    emp_nm, 
    addr
FROM tb_emp
-- = 자리에 LIKE를 사용해야 함
WHERE addr LIKE '%용인%'
;

SELECT 
    emp_no, 
    emp_nm, 
    addr
FROM tb_emp
WHERE emp_nm LIKE '이%'
;

SELECT 
    emp_no, 
    emp_nm, 
    addr
FROM tb_emp
WHERE emp_nm LIKE '이__'
;

-- %가 앞에있으면 _ 로 끝나는 사람
-- %가 뒤에있으면 _ 로 시작하는 사람출력
SELECT 
    emp_no, 
    emp_nm, 
    addr
FROM tb_emp
WHERE emp_nm LIKE '%심'
;


SELECT 
    email
from user
where email like '_A%@%' -- banana@gamil.com 가 출력이 됨
;

-- 성씨가 김씨 이면서 부서가 100003, 100004 중에 하나면서
-- 90년대 생인 사원의 사번, 이름, 생일, 부서코드를 조회하세요.
select 
    emp_no,
    emp_nm,
    birth_de,
    dept_cd
from tb_emp
-- 1=1(true) 을 걸고 모두에게 and를 걸어주면 필요한부분만 주석처리가 가능해서 좋다.
WHERE 1=1
    and emp_nm LIKE '김%'
    and dept_cd in (100003, 100004)
    and birth_de BETWEEN '19900101' and '19991231'
;


-- NULL값 조회
-- 반드시 IS NULL로 조회할 것!!!!!!!!
SELECT
    emp_no,
    emp_nm,
    direct_manager_emp_no
FROM tb_emp
-- 반드시 is null 넣어야함
WHERE direct_manager_emp_no IS NULL
;

-- NOT 위치는 is 와 null 사이에 넣어야 함 ㅈ같네
SELECT
    emp_no,
    emp_nm,
    direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NOT NULL
;

-- 연산자 우선 순위
-- NOT > AND > OR
SELECT 
	EMP_NO ,
	EMP_NM ,
	ADDR 
FROM TB_EMP
WHERE 1=1
	AND EMP_NM LIKE '김%'
	AND (ADDR LIKE '%수원%' OR ADDR LIKE '%일산%')
;
-- 1 and 2 or 3
-- ()가 없을경우 and가 or 보다 우선순위가 높아
-- 김씨 이면서 수원사는사람과 일산사는사람 전부가 출력이 된다.
-- 즉 김$와 수원이 ()가 쳐지게 되는 것 이다. 주의하기!!

    

