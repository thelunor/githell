/*
[1일차 수업]
1. 오라클 소프트웨어 다운로드

1.11g Express Edition  버전
https://www.oracle.com/database/technologies/xe-prior-releases.html

2.오라클 접속 툴 (무료버전)
https://www.oracle.com/tools/downloads/sqldev-v192-downloads.html

3. 설치 (관리자 권한 : SYSTEM , SYS 계정 >> 암호설정 : 1004)
    Port for 'Oracle Database Listener': 1521

4. 접속 (sqlplus 툴 : DOS 기반) >> UI 툴 설치

5. 오라클 제공 : SqlDeveloper 
   유료 :  토드 , 오렌지 , sqlgate
   무료 :  https://dbeaver.io/download/   


6.  Tool 접속
     SYSTEM : 1004 계정 접속  (관리자 권한)
     6.1 HR 계정 사용 (unlock)
     -- USER SQL
     ALTER USER "HR" IDENTIFIED BY "1004" 
     DEFAULT TABLESPACE "USERS"
     TEMPORARY TABLESPACE "TEMP"
     ACCOUNT UNLOCK ; 
    6.2  HR 계정으로  로그인 (테이블 조회)

7.  새로운 계정 만들기 (실습용 계정)
    bituser : 1004
   	 -- USER SQL
	CREATE USER bituser IDENTIFIED BY 1004 
	DEFAULT TABLESPACE "USERS"
	TEMPORARY TABLESPACE "TEMP";

	-- QUOTAS
	ALTER USER bituser QUOTA UNLIMITED ON USERS;

	-- ROLES
	GRANT "CONNECT" TO bituser WITH ADMIN OPTION;
	GRANT "RESOURCE" TO bituser WITH ADMIN OPTION;
	ALTER USER bituser DEFAULT ROLE "CONNECT","RESOURCE";

	-- SYSTEM PRIVILEGES

8. 실습 script 만들기
    CREATE TABLE EMP
(EMPNO number not null,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR number ,
HIREDATE date,
SAL number ,
COMM number ,
DEPTNO number );
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,null,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,200,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,30,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,300,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,'1981-04-01',2850,null,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,'1981-06-01',2450,null,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,'1982-10-09',3000,null,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',null,'1981-11-17',5000,3500,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,null,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,'1981-10-03',950,null,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,'1981-10-3',3000,null,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10);

COMMIT;

CREATE TABLE DEPT
(DEPTNO number,
DNAME VARCHAR2(14),
LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

COMMIT;

=========================================================


CREATE TABLE SALGRADE
( GRADE number,
LOSAL number,
HISAL number );

INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;
*/








SELECT [DISTINCT]  {*, column [alias], . . .}   
      FROM  table_name   
      [WHERE  condition]   
      [ORDER BY {column, expression} [ASC | DESC]]; 
      
/*
DISTINCT  중복 행 제거 옵션 
*   테이블의 모든 column 출력 
alias   해당 column 에 대한 다른 이름 부여 
table_name 테이블명 질의 대상 테이블 이름 
WHERE   조건을 만족하는 행들만 검색 
condition  column, 표현식, 상수 및 비교 연산자 
ORDER BY  질의 결과 정렬을 위한 옵션(ASC:오름차순(Default),DESC 내림차순

[] 생략해도 된다
*/

-- 1. 사원테이블에 있는 모든 데이터를 출력하세요
select * from emp; -- 쿼리문은 대소문자 구분하지 않는다

-- 2. 특정 컬럼 데이터 추출하기
select empno, ename, job, sal from emp;

select empno from emp;

select hiredate, deptno from emp;

-- 3. 컬럼에 가명칭(alias) 부여하기
-- select empno 사번, ename 이름 -- 띄어쓰기 불가능, 바로 앞 단어까지만 인식
-- from emp;
select empno "사   번", ename "이   름"
from emp;

-- 정식(ansi 표준): 권장사항
select empno as "사   번", ename as "이   름"
from emp;

-- Oracle: 문자열 데이터에서 엄격하게 대소문자 구분
-- 데이터(문자): A, a는 서로 다른 문자 >> '문자'
select * from emp where ename = 'king'; -- 데이터가 출력되지 않는다
select * from emp where ename = 'KING'; -- 대소문자를 구분하면 출력된다
select * from emp where ename = 'King';

-- Oracle: 연산자(결합 연산자) >> || >> 'hello' || 'world': 결합 >> 'helloworld'
-- Java: + 산술, 결합, ex) 10 + 10(산술), "A" + "B"(결합)
-- Tip) ms-sql: + 연산(산술), 결합

select '사원의 이름은' || ename || '입니다'
from emp;
select '사원의 이름은' || ename || '입니다' as "ename" -- Oracle ""은 가명칭 밖에 없다
from emp;

-- Java: class Emp {private int empno;}
-- Point: Oracle의 컬럼은 타입정보를 갖는다
-- 현재 내가 가지고 있는 emp 정보를 보는 방법
desc emp; -- emp 컬럼의 타입정보

select empno + ename as "결합" -- 연산 수행: 에러: "invalid number"
from emp;

select empno || ename as "결합" -- 숫자와 문자는 결합 가능(내부적으로는 자동형변환: 숫자->문자), to_char()
from emp;

-- 사장님 왈: 우리 회사에 직종(job)이 몇 개나 있나
select job from emp;
-- 중복 데이터 제거 키워드: distinct
select distinct job from emp;

select distinct deptno from emp;

-- distinct 원리: 컬럼이 2개 이상일 경우(보통은 하나씩만 쓴다) >> grouping(꾸러미)
select distinct job, deptno from emp order by job;
select distinct deptno, job from emp order by deptno;

-- Oracle 언어(SQL)
-- Java도 언어: 연산자 >> Oracle도 연산자
-- Oracle 연산자: Java와 80% 정도 동일

-- Java(%는 나머지 연산자) >> Oracle(%는 검색패턴자원으로 활용) >> 나머지 함수를 만듦: Mod() 함수
-- Oracle(+, -, *, /, ...) + 나머지 Mod() 함수

-- 사원테이블에서 사원의 급여를 100달러 인상한 결과를 출력하세요
-- 전제조건: 컬럼의 타입이 NUMBER
desc emp;
select empno, ename, sal, sal + 100 as "급여인상"
from emp;

-- 재미로...: 산술연산자와 결합연산자가 구분되어 있다
select 100 + 100 from dual; -- dual 임시 테이블(데이터 테스트 할 때 사용하는)
select 100 || 100 from dual; -- || 무조건 결합(숫자 -> 문자 자동형변환)
select '100' + 100 from dual; -- + 무조건 산술연산('100' -> 숫자 형변환)
select 'A100' + 100 from dual; -- error: "invalid number"

-- 비교연산자
-- >, >=, <, ...
-- Java에서 같다: (==), 우측의 값을 왼쪽으로 할당
-- javascript: (===)
-- Oracle에서 같다: (=), 같지 않다: (!=), Oracle은 할당이라는 것이 없다

-- 논리연산자
-- AND, OR, NOT

/*
SELECT [DISTINCT]  {*, column [alias], . . .}   
FROM  table_name   
[WHERE  condition]   
[ORDER BY {column, expression} [ASC | DESC]]; 
*/

-- 조건절(원하는 row만 가지고 오겠다)
-- 실행순서: select 절, from 절, where 절
select * -- 3
from emp -- 1
where sal >= 3000; -- 2

 -- 이상, 이하(= 포함)
 -- 초과, 미만(= 미포함)
 
 -- 사번이 7788번인 사원의 사번, 이름, 직종, 입사일을 출력하세요
 select * -- *으로 먼저 다 뽑아서 조건을 만족하는 경우를 찾는다
 from emp
 where empno = 7788;
 select empno, ename, job, hiredate
 from emp
 where empno = 7788;
 
 -- 사원의 이름이 KING인 사원의 사번, 이름, 급여정보를 출력하세요
 select *
 from emp
 where ename = 'KING';
 select empno, ename, sal
 from emp
 where ename = 'KING';
 
 -- 급여가 2,000달러 이상이면서 직종이 MANAGER인 사원의 모든 정보를 출력하세요
 -- 논리연산자: and, or, not
 select *
 from emp
 where sal >= 2000 AND job = 'MANAGER';
 
 -- 급여가 2,000달러이거나 직종이 MANAGER인 사원의 모든 정보를 출력하세요
 select * -- 3
 from emp -- 1
 where sal >= 2000 or job = 'MANAGER'; -- 2
 
 -- Oracle 날짜
 -- DB 서버의 날짜
 -- 시스템: 날짜를 가지고 있다 >> sysdate
 select sysdate from dual;
 -- 게시판 글쓰기: insert into board(writer, title, content, regdate)
 --              values('홍길동', '방가방가', '피곤해요', sysdate)
 -- Tip: ms-sql >> select getdate()
 
 select hiredate from emp;
 desc emp; -- date
 -- Oracle 시스템정보를 담고 있는 테이블을 별도로 관리
 -- 환경설정
 select * from SYS.NLS_SESSION_PARAMETERS; -- 메모장에 담아두고 필요할 때 가져다 쓴다(외우지 않음)
 -- NLS_LANGUAGE	KOREAN
 -- NLS_DATE_FORMAT	RR/MM/DD >> 변경도 가능하다
 -- NLS_DATE_LANGUAGE	KOREAN
 -- NLS_TIME_FORMAT	HH24:MI:SSXFF
 
 select * from SYS.NLS_SESSION_PARAMETERS where parameter = 'NLS_DATE_FORMAT';
 -- Point
 -- 서버기준에서 설정변경 가능(DBA)
 -- 현재 접속한 사용자: session 기준으로 적용
 -- 다른 곳에서 bituser로 접속하면 날짜형식은 변경되지 않고(그대로 유지)

alter session set nls_date_format = 'YYYY-MM-DD HH24:MI:SS'; -- 변경
select * from SYS.NLS_SESSION_PARAMETERS where parameter = 'NLS_DATE_FORMAT'; -- 변경확인

-- NLS_DATE_FORMAT	YYYY-MM-DD HH24:MI:SS
select sysdate from dual; -- 2019-09-24 11:52:48
select hiredate from emp; -- 1980-12-17 00:00:00
-- DB서버가 아닌 session에 대해서 처리하도록 변경

select *
from emp
where hiredate = '1980-12-17'; -- 날짜형식표현은 문자와 동일

select *
from emp
where hiredate = '1980/12/17'; -- 날짜형식에 대해 '-'와 '/' 둘 다 인정

select * from emp;
select *
from emp where hiredate = '80-12-17'; -- 날짜형식을 바꿔놓았기 때문에 조회가 되지 않는다
-- RR-MM-DD >> YYYY-MM-DD

-- 사원의 급여가 2,000달러 이상이고 4,000달러 이하인 모든 사원의 정보를 출력하세요
select *
from emp
where sal >= 2000 and sal <= 4000; -- 개발자가 실수하기 쉽고 싫어하는 코드(sal 두 번)
-- 연산자: column명 between A and B('=' 포함)
select *
from emp
where sal between 2000 and 4000;

-- 사원의 급여가 2,000달러 초과이고 4,000달러 미만인 모든 사원의 정보를 출력하세요
select *
from emp
where sal > 2000 and sal < 4000; -- 초과, 미만은 between 사용불가(별도로 만들어두지 않았다)

-- 부서번호가 10번 또는 20번 또는 30번인 사원의 사번, 이름, 급여, 부서번호를 출력하세요
select *
from emp
where deptno = 10 or deptno = 20 or deptno = 30;
select empno, ename, sal, deptno
from emp
where deptno = 10 or deptno = 20 or deptno = 30;
-- in 연산자: 조건 or 조건 or 조건...
select empno, ename, sal, deptno
from emp
where deptno in (10, 20, 30); -- where deptno = 10 or deptno = 20 or deptno = 30;

-- 부서번호가 10번 또는 20번이 아닌 사원의 사번, 이름, 급여, 부서번호를 출력하세요
select *
from emp
where deptno != 10 and deptno != 20;
-- not in 연산자
select empno, ename, sal, deptno
from emp
where deptno not in (10, 20); -- where deptno != 10 and deptno != 20;

-- Point: 값이 없다(데이터가 없다): null
-- null: 필요악
-- Java: calss Member { private String userid }
create table member ( -- member 테이블
userid varchar2(20) not null, -- null이 아니어야 한다(입력해야만 한다)
name varchar2(20) not null,
hobby varchar2(20) -- default: null >> null값 허용 >> 필수 입력사항이 아니다
)

select * from member;

insert into member (userid, name) values ('hong', '홍길동')
select * from member;

insert into member (userid, hobby) values ('kim', '농구')
-- error: ORA-01400: cannot insert NULL into ("BITUSER"."MEMBER"."NAME")

insert into member (userid, name, hobby) values ('park', '박군', '축구')
select * from member;

-- 실반영
commit;
select * from member;

-- 수당을 받지 않는 모든 사원의 정보를 수정하세요
desc emp;
select * from emp;
-- null은 다른 연산자(is null)
select * from emp where comm = null; -- 이렇게 안 씁니다

-- null 비교 *** ***
select * from emp where comm is null;
select * from emp where comm is not null; -- is null 반대

-- 수당을 받는 모든 사원의 정보를 출력하세요
select * from emp where comm is not null;

-- 사원 테이블에서 사번, 이름, 급여, 수당, 총급여를 출력하세요
-- 총급여 = 급여 + 수당
select empno, ename, sal, comm, sal + comm as "총급여" from emp;

-- Point: null
-- null과의 모든 연산은 그 결과가 null
-- nvl () 탄생: null을 만나면 대체값으로 바꿔라
-- nvl ()에서 버전업 nvl2
-- ms-sql: convert () ***
-- my-sql: IFNULL () ***
select 1000 + null from dual; -- 결과값 null
select 1000 + nvl (null, 0) from dual; -- 첫 번째 파라미터가 null이면 두 번째 값으로 바꿔라
select 'A' || null from dual; -- 문자열은 상관없음
select 1000 + nvl (null, 1111) from dual;
select nvl (comm, 0) from emp;

select empno, ename, sal, comm, sal + nvl (comm, 0) as "총급여" from emp;
-- nvl *****

-- 사원의 급여가 1,000달러 이상이고 수당을 받지 않는 사원의 사번, 이름, 직종, 급여, 수당을 출력하세요
select empno, ename, job, sal, comm
from emp
where sal >= 1000 and comm is null;

-- DQL(Data Query Language): SELECT
-- DDL: 정의어(CREATE, ALTER, DROP(객체 생성, 수정, 삭제))

create table board (
  boardid number not null, -- 필수입력사항
  title varchar2(20) not null, -- 필수입력사항(영문자, 특수문자, 공백: 1byte | 한글: 2byte)
  content varchar2(2000) not null, -- 필수입력사항
  hp varchar2(20) -- default null: 선택입력사항
);

-- DML(데이터 조작어): insert, update, delete
-- 작업 시에는(실제 반영)이나 취소처리를 위해 commit, rollback 반드시 사용

insert into board (boardid, title, content)
values (100, '오라클', '참 쉽네');

select * from board;
commit; -- 실반영

insert into board (boardid, title, content)
values (200, '자바', '그립다');
select * from board;
insert into board (boardid, title, content)
values (300, '자바', '그립다');
select * from board;
rollback;
select * from board;
-- insert, update, delete 작업 오라클(무조건 commit, rollback 반드시)
-- ms-sql(Auto commit): default commit; , begin tran을 해주면 commit, rollback 무조건 해줘야 한다
select * from board;

select boardid, nvl(hp, '핸드폰 없어요') as "hp" -- nvl 문자열, 숫자, 날짜 모두 가능
from board;

-- 문자열 검색
-- 주소 검색: ex) '역삼' 단어를 검색하면 '역삼'이라는 단어가 포함되어 있는 주소가 다 나온다
-- 문자열 패턴 검색(LIKE 연산자)

