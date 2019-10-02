-- 1. 연봉이 12000 이상되는 직원들의 LAST_NAME 및 연봉을 조회한다.
SELECT LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > 12000;

-- 2. 사원번호가 176 인 사람의 LAST_NAME 과 부서 번호를 조회한다.
SELECT EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 176;

-- ***3. 연봉이 5000 에서 12000의 범위 이외인 사람들의 LAST_NAME 및 연봉을 조회힌다.
SELECT LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY NOT BETWEEN 5000 AND 12000;

-- 4. 1998/02/20 일부터 1998/05/01 사이에 고용된 사원들의 LAST_NAME 사번, 고용일자를 조회한다.
-- 고용일자 순으로 정렬한다.
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN;

-- 5. 20 번 및 50 번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 부서 번호를 알파벳순으로 조회한다.
SELECT LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (20, 50)
ORDER BY LAST_NAME ASC;

-- ***6. 20 번 및 50 번 부서에 근무하며, 연봉이 5000 ~ 12,000 사이인 사원들의 LAST_NAME 및 연봉을 조회한다.
SELECT LAST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (20, 50) AND SALARY BETWEEN 5000 AND 12000;

-- 7. 1994년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회한다.

-- 8. 매니저가 없는 사람들의 LAST_NAME 및 JOB_ID 를 조회한다.
SELECT LAST_NAME, JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- 9. 커미션을 버는 모든 사원들의 LAST_ANME, 연봉 및 커미션을 조회한다.
-- 연봉 역순, 커미션 역순차로 정렬한다.
SELECT LAST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY SALARY DESC, COMMISSION_PCT DESC;

-- 10. LAST_NAME 의 네번째 글자가 a 인 사원들의 LAST_NAME 을 조회한다.
SELECT LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE '___a%';

-- ***11. LAST_NAME 에 a 및 e 글자가 있는 사원들의 LAST_NAME 을 조회힌다.
SELECT LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE '%a%' OR LAST_NAME LIKE '%e%';

-- 12. 연봉이 2,500, 3,500, 7,000 이 아니며 직업이 SA_REP 이나 ST_CLERK 인 사람들을 조회한다.
SELECT LAST_NAME, JOB_ID
FROM EMPLOYEES
WHERE SALARY NOT IN (2500, 3500, 7000) AND JOB_ID IN ('SA_REP', 'ST_CLERK');

-- 13. 직업이 AD_PRESS 인 사람은 A 등급을, ST_MAN 인 사람은 B 등급을, IT_PROG 인 사람은 C 등급을, SA_REP 인 사람은 D 등급을, ST_CLEAK 인 사람은 E 등급을 기타는 0 을 부여하여 조회한다.
SELECT JOB_ID, DECODE (JOB_ID, 'AD_PRESS', 'A',
                              'ST_MAN', 'B',
                              'IT_PROG', 'C',
                              'SA_REP', 'D',
                              '0') AS "등급"
FROM EMPLOYEES;

-- 14. 모든 사원들의 LAST_NAME, 부서 번호 및 부서 이름을 조회한다.
SELECT E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- 15. 부서번호 30 내의 모든 직업들을 유일한 포맷으로 조회한다. 
-- 90 부서 또한 포함한다.
SELECT DEPARTMENT_ID, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;

-- 16. 커미션을 버는 모든 사람들의 LAST_NAME, 부서 명, 지역 ID 및 도시 명을 조회한다.
SELECT E.LAST_NAME, D.DEPARTMENT_NAME, L.COUNTRY_ID, L.CITY
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
                 JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
WHERE COMMISSION_PCT IS NOT NULL;

-- 17. LAST_NAME 이 DAVIES 인 사람보다 후에 고용된 사원들의 LAST_NAME 및 HIRE_DATE 을 조회한다.
SELECT LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE LAST_NAME = 'DAVIES' ;

-- 18. 자신의 매니저보다 먼저 고용된 사원들의 LAST_NAME 및 고용일을 조회한다.


-- 19. 회사 전체의 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉을 자연수로 포맷하여 조회한다.
SELECT TRUNC (MAX (SALARY), 0) AS "최대연봉",
       TRUNC (MIN (SALARY), 0) AS "최소연봉",
       TRUNC (SUM (SALARY), 0) AS "총연봉",
       TRUNC (AVG (SALARY), 0) AS "평균연봉"
FROM EMPLOYEES;

