-- 1. 모든 사원의 모든 컬럼 조회
SELECT * FROM EMPLOYEE;

-- 2. 사원들의 사번(사원번호), 이름 조회
SELECT
    EMP_ID,
    EMP_NAME
FROM
    EMPLOYEE;

-- 3. 201번 사번의 사번 및 이름 조회
SELECT EMP_ID, EMP_NAME FROM EMPLOYEE WHERE EMP_ID = '201';

-- 4. 부서 코드가 'D9'인 사원의 이름과 부서코드 조회
SELECT EMP_NAME, DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE = 'D9';

-- 5. 직급 코드가 'J1'인 사원 조회
SELECT * FROM EMPLOYEE WHERE JOB_CODE = 'J1';

-- 6. 급여가 300만원 이상인 사원의 사번, 이름, 급여 조회
SELECT EMP_ID, EMP_NAME, SALARY FROM EMPLOYEE WHERE SALARY >= 3000000;

-- 7. 부서코드가 'D6'이고 급여를 300만원보다 많이 받는 사원의 이름, 급여 조회
SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE DEPT_CODE = 'D6' AND SALARY > 3000000;

-- 8. 보너스를 받지 않는 사원의 사번, 이름, 급여, 보너스 조회
-- BONUS 컬럼 값이 없는(NULL) 사원만 필터링, BONUS=0인 사원은 포함 안 됨
SELECT EMP_ID, EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
WHERE BONUS IS NULL;

-- 9. 'D9' 부서에서 근무하지 않는 사원의 사번, 이름 조회
SELECT EMP_ID, EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE != 'D9'   -- D9가 아닌 부서 사원  DEPT_CODE <> 'D9'
   OR DEPT_CODE IS NULL;  -- 부서 자체가 없는(NULL) 사원도 포함
-- ⚠️ NULL != 'D9' 도 false로 처리되기 때문에
--    IS NULL 조건을 OR로 따로 추가해야 해요!

-- 10. 퇴사 여부가 N인 직원의 사번, 이름, 입사일 조회 (별칭 사용)
-- AS 별칭으로 컬럼명을 한글로 변경, ENT_YN='N'은 재직중인 직원
SELECT EMP_ID AS 사번, EMP_NAME AS 이름, HIRE_DATE AS 입사일
FROM EMPLOYEE
WHERE ENT_YN = 'N';

-- 11. 급여가 350만원 이상 550만원 이하를 받는 직원의 사번, 이름, 급여 조회
-- BETWEEN A AND B는 A이상 B이하 (경계값 포함), SALARY>=3500000 AND SALARY<=5500000 과 동일
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY BETWEEN 3500000 AND 5500000;

-- 12. '성이 김씨'인 직원의 사번, 이름, 입사일 조회
-- LIKE '김%': 김으로 시작하는 모든 이름, %는 뒤에 어떤 글자가 와도 OK
SELECT EMP_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '김%';

-- 13. '성이 김씨'가 아닌 직원의 사번, 이름, 입사일 조회
-- NOT LIKE: LIKE의 반대, 김으로 시작하지 않는 이름만 조회
SELECT EMP_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE EMP_NAME NOT LIKE '김%';

-- 14. 이름에 '하' 문자가 포함된 직원의 이름, 주민번호, 부서코드 조회
-- '%하%': 앞뒤로 % 붙이면 이름 어디든 '하'가 포함된 경우 검색 (예: 하동운, 유하진)
SELECT EMP_NAME, EMP_NO, DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%하%';

-- 15. 'J2'직급이거나 'J7'직급인 직원들 중 급여가 200만원 이상인 직원의 이름, 급여 조회
-- IN('J2','J7')은 JOB_CODE='J2' OR JOB_CODE='J7'과 동일, AND로 급여 조건 추가
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE JOB_CODE IN ('J2', 'J7')
  AND SALARY >= 2000000;

-- 16. 급여가 높은 순서대로 사원의 이름, 급여 조회 (상위 5명만)
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
ORDER BY SALARY DESC  -- 내림차순: 높은 급여부터
LIMIT 5;              -- 상위 5개 행만 출력

-- 17. 중복된 급여 범위를 제거하고 급여 조회
SELECT DISTINCT SAL_LEVEL
FROM EMPLOYEE;
-- DISTINCT: 중복 제거
-- 같은 SAL_LEVEL이 여러 사원에게 있어도 한 번만 출력

-- 18. 이름 사전순 정렬 상위 10명
SELECT EMP_NAME
FROM EMPLOYEE
ORDER BY EMP_NAME ASC  -- 오름차순: 가나다 순 (ASC 생략 가능)
LIMIT 10;              -- 상위 10명만