-- like 연산자를 도와주는: 와일드 카드 문자: %(모든 것이라는 의미), _(한 문자 의미) 결합해서 사용

select *
from emp
where ename like '%A%'; -- A 앞에 어떤 것이 와도 되고 뒤에 어떤 것이 와도 된다: A가 들어있는 모든 것을 검색해라

select *
from emp
where ename like 'A%'; -- A로 시작하는 모든 것을 검색해라

select *
from emp
where ename like '김%'; -- 김씨 성을 가진 사람을 모두 검색해라

select *
from emp
where ename like '%S'; -- S로 끝나는 이름을 가진 모든 사원을 검색해라

select *
from emp
where ename like '%LL%'; -- LL이 이름에 포함되어 있는 모든 사원을 검색해라

select *
from emp
where ename like '%A%A%'; -- A가 무조건 2개 이상 있는 사원을 검색해라, AA, ABA

select *
from emp
where ename like '_A%'; -- 첫 번째 글자는 어떤 것이 와도 되고 두 번째 글자는 A이며 뒤에는 어떤 것이 와도 된다

select *
from emp
where ename like '__A%'; -- 세 번째 글자가 A인 모든 사원을 검색해라

-- Oracle 과제(regexp_like): 상세한 패턴 검색
-- select * from emp where regexp_like (ename, 정규표현식);
-- Oracle 정규표현 사용해서 정규패턴 만들기 3~5개(조별) >> 중간 프로젝트에 반영

-- 데이터 정렬하기
-- order by column명(문자, 숫자, 날짜를 담은 column) asc or desc
-- 오름차순 asc: 낮은 순(생략하면 default)
-- 내림차순 desc: 높은 순

select * from emp
order by sal; -- asc 생략(default)
select * from emp
order by sal asc; -- 정확한 코드

-- 급여를 많이 받는 순으로 정렬하세요
select * from emp
order by sal desc;

select * from emp
order by ename asc;

-- 입사일이 가장 늦은 순으로 정렬해서 사번, 이름, 급여, 입사일을 출력하세요
select empno, ename, sal, hiredate from emp
order by hiredate desc;

/*
SELECT  3
FROM  1
WHERE 2
ORDER BY  4
데이터를 가져와서 정렬하기 때문에 유일하게 select한 결과를 정렬한다
*/
-- 직종이 MANAGER인 사원들의 사번, 이름, 급여, 직종, 입사일을 입사일이 늦은 순으로 정렬하세요
-- 사원 테이블에서 직종이 MANAGER인 사원의 사번, 이름, 급여, 직종, 입사일을 출력하되, 입사일이 늦은 순으로 출력하세요
-- 실행 순으로 읽으면 편하다
select empno, ename, sal, job, hiredate
frmo emp
where job = 'MANAGER'
order by hiredate desc;

-- 사원 테이블에서 사원의 부서번호, 직종을 출력하되, 부서번호를 내림차순으로 정렬 후 그룹화된 데이터를 직종 오름차순으로 정렬하세요
select deptno, job
from emp
order by deptno desc, job asc; -- 정렬 기준 2개, grouping 중요

-- 연산자
-- 합집합(union): 테이블과 테이블의 데이터를 합쳐서 보여지는 것(중복값 배제)
-- 합집합(union all): 중복값 허용

create table UTA (name varchar2(20));
INSERT INTO UTA (name) VALUES ('AAA');
INSERT INTO UTA (name) VALUES ('BBB');
INSERT INTO UTA (name) VALUES ('CCC');
INSERT INTO UTA (name) VALUES ('DDD');
COMMIT;

create table ut (name varchar2(20));
INSERT INTO ut(NAME) VALUES ('AAA');
INSERT INTO ut(NAME) VALUES ('BBB');
INSERT INTO ut(NAME) VALUES ('CCC');
COMMIT;

select name from ut
union -- 중복값 배제
select name from uta;

select name from ut
union all
select name from uta;

-- union 규칙
-- 1. 대응되는 column의 타입이 동일해야 한다
select empno, ename from emp
union
select dname, deptno from dept;
-- "expression must have same datatype as corresponding expression"
select empno, ename from emp
union
select deptno, dname from dept;

-- 2. 대응되는 COLUMN의 개수 동일(NULL)
SELECT EMPNO, ENAME, JOB, SAL FROM EMP
UNION
SELECT DEPTNO, DNAME, LOC FROM DEPT;
-- query block has incorrect number of result columns"
SELECT EMPNO, ENAME, JOB, SAL FROM EMP
UNION
SELECT DEPTNO, DNAME, LOC, NULL FROM DEPT;

-- Oracle 함수(PDF 48P)
/*
단일 행 함수
1) 문자형 함수 : 문자를 입력 받고 문자와 숫자 값 모두를 RETURN 할 수 있다.
2) 숫자형 함수 : 숫자를 입력 받고 숫자를 RETURN 한다.
3) 날짜형 함수 : 날짜형에 대해 수행하고 숫자를 RETURN 하는 MONTHS_BETWEEN 함수를 제외하고 모두 날짜 데이터형의 값을 RETURN 한다.
4) 변환형 함수 : 어떤 데이터형의 값을 다른 데이터형으로 변환한다.
5) 일반적인 함수 : NVL, DECODE
*/

-- 문자열 함수
SELECT INITCAP('the superman') FROM DUAL; -- INITCAP: 단어의 첫 글자를 대문자로
SELECT LOWER('AAA'), UPPER('aaa') FROM DUAL; -- LOWER: 대문자를 소문자로, UPPER: 소문자를 대문자로
SELECT ENAME, LOWER (ENAME) AS "ename" FROM EMP;
SELECT * FROM EMP WHERE lower (ENAME) = 'king';

-- 문자의 개수(LENGTH)
SELECT LENGTH('ABCD') AS "LENGTH" FROM DUAL;
SELECT LENGTH('홍길동 바보') AS "LENGTH" FROM DUAL;
SELECT LENGTH('홍 길 동 ') AS "LENGTH" FROM DUAL;

-- 결합 연산자: ||
-- 결합 함수: CONCAT(PARAMETER가 제한적이라 결합 연산자를 더 많이 사용)
SELECT 'A' || 'B' || 'C' FROM DUAL;

SELECT CONCAT('A', 'B') FROM DUAL;
SELECT CONCAT(ENAME, JOB) FROM EMP;
SELECT ENAME || '   ' || JOB AS "결합 연산자" FROM EMP;

-- 부분적 문자열 추열
-- Java: substring
-- Oracle: substr

SELECT SUBSTR ('ABCDE', 2, 3) AS "문자열 추출" FROM DUAL;
SELECT SUBSTR ('ABCDE', 1, 1) AS "문자열 추출" FROM DUAL; -- 두 번째 1은 자기 자신 A
SELECT SUBSTR ('ABCDE', 3, 1) AS "문자열 추출" FROM DUAL; -- 두 번째 1은 자기 자신 C

SELECT SUBSTR ('ABCDE', 3) FROM DUAL;
SELECT SUBSTR ('ABCDE', -2, 1) FROM DUAL;
SELECT SUBSTR ('ABCDE', -2, 2) FROM DUAL;

-- 사원 테이블에서 ENAME COLUMN 데이터에 대해 첫 글자는 소문자로, 나머지는 대문자로 출력하되 하나의 COLUMN 데이터로 출력하세요
-- 컬럼의 가명칭은 fullname, 첫 글자와 나머지 문자 사이에 공백은 하나

SELECT LOWER (SUBSTR (ENAME, 1, 1)) || ' ' || UPPER (SUBSTR (ENAME, 2)) AS "FULLNAME"
FROM EMP;

-- LPAD(PAD: 채우기): 왼쪽
-- RPAD: 오른쪽
SELECT LPAD ('ABC', 10, '*') FROM DUAL;
SELECT RPAD ('ABC', 10, '#') FROM DUAL;

-- QUIZ
-- 사용자 비번: hong1006
-- 화면에 ho******로 출력(앞 두 글자는 보여주고 나머지는 특수문자로 출력)
SELECT RPAD ('hong1006', LENGTH ('hong1006'), '*') FROM DUAL; -- LENGTH와 같으면 다 보임
SELECT RPAD (SUBSTR ('hong1006', 1, 2), LENGTH ('hong1006'), '*') AS "password"
FROM DUAL;
-- EMP 테이블에서 ENAME COLUMN의 데이터를 첫 글자만 출력하고 나머지는 *로 출력하세요
SELECT RPAD (SUBSTR (ENAME, 1, 1), LENGTH (ENAME), '*') AS "ENAME"
FROM EMP;

CREATE TABLE MEMBER2 (
ID NUMBER,
JUMIN VARCHAR2(14)
);

INSERT INTO MEMBER2 (ID, JUMIN) VALUES (100, '123456-1234567');
INSERT INTO MEMBER2 (ID, JUMIN) VALUES (200, '234567-1234567');
COMMIT;
-- QUIZ
-- 출력결과: 100; 123456-*******
-- 200; 234567-*******
-- 결과에 대한 가명칭은 JUMIN
SELECT ID || ' : ' || RPAD (SUBSTR (JUMIN, 1, 7), LENGTH (JUMIN), '*') AS "JUMIN"
FROM MEMBER2;

-- RTRIM 함수: 오른쪽 문자를 삭제
-- LTRIM 함수: 왼쪽 문자를 삭제
SELECT RTRIM('MILLER', 'ER') FROM DUAL;
SELECT LTRIM('MILLLLLER', 'MIL') FROM DUAL; -- 중복값도 해당: ER

-- 치환 함수
SELECT ENAME, REPLACE (ENAME, 'A', '와우') FROM EMP;

-- 여기까지가 문자열 함수 END

-- 숫자 함수
-- ROUND(반올림) 함수
-- TRUNC(절사) 함수
-- MOD(나머지) 함수

-- -3 -2 -1 0(정수: 기준점) 1 2 3
SELECT ROUND (12.345, 0) AS "R" FROM DUAL; -- 0: 정수만 남겨라(반올림)
SELECT ROUND (12.567, 0) AS "R" FROM DUAL;

SELECT ROUND (12.345, -2) AS "R" FROM DUAL;


SELECT ROUND (12.345, -1) AS "R" FROM DUAL;
SELECT ROUND (15.345, -1) AS "R" FROM DUAL;
SELECT ROUND (12.345, -2) AS "R" FROM DUAL;

-- TURNC: 반올림 하지 않고 버림
SELECT TRUNC (12.345, 0) AS "R" FROM DUAL;
SELECT TRUNC (12.567, 0) AS "R" FROM DUAL;

SELECT TRUNC (12.345, 1) AS "R" FROM DUAL;
SELECT TRUNC (12.567, 1) AS "R" FROM DUAL;

SELECT TRUNC (12.345, -1) AS "R" FROM DUAL;
SELECT TRUNC (15.345, -1) AS "R" FROM DUAL;
SELECT TRUNC (12.345, -2) AS "R" FROM DUAL;

-- MOD
SELECT 12/10 FROM DUAL; -- 몫과 나머지가 한번에 나온다
SELECT MOD (12, 10) FROM DUAL;
SELECT MOD (0, 0) FROM DUAL;

-- 숫자 함수는 여기까지 END

-- 날짜 함수: SYSDATE
-- Point: 날짜 연산
SELECT SYSDATE FROM DUAL;
alter session set nls_date_format = 'YYYY-MM-DD HH24:MI:SS'; -- 변경

SELECT HIREDATE FROM EMP;

-- DATE + NUMBER: DATE
-- DATE - NUMBER: DATE
-- DATE - DATE: NUMBER
-- 날짜: ROUND, TRUNC

SELECT MONTHS_BETWEEN ('2019-02-27', '2010-02-27') FROM DUAL; -- 개월 수 차이
SELECT MONTHS_BETWEEN (SYSDATE, '2010-01-01') FROM DUAL; -- 시분초까지 다 계산해서 복잡
-- 116.795324074074074074074074074074074074
SELECT ROUND (MONTHS_BETWEEN (SYSDATE, '2010-01-01'), 0) FROM DUAL;
SELECT TRUNC (MONTHS_BETWEEN (SYSDATE, '2010-01-01'), 0) FROM DUAL;

SELECT TO_DATE ('2015-01-01') + 1000 FROM DUAL; -- '2015-01-01' 이 자체로는 문자열로 인식해서 오류

SELECT SYSDATE + 100 FROM DUAL;

-- QUIZ
/*
1. 사원 테이블에서 사원들의 입사일에서 현재 날짜(SYSDATE)까지의 근속월수를 구하세요
단, 근속월수는 정수만 남긴다
2. 한 달이 31일이라고 가정하고 근속월수를 구하세요
*/
SELECT TRUNC (MONTHS_BETWEEN (SYSDATE, HIREDATE)) AS "근속월수",
TRUNC ((SYSDATE - HIREDATE) / 31) AS "근속월수2"
FROM EMP;

-- 변환 함수 ***Point***
-- Oracle: 문자, 숫자, 날짜 데이터
-- TO_CAHR (): 숫자(10000) -> 문자로(10000 -> $10000), (100,000) | 날짜(1900-01-01) -> 문자(1900년01월01일)
-- 목적: 형식 정의

-- TO_DATE (): 문자 -> 날짜: SELECT '2019-12-12' + 1000 -> SELECT TO_DATE ('2019-12-12') + 100
-- TO_NUMBER (): 문자 -> 숫자(자동형변환 된다)
SELECT '100' + 100 AS "자동형변환" FROM DUAL;
SELECT TO_NUMBER('100') + 100 AS "정확하게 표현하면" FROM DUAL;

Oracle 기본 타입(데이터 타입)
create table 테이블명 (column명 타입);
create table member (age number); 100건의 데이터 insert
-- Java: class member { int age } >> member m = new member(); 1건
-- Java: List<member> list = new ArrayList<>(); list.add(new member()) 여러 건

문자 타입
-- char(20) >> 20byte >> 한글 10자, 영문자, 특수문자, 공백 20자 >> 고정길이 문자열
-- varchar2(20) >> 20byte >> 한글 10자, 영문자, 특수문자, 공백 20자 >> 가변길이 문자열

고정된 데이터: 남, 여 >> 처리 >> char(2)
결국 varchar2(20)

성능 상의 문제
char () -- varchar2()보다 검색상 우선

결국 문제는 한글
unicode(2byte): 한글, 영문자, 특스문자, 공백 >> 2byte
nchar(20) >> 20은 문자의 개수 >> 실제 byte * 2 >> 40byte
nvarchar2(20) >> 20개의 문자

한글 20자, 영문자 20자

-- QUIZ 1. TO_NUMBER (): 문자를 숫자로
SELECT 1 + 1 FROM DUAL;

SELECT '1' + 1 FROM DUAL;

SELECT TO_NUMBERS('1') + 1 FROM DUAL;

SELECT '1' + '1' FROM DUAL; -- 자동형변환

SELECT '1A' + '1' FROM DUAL;

-- 2. TO_CHAR (): 숫자를 문자로, 날짜를 문자로
SELECT SYSDATE FROM DUAL;
-- YYYY YY MM DD 정의되어 있어요
SELECT SYSDATE || '일' FROM DUAL; -- 자동형변환(날짜와 문자가 결합 >> 문자)


-- 입사일이 12월인 사원들의 사번, 이름, 입사일, 입사년도, 입사월을 출력하세요
SELECT EMPNO, ENAME, HIREDATE, TO_CHAR (HIREDATE, 'YYYY') AS "년", TO_CHAR (HIREDATE, 'MM') AS "월", TO_CHAR (HIREDATE, 'DD') AS "일"
FROM EMP
WHERE TO_CHAR (HIREDATE, 'MM') = 12;

SELECT TO_CHAR (HIREDATE, 'YYYY MM DD') FROM EMP;

