-- 실습문제


-- 1. employees테이블에서 각 사원의 부서별 부서 번호(department_id)와 
--    평균 급여(salary)를 조회하세요. 
--    단, 부서번호가 null이면 0으로 변경하여 조회세요.
SELECT
    CASE WHEN department_id IS NULL THEN 0 ELSE department_id END AS 부서번호,
    ROUND(AVG(salary), 2) AS 평균급여
FROM employees
GROUP BY department_id
ORDER BY 부서번호
;

SELECT 
  NVL(department_id, 0) AS dep_id
  , ROUND(AVG(salary), 2) AS avg_salary
FROM employees
GROUP BY department_id
ORDER BY dep_id
;

-- 2. employees테이블에서 부서별 부서 번호(department_id)와 부서별 총 사원 수를 조회하세요.
--    단, 부서번호가 null이면 0으로 변경하여 조회세요.
SELECT
    CASE WHEN department_id is null THEN 0 else department_id END AS 부서번호,
    COUNT(employee_id)
FROM employees 
GROUP BY department_id
ORDER BY 부서번호
;

SELECT 
    NVL(department_id, 0) AS dep_id
     , COUNT(employee_id) AS total_count
FROM employees
GROUP BY department_id
ORDER BY dep_id
;

-- 3. employees테이블에서 부서의 급여 평균이 8000을 초과하는 부서의 부서번호와 급여 평균을 조회하세요.
SELECT
    department_id,
    round(AVG(salary), 1)
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 8000
ORDER BY department_id
;

SELECT
    department_id,
    ROUND(AVG(salary), 2) AS avg_sal
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 8000
ORDER BY department_id
;

-- 4. employees테이블에서 급여 평균이 8000을 초과하는 각 직무(job_id)에 대하여 
--    직무 이름(job_id)이 SA로 시작하는 사원은 제외하고 직무 이름과 직무별 급여 평균을 
--    급여 평균이 높은 순서로 정렬하여 조회하세요.
SELECT
    job_id, 
    round(AVG(salary), 2) AS 평균금액
FROM employees
WHERE job_id NOT LIKE 'SA%'
GROUP BY job_id
HAVING AVG(salary) > 8000
ORDER BY AVG(salary) DESC
;

SELECT 
    job_id
    , ROUND(AVG(salary), 2) AS avg_sal
FROM employees
WHERE job_id NOT LIKE 'SA%'
GROUP BY job_id
HAVING AVG(salary) > 8000
ORDER BY avg_sal DESC
;