-- 20. 각 JOB_ID 별, 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉을 자연수로 포맷하여 조회한다.
SELECT JOB_ID, TRUNC (MAX (SALARY), 0) AS "최대연봉",
       TRUNC (MIN (SALARY), 0) AS "최소연봉",
       TRUNC (SUM (SALARY), 0) AS "총연봉",
       TRUNC (AVG (SALARY), 0) AS "평균연봉"
FROM EMPLOYEES
GROUP BY JOB_ID;
-- ORDER BY JOB_ID;

-- ***21. 동일한 직업을 가진 사원들의 총 수를 조회한다.
SELECT JOB_ID, COUNT (JOB_ID)
FROM EMPLOYEES
GROUP BY JOB_ID;

-- 22. 매니저로 근무하는 사원들의 총 수를 조회한다.
SELECT JOB_ID, COUNT (JOB_ID)
FROM EMPLOYEES
WHERE JOB_ID LIKE ('___MGR')
GROUP BY JOB_ID;

-- 23. 사내의 최대 연봉 및 최소 연봉의 차이를 조회한다.
SELECT (MAX (SALARY) - MIN (SALARY)) AS "연봉차이"
FROM EMPLOYEES;

/*
사원 테이블에 2002년 이후 입사자들 중에서 연봉에 수당을 더한 실연봉을 1000단위 콤마처리하여 사원의 이름, 직종, 입사일, 연봉, 실연봉을 출력하세요
단, 입사일 형식은 YYYY-MM-DD로 하고 입사일이 오래된 순으로 정렬하세요
HINT) SELECT ~ ; 두 번
*/
alter session set nls_date_format = 'YYYY-MM-DD';
SELECT LAST_NAME, JOB_ID, HIRE_DATE, TO_CHAR (SALARY, '999,999') AS "SALARY"
FROM EMPLOYEES
WHERE TO_CHAR (HIRE_DATE, 'YYYY') >= '2002'
ORDER BY HIRE_DATE ASC;

/*
사원테이블에서 COUNTRY_ID가 US이고 급여의 합계가 5000이상인 사원의 직종,
급여의 합계("합계"로 별칭 부여하기), 부서이름, city를 city의 알파벳 순으로 출력
*/
SELECT E.JOB_ID, E.SALARY, D.DEPARTMENT_NAME, L.CITY
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
                 JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID;
/*
커미션이 책정된 사원들의 이름(frist_name), (last_name), 입사날짜, 연봉+커미션, 부서번호, 부서 지역을 출력한다.
-- 단, 연봉+커미션이 5000이상이며 입사 날짜가 04년 이상인 사원들만 출력하라.
*/





/*
1. union 문제
어제 만든 데이타 형식으로 1조에 대한 테이블을 만들고(세명만 만들어도 됨)
유니온을 사용해서 1조와 3조의 이름과 성별정보를 보여주세요.

2. HR 계정으로 들어가
employees 테이블에서 사원아이디 성, 이름을 출력 하되, 성은 모두 대문자로,
이름은 첫 세문자만(ex, 'James' --> 'Jam') 출력하시오.

3. HR 계정으로 들어가
employees 테이블에서 사원의 풀네임과 폰넘버를 출력하되, 폰 넘버 정보는 마지막 네글자를 가려주세요
(예  123.123.1234 --->  123.123.***********)

4. HR 계정으로 들어가
employees 테이블에서 사원의 풀네임과 입사일, 그리고 근속 월수, 17% 인상된 급여 를 출력하세요.
단 근무한지 오래된 사람 먼저 출력하세요. 그리고 인상된 급여는 정수로 표현해 주세요. 또한
그 결과는 1000단위 콤마 처리해 주시고 급여 앞에 $ 붙여 주세요 이쁘게.

5. HR 계정으로 들어가
employees 테이블에서. 사원의 이름과 입사일을 출력해 주세요. 단 입사일은 YYYY-MM 형태로 표현해주세요.

*/

/*
1. 사원테이블에서 사번, 이름, 급여, 입사일을 출력하되 사번을 정렬하고, 그 그룹안에서 입사일을 최근 입사한 순으로 출력하세요.

2. 사원테이블에서 이름에 'IN'이 들어가는 이름을 알파벳 순으로 출력하세요.

3. group3 테이블에 조원이름(name), 성별(sex), 태어난년도(ex.1991), 취미(hobby)를 만들고, 3조의 조원들의 정보를 넣어보세요. 
    / 태어난 년도 날짜형식에 맞추지않음. 그냥 숫자데이터로 작성
    / 조원이름, 성별, 태어난달 은 필수사항   
    / 취미는 옵션사항

4. group3 테이블에서 태어난년도가 1991 또는 1995가 아닌 조원의 조원이름, 성별, 태어난년도를 출력하세요.
*/