SELECT TO_CHAR (HIREDATE, 'YYYY''년''MM''월''DD''일') FROM EMP;

SELECT TO_CHAR (SAL, '$999,999') AS "SAL"
FROM EMP;

-- 현재 접속 계정: BITUSER

-- 접속 계정 변경: HR
SELECT * FROM EMPLOYEES;

/*
사원테이블에서 사원의 이름은 last_name , first_name 합쳐서 fullname 별칭 부여해서 출력하고
입사일은  YYYY-MM-DD 형식으로 출력하고 연봉(급여 *12)을 구하고 연봉의 10%(연봉 * 1.1)인상한 값을 
출력하고 그 결과는 1000단위 콤마 처리해서 출력하세요
단 2005년 이후 입사자들만 출력하세요 그리고 연봉이 높은 순으로  출력하세요
*/
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES;
SELECT LAST_NAME || FIRST_NAME AS "FULLNAME", TO_CHAR (HIRE_DATE, 'YYYY-MM-DD') AS "입사일", TO_CHAR (SALARY, '999,999') AS "급여",
TO_CHAR (SALARY * 12, '999,999') AS "연봉", TO_CHAR ((SALARY * 12) * 1.1, '999,999') AS "연봉인상", HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR (HIRE_DATE, 'YYYY') >= '2005'
ORDER BY "연봉" DESC;

-- 문자
-- 숫자
-- 날짜
-- 변환(TO_CHAR 형식)

-- 일반 함수
-- 프로그램 성향이 강함
-- NVL (), NVL2 (): NULL
-- DECODE (): Java if 유사
-- CASE (): Java switch 유사

SELECT COMM, NVL (COMM, 0) FROM EMP;


CREATE TABLE T_EMP (
ID NUMBER(6), -- 6자리 숫자 제한
JOB VARCHAR2(20)
);

INSERT INTO T_EMP (ID, JOB) VALUES (100, 'IT');
INSERT INTO T_EMP (ID, JOB) VALUES (200, 'SALES');
INSERT INTO T_EMP (ID, JOB) VALUES (300, 'MGR');
INSERT INTO T_EMP (ID) VALUES (400);
INSERT INTO T_EMP (ID, JOB) VALUES (500, 'MGR');
COMMIT;

-- 1. NVL ()
SELECT ID, JOB, NVL (JOB, 'EMPTY')
FROM T_EMP;

-- 2. NVL2 ()
SELECT ID, JOB, NVL2 (JOB, JOB || '입니다', 'EMPTY')
FROM T_EMP;
-- if ~ else와 비슷한 성격
-- null값이 없으면 앞, null값이면 뒤

SELECT ID, JOB, NVL2 (JOB, 'AAAA', 'BBBB')
FROM T_EMP;

-- 3. DECODE Point(sql언어 제어문이 없음, ex) if, for)
-- DECODE (표현식, 조건1, 결과1, 조건2, 결과2, 조건3, 결과3...)
-- 통계 데이터 추출에 주로 사용
SELECT ID, JOB, DECODE (ID, 100, 'IT...', 
                            200, 'SALES...',
                            300, 'MGR...', 
                            'ETC...') AS "DECODE JOB"
FROM T_EMP;

SELECT JOB, DECODE (JOB, 'IT', 1) FROM T_EMP; -- DECODE 조건에 해당하지 않는 데이터는 전부 NULL
SELECT JOB, DECODE (JOB, 'IT', 1, 1111) FROM T_EMP; -- NULL값이 싫으면 DEFAULT 값을 주면 된다

-- 활용(통계 데이터)
SELECT DECODE (JOB, 'IT', 1) AS "IT", -- COLUMN 1개
       DECODE (JOB, 'SALES', 1) AS "SALES", -- COLUMN 1개
       DECODE (JOB, 'MGR', 1) AS "MGR" -- COLUMN 1개
FROM T_EMP;

SELECT * FROM T_EMP;

SELECT COUNT (DECODE (JOB, 'IT', 1)) AS "IT", -- COLUMN 1개
       COUNT (DECODE (JOB, 'SALES', 1)) AS "SALES", -- COLUMN 1개
       COUNT (DECODE (JOB, 'MGR', 1)) AS "MGR" -- COLUMN 1개
FROM T_EMP;

SELECT * FROM T_EMP;

/*
emp 테이블에서 부서번호가 10이면 '인사부' , 20 '관리부' , 30 '회계부' 나머지 부서 번호는
'기타부서' 라고 출력하는 쿼리문을 만드세요
decode 를 사용해서
*/

SELECT ENAME, DEPTNO, DECODE (DEPTNO, 10, '인사부',
                                      20, '관리부',
                                      30, '회계부',
                                      '기타부서') AS "부서이름"
FROM EMP;

CREATE TABLE T_EMP2 (
ID NUMBER(2),
JUMIN CHAR(7)
);

DROP TABLE T_EMP2; -- 테이블 삭제

INSERT INTO T_EMP2 (ID, JUMIN) VALUES (1, '1234567');
INSERT INTO T_EMP2 (ID, JUMIN) VALUES (2, '2234567');
INSERT INTO T_EMP2 (ID, JUMIN) VALUES (3, '3234567');
INSERT INTO T_EMP2 (ID, JUMIN) VALUES (4, '4234567');
INSERT INTO T_EMP2 (ID, JUMIN) VALUES (5, '9234567');
COMMIT;

SELECT * FROM T_EMP2;
/*
T_EMP2 테이블에서 ID, JUMIN 데이터를 출력하되 JUMIN COLUMN 앞자리가 1이면 '남성', 2이면 '여성', 3이면 '중성', 그 외는 '기타'로 출력하세요
*/
SELECT ID, JUMIN, DECODE (SUBSTR (JUMIN, 1, 1), 1, '남성',
                                         2, '여성',
                                         3, '중성',
                                         '기타') AS "GENDER"
FROM T_EMP2;

-- 난이도 중급
-- Java if () { if () }
-- Oracle: DECODE ( DECODE ())

SELECT DEPTNO, ENAME, DECODE (DEPTNO, 20, DECODE (ENAME, 'SMITH', 'HELLO',
                                                         'WORLD'),
                                          'ETC') AS "DECODE"
FROM EMP;
-- EMP 테이블에서 부서번호가 20번이고 이름이 SMITH이면 HELLO를, 아니면 WORLD를 출력하고 부서번호가 20번이 아니면 ETC를 출력하세요

-- CASE 문
-- Java: switch
/*
CASE 조건 WHEN 결과1 THEN 출력1
         WHEN 결과2 THEN 출력2
         WHEN 결과3 THEN 출력3
         WHEN 결과4 THEN 출력4
         ELSE 출력5
END 'COLUMN명'
*/

CREATE TABLE T_ZIP (
ZIPCODE NUMBER(10)
);

INSERT INTO T_ZIP (ZIPCODE) VALUES (2);
INSERT INTO T_ZIP (ZIPCODE) VALUES (31);
INSERT INTO T_ZIP (ZIPCODE) VALUES (32);
INSERT INTO T_ZIP (ZIPCODE) VALUES (33);
INSERT INTO T_ZIP (ZIPCODE) VALUES (41);
COMMIT;

SELECT * FROM T_ZIP;

SELECT '0' || TO_CHAR (ZIPCODE), CASE ZIPCODE WHEN 2 THEN '서울'
                                              WHEN 31 THEN '경기'
                                              WHEN 32 THEN '인천'
                                              WHEN 41 THEN '제주'
                                              ELSE '기타지역'
                                 END "REGIONNAME"
FROM T_ZIP;

/*
사원테이블에서 사원급여가 1000달러 이하면 4급   
1001 달러 2000달러 이하면 3급
2001 달러 3000달러 이하면 2급
3001 달러 4000달러 이하면 1급
4001 달러 이상이면 특급을 부여하는 데이터를 출력하세요

CASE문은 범위값을 잡을 수가 없다
CASE WHEN COLUMN명 조건비교 결과 THEN SAL <= 200
*/

SELECT ENAME, SAL, CASE WHEN SAL <= 1000 THEN ' 4급'
                   WHEN SAL BETWEEN 1001 AND 2000 THEN ' 3급'
                   WHEN SAL BETWEEN 2001 AND 3000 THEN ' 2급'
                   WHEN SAL BETWEEN 3001 AND 4000 THEN ' 1급'
                   ELSE ' 특급'
               END "등급"
FROM EMP;

-- 문자 -> 숫자 -> 날짜 -> 변환(TO_CHAR, TO_DATE, TO NUMBER) -> 일반 함수 (NVL) ~ CASE ()
-- 집계 함수: 그룹 함수(MULTI ROW FUNCTION), PDF(75P)

-- 집계 함수
-- 1. COUNT (*), COUNT(COLUMN) >> 데이터 건수
-- 2. SUM ()
-- 3. AVG ()
-- 4. MAX ()
-- 5. MIN ()
-- 등등
/*
UNION: 대응되는 타입과 COLUMN의 개수가 일치해야 한다
1. 집계 함수는 반드시 GROUP BY 절과 같이 사용
2. Point: 모든 집계 함수는 NULL값을 무시한다
3. Point: SELECT절에 집계 함수 이외에 다른 COLUMN이 오면 반드시 GROUP BY절에 명시

*/

SELECT COUNT (*) FROM EMP; -- *: ROW의 수 COUNT
SELECT COUNT (EMPNO) FROM EMP; -- COLUMN 데이터의 개수 COUNT
SELECT COUNT (COMM) FROM EMP; -- NULL값을 무시한 데이터의 개수

-- NULL 건수: NVL
SELECT COUNT (NVL (COMM, 0)) FROM EMP; -- NULL값 처리는 NVL 함수

-- 급여의 합
SELECT SUM (SAL) AS "SUM" FROM EMP;

-- 평균 급여(급여의 합/사원 수)
SELECT TRUNC ((AVG (SAL)), 0) AS "AVG" FROM EMP;

-- 사장님 왈: 우리 회사 수당이 총 얼마 지급(평균)
SELECT SUM (COMM) AS "COMM" FROM EMP; -- 4330
-- 평균 수당
SELECT TRUNC ((AVG (COMM)), 0) AS "AVG" FROM EMP; -- 721

SELECT COMM FROM EMP;
SELECT (300 + 200 + 30 + 300 + 3500 + 0) / 6 FROM DUAL; -- 721
-- 회사 사원은 14명인데 6명으로 계산한 평균

-- 14명으로 계산한 평균
SELECT (300 + 200 + 30 + 300 + 3500 + 0) / 14 FROM DUAL; -- 309
SELECT SUM (COMM) / 14 FROM EMP;
SELECT AVG (NVL (COMM, 0)) FROM EMP;

-- 회사가 정의하는 규칙에 따라 계산하기 때문에 6명, 14명 둘 다 맞는 계산
-- 회사규정: 전체 사원 수: 309
-- 회사규정: 받는 사원 수: 721

SELECT COUNT (COMM) FROM EMP
WHERE COMM IS NOT NULL;
SELECT COUNT (COMM) FROM EMP; -- 어차피 NULL값을 인지하지 못하기 때문에 NULL값 조건이 필요없다

SELECT MAX (SAL) FROM EMP;
SELECT MIN (SAL) FROM EMP;

-- Point: 집계 함수가 RETURN하는 값은 1개(1개의 ROW에 출력할 수 있으면 가능)
SELECT SUM (SAL), AVG (SAL), MAX (SAL), MIN (SAL), COUNT (SAL), COUNT (*) FROM EMP;

-- 부서별 평균 급여를 구하세요
-- SELECT절에 집계 함수 이외에 COLUMN이 오면 그 COLUMN은 GROUP BY절에 명시되어야 한다
SELECT DEPTNO, AVG (SAL)
FROM EMP
GROUP BY DEPTNO;

SELECT AVG (SAL) FROM EMP GROUP BY DEPTNO; -- 실행은 가능하지만 데이터가 의미하는 것을 알 수 없다

-- 직종별 평균 급여, 급여의 합, 최대 급여, 최소 급여, 건수를 출력하세요
SELECT JOB, AVG (SAL) AS "평균급여", SUM (SAL) AS "급여의합", MAX (SAL) AS "최대급여", MIN (SAL) AS "최소급여", COUNT (SAL) AS "건수"
FROM EMP
GROUP BY JOB;

/*
GROUPING 원리(COLUMN 순서 중요)
DISTINCT COLUMN명1, COLUMN명2

ORDER BY COLUMN ASC, COLUMN DESC

GROUP BY COLUMN명1, COLUMN명2
*/

-- 부서별, 직종별 급여의 합을 구하세요
SELECT DEPTNO, JOB, SUM (SAL), COUNT (SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO ASC;

/*
SELECT 4
FROM 1
WHERE 2
GROUP BY 3
ORDER BY 5 
*/

-- 직종별 평균 급여가 3,000달러 이상인 사원의 직종과 평균 급여를 출력하세요
SELECT JOB, AVG (SAL) AS "평균급여"
FROM EMP
WHERE 
GROUP BY JOB, AVG (SAL);
-- 평균 급여 >= 3000: 평균 급여가 먼저 구해져야 하고 그 시점은 GROUP BY를 통과했을 때 나온다
-- WHERE절에서는 평균 급여 데이터를 사용할 수 없다(GROUP BY보다 실행 순서가 먼저이기 때문에)
-- GROUP BY 결과에 조건을 거는 것: HAVING
-- FROM절의 조건절: WHERE
-- GROUP BY절의 조건절: HAVING
SELECT JOB, AVG (SAL) -- AS "평균급여"(HAVING이 먼저라 AS "" 불가) -- 4
FROM EMP -- 1
GROUP BY JOB -- 2
HAVING AVG (SAL) >= 3000; -- 3

/*
1개의 테이블에서 데이터를 조회할 수 있는 방법
SELECT 5
FROM 1
WHERE 2
GROUP BY 3
HAVING 4
ORDER BY 6
*/

/*
사원테이블에서 직종별 급여합을 출력하되 수당은 지급 받고 급여의 합이 5000 이상인 사원들의 목록을 출력하세요
--급여의 합이 낮은 순으로 출력하세요
*/
SELECT JOB, SUM (SAL) AS "SUMSAL"
FROM EMP
WHERE COMM IS NOT NULL
GROUP BY JOB
HAVING SUM (SAL) >= 5000
ORDER BY SUM (SAL) DESC;

/*
사원테이블에서 부서 인원이 4명보다 많은 부서의 부서번호 ,인원수 , 급여의 합을 출력하세요
*/
SELECT DEPTNO, COUNT (*) AS "부서별 인원", SUM (SAL) AS "급여의 합"
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*) > 4;

/*
사원테이블에서 직종별 급여의 합이 5000를 초과하는 직종과 급여의 합을 출력하세요
단 판매직종(salesman) 은 제외하고 급여합으로 내림차순 정렬하세요
*/
SELECT 


/*
사원테이블에서 직종별 급여의 평균이 1500 이상인 사원의 직종, 평균 급여, 부서번호를 출력하세요. 
단, 'CLERK'는 제외하고 평균 급여와 부서번호를 오름차순으로 정렬하세요. 
*/
SELECT JOB, AVG (SAL), DEPTNO
FROM EMP
WHERE 
GROUP BY
ORDER BY
/*
사원테이블에서 입사일이 82년 이후이고 급여의 평균이 2500이상인 사원의 입사일, 직종과 급여의 평균을 출력하세요
*/
select hiredate, job, avg(sal) as "급여의 평균"
from emp
where to_char(hiredate,'YY') >= '82'
group by hiredate, job
having avg(sal)>=2500;

/*
사원테이블에서 직종별 연봉(급여*12)의 평균이 5000 이상인 사원의 직종, 연봉의 평균을 출력하세요. 
단, 'CLERK'는 제외하고 연봉 평균을 오름차순으로 정렬하세요. 
*/
SELECT JOB, AVG (SAL * 12) AS "평균연봉"
FROM EMP
WHERE JOB != 'CLERK'
GROUP BY JOB
HAVING AVG (SAL * 12) >= 5000
ORDER BY "평균연봉" ASC;

