-- 1. employees 테이블에서 모든 사원의 first_name을 대문자로 변환하여 출력하세요.
SELECT
    UPPER(first_name)
FROM employees
;

-- 2. employees 테이블에서 모든 사원의 last_name을 소문자로 변환하여 출력하세요.
SELECT
    LOWER(last_name)
FROM employees
;

-- 3. employees 테이블에서 각 사원의 hire_date의 연도만 추출하여 출력하세요.
-- TO_NUMBER 사용하면 숫자열로 변경
SELECT
    TO_NUMBER(TO_CHAR(hire_date, 'YYYY'))
--    EXTRACT(YEAR FROM hire_date)  -- 추출하다...
FROM employees
;

-- 4. employees 테이블에서 각 사원의 hire_date의 월과 일을 연결하여 출력하세요. 예: MM-DD 형식.
SELECT
    TO_CHAR(hire_date, 'MM-DD')
FROM employees
;

-- 5. departments 테이블에서 모든 부서의 department_name의 앞 두 글자만 출력하세요.
SELECT
    SUBSTR(department_name, 1, 2)
FROM departments
;

-- 6. employees 테이블에서 manager_id가 NULL인 사원의 이름과 직책을 출력하세요.
SELECT
    first_name, 
    job_ID 
FROM employees 
    WHERE manager_id IS NULL
;
    
-- 7. jobs 테이블에서 job_title의 길이를 계산하여 출력하세요.
SELECT
    LENGTH(job_title)
FROM jobs
;

-- 8. employees 테이블에서 사원의 이름을 성과 이름으로 나누어 각각 '성', '이름' 별칭으로 출력하세요.
SELECT
    last_name AS 성, 
    first_name AS 이름 
FROM employees
;

-- 9. employees 테이블에서 각 사원의 성의 첫 글자와 이름을 연결하여 출력하세요.
SELECT
    CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 20))
--    SUBSTR(last_name, 1, 1) || first_name
--    CONCAT(SUBSTR(last_name, 1, 1), first_name) 
FROM employees
;

-- 10. locations 테이블에서 city의 이름을 역으로 출력하세요. 
-- 서울의 스펠링을 울서로 바꿔라
SELECT
    REVERSE(city)
FROM locations
; 

-- 11. employees 테이블에서 각 사원의 salary를 100달러 단위로 올림하여 출력하세요.
-- 100달러 단위로 올림 12570 -> 12600 , 8748 -> 8800 으로
SELECT
    CEIL(salary / 100) * 100
FROM employees
;

-- 12. employees 테이블에서 각 사원의 commission_pct가 NULL일 경우, 0으로 표시하여 출력하세요.
SELECT
    first_name,
    NVL(commission_pct, '0')
FROM employees
;

-- 13. employees 테이블에서 각 사원의 이름의 첫 글자와 성의 첫 글자를 연결하여 출력하세요.
SELECT
     CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 1))
FROM employees
;

-- 14. employees 테이블에서 각 사원의 salary에 대해 10% 인상한 금액을 계산하여 출력하세요.
SELECT
    salary * 1.1
FROM employees
;

-- 15. countries 테이블에서 각 국가의 이름을 세 글자로 줄여서 출력하세요.
SELECT
    SUBSTR(country_name, 1, 3)
FROM countries
;

-- 16. employees 테이블에서 각 사원의 last_name의 두 번째 글자를 '*'로 변경하여 출력하세요
SELECT
    CONCAT(SUBSTR(last_name, 1, 1) , '*') || SUBSTR(last_name, 3) 
FROM employees
;

-- 17. employees 테이블에서 job_id가 it_prog인 사원의 first_name과 salary를 출력하세요.
SELECT
    --RPAD(first_name, 10, '!')  글자수를 10글자로 늘려놓고 빈 공간을 !로 출력시킴
    RPAD(SUBSTR(first_name, 1, 3), LENGTH(first_name), '*') AS name,
--    CONCAT(SUBSTR(first_name, 1, 3), '*') AS name,
    salary
FROM employees
    WHERE LOWER(job_id) = 'it_prog'
;
-- 조건1 ) 비교하기 위한 값은 소문자로 입력할 것!
-- 조건2 ) 이름은 앞 3글자까지만 출력하고 나머지는 *로 마킹할 것. 
-- 이 열의 별칭은 name입니다.