/* 1
사원테이블에서 직종별 급여의 합이 2000 이상5000 이하의 직종과 급여의 평균을 반올림해서 정수만 출력하세요
단, 직종 'PRESIDENT'는 제외하고 급여 평균으로 올림차순 정렬하세요
*/
SELECT JOB, SUM (SAL) AS "급여의합", ROUND (AVG (SAL), 0) AS "평균급여"
FROM EMP
WHERE JOB != 'PRESIDENT'
GROUP BY JOB
HAVING SUM (SAL) BETWEEN 2000 AND 5000
ORDER BY "평균급여";
/* 3
사원 테이블에서 이름이 M 혹은 A로 시작하는 사원의 직종, 평균 급여를 출력하세요
단 커미션이 널이 아닌 사원 중에서.
*/
SELECT JOB, AVG (SAL) AS "평균급여"
FROM EMP
WHERE (ENAME LIKE 'M%' or ENAME LIKE 'A%') AND COMM IS NOT NULL
GROUP BY JOB;
/* 2
수당을 안받는 직원들의 부서별, 직종별 급여의 총합이 1000이상인 부서별 직종의 부서번호와 직종, 총급여를 부서번호는 내림차순으로, 총급여가 높은 순으로 출력하시오
*/
select deptno,job,sum(sal)
from emp
where comm is null
group by deptno,job
having sum(sal)>=1000
order by deptno desc,sum(sal) desc;

-- 지금까지 SELECT 대상이 하나의 테이블
-- RDBMS(최소 하나 이상의 테이블로 이루어진)

-- Java: class 작업: 관계(상속, 구현, 연관...)
-- DB: TABLE TABLE끼리의 관계를 가지고 있다
-- 1:1, 1:N, N:N 관계
-- 내가 원하는 데이터가 하나의 테이블에 있는 것이 아니라 한 개 이상의 테이블에 나눠져 있다
-- 나누어진 테이블에서 원하는 데이터를 출력하는 방법: JOIN
-- SELECT의 기준은 단일 테이블이 빠르기 때문에 데이터의 양이 적은 경우 상관이 없지만, 데이터의 양이 무수히 많을 경우에는 테이블을 구분하는 것이 좋다
-- 원칙: 테이블은 쪼갤 수 있는 대로 쪼개서 설계한다(쪼개는 것: 정규화: 제1정규화, 제2정규화... , 역정규화)
-- EMP 테이블의 DEPT COLUMN은 DEPT 테이블의 DEPTNO COLUMN 데이터를 참조한다: 고유한 값, NULL값 불가
-- 프라이머리티 컨스테인트: 제약(참조를 당하는 테이블)
-- DEPT 테이블의 DEPTNO 데이터 사용을 강제하는 제약: 포링키(외래키): 참조를 하는 테이블

-- 종류
-- 1. 등가조인(EQUI JOIN): 70%
-- 원테이블과 대응대는 테이블에 있는 COLUMN의 데이터 1:1 매핑
-- ANSI문법(표준문법)
-- 문법: JOIN ON-조건절, [INNER]JOIN ON-조건절(INNER 구문 생략 가능)

create table M (M1 char(6) , M2 char(10));
create table S (S1 char(6) , S2 char(10));
create table X (X1 char(6) , X2 char(10));

insert into M values('A','1');
insert into M values('B','1');
insert into M values('C','3');
insert into M values(null,'3');
commit;

insert into S values('A','X');
insert into S values('B','Y');
insert into S values(null,'Z');
commit;

insert into X values('A','DATA');
commit;

select * from m;
select * from s;
select * from x;

SELECT *
FROM M, S
WHERE M.M1 = S.S1;
-- NULL은 JOIN 조건의 대상이 아님

SELECT M.M1, S.S2
FROM M, S
WHERE M.M1 = S.S1;

SELECT EMP.EMPNO, EMP.ENAME, EMP.DEPTNO, DEPT.DNAME
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;
-- (좋지 않다): 쓰지마라

SELECT *
FROM M JOIN S
ON M.M1 = S.S1;

SELECT M.M1, M.M2, S.S2
FROM M INNER JOIN S
ON M.M1 = S.S1;

SELECT EMP.EMPNO, EMP.ENAME, EMP.DEPTNO, DEPT.DNAME
FROM EMP JOIN DEPT
ON EMP.DEPTNO = DEPT.DEPTNO;

SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E JOIN DEPT D -- 테이블에 가명칭을 부여하여 사용(ANSI문법)
ON E.DEPTNO = D.DEPTNO;

----------------------------------------------------
-- SQL JOIN문법: 어떤 것이 FROM절의 조건이고 어떤 것이 JOIN의 조건인지 판단이 어렵다
SELECT *
FROM M, S
WHERE M.M1 = S.S1 AND M.M1 = 'A';

SELECT *
FROM M JOIN S
ON M.M1 = S.S1
WHERE M.M1 = 'A'; -- ANSI문법: 권장사항

SELECT *
FROM S JOIN X
ON S.S1 = X.X1;

-- M.M1 = S.S1 AND S.S1 = X.X1
-- 한 개 이상의 테이블에서 JOIN
-- Oracle sql JOIN문법
SELECT *
FROM M, S, X
WHERE M.M1 = S.S1 AND S.S1 = X.X1;

-- ANSI문법
SELECT M.M1, M.M2, S.S2, X.X2
FROM M JOIN S ON M.M1 = S.S1
       JOIN X ON S.S1 = X.X1;
    -- JOIN Y ON
    -- JOIN Z ON
    
-- 사번, 이름, 부서번호, 부서명, 급여, 급여등급을 출력하세요
DESC DEPT;
DESC EMP;
DESC SALGRADE;

SELECT *
FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
           JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

SELECT E.EMPNO, E.ENAME, E.DEPTNO, E.SAL, D.DNAME, S.GRADE
FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
           JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL -- 비등가조인
ORDER BY E.EMPNO;

-- 1. HR 계정으로 이동
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM LOCATIONS;

-- 1. 사번, 이름(LAST_NAME), 부서번호, 부서이름을 출력하세요
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY E.EMPLOYEE_ID;
-- 문제점: 사원의 수는 107명인데 현재 출력된 사원은 106명(누군가 누락): NULL(JOIN은 NULL을 처리하지 않는다)
-- 등가조인으로는 이 문제를 해결할 수 없다 >> 해결: OUTER JOIN

-- 2. 사번, 이름, 부서번호, 부서이름, 도시명을 출력하세요
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME, D.LOCATION_ID, L.CITY
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
                 JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID;

SELECT * FROM TABS; -- 접속한 계정이 가지고 있는 테이블 목록
SELECT * FROM COLS;
-- 2. 비등가조인(NON-EQUI JOIN): 의미만 존재: 문법은 등가조인
-- 원테이블과 대응대는 테이블에 있는 COLUMN이 1:1 매핑되지 않는 경우
-- EMP, SALGRADE: SAL COLUMN을 가지고... 2개의 COLUMN(LOSAL, HISAL)

-- 비등가(1:1 매핑되는 COLUMN이 없어요)
SELECT * FROM EMP;
SELECT * FROM SALGRADE;

SELECT E.EMPNO, E.ENAME, E.DEPTNO, E.SAL, D.DNAME, S.GRADE
FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
           JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL -- 비등가조인
ORDER BY E.EMPNO;

-- 3. 외부조인(OUTER JOIN): NULL값 때문에 >> EQUI JOIN NULL 처리가 안 돼요
-- OUTER JOIN(두 개의 테이블에서 주, 종 관계 파악)
-- 문법
-- LEFT OUTER JOIN: 왼쪽이 주, 오른쪽이 종
-- RIGHT OUTER JOIN: 오른쪽이 주, 왼쪽이 종
-- FULL OUTER JOIN(LEFT, RIGHT >> UNION)

-- OUTER JOIN: 내부적으로 등가조인을 먼저 실행하고 주, 종 관계를 파악하고
-- 주인이 되는 테이블에 남아있는 데이터를 가져오는 방법

SELECT *
FROM M JOIN S
ON M.M1 = S.S1;

SELECT *
FROM M LEFT OUTER JOIN S
ON M.M1 = S.S1;

-- 접속: HR
-- 1. 사번, 이름(LAST_NAME), 부서번호, 부서이름을 출력하세요
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY E.EMPLOYEE_ID;

SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID IS NULL;
-- Grant가 부서 NULL값이라도 107명의 사원이 출력되기를 원한다
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY E.EMPLOYEE_ID;

-- 2. 사번, 이름, 부서번호, 부서이름, 도시명을 출력하세요
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME, D.LOCATION_ID, L.CITY
FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
                 LEFT OUTER JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID;

SELECT *
FROM M FULL OUTER JOIN S
ON M.M1 = S.S1;

-- 4. SELF JOIN(자기참조): 테이블 안에서 COLUMN이 다른 COLUMN을 참조하는 경우(의미만 존재): 문법은 등가조인
-- EMP 테이블에서 SMITH 사원의 관리자 이름은 무엇입니까
-- 하나의 테이블에서 어떤 COLUMN이 다른 COLUMN을 참조하는 경우에 사용하는 방법
SELECT * FROM EMP;

SELECT E.EMPNO, E.ENAME, M.EMPNO, M.ENAME
FROM EMP E JOIN EMP M
ON E.MGR = M.EMPNO; -- 데이터가 같다면 COLUMN명까지는 같지 않아도 된다

SELECT E.EMPNO, E.ENAME, M.EMPNO, M.ENAME
FROM EMP E LEFT OUTER JOIN EMP M
ON E.MGR = M.EMPNO;

-- 1. 사원들의 이름, 부서번호, 부서이름을 출력하라.
SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO;
 
-- 2. DALLAS에서 근무하는 사원의 이름, 직위, 부서번호, 부서이름을
-- 출력하라.
SELECT E.ENAME, E.JOB, E.DEPTNO, D.DNAME
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE D.LOC = 'DALLAS';

SELECT E.ENAME, E.JOB, D.DEPTNO, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO 
WHERE  D.LOC='DALLAS';

-- 3. 이름에 'A'가 들어가는 사원들의 이름과 부서이름을 출력하라.
SELECT E.ENAME, D.DNAME
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE ENAME LIKE '%A%';

SELECT E.ENAME, D.DNAME
FROM EMP E  join DEPT D  on D.DEPTNO=E.DEPTNO
WHERE  E.ENAME LIKE '%A%';

-- 4. 사원이름과 그 사원이 속한 부서의 부서명, 그리고 월급을
--출력하는데 월급이 3000이상인 사원을 출력하라.
SELECT E.ENAME, D.DNAME, E.SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE SAL >= 3000;

SELECT E.ENAME, D.DNAME, E.SAL ,D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE E.SAL>=3000;

-- 5. 직위(직종)가 'SALESMAN'인 사원들의 직위와 그 사원이름, 그리고
-- 그 사원이 속한 부서 이름을 출력하라.
SELECT E.JOB, E.ENAME, D.DNAME
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE JOB = 'SALESMAN';

SELECT E.JOB, E.ENAME, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE E.JOB='SALESMAN';

-- 6. 커미션이 책정된 사원들의 사원번호, 이름, 연봉, 연봉+커미션,
-- 급여등급을 출력하되, 각각의 컬럼명을 '사원번호', '사원이름',
-- '연봉','실급여', '급여등급'으로 하여 출력하라.
--(비등가 ) 1 : 1 매핑 대는 컬럼이 없다
SELECT E.EMPNO AS "사원번호", E.ENAME AS "사원이름", E.SAL * 12 AS "연봉", (E.SAL * 12) + E.COMM AS "실급여", S.GRADE AS "급여등급"
FROM EMP E JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE COMM IS NOT NULL;

SELECT E.EMPNO AS "사원번호",
               E.ENAME AS "사원이름",
               E.SAL*12 AS "연봉",
           --E.SAL*12+NVL(COMM,0) AS "실급여",
               E.SAL*12+COMM AS "실급여",
               S.GRADE AS "급여등급"
FROM EMP E  join SALGRADE S on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.Comm is not null;

-- 7. 부서번호가 10번인 사원들의 부서번호, 부서이름, 사원이름,
-- 월급, 급여등급을 출력하라.
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL, S.GRADE
FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
           JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.DEPTNO = 10;

SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL, S.GRADE
FROM EMP E   join DEPT D on E.DEPTNO=D.DEPTNO
                         join SALGRADE S on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.DEPTNO=10;
 
SELECT * FROM SALGRADE;

-- 8. 부서번호가 10번, 20번인 사원들의 부서번호, 부서이름,
-- 사원이름, 월급, 급여등급을 출력하라. 그리고 그 출력된
-- 결과물을 부서번호가 낮은 순으로, 월급이 높은 순으로
-- 정렬하라.
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL, S.GRADE
FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
           JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.DEPTNO IN (10, 20)
ORDER BY E.DEPTNO ASC, E.SAL DESC;

SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL, S.GRADE
FROM EMP E  join DEPT D    on E.DEPTNO=D.DEPTNO
            join SALGRADE S    on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE  E.DEPTNO<=20 --WHERE E.DEPTNO IN (10,20)  -- e.deptno = 10 or 
ORDER BY E.DEPTNO ASC,  E.SAL DESC;

-- 9. 사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의
-- 사원번호와 사원이름을 출력하되 각각의 컬럼명을 '사원번호',
-- '사원이름', '관리자번호', '관리자이름'으로 하여 출력하라.
--SELF JOIN (자기 자신테이블의 컬럼을 참조 하는 경우)
SELECT E.EMPNO AS "사원번호", E.ENAME AS "사원이름", D.EMPNO AS "관리자번호", D.ENAME AS "관리자이름"
FROM EMP E LEFT OUTER JOIN EMP D
ON E.MGR = D.EMPNO;

SELECT E.EMPNO, E.ENAME , M.EMPNO, M.ENAME
FROM EMP E  left outer join EMP M
on e.MGR = m.EMPNO;

-- 초급개발자: 함수, 조인
-- SUBQUERY(PDF 100P)
-- SQL 만능 해결사

-- 사원 테이블에서 사원들의 평균월급보다 더 많은 급여를 받는 사원의 사번, 이름, 급여를 출력하세요

-- SUBQUERY
SELECT AVG (SAL) FROM EMP; -- 2073
-- MAIN QUERY
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > 2073;

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT AVG (SAL) FROM EMP);
-- () 안에 있는 SUBQUERY가 먼저 실행된다

-- QUERY
-- 문제 >> 단일 테이블일 때 함수를 통해 해결 >> 테이블이 하나 이상이면 JOIN >> JOIN에서 해결이 안 되면 SUBQUERY(마지막 방법)
select * from emp;
/*
SUBQUERY 종류
1. SINGLE ROW SUBQUERY: 하나의 COLUMN으로 나온 결과가 하나짜리 ROW라면(단일값이라면)
SELECT SUM (SAL) FROM EMP; -- 하나의 COLUMN에 하나의 ROW
2. MULTI ROW SUBQUERY: SUBQUERY의 결과가 하나 이상의 ROW(다중값): COLUMN 하나
SELECT SAL FROM EMP; -- 하나의 COLUMN에 여러 개의 ROW

구분하는 이유: 사용하는 연산자가 다르다
연산자: 다중값(IN, NOT IN, ANY, ALL)
-- ALL: SAL > 1000 AND SAL > 2000 AND ... 데이터를 AND로 묶어낸다
-- ANY: SAL > 1000 OR SAL > 2000 OR ... 데이터를 OR로 묶어낸다

문법 정의
1. SUBQUERY는 () 안에 있어야 한다: (SELECT SAL FROM EMP)
2. SUBQUERY는 단일 COLUMN으로 구성되어야 한다: SELECT SUM (SAL), AVG (SAL) FROM EMP (X)
3. SUBQUERY는 단독으로 실행 가능해야 한다

SUBQUERY를 가지는 QUERY문은
1. SUBQUERY 선행
2. SUBQUERY의 결과를 가지고 MAIN QUERY 실행
*/

-- 사원 테이블에서 JONES의 급여보다 더 많은 급여를 받는 사원의 사번, 이름, 급여를 출력하세요
SELECT SAL FROM EMP WHERE ENAME = 'JONES'; -- 2975 -- SINGLE ROW
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'JONES');

SELECT *
FROM EMP
WHERE SAL = (SELECT SAL FROM EMP WHERE DEPTNO = 30);

SELECT *
FROM EMP
WHERE SAL IN (SELECT SAL FROM EMP WHERE DEPTNO = 30); -- MULTI ROW -- IN은 데이터를 OR로 푼다
-- WHERE SAL = 2975 OR SAL = 3000 OR ...

SELECT *
FROM EMP
WHERE SAL NOT IN (SELECT SAL FROM EMP WHERE DEPTNO = 30);
-- WHERE SAL != 2975 AND SAL != 3000 AND ... -- NOT IN은 부정의 AND로 푼다

-- 부하직원이 있는 사원의 사번과 이름을 출력하세요
SELECT *
FROM EMP
WHERE EMPNO IN (SELECT MGR FROM EMP);
-- EMPNO = 7839 OR EMPNO = 7698 OR EMPNO IS NULL OR
-- NULL은 OR에 영향을 주지 않는다

-- NULL과의 모든 연산 결과는 NULL
-- 부하직원이 없는 사원의 사번과 이름을 출력하세요
SELECT EMPNO, ENAME
FROM EMP
WHERE EMPNO NOT IN (SELECT NVL (MGR, 0) FROM EMP);
-- EMPNO != 7839 AND EMPNO != 7698 AND EMPNO IS NULL AND >> NULL

-- KING에게 보고하는(즉, 직속상관이 KING) 사원의 사번, 이름, 직종, 관리자사번을 출력하세요
SELECT EMPNO, ENAME, JOB, MGR
FROM EMP
WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING');

-- 20번 부서의 사원 중에서 가장 많은 급여를 받는 사원보다 더 많은 급여를 받는 사원의 사번, 이름, 급여, 부서번호를 출력하세요
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL > (SELECT MAX (SAL) FROM EMP WHERE DEPTNO = 20);

SELECT * FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB = 'SALESMAN')
     AND SAL IN (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN');

--1. 'SMITH'보다 월급을 많이 받는 사원들의 이름과 월급을 출력하라.
SELECT SAL FROM EMP WHERE ENAME = 'SMITH';
SELECT ENAME, SAL
FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'SMITH');

SELECT ENAME, SAL
FROM EMP
WHERE SAL>(SELECT SAL
               FROM EMP
               WHERE ENAME='SMITH');
 
--2. 10번 부서의 사원들과 같은 월급을 받는 사원들의 이름, 월급, 부서번호를 출력하라.
SELECT DEPTNO FROM EMP WHERE DEPTNO = 10;
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL IN (SELECT SAL FROM EMP WHERE DEPTNO = 10);

SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL IN(SELECT SAL
                 FROM EMP
                 WHERE DEPTNO=10);
 
--3. 'BLAKE'와 같은 부서에 있는 사원들의 이름과 고용일을 뽑는데
-- 'BLAKE'는 빼고 출력하라.
SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE';
SELECT ENAME, HIREDATE
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE')
      AND ENAME != 'BLAKE';

SELECT ENAME, HIREDATE
FROM EMP
WHERE DEPTNO=(SELECT DEPTNO
                     FROM EMP
                     WHERE ENAME='BLAKE')
AND ENAME!='BLAKE';

--4. 평균급여보다 많은 급여를 받는 사원들의 사원번호, 이름, 월급을 출력하되, 월급이 높은 사람 순으로 출력하라.
SELECT AVG (SAL) FROM EMP;
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT AVG (SAL) FROM EMP)
ORDER BY SAL DESC;
 
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL>(SELECT  AVG(SAL)  FROM EMP)
ORDER BY SAL DESC;
 
--5. 이름에 'T'를 포함하고 있는 사원들과 같은 부서에서 근무하고 있는 사원의 사원번호와 이름을 출력하라.
SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%T%';
SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%T%');

SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                       FROM EMP
                       WHERE ENAME LIKE '%T%');

--6. 30번 부서에 있는 사원들 중에서 가장 많은 월급을 받는 사원보다 많은 월급을 받는 사원들의 이름, 부서번호, 월급을 출력하라.
--(단, ALL(and) 또는 ANY(or) 연산자를 사용할 것)
SELECT MAX (SAL) FROM EMP WHERE DEPTNO = 30;
SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE SAL > (SELECT MAX (SAL) FROM EMP WHERE DEPTNO = 30);

SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO = 30);
-- where sal > 1600 and sal > 1250 and sal > 2850 and sal > 1500 and sal > 950
-- MAX 함수를 모른다 하여도 ALL 기준으로 하게 되면 결국 MAX값으로 계산하게 된다

SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE SAL > (SELECT MAX(SAL)
                FROM EMP
                WHERE DEPTNO=30);
 
SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE SAL > ALL(SELECT SAL
  FROM EMP
  WHERE DEPTNO=30);
 
--where sal > 1600 and sal > 1250 and sal > 2850 and sal > 1500 and sal > 950

--7. 'DALLAS'에서 근무하고 있는 사원과 같은 부서에서 일하는 사원의 이름, 부서번호, 직업을 출력하라.
SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS';
SELECT E.ENAME, E.DEPTNO, E.JOB
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS');
-- 출력하려는 결과값이 JOIN된 테이블이 필요한 상황이 아니기 때문에 JOIN까지 할 필요가 없다

SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO    -- = 이 맞는데  IN
                      FROM DEPT
                      WHERE LOC='DALLAS');

--8. SALES 부서에서 일하는 사원들의 부서번호, 이름, 직업을 출력하라.
SELECT DNAME FROM DEPT WHERE DNAME = 'SALES';
SELECT E.DEPTNO, E.ENAME, E.JOB
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES');
-- JOIN은 7번과 같다

SELECT DEPTNO, ENAME, JOB
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                      FROM DEPT
                      WHERE DNAME='SALES');
 
--9. 'KING'에게 보고하는 모든 사원의 이름과 급여를 출력하라
--king 이 사수인 사람 (mgr 데이터가 king 사번)
SELECT EMPNO FROM EMP WHERE ENAME = 'KING';
SELECT ENAME, SAL
FROM EMP
WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING');

SELECT ENAME, SAL
FROM EMP
WHERE MGR=(SELECT EMPNO
                FROM EMP
                WHERE ENAME='KING');
 
--10. 자신의 급여가 평균 급여보다 많고, 이름에 'S'가 들어가는 사원과 동일한 부서에서 근무하는 모든 사원의 사원번호, 이름, 급여를 출력하라.
SELECT AVG (SAL) FROM EMP;
SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%S%';
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT AVG (SAL) FROM EMP)
      AND DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%S%');

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT AVG(SAL)
                FROM EMP)
AND DEPTNO IN(SELECT DEPTNO
                   FROM EMP
                   WHERE ENAME LIKE '%S%');
--select * from emp
--where  deptno in  (
--                      select deptno from emp where sal > (select avg(sal) from emp)
--                      and ename like '%S%'
--                   )

--11. 커미션을 받는 사원과 부서번호, 월급이 같은 사원의 이름, 월급, 부서번호를 출력하라.
SELECT DEPTNO, SAL FROM EMP WHERE COMM IS NOT NULL;
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE COMM IS NOT NULL)
      AND SAL IN (SELECT SAL FROM EMP WHERE COMM IS NOT NULL);

SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                      FROM EMP
                      WHERE COMM IS NOT NULL)
AND SAL IN( SELECT SAL
               FROM EMP
               WHERE COMM IS NOT NULL);

--12. 30번 부서 사원들과 월급과 커미션이 같지 않은 사원들의 이름, 월급, 커미션을 출력하라.
SELECT SAL, COMM FROM EMP WHERE DEPTNO = 30;
SELECT ENAME, SAL, COMM
FROM EMP
WHERE SAL NOT IN (SELECT SAL FROM EMP WHERE DEPTNO = 30)
      AND COMM NOT IN (SELECT COMM FROM EMP WHERE DEPTNO = 30 AND COMM IS NOT NULL); -- 난 OR로 해서 틀림
      
SELECT ENAME, SAL, COMM
FROM EMP
WHERE SAL NOT IN(SELECT SAL
                        FROM EMP
                        WHERE DEPTNO=30)
AND COMM NOT IN(SELECT COMM
                         FROM EMP
                         WHERE DEPTNO=30 and comm is not null);
 
--SELECT NVL(COMM, 0)
--FROM EMP
--WHERE DEPTNO=30 and comm is not null;
 
--SELECT COMM
--FROM EMP
--WHERE DEPTNO=30 and comm is not null;

/*
SELECT 5
FROM 1
WHERE 2
GROUP BY 3
HAVING 4
ORDER BY 6

기본 함수(문자 ~ 일반 함수)
다중 테이블: JOIN
SUBQUERY
++++++++
DML(INSERT, UPDATE, DELETE): 암기(필수)***
*/

-- INSERT, UPDATE, DELETE
/*
DDL(데이터 정의어): CREATE, ALTER, DROP, TRUNCATE, RENAME, MODIFY >> DBA
DML(데이터 조작어): INSERT, UPDATE, DELETE >> 개발자
DQL(데이터 질의어): SELECT >> 개발자(함수, 조인, 서브쿼리)
DCL(데이터 제어어): 권한(GRANT, REVOKE) >> DBA
TCL(트랜잭션): COMMIT, ROLLBACK, SAVEPOINT >> 개발자
*/

-- DML 작업
-- Oracle 내부적으로 트랜잭션을 동반
-- Oracle (BEGIN TRAN) 자동으로... >> 처리완료여부(ROLLBACK(취소), COMMIT(반영))
-- INSERT 실행
-- MS-SQL (BEGIN TRAN) 수동으로 직접

-- TRANSACTION: 하나의 논리적인 작업 단위
-- 업무(TRANSACTION)
-- 은행업무
-- 은행(A라는 계좌 돈의 1000인출, B라는 계좌 입금)
-- 업무(A 돈 인출 ~~~~~~~~~~ B 계좌 입금) 하나의 업무
/*
시작
  A라는 계좌 출금
  UPDATE 계좌
  SET 잔액 = 잔액 - 출금액
  
  B라는 계좌 입금
  UPDATE 계좌
  SET 잔액 = 잔액 + 입금액
끝... COMMIT

끝까지 오지 않고 문제가 하나라도 발생할 경우 원점 복구: ROLLBACK
*/

-- 테이블 기본 정보
DESC EMP;

-- Oracle(SYSTEM 테이블 다양한 정보 제공)
SELECT * FROM TAB; -- 접속계정이 다룰 수 있는 테이블 목록
SELECT * FROM TAB WHERE TNAME = 'EMP'; -- 테이블 생성 여부 확인
SELECT * FROM COL WHERE TNAME = 'EMP';
SELECT * FROM USER_TABLES; -- 관리자, 튜닝하는 사람
SELECT * FROM USER_TABLES WHERE TABLE_NAME = 'DEPT';

-- DML(PDF 168P)
/*
INSERT INTO table_name [(column1[, column2, . . . . . ])]
VALUES (value1[, value2, . . . . . . ]);
*/

CREATE TABLE TEMP (
  ID NUMBER PRIMARY KEY,
  -- ID COLUMN의 데이터는 NULL값을 쓰지 못하고 중복값도 쓰지 못하도록 강제하는 방법: 대표적으로 PRIMARY KEY
  NAME VARCHAR2(20) -- DEFAULT NULL: NULL값이 들어가도 된다
);

INSERT INTO TEMP (ID, NAME)
VALUES (100, '홍길동');
SELECT * FROM TEMP;
COMMIT;

-- COLUMN 리스트 생략하기
INSERT INTO TEMP -- COLUMN 리스트 생략: 데이터가 순서대로 입력(되도록이면 생략하지 말 것)
VALUES (200, '김유신');
SELECT * FROM TEMP;
COMMIT;

-- 1.
INSERT INTO TEMP (ID, NAME)
VALUES (100, '아무개'); -- unique constraint (BITUSER.SYS_C007003) violated
                       -- PRIMARY KEY 제약 위반(중복값 (X))
-- 2.
INSERT INTO TEMP (NAME)
VALUES ('누구야'); -- ORA-01400: cannot insert NULL into ("BITUSER"."TEMP"."ID")
                  -- PRIMARY KEY 제약 위반(NULL값 (X))
-- 재미삼아
-- SQL 변수, 제어문 (X)
-- PL-SQL: Java 언어처럼 사용 가능
CREATE TABLE TEMP2 (ID VARCHAR2(20));

BEGIN
  FOR I IN 1..1000 LOOP
    INSERT INTO TEMP2 (ID) VALUES ('A' || TO_CHAR(I));
  END LOOP;
END;

SELECT * FROM TEMP2;
SELECT COUNT (*) FROM TEMP2;

CREATE TABLE TEMP3 (
  MEMBERID NUMBER(3) NOT NULL,
  NAME VARCHAR2(10),
  REGDATE DATE DEFAULT SYSDATE -- INSERT 하지 않아도 자동으로 시스템 날짜 값이 입력
);

INSERT INTO TEMP3(MEMBERID, NAME, REGDATE)
VALUES (100, '홍길동', '2019-09-27');

COMMIT;

INSERT INTO TEMP3(MEMBERID, NAME)
VALUES (200, '김유신');

SELECT * FROM TEMP3;

COMMIT;

INSERT INTO TEMP3(MEMBERID)
VALUES (300);

SELECT * FROM TEMP3;

COMMIT;

-- 옵션 TIP
-- 1. 대량 데이터 삽입하기(INSERT)
CREATE TABLE TEMP4 (ID NUMBER);
CREATE TABLE TEMP5 (NUM NUMBER);

INSERT INTO TEMP4 (ID) VALUES (1);
INSERT INTO TEMP4 (ID) VALUES (2);
INSERT INTO TEMP4 (ID) VALUES (3);
INSERT INTO TEMP4 (ID) VALUES (4);
INSERT INTO TEMP4 (ID) VALUES (5);
INSERT INTO TEMP4 (ID) VALUES (6);
INSERT INTO TEMP4 (ID) VALUES (7);
INSERT INTO TEMP4 (ID) VALUES (8);
INSERT INTO TEMP4 (ID) VALUES (9);
INSERT INTO TEMP4 (ID) VALUES (10);

COMMIT;

SELECT * FROM TEMP4;

-- 요구사항: TEMP4 테이블에 있는 모든 데이터를 TEMP5에 넣으세요
-- INSERT INTO TABLE명 (COLUMN명) VALUES
-- VALUES 대신에 SELECT 구문
-- 단, COLUMN의 개수와 타입이 일치한다면

INSERT INTO TEMP5 (NUM)
SELECT ID FROM TEMP4;
-- VALUES

COMMIT;

-- 2. INSERT
-- 복사(CLONE) INSERT
-- 테이블이 없는 상황에서 테이블을 자동생성 하고 데이터도 삽입하는 방법
-- 단, 제약정보는 복사되지 않는다(PRIMARY KEY...)

-- EMP >> COPYEMP 테이블을 만들고 데이터도 똑같이 넣기
CREATE TABLE COPYEMP
AS
  SELECT * FROM EMP;

SELECT * FROM COPYEMP;
SELECT * FROM EMP;

-- DROP TABLE TMPE2; -- 테이블 삭제

CREATE TABLE COPYEMP2
AS
  SELECT EMPNO, ENAME, SAL
  FROM EMP
  WHERE DEPTNO = 30;

SELECT * FROM COPYEMP2;

-- 구조만 복사하고 데이터는 복사하지 않아요
CREATE TABLE COPYEMP3
AS
  SELECT * FROM EMP WHERE 1 = 2; -- FALSE 구조만
  -- SELECT * FROM EMP WHERE 1 = 1; -- 해킹

SELECT * FROM COPYEMP3;

COMMIT;

-- INSERT END

-- UPDATE
/*
문법
UPDATE table_name
SET column1 = value1 [,column2 = value2, . . . . . . .]
[WHERE condition];

UPDATE table_name
SET (column1, column2, . . . . ) = (SELECT column1,column2, . . . -- SET절에 SUBQUERY 올 수 있다
                                    FROM table_name
                                    WHERE coundition)
[WHERE condition];
*/

SELECT * FROM COPYEMP;
COMMIT;

UPDATE COPYEMP
SET SAL = 0;

SELECT * FROM COPYEMP;
ROLLBACK;

UPDATE COPYEMP
SET JOB = 'NOT...'
WHERE DEPTNO = 20;

SELECT * FROM COPYEMP WHERE DEPTNO = 20;
COMMIT;

UPDATE COPYEMP
SET SAL = (SELECT SUM (SAL) FROM EMP); -- SUBQUERY도 올 수 있다

SELECT * FROM COPYEMP;
ROLLBACK;

UPDATE COPYEMP
SET ENAME = 'AAA', JOB = 'BBB', SAL = (SELECT SUM (SAL) FROM EMP)
WHERE DEPTNO = 10;

SELECT * FROM COPYEMP WHERE DEPTNO = 10;
COMMIT;

-- UPDATE END

-- DELETE
DELETE FROM COPYEMP;

SELECT * FROM COPYEMP;
ROLLBACK;

DELETE FROM COPYEMP
WHERE SAL >= 3000;
COMMIT;

-- DELETE END

/*
APP(Java) --> JDBC API --> Oracle(My-sql, MS-sql, ...)

개발자: CRUD 작업
CREATE: INSERT
READ  : SELECT
UPDATE: UPDATE
DELETE: DELETE

C U D >> TRANSACTION 개념 동반(COMMIT, ROLLBACK)

-- EMP 테이블(Oracle)
-- Java
-- 삽입, 수정, 삭제, 전체조회, 조건조회(PK(PRIMARY KEY): WHERE EMPNO = 7788)
-- Java 함수 5개
-- public int insertEmp(Emp emp) { insert into emp... }
-- public List<Emp> getEmpList() { select * from emp }
-- public Emp getEmpListByEmpno(int empno) { select ... where empno = 7788 }

*/

-- Oracle 11g 버전 이상부터 가상 COLUMN(조합 COLUMN)
-- COLUMN: 국어, 영어, 수학 >> 합, 평균
-- COLUMN: 국어, 영어, 수학, 합, 평균 >> 자동화

CREATE TABLE VTABLE (
  NO1 NUMBER,
  NO2 NUMBER,
  NO3 NUMBER GENERATED ALWAYS AS (NO1 + NO2) VIRTUAL
);

INSERT INTO VTABLE (NO1, NO2) VALUES (100, 200);
INSERT INTO VTABLE (NO1, NO2) VALUES (80, 50);

SELECT * FROM VTABLE;

COMMIT;

INSERT INTO VTABLE (NO1, NO2, NO3) VALUES (10, 50, 60); -- 가상 COLUMN은 데이터를 직접 넣을 수 없다

SELECT COLUMN_NAME, DATA_TYPE, DATA_DEFAULT
FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'VTABLE';

-- 실무에 사용되는 형식의 코드
-- 제품의 정보(입고일) 기준으로 분기 계산(1~4분기)
-- 20190101, 20190520
CREATE TABLE VTABLE2 (
  NO NUMBER, -- 순번
  P_CODE CHAR(4), -- 제품코드(A001, B002)
  P_DATE CHAR(8), -- 입고일(20190101, 날짜를 받아 문자로 받아놓으면 나중에 쓰기 편하다, 문자열 함수 사용)
  P_QTY NUMBER, -- 물건의 수량
  P_BUNGI NUMBER(1) GENERATED ALWAYS AS (
                    CASE WHEN SUBSTR (P_DATE, 5, 2) IN ('01', '02', '03') THEN 1
                         WHEN SUBSTR (P_DATE, 5, 2) IN ('04', '05', '06') THEN 2
                         WHEN SUBSTR (P_DATE, 5, 2) IN ('07', '08', '09') THEN 3
                         ELSE 4
                    END
                    ) VIRTUAL
);
SELECT COLUMN_NAME, DATA_TYPE, DATA_DEFAULT
FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'VTABLE2';

INSERT INTO VTABLE2 (P_DATE) VALUES ('20190101');
INSERT INTO VTABLE2 (P_DATE) VALUES ('20190129');
INSERT INTO VTABLE2 (P_DATE) VALUES ('20190404');
INSERT INTO VTABLE2 (P_DATE) VALUES ('20191101');
INSERT INTO VTABLE2 (P_DATE) VALUES ('20191207');
COMMIT;
SELECT * FROM VTABLE2;

SELECT * FROM VTABLE2 WHERE P_BUNGI = 1;

-- 테이블 만들 때 자동으로 값을 넣을 수 있는 것: DEFAULT, 가상 COLUMN
-- 이런 기능이 있다는 것 정도를 기억했다가 나중에 찾아 쓰도록 하자

-- DDL: 테이블 다루기
-- PDF(138P): 제 9 장 테이블(TABLE) 생성

-- 1. 테이블 생성
CREATE TABLE TEMP6 (
  ID NUMBER
);

-- 2. 테이블 생성 시 COLUMN 누락... COLUMN을 추가하는 방법
-- 기존 테이블에 새로운 COLUMN 추가하기(한번에 하나씩)
ALTER TABLE TEMP6
ADD ENAME VARCHAR2(20);

DESC TEMP6;

-- 3. 기존 테이블에 있는 COLUMN의 이름 잘못 표기(ENAME >> USERNAME)
-- 기존 테이블에 있는 기존 COLUMN의 이름을 변경: RENAME
ALTER TABLE TEMP6
RENAME COLUMN ENAME TO USERNAME;

DESC TEMP6;

-- 4. 기존 테이블에 있는 COLUMN의 TYPE 변경
-- MODIFY
ALTER TABLE TEMP6
MODIFY USERNAME VARCHAR2(2000);

DESC TEMP6;

-- 5. 기존 테이블에 있는 기존 COLUMN 삭제
ALTER TABLE TEMP6
DROP COLUMN USERNAME;

DESC TEMP6;

-- 6. DELETE: 테이블 데이터 삭제(WHERE 가능)
-- 문제점: 테이블을 처음 생성하면 크기가 잡히고 데이터를 넣으면 테이블 크기도 증가 >> DELETE를 해도 크기는 그대로...
-- Ex) 처음 1M >> 10만건 >> 100M >> 10만건의 데이터 DELETE >> 현재 테이블의 크기가 101M
-- 테이블 데이터 삭제 시 공간의 크기도 처음 상태로
-- TRUNCATE: 데이터 축소이기 때문에 WHERE 조건을 사용할 수 없다
-- Ex) 처음 1M >> 10만건 >> 100M >> 10만건의 데이터 TRUNCATE >> 현재 테이블의 크기가 1M

-- DROP TABLE TEMP6
-- DELETE, DROP 백업하지 않으면 데이터 복구 불가
-- BUT Oracle 휴지통 기능은 있다(원칙적인 방법은 아님)

-- 테이블 제약 설정하기
-- PDF 144P
-- 데이터 무결성 확보(신뢰, 검증가능한 데이터인가)
-- 제약(CONSTRAINT): INSERT, UPDATE ...
/*
NOT NULL(NN) 열은 NULL 값을 포함할 수 없습니다.
-- MS-SQL에서는 제약이 아니지만 Oracle에서는 제약

UNIQUE key(UK) 테이블의 모든 행을 유일하게 하는 값을 가진 열(NULL 을 허용): 중복방지
-- UNIQUE 제약은 NULL값을 가질 수 있다 >> NULL값을 가지지 못하게 하려면(NAME UNIQUE, NOT NULL)
-- COLUMN의 개수만큼 제약
-- A UNIQUE, NOT NULL
-- B UNIQUE, NOT NULL
-- C UNIQUE, NOT NULL

PRIMARY KEY(PK) 유일하게 테이블의 각행을 식별(NOT NULL 과 UNIQUE 조건(중복방지)을 만족)
-- NOT NULL하고 UNIQUE 내포하는 제약
-- 테이블 당 1개의 제약(여러 COLUMN을 묶어서 하나로 만들어 제약은 가능): 복합 KEY
-- 주민번호, 게시판 글 번호, 학번, 핸드폰번호...
-- INDEX 자동생성(빠른 검색)
-- Oracle: BLOCK 데이터를 저장하는 단위(PAGE >> BLOCK)
-- WHERE BOARDID = 100

-- 진호: 만화방... 50권 주문... 주 고객 한녘... 장사...고객 왈: 열혈강호... 
-- 만화책 1000권...
-- 고민... 방안: 카테고리 분류... 가나다 분류...
-- 도서관: 검색... 위치...
-- 물리적인 형태: 1개의 정렬순(가나다, 출판일...)
-- 논리적인 형태: 이름, 연도순(2000년 가열 3행), 저자...: 찾아갈 수 있는 주소 >> 테이블 COLUMN의 개수만큼 가능
-- 데이터가 추가, 삭제되는 경우가 있기 때문에 INDEX도 관리가 필요하다: 주기적으로 업데이트 >> 비용(CPU, MEMORY): DBA

***FOREIGN KEY(FK) 열과 참조된 열 사이의 외래키 관계를 적용하고 설정합니다.***
-- 참조 제약: 테이블과 테이블 간의 제약
-- EMP, DEPT 참조제약 필요하지만 지금은 없다(실습에 어려움 때문에, 데이터는 제약에 맞추어 놓았다)
-- 참조 되어지는 테이블에 걸어지는 제약 PRIMARY KEY >> NOT NULL, UNIQUE 보장(증명) >> 신뢰성
-- 참조 하는 테이블에 걸어지는 제약 FOREIGN KEY >> 테이블과 테이블 간의 제약 >> 1:1, 1:N, N:N

CHECK(CK) 참이어야 하는 조건을 지정함(대부분 업무 규칙을 설정)
-- 내가 원하는 값만 받는 제약(Ex) GENDER COLUMN의 데이터는 '남', '여'만 받겠다)
-- 항상 데이터를 CHECK 하겠다
-- Ex) WHERE GENDER IN ('남', '여')

-- 5가지 제약을 만드는 시점
1. 테이블을 생성할 때 바로 생성(CREATE TABLE 구문 안에서)
2. 테이블이 생성 이후(CREATE TABLE 생성 후... 필요하다면 ALTER TABLE ADD CONSTRAINT: 자동화된 툴

*/
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMP';

-- 간단 표기법(줄임표현): 권장(X)
CREATE TABLE TEMP7 (
  -- ID NUMBER CONSTRAINT PK_TEMP7_ID PRIMARY KEY -- 제약이름설정방법(관용)
  -- PK(제약이름)_TEMP7(테이블명)_COLUMN명
  ID NUMBER PRIMARY KEY,
  NAME VARCHAR2(20) NOT NULL,
  ADDR VARCHAR2(50)
);

-- SYS_C007008: 내부적으로 제약이름 SYS_고유번호(시스템)
-- SYS_C007009
-- 내가 원하는 대로 이름 설정(FULL 표기)
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'TEMP7'; -- TABLE명 대문자(소문자로 관리 (X))
-- SELECT * FROM USER_CONSTRAINTS WHERE LOWER (TABLE_NAME) = 'temp7';

INSERT INTO TEMP7 (NAME, ADDR) VALUES ('홍길동', '서울시 강남구'); -- cannot insert NULL into ("BITUSER"."TEMP7"."ID")
INSERT INTO TEMP7 (ID, NAME, ADDR) VALUES (10, '홍길동', '서울시 강남구');
INSERT INTO TEMP7 (ID, NAME, ADDR) VALUES (10, '김유신', '서울시 강북구'); -- unique constraint (BITUSER.SYS_C007009) violated

-- PRIMARY KEY(WHERE ID 자주 사용): PK 제약을 걸면 그 COLUMN에 대한 자동으로 INDEX 검색 속도 향상
SELECT * FROM TEMP7 WHERE ID = 10;

COMMIT;

-- 정식 표현
CREATE TABLE TEMP8 (
  ID NUMBER CONSTRAINT PK_TEMP8_ID PRIMARY KEY,
  NAME VARCHAR2(20) NOT NULL, -- NOT NULL은 보통 이름 안 넣어준다
  JUMIN CHAR(6) CONSTRAINT UK_TEMP8_JUMIN UNIQUE, -- NOT NULL을 사용하지 않았기 때문에 NULL값 중복 가능
  -- JUMIN CHAR(6) NOT NULL CONSTRAINT UK_TEMP8_JUMIN UNIQUE, -- UNIQUE + NOT NULL
  ADDR VARCHAR2(20)
);

SELECT * FROM USER_INDEXES WHERE TABLE_NAME = 'TEMP8';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'TEMP8';

INSERT INTO TEMP8 (ID, NAME, JUMIN, ADDR)
VALUES (10, '홍길동', '123456', '서울시');

SELECT * FROM TEMP8;
COMMIT;

INSERT INTO TEMP8 (ID, NAME, JUMIN, ADDR)
VALUES (10, 'A', '456789', '서울시');
-- unique constraint (BITUSER.PK_TEMP8_ID) violated -- PK UNIQUE 위반
INSERT INTO TEMP8 (NAME, JUMIN, ADDR)
VALUES ('A', '456789', '서울시');
-- cannot insert NULL into ("BITUSER"."TEMP8"."ID") -- PK NOT NULL 위반
INSERT INTO TEMP8 (ID, NAME, JUMIN, ADDR)
VALUES (20, '아무개', '123456', '서울시');
-- unique constraint (BITUSER.UK_TEMP8_JUMIN) violated -- UNIQUE 위반
INSERT INTO TEMP8 (ID, NAME, ADDR)
VALUES (20, '아무개', '서울시'); -- NOT NULL을 하지 않았기 때문에 NULL 허용

SELECT * FROM TEMP8;

INSERT INTO TEMP8 (ID, NAME, ADDR)
VALUES (30, '야무지게', '서울시'); -- UNIQUE 제약은 NULL값을 중복체크 하지 않는다

SELECT * FROM TEMP8;

COMMIT;

-- 테이블 생성 후 제약걸기
CREATE TABLE TEMP9 (
  ID NUMBER
);

-- 기존 테이블, 데이터도 있음(10, 10) 2건 >> PRIMARY KEY (X): 제약 걸기 전 데이터 내부 검사 >> 데이터 삭제(중복데이터 삭제) >> PK
ALTER TABLE TEMP9
ADD CONSTRAINT PK_TEMP9_ID PRIMARY KEY (ID);

-- 두 개의 COLUMN 묶어서 한 개의 제약
-- ALTER TABLE TEMP9
-- ADD CONSTRAINT PK_TEMP9_ID PRIMARY KEY(ID, JUMIN); 중복키(복합키)

SELECT * FROM USER_INDEXES WHERE TABLE_NAME = 'TEMP9';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'TEMP9'; -- CONSTRAINT_TYPE = P
DESC TEMP9;

-- ENAME COLUMN 추가
ALTER TABLE TEMP9
ADD ENAME VARCHAR2(20);

DESC TEMP9;

-- NOT NULL 추가하기
ALTER TABLE TEMP9
MODIFY (ENAME NOT NULL);

DESC TEMP9;

-- CHECK
CREATE TABLE TEMP10 (
  ID NUMBER CONSTRAINT PK_TEMP10_ID PRIMARY KEY, -- 제약이름 같으면 충돌
  NAME VARCHAR2(20) NOT NULL, -- NOT NULL은 보통 이름 안 넣어준다
  JUMIN CHAR(6) CONSTRAINT UK_TEMP10_JUMIN UNIQUE, -- NOT NULL을 사용하지 않았기 때문에 NULL값 중복 가능
  -- JUMIN CHAR(6) NOT NULL CONSTRAINT UK_TEMP8_JUMIN UNIQUE, -- UNIQUE + NOT NULL
  ADDR VARCHAR2(20),
  AGE NUMBER CONSTRAINT CK_TEMP10_AGE CHECK (AGE >= 19) -- WHERE AGE >= 19, GENDER IN ('남', '여')
);

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'TEMP10';

INSERT INTO TEMP10 (ID, NAME, JUMIN, ADDR, AGE)
VALUES (100, '홍길동', '123456', '서울시', 20);
SELECT * FROM TEMP10;

COMMIT;

INSERT INTO TEMP10 (ID, NAME, JUMIN, ADDR, AGE)
VALUES (200, '김유신', '789456', '서울시', 15); -- check constraint (BITUSER.CK_TEMP10_AGE) violated

-- 참조 제약***: 테이블과 테이블 간의 관계RDB)
CREATE TABLE C_EMP
AS
  SELECT EMPNO, ENAME, DEPTNO FROM EMP WHERE 1 = 2;

CREATE TABLE C_DEPT
AS
  SELECT DEPTNO, DNAME FROM DEPT WHERE 1 = 2;

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'C_EMP';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'C_DEPT';

-- 참조키(C_EMP (DEPTNO) COLUMN은 C_DEPT (DEPTNO) COLUMN을 참조합니다)
-- C_DEPT (DEPTNO) COLUMN은 C_EMP (DEPTNO) COLUMN에 의해 참조 되어집니다)

-- 2) 선행작업 후(후행)
ALTER TABLE C_EMP
ADD CONSTRAINT FK_C_EMP_DEPTNO FOREIGN KEY (DEPTNO) REFERENCES C_DEPT (DEPTNO);
-- no matching unique or primary key for this column-list >> 신용이 없다
-- 참조 되어지는 테이블에 있는 COLUMN은 신용을 보장해야 한다 >> PRIMARY KEY, UNIQUE 제약 설정
-- 1. PK 설정
-- 2. FK 참조
-- 1) 선행
ALTER TABLE C_DEPT
ADD CONSTRAINT PK_C_DEPT_DEPTNO PRIMARY KEY (DEPTNO);

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'C_EMP';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'C_DEPT';

INSERT INTO C_DEPT (DEPTNO, DNAME) VALUES (100, '인사팀');
INSERT INTO C_DEPT (DEPTNO, DNAME) VALUES (200, '관리팀');
INSERT INTO C_DEPT (DEPTNO, DNAME) VALUES (300, '회계팀');
COMMIT;

SELECT * FROM C_DEPT;
SELECT * FROM C_EMP;

-- 사원 입사(참조키)
INSERT INTO C_EMP (EMPNO, ENAME, DEPTNO)
VALUES (1, '신입이', 500); -- integrity constraint (BITUSER.FK_C_EMP_DEPTNO) violated - parent key not found
-- FOREIGN KEY: 내가 가지고 있는 DEPTNO은 너가 가지고 있는 DEPTNO 중에 하나를 쓸게
INSERT INTO C_EMP (EMPNO, ENAME)
VALUES (1, '신입이');
-- FOREIGN KEY: NOT NULL은 막지 못한다
SELECT * FROM C_EMP;
-- 회사가 신입이 반드시 부서번호를 가져야 한다면 NOT NULL을 넣어줘야 하고 아니라면 안 넣어줘도 된다(회사 마음)
-- 회사 신입사원은 무조건 부서번호를 가진다: NOT NULL FOREIGN KEY
-- 회사 신입사원은 부서번호를 가질 수도 있고 아닐 수도 있다 FOREIGN KEY

INSERT INTO C_EMP (EMPNO, ENAME, DEPTNO)
VALUES (1, '아무개', 100);

SELECT * FROM C_EMP;
COMMIT;

-- 두 개의 관계에서 주, 종 관계를 파악하면
-- FK C_EMP_DEPTNO 관계에서 부모는 DEPT(PK를 가지고 있는 테이블이 주 테이블, FK를 가지고 있는 테이블이 종 테이블)
-- MASTER TABLE(주), CHILD TABLE(종)
-- 전체에서 C_EMP 테이블이 핵심 테이블이지만, 두 테이블의 관계에서는 종 테이블

SELECT * FROM C_EMP;

DELETE FROM C_DEPT WHERE DEPTNO = 200; -- 삭제 가능: 참조되지 않았기 때문에
DELETE FROM C_DEPT WHERE DEPTNO = 100; -- integrity constraint (BITUSER.FK_C_EMP_DEPTNO) violated - child record found

-- 굳이 100번 부서번호를 지우겠다
-- C_EMP 테이블에서 100번 부서번호를 찾아 삭제를 선행하고 C_DEPT에서 100번 부서번호를 지운다

/*
column datatype [CONSTRAINT constraint_name]
  REFERENCES table_ name (column1[,column2,..] [ON DELETE CASCADE])

column datatype,
. . . . . . . ,
  [CONSTRAINT constraint_name] FOREIGN KEY (column1[,column2,..])
  REFERENCES table_name (column1[,column2,..] [ON DELETE CASCADE])

ON DELETE CASCADE: 부모 테이블과 생명을 같이 하겠다
부모 테이블에서 지우면 자식 테이블에서도 참조하는 데이터를 전부 지운다(위험)
DELETE FROM C_DEPT WHERE DEPTNO = 100; -- 원칙은 삭제 불가능
ON DELETE CASCADE 옵션이 걸려있으면
DELETE FROM C_DEPT WHERE DEPTNO = 100; 실행 가능
C_EMP DEPTNO 100인 모든 사원 데이터도 같이 삭제

MS-SQL에는 ON DELETE CASCADE, ON UPDATE CASCADE도 있음
*/

-- DDL END --

-- DDL 조별과제 --
/*
--학생 성적 테이블
--학번의 데이터는 중복되거나 NULL 값을 허용하면 안된다
--이름 NULL 값을 허용하지 않는다
--국어
--영어
--수학 점수 컬럼은 숫자 타입이고 NULL 값을 허용
--국어, 영어, 수학의 값을 입력하지 않으면  default로 0값을 갖는다
--총점, 평균 컬럼은 가상컬럼으로(조합컬럼) 생성한다
--학과코드는 학과 테이블에 학과코드를 참조한다
--학번, 이름, 국어, 영어, 수학, 총점, 평균, 학과코드

--학과 테이블
--학과코드 데이터는 중복되거나 NULL 값을 허용하면 안된다,
--학과명은 null값을 허락하지 않는다

--학과코드 , 학과명

--그리고 select 결과는
--학번, 이름, 총점, 평균, 학과코드, 학과명을 출력하세요
*/
CREATE TABLE STUDENT (
  STD_ID VARCHAR2(20) CONSTRAINT PK_STUDENT_STD_ID PRIMARY KEY, 
  STD_NAME VARCHAR2(20) NOT NULL,
  KOREAN NUMBER DEFAULT 0,
  ENGLISH NUMBER DEFAULT 0,
  MATH NUMBER DEFAULT 0,
  SUM NUMBER GENERATED ALWAYS AS (KOREAN + ENGLISH + MATH) VIRTUAL,
  AVG NUMBER GENERATED ALWAYS AS (ROUND ((KOREAN + ENGLISH + MATH) / 3, 0)) VIRTUAL,
  DEPT_CD VARCHAR2(20)
);

CREATE TABLE DEPARTMENT (
  DEPT_CD VARCHAR2(20) CONSTRAINT PK_DEPARTMENT_DPET_CD PRIMARY KEY,
  DEPT_NAME VARCHAR2(20) NOT NULL
);

ALTER TABLE STUDENT
ADD CONSTRAINT FK_STUDENT_DEPT_CD FOREIGN KEY (DEPT_CD) REFERENCES DEPARTMENT (DEPT_CD);

SELECT * FROM STUDENT;
SELECT * FROM DEPARTMENT;

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'STUDENT';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'DEPARTMENT';

INSERT INTO DEPARTMENT (DEPT_CD, DEPT_NAME)
VALUES (10, '수학과');
INSERT INTO DEPARTMENT (DEPT_CD, DEPT_NAME)
VALUES (20, '영문과');
INSERT INTO DEPARTMENT (DEPT_CD, DEPT_NAME)
VALUES (30, '국문과');

INSERT INTO STUDENT (STD_ID, STD_NAME, KOREAN, ENGLISH, MATH, DEPT_CD)
VALUES ('10_123', '김진호', 100, 100, 100, 10);
INSERT INTO STUDENT (STD_ID, STD_NAME, KOREAN, ENGLISH, MATH, DEPT_CD)
VALUES ('20_234', '오형남', 90, 80, 85, 20);
INSERT INTO STUDENT (STD_ID, STD_NAME, KOREAN, ENGLISH, MATH, DEPT_CD)
VALUES ('30_345', '이혜리', 95, 100, 85, 30);
INSERT INTO STUDENT (STD_ID, STD_NAME, KOREAN, ENGLISH, MATH, DEPT_CD)
VALUES ('10_567', '이정은', 90, 90, 80, 10);
INSERT INTO STUDENT (STD_ID, STD_NAME, KOREAN, ENGLISH, MATH, DEPT_CD)
VALUES ('20_789', '권태일', 80, 80, 90, 20);

SELECT S.STD_ID AS "학번", S.STD_NAME AS "학생이름", S.SUM AS "총점", S.AVG AS "평균", S.DEPT_CD AS "학과코드", D.DEPT_NAME AS "학과이름"
FROM STUDENT S JOIN DEPARTMENT D
ON S.DEPT_CD = D.DEPT_CD;

DROP TABLE STUDENT; -- 테이블 삭제

COMMIT;

-- VIEW: 가상 테이블
-- PDF 192P
-- 가상 테이블: 물리적(X), 잠시 메모리에...
-- VIEW 객체라고 표현한다
-- CREATE VIEW 뷰이름 AS (VIEW가 보는 목록(SELECT 구문))
-- VIEW는 테이블처럼 사용 가능(가상 테이블: 실제 테이블(EX) EMP, DEPT)과 사용법이 동일)
-- VIEW는 메모리에만 존재하는 가상 테이블(SUBQUERY >> IN LINE VIEW >> 실제 테이블처럼(고급 기능))
-- VIEW: SQL 문장 덩어리

-- 사용법
-- 일반 테이블과 동일하게 사용: FROM 절 WHERE 절
-- DML이 가능하지만 VIEW를 통해 물리적인 테이블에 접근하여 INSERT, UPDATE, DELETE 하는 것을 자제하도록 하자
-- VIEW의 장점
-- 개발자의 편리함(JOIN, SUBQUERY): 쿼리문 설계
-- 복잡한 쿼리를 단순하게
-- 보안: 권한 별로 처리

CREATE VIEW V_001
AS
  SELECT EMPNO, ENAME FROM EMP;

SELECT * FROM V_001; -- 실제로는 VIEW가 가지고 있는 SQL 문장을 실행

-- VIEW가 볼 수 있는 데이터에 대해서 DML 가능, 조건절 가능
SELECT * FROM V_001 WHERE EMPNO = 7788;

CREATE VIEW V_002
AS
  SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME
  FROM EMP E JOIN DEPT D
  ON E.DEPTNO = D.DEPTNO;

SELECT * FROM V_002;

CREATE VIEW V_003
AS
  SELECT DEPTNO, AVG(SAL) AS AVGSAL
  FROM EMP
  GROUP BY DEPTNO;

SELECT * FROM V_003;

-- 자기 부서의 평균 월급보다 더 많은 월급을 받는 사원의 사번, 이름, 부서번호, 부서별 평균 월급을 출력하세요
-- 만약에 부서별 평균 월급을 가지고 있는 테이블이 있다면
-- IN LINE VIEW
SELECT E.EMPNO, E.ENAME, E.DEPTNO, E.SAL, TRUNC((S.AVGSAL), 0)
FROM EMP E JOIN V_003 S
ON E.DEPTNO = S.DEPTNO
WHERE E.SAL > S.AVGSAL;

SELECT E.EMPNO, E.ENAME, E.DEPTNO, E.SAL, TRUNC(S.AVGSAL)
FROM EMP E JOIN (SELECT DEPTNO, AVG(SAL) AS AVGSAL FROM EMP GROUP BY DEPTNO) S
ON E.DEPTNO = S.DEPTNO
WHERE E.SAL > S.AVGSAL;

-- JOIN 처리: 만약 원하는 값이 테이블로 존재한다면 >> VIEW

/*
CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW view_name [(alias[,alias,...])]
AS Subquery
[WITH CHECK OPTION [CONSTRAINT constraint ]]
[WITH READ ONLY]

OR REPLACE 이미 존재한다면 다시 생성한다.

FORCE Base Table 유무에 관계없이 VIEW 을 만든다.
NOFORCE 기본 테이블이 존재할 경우에만 VIEW 를 생성한다.

view_name VIEW 의 이름
Alias Subquery 를 통해 선택된 값에 대한 Column 명이 된다.
Subquery SELECT 문장을 기술한다.
WITH CHECK OPTION VIEW 에 의해 액세스 될 수 있는 행만이 입력,갱신될 수 있다.
Constraint CHECK OPTON 제약 조건에 대해 지정된 이름이다.
WITH READ ONLY 이 VIEW 에서 DML 이 수행될 수 없게 한다.
*/
-- 기존에 만든 VIEW 수정
-- CREATE OR REPLACE VIEW이름: OVERWRITE

CREATE OR REPLACE VIEW V_004
AS
  SELECT EMPNO, ENAME, SAL
  FROM EMP;

SELECT * FROM V_004;

DROP VIEW V_004;

CREATE OR REPLACE VIEW V_EMP
AS
  SELECT EMPNO, ENAME, DEPTNO
  FROM EMP
  WHERE DEPTNO = 20;

SELECT * FROM V_EMP;

SELECT * FROM V_EMP WHERE DEPTNO = 10; -- V_EMP가 볼 수 있는 데이터는 DEPTNO = 20

-- VIEW: 가상 테이블 >> DML(INSERT, UPDATE, DELTE)
-- VIEW를 통해서 바라볼 수 있는 데이터에 대해서만 가능
-- DML은 단일 테이블로 작업만 가능

SELECT * FROM V_EMP;

DELETE FROM V_EMP; -- 실제로 VIEW가 가지고 있는 테이블 데이터 삭제

SELECT * FROM EMP WHERE DEPTNO = 20;
ROLLBACK;

UPDATE V_EMP
SET ENAME = 'AAA'
WHERE DEPTNO = 30;
-- VIEW가 볼 수 있는 데이터는 DEPTNO = 20, DEPTNO = 30은 VIEW가 볼 수 없다

--1. 30번 부서 사원들의 직위, 이름, 월급을 담는 VIEW를 만들어라.
CREATE VIEW V_004
AS
  SELECT JOB, ENAME, SAL FROM EMP WHERE DEPTNO = 30;

SELECT * FROM V_004

CREATE OR REPLACE  VIEW VIEW100
AS
  SELECT JOB, ENAME, SAL
  FROM EMP
  WHERE DEPTNO=30
 
SELECT * FROM VIEW100

--2. 30번 부서 사원들의  직위, 이름, 월급을 담는 VIEW를 만드는데,
-- 각각의 컬럼명을 직위, 사원이름, 월급으로 ALIAS를 주고 월급이
-- 300보다 많은 사원들만 추출하도록 하라.
-- create or replace view view001 (컬럼명, 컬럼명, .....)  
CREATE VIEW V_005
AS
  SELECT JOB AS "직위", ENAME AS "사원이름", SAL AS "월급"
  FROM EMP
  WHERE SAL > 300;

SELECT * FROM V_005;

CREATE OR REPLACE VIEW  VIEW101 (직위, 사원이름, 월급) -- ALIAS 쓰는 다른 방법
AS
 SELECT JOB , ENAME , SAL
 FROM EMP
 WHERE DEPTNO=30 AND SAL > 300
 
SELECT * FROM VIEW101

--3. 부서별 최대월급, 최소월급, 평균월급을 담는 VIEW를 만들어라.
CREATE OR REPLACE VIEW V_006
AS
  SELECT DEPTNO AS "부서번호", MAX (SAL) AS "최대월급", MIN (SAL) AS "최소월급", ROUND (AVG (SAL), 0) AS "평균월급"
  FROM EMP
  GROUP BY DEPTNO;

SELECT * FROM V_006;

CREATE OR REPLACE VIEW  VIEW102
AS
 SELECT DEPTNO, MAX(SAL) AS "최대월급", -- ALIAS 안 붙이면 VIEW가 안 만들어짐(VIEW도 테이블이기 때문에 COLUMN 이름이 필요)
  MIN(SAL) AS "최소월급",
  AVG(SAL) AS "평균월급"
 FROM EMP
 GROUP BY DEPTNO

SELECT * FROM VIEW102;

--4. 부서별 평균월급을 담는 VIEW를 만들되, 평균월급이 2000 이상인 부서만 출력하도록 하라.
CREATE OR REPLACE VIEW V_007
AS
  SELECT ROUND (AVG (SAL), 0) "평균월급"
  FROM EMP
  GROUP BY DEPTNO
  HAVING AVG (SAL) >= 2000;

SELECT * FROM V_007;

CREATE OR REPLACE VIEW VIEW103
AS
 SELECT DEPTNO, AVG(SAL) AS "평균월급"
 FROM EMP
 GROUP BY DEPTNO
 HAVING AVG(SAL) >=2000;
 
----------------------------------------
SELECT v.deptno,v.평균월급 , d.dname
FROM view103 v JOIN dept d
ON v.deptno = d.deptno;
-----------------------------------------

--5. 직위별 총월급을 담는 VIEW를 만들되, 직위가 MANAGER인 사원들은 제외하고 총월급이 3000이상인 직위만 출력하도록 하라.
CREATE OR REPLACE VIEW V_008
AS
  SELECT JOB, SUM (SAL) AS "총월급"
  FROM EMP
  WHERE JOB != 'MANAGER'
  GROUP BY JOB
  HAVING SUM (SAL) >= 3000;

SELECT * FROM V_008;

CREATE OR REPLACE VIEW VIEW104
AS
 SELECT JOB, SUM(SAL) AS "총월급"
 FROM EMP
 WHERE JOB!='MANAGER'
 GROUP BY JOB
 HAVING SUM(SAL)>=3000;
 
SELECT * FROM VIEW104;


-------------------------------------------------------------------------
--제 11장 SEQUENCE pdf 185page
--시퀀스 객체
--순번 추출 (채번기) -> 자동으로 번호를 생성해서 전달하는 객체

/*
CREATE  SEQUENCE  sequence_name  
[INCREMENT  BY  n]  
[START  WITH  n]  
[{MAXVALUE n | NOMAXVALUE}]  
[{MINVALUE n | NOMINVALUE}]  
[{CYCLE | NOCYCLE}]  
[{CACHE | NOCACHE}];

sequence_name  SEQUENCE 의 이름입니다. 

INCREMENT  BY  n 정수 값인 n 으로 SEQUENCE 번호 사이의 간격을 지정. 이 절이 생략되면 SEQUENCE 는 1 씩 증가.
                 
START  WITH  n  생성하기 위해 첫번째 SEQUENCE 를 지정. 이 절이 생략되면 SEQUENCE 는 1 로 시작. 
                      
MAXVALUE n  SEQUENCE 를 생성할 수 있는 최대 값을 지정. 

NOMAXVALUE   오름차순용 10^27 최대값과 내림차순용-1 의 최소값을 지정. 

MINVALUE n  최소 SEQUENCE 값을 지정. 

NOMINVALUE  오름차순용 1 과 내림차순용-(10^26)의 최소값을 지정. 

CYCLE | NOCYCLE  최대 또는 최소값에 도달한 후에 계속 값을 생성할 지의 여부를 지정. NOCYCLE 이 디폴트. 

CACHE | NOCACHE  얼마나 많은 값이 메모리에 오라클 서버가 미리 할당하고 유지 하는가를 지정. 디폴트로 오라클 서버는 20 을 CACHE. 
 
*/

--게시판
/*
create table board(
  boardid number primary key,
  title varchar2(50)
);

boardid 글 번호는 >> 중복값, null (X)
내가 실수 없이 데이터를 넣을 수 있을까?

where boardid = `0 -> 하나의 row return 하는 것을 저장

Q) insert into board _ boardid 1,
   insert into board _ boardid 2,
   insert into board _ boardid 3,

*/

CREATE TABLE KBOARD (
  NUM NUMBER CONSTRAINT PK_KBOARD_NUM PRIMARY KEY,
  TITLE VARCHAR2(50)
);

--처음 글
--num = 1
--다음 글
--num = 2

-- 방법 1.
INSERT INTO KBOARD (NUM, TITLE)
VALUES ((SELECT NVL (MAX (NUM), 0) + 1 FROM KBOARD), '처음'); -- MAX 초기값이 0이기 때문에 NULL 값 방지를 위해 NVL
INSERT INTO KBOARD (NUM, TITLE)
VALUES ((SELECT NVL (MAX (NUM), 0) + 1 FROM KBOARD), '두번');
INSERT INTO KBOARD (NUM, TITLE)
VALUES ((SELECT NVL (MAX (NUM), 0) + 1 FROM KBOARD), '세번');
SELECT * FROM KBOARD;
-- 이 방법이 괜찮은 방법
DELETE KBOARD WHERE NUM = 1;
INSERT INTO KBOARD (NUM, TITLE)
VALUES ((SELECT NVL (MAX (NUM), 0) + 1 FROM KBOARD), '네번');

-- 방법 2.
CREATE TABLE TBOARD (
  num number constraint PK_TBOARD_NUM primary key,
  title varchar2(50)
);
INSERT INTO TBOARD (NUM, TITLE)
VALUES ((SELECT COUNT (NUM) + 1 FROM TBOARD), '처음');
INSERT INTO TBOARD (NUM, TITLE)
VALUES ((SELECT COUNT (NUM) + 1 FROM TBOARD), '두번');
INSERT INTO TBOARD (NUM, TITLE)
VALUES ((SELECT COUNT (NUM) + 1 FROM TBOARD), '세번');

SELECT * FROM TBOARD;

COMMIT;
-- 문제점
DELETE FROM TBOARD WHERE NUM = 1;
INSERT INTO TBOARD (NUM, TITLE)
VALUES ((SELECT COUNT (NUM) + 1 FROM TBOARD), '네번'); -- unique constraint (BITUSER.PK_TBOARD_NUM) violated
-- 데이터 DELETE 후 INSERT를 하게 되면 기존번호와 충돌

-- 번호를 추출해서 중복값이 나오지 않게 순차적인 값 전달
CREATE SEQUENCE SEQ_NUM; -- Oracle 서버에 등록
-- 초기값 1, MAX 제한 없음, INCREMENT 1
-- 내가 가지고 있는 계정의 객체 확인
SELECT * FROM USER_SEQUENCES;

/*
 NEXTVAL 과 CURRVAL 의사열
가) 특징
1) NEXTVAL 는 다음 사용 가능한 SEQUENCE 값을 반환 한다.
2) SEQUENCE 가 참조될 때 마다, 다른 사용자에게 조차도 유일한 값을 반환한다.
3) CURRVAL 은 현재 SEQUENCE 값을 얻는다.
4) CURRVAL 이 참조되기 전에 NEXTVAL 이 사용되어야 한다.
*/

-- 번호 추출하기
SELECT SEQ_NUM.NEXTVAL FROM DUAL; -- 번호추출: 채번기
-- 정보 확인하기
SELECT SEQ_NUM.CURRVAL FROM DUAL; -- 마지막으로 추출된 순번
SELECT SEQ_NUM.CURRVAL + 1 AS "다음 번호" FROM DUAL; -- 내 메모

CREATE TABLE SBOARD (
  NUM NUMBER CONSTRAINT PK_SBOARD_NUM PRIMARY KEY,
  TITLE VARCHAR2(50)
);

INSERT INTO SBOARD (NUM, TITLE)
VALUES (SEQ_NUM.NEXTVAL, '처음글');
INSERT INTO SBOARD (NUM, TITLE)
VALUES (SEQ_NUM.NEXTVAL, '두번');
INSERT INTO SBOARD (NUM, TITLE)
VALUES (SEQ_NUM.NEXTVAL, '세번');

DELETE SBOARD WHERE NUM = 9;

INSERT INTO SBOARD (NUM, TITLE)
VALUES (SEQ_NUM.NEXTVAL, '네번');

SELECT * FROM SBOARD;

ROLLBACK; -- ROLLBACK 후 INSERT를 하여도 NEXTVAL은 이어진다

COMMIT;

/*
의사 컬럼(Pseudo-column)은 테이블의 컬럼처럼 동작하지만 
실제로 테이블에 저장되지 않는 컬럼을 의미한다.
SELECT 문에서는 의사컬럼을 사용할 수 있지만, DML 문장에서는 할 수 없다.
시퀀스에서 사용하는 NEXTVAL이나 CURRVAL 도 의사 컬럼의 일종이며, 
대표적인 예는 ROWNUM이다.
*/
-- 게시판 10개
-- 질문게시판, 자유게시판, 공지사항
-- 3개 게시판의 글번호를 따로 관리하고 싶다
-- SEQUENCE 3개
-- 1. Q_NUM
-- 2. F_NUM
-- 3. N_NUM

-- 게시판 10개
-- 질문게시판, 자유게시판, 공지사항을 하나의 글번호로 통합
-- SEQUENCE 1개: 네이버 카페

CREATE SEQUENCE BOARD_SEQ;

-- INSERT INTO QBOARD () VALUES (BOARD_SEQ.NEXTVAL ...)
-- INSERT INTO FBOARD () VALUES (BOARD_SEQ.NEXTVAL ...)
-- INSERT INTO NBOARD () VALUES (BOARD_SEQ.NEXTVAL ...)

-- 1. SEQUENCE는 ROLLBACK 지원합니까? >> NO (은행 번호표와 같다)
SELECT * FROM SBOARD;
INSERT INTO SBOARD (NUM, TITLE)
VALUES (SEQ_NUM.NEXTVAL, '안녕');
ROLLBACK;
INSERT INTO SBOARD (NUM, TITLE)
VALUES (SEQ_NUM.NEXTVAL, '안녕');

-- TIP
-- MS-SQL
-- CREATE TABLE BOARD (BOARDNUM INT IDENTITY(1, 1), TITLE VARCHAR(20)) -- 1로 시작해서 1씩 증가, 테이블 종속적
-- INSERT INTO BOARD (TITLE) VALUES ('MS');
-- 버전: 2012버전부터 SEQUENCE 객체 가능

-- MY-SQL
-- CREATE TABLE BOARD (BOARDNUM INT AUTO_INCREMENT, TITLE VARCHAR(2)) -- 테이블 종속적
-- INSERT INTO BOARD (TITLE) VALUES ('MYSQL');

CREATE SEQUENCE SEQ2_NUM
START WITH 10
INCREMENT BY 2;

SELECT SEQ2_NUM.CURRVAL FROM DUAL; -- NEXTVAL 하기 전에 CURRVAL을 하면 오류
SELECT SEQ2_NUM.NEXTVAL FROM DUAL;

SELECT * FROM USER_SEQUENCES;

/*
게시판 글번호
NUM
1
2
4
6
10
15

최신글 순으로 게시글 목록을 보여주세요
SELECT * FROM BOARD ORDER BY NUM DESC;
게시판 만들기의 기본
*/
/*
의사 컬럼(Pseudo-column)은 테이블의 컬럼처럼 동작하지만 
실제로 테이블에 저장되지 않는 컬럼을 의미한다.
SELECT 문에서는 의사컬럼을 사용할 수 있지만, DML 문장에서는 할 수 없다.
시퀀스에서 사용하는 NEXTVAL이나 CURRVAL 도 의사 컬럼의 일종이며, 
대표적인 예는 ROWNUM이다.
*/

-- 개발자(SEQUENCE, ROWNUM)
-- ROWNUM: 의사 컬럼
-- ROWNUM: 실제로는 테이블에 존재하지 않는 COLUMN이지만 행마다 번호를 부여
-- ROWID: 주소값: 행이 실제로 저장되는 내부(메모리) 주소값(참고사항: DBA, 튜닝)
SELECT EMPNO, ENAME FROM EMP;

SELECT ROWNUM AS 순번, EMPNO, ENAME FROM EMP; -- 실제로 순번이라는 데이터를 만든다
-- SELECT 끝난 후 ROW(열)에 번호 부여
-- PAGING 처리 가능
-- TOP-N QUERY 사용
-- 테이블에서 조건에 맞는 상위 TOP 레코드(ROW) N개 추출: 정렬된 데이터를 기준으로
-- 근거: 정렬된 데이터(기준 > 줄 > 순번)
SELECT * FROM EMP ORDER BY SAL DESC; -- 동점처리에 대한 문제점

-- TIP
-- TOP-N QUERY
-- MS-SQL: SELECT TOP 10, * FROM EMP ORDER BY SAL DESC;
-- Oracle: ROWNUM

-- 1. 정렬 QUERY를 만든다
-- 2. QUERY에 순번(ROWNUM)을 부여하고 조건 WHERE ROWNUM <= 10

-- 1단계
-- 기준설정
SELECT ROWNUM AS "NUM", E.*
FROM (
  SELECT *
  FROM EMP
  ORDER BY SAL DESC) E;

-- 2단계
-- 조건설정
SELECT ROWNUM AS "NUM", E.* -- 조건처리를 한 뒤에 ROWNUM을 붙였다
FROM (
  SELECT *
  FROM EMP
  ORDER BY SAL DESC) E
WHERE ROWNUM <= 10;

SELECT ROWNUM AS "NUM", E.*
FROM (
  SELECT *
  FROM EMP
  ORDER BY SAL DESC) E
WHERE ROWNUM <= 3;

SELECT ROWNUM AS "NUM", E.*
FROM (
  SELECT *
  FROM EMP
  ORDER BY SAL DESC) E
WHERE ROWNUM <= 2; -- 같은 조건값이 있을 때는 그때 그때 다르다(내부적 처리)

SELECT *
FROM (
      SELECT ROWNUM AS "NUM", E.*
      FROM (
            SELECT *
            FROM EMP
            ORDER BY SAL DESC) E
      ) N
WHERE "NUM" <= 2

-- Oracle 기본 END --
-- SQL 1차 학습완료 --

-- SQL 2차 학습 --
-- 고급 QUERY
-- PL-SQL: 변수, 제어문, 커서, 함수, 프로시저, 트리거, 스케쥴



--사원테이블에서 COUNTRY_ID가 US이고 급여의 합계가 5000이상인 사원의 직종, 급여의 합계("합계"로 별칭 부여하기),
--부서이름, city를 city의 알파벳 순으로 출력
select e.job_id, sum(e.salary) as "합계", d.department_name, l.city
from employees e join departments d on e.department_id=d.department_id join locations l on d.location_id=l.location_id
where l.country_id='US'
group by e.job_id, e.salary, d.department_name, l.city
having sum(e.salary)>5000
order by l.city asc;