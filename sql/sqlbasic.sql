/*
[1���� ����]
1. ����Ŭ ����Ʈ���� �ٿ�ε�

1.11g Express Edition  ����
https://www.oracle.com/database/technologies/xe-prior-releases.html

2.����Ŭ ���� �� (�������)
https://www.oracle.com/tools/downloads/sqldev-v192-downloads.html

3. ��ġ (������ ���� : SYSTEM , SYS ���� >> ��ȣ���� : 1004)
    Port for 'Oracle Database Listener': 1521

4. ���� (sqlplus �� : DOS ���) >> UI �� ��ġ

5. ����Ŭ ���� : SqlDeveloper 
   ���� :  ��� , ������ , sqlgate
   ���� :  https://dbeaver.io/download/   


6.  Tool ����
     SYSTEM : 1004 ���� ����  (������ ����)
     6.1 HR ���� ��� (unlock)
     -- USER SQL
     ALTER USER "HR" IDENTIFIED BY "1004" 
     DEFAULT TABLESPACE "USERS"
     TEMPORARY TABLESPACE "TEMP"
     ACCOUNT UNLOCK ; 
    6.2  HR ��������  �α��� (���̺� ��ȸ)

7.  ���ο� ���� ����� (�ǽ��� ����)
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

8. �ǽ� script �����
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
DISTINCT  �ߺ� �� ���� �ɼ� 
*   ���̺��� ��� column ��� 
alias   �ش� column �� ���� �ٸ� �̸� �ο� 
table_name ���̺�� ���� ��� ���̺� �̸� 
WHERE   ������ �����ϴ� ��鸸 �˻� 
condition  column, ǥ����, ��� �� �� ������ 
ORDER BY  ���� ��� ������ ���� �ɼ�(ASC:��������(Default),DESC ��������

[] �����ص� �ȴ�
*/

-- 1. ������̺� �ִ� ��� �����͸� ����ϼ���
select * from emp; -- �������� ��ҹ��� �������� �ʴ´�

-- 2. Ư�� �÷� ������ �����ϱ�
select empno, ename, job, sal from emp;

select empno from emp;

select hiredate, deptno from emp;

-- 3. �÷��� ����Ī(alias) �ο��ϱ�
-- select empno ���, ename �̸� -- ���� �Ұ���, �ٷ� �� �ܾ������ �ν�
-- from emp;
select empno "��   ��", ename "��   ��"
from emp;

-- ����(ansi ǥ��): �������
select empno as "��   ��", ename as "��   ��"
from emp;

-- Oracle: ���ڿ� �����Ϳ��� �����ϰ� ��ҹ��� ����
-- ������(����): A, a�� ���� �ٸ� ���� >> '����'
select * from emp where ename = 'king'; -- �����Ͱ� ��µ��� �ʴ´�
select * from emp where ename = 'KING'; -- ��ҹ��ڸ� �����ϸ� ��µȴ�
select * from emp where ename = 'King';

-- Oracle: ������(���� ������) >> || >> 'hello' || 'world': ���� >> 'helloworld'
-- Java: + ���, ����, ex) 10 + 10(���), "A" + "B"(����)
-- Tip) ms-sql: + ����(���), ����

select '����� �̸���' || ename || '�Դϴ�'
from emp;
select '����� �̸���' || ename || '�Դϴ�' as "ename" -- Oracle ""�� ����Ī �ۿ� ����
from emp;

-- Java: class Emp {private int empno;}
-- Point: Oracle�� �÷��� Ÿ�������� ���´�
-- ���� ���� ������ �ִ� emp ������ ���� ���
desc emp; -- emp �÷��� Ÿ������

select empno + ename as "����" -- ���� ����: ����: "invalid number"
from emp;

select empno || ename as "����" -- ���ڿ� ���ڴ� ���� ����(���������δ� �ڵ�����ȯ: ����->����), to_char()
from emp;

-- ����� ��: �츮 ȸ�翡 ����(job)�� �� ���� �ֳ�
select job from emp;
-- �ߺ� ������ ���� Ű����: distinct
select distinct job from emp;

select distinct deptno from emp;

-- distinct ����: �÷��� 2�� �̻��� ���(������ �ϳ����� ����) >> grouping(�ٷ���)
select distinct job, deptno from emp order by job;
select distinct deptno, job from emp order by deptno;

-- Oracle ���(SQL)
-- Java�� ���: ������ >> Oracle�� ������
-- Oracle ������: Java�� 80% ���� ����

-- Java(%�� ������ ������) >> Oracle(%�� �˻������ڿ����� Ȱ��) >> ������ �Լ��� ����: Mod() �Լ�
-- Oracle(+, -, *, /, ...) + ������ Mod() �Լ�

-- ������̺��� ����� �޿��� 100�޷� �λ��� ����� ����ϼ���
-- ��������: �÷��� Ÿ���� NUMBER
desc emp;
select empno, ename, sal, sal + 100 as "�޿��λ�"
from emp;

-- ��̷�...: ��������ڿ� ���տ����ڰ� ���еǾ� �ִ�
select 100 + 100 from dual; -- dual �ӽ� ���̺�(������ �׽�Ʈ �� �� ����ϴ�)
select 100 || 100 from dual; -- || ������ ����(���� -> ���� �ڵ�����ȯ)
select '100' + 100 from dual; -- + ������ �������('100' -> ���� ����ȯ)
select 'A100' + 100 from dual; -- error: "invalid number"

-- �񱳿�����
-- >, >=, <, ...
-- Java���� ����: (==), ������ ���� �������� �Ҵ�
-- javascript: (===)
-- Oracle���� ����: (=), ���� �ʴ�: (!=), Oracle�� �Ҵ��̶�� ���� ����

-- ��������
-- AND, OR, NOT

/*
SELECT [DISTINCT]  {*, column [alias], . . .}   
FROM  table_name   
[WHERE  condition]   
[ORDER BY {column, expression} [ASC | DESC]]; 
*/

-- ������(���ϴ� row�� ������ ���ڴ�)
-- �������: select ��, from ��, where ��
select * -- 3
from emp -- 1
where sal >= 3000; -- 2

 -- �̻�, ����(= ����)
 -- �ʰ�, �̸�(= ������)
 
 -- ����� 7788���� ����� ���, �̸�, ����, �Ի����� ����ϼ���
 select * -- *���� ���� �� �̾Ƽ� ������ �����ϴ� ��츦 ã�´�
 from emp
 where empno = 7788;
 select empno, ename, job, hiredate
 from emp
 where empno = 7788;
 
 -- ����� �̸��� KING�� ����� ���, �̸�, �޿������� ����ϼ���
 select *
 from emp
 where ename = 'KING';
 select empno, ename, sal
 from emp
 where ename = 'KING';
 
 -- �޿��� 2,000�޷� �̻��̸鼭 ������ MANAGER�� ����� ��� ������ ����ϼ���
 -- ��������: and, or, not
 select *
 from emp
 where sal >= 2000 AND job = 'MANAGER';
 
 -- �޿��� 2,000�޷��̰ų� ������ MANAGER�� ����� ��� ������ ����ϼ���
 select * -- 3
 from emp -- 1
 where sal >= 2000 or job = 'MANAGER'; -- 2
 
 -- Oracle ��¥
 -- DB ������ ��¥
 -- �ý���: ��¥�� ������ �ִ� >> sysdate
 select sysdate from dual;
 -- �Խ��� �۾���: insert into board(writer, title, content, regdate)
 --              values('ȫ�浿', '�氡�氡', '�ǰ��ؿ�', sysdate)
 -- Tip: ms-sql >> select getdate()
 
 select hiredate from emp;
 desc emp; -- date
 -- Oracle �ý��������� ��� �ִ� ���̺��� ������ ����
 -- ȯ�漳��
 select * from SYS.NLS_SESSION_PARAMETERS; -- �޸��忡 ��Ƶΰ� �ʿ��� �� ������ ����(�ܿ��� ����)
 -- NLS_LANGUAGE	KOREAN
 -- NLS_DATE_FORMAT	RR/MM/DD >> ���浵 �����ϴ�
 -- NLS_DATE_LANGUAGE	KOREAN
 -- NLS_TIME_FORMAT	HH24:MI:SSXFF
 
 select * from SYS.NLS_SESSION_PARAMETERS where parameter = 'NLS_DATE_FORMAT';
 -- Point
 -- �������ؿ��� �������� ����(DBA)
 -- ���� ������ �����: session �������� ����
 -- �ٸ� ������ bituser�� �����ϸ� ��¥������ ������� �ʰ�(�״�� ����)

alter session set nls_date_format = 'YYYY-MM-DD HH24:MI:SS'; -- ����
select * from SYS.NLS_SESSION_PARAMETERS where parameter = 'NLS_DATE_FORMAT'; -- ����Ȯ��

-- NLS_DATE_FORMAT	YYYY-MM-DD HH24:MI:SS
select sysdate from dual; -- 2019-09-24 11:52:48
select hiredate from emp; -- 1980-12-17 00:00:00
-- DB������ �ƴ� session�� ���ؼ� ó���ϵ��� ����

select *
from emp
where hiredate = '1980-12-17'; -- ��¥����ǥ���� ���ڿ� ����

select *
from emp
where hiredate = '1980/12/17'; -- ��¥���Ŀ� ���� '-'�� '/' �� �� ����

select * from emp;
select *
from emp where hiredate = '80-12-17'; -- ��¥������ �ٲ���ұ� ������ ��ȸ�� ���� �ʴ´�
-- RR-MM-DD >> YYYY-MM-DD

-- ����� �޿��� 2,000�޷� �̻��̰� 4,000�޷� ������ ��� ����� ������ ����ϼ���
select *
from emp
where sal >= 2000 and sal <= 4000; -- �����ڰ� �Ǽ��ϱ� ���� �Ⱦ��ϴ� �ڵ�(sal �� ��)
-- ������: column�� between A and B('=' ����)
select *
from emp
where sal between 2000 and 4000;

-- ����� �޿��� 2,000�޷� �ʰ��̰� 4,000�޷� �̸��� ��� ����� ������ ����ϼ���
select *
from emp
where sal > 2000 and sal < 4000; -- �ʰ�, �̸��� between ���Ұ�(������ �������� �ʾҴ�)

-- �μ���ȣ�� 10�� �Ǵ� 20�� �Ǵ� 30���� ����� ���, �̸�, �޿�, �μ���ȣ�� ����ϼ���
select *
from emp
where deptno = 10 or deptno = 20 or deptno = 30;
select empno, ename, sal, deptno
from emp
where deptno = 10 or deptno = 20 or deptno = 30;
-- in ������: ���� or ���� or ����...
select empno, ename, sal, deptno
from emp
where deptno in (10, 20, 30); -- where deptno = 10 or deptno = 20 or deptno = 30;

-- �μ���ȣ�� 10�� �Ǵ� 20���� �ƴ� ����� ���, �̸�, �޿�, �μ���ȣ�� ����ϼ���
select *
from emp
where deptno != 10 and deptno != 20;
-- not in ������
select empno, ename, sal, deptno
from emp
where deptno not in (10, 20); -- where deptno != 10 and deptno != 20;

-- Point: ���� ����(�����Ͱ� ����): null
-- null: �ʿ��
-- Java: calss Member { private String userid }
create table member ( -- member ���̺�
userid varchar2(20) not null, -- null�� �ƴϾ�� �Ѵ�(�Է��ؾ߸� �Ѵ�)
name varchar2(20) not null,
hobby varchar2(20) -- default: null >> null�� ��� >> �ʼ� �Է»����� �ƴϴ�
)

select * from member;

insert into member (userid, name) values ('hong', 'ȫ�浿')
select * from member;

insert into member (userid, hobby) values ('kim', '��')
-- error: ORA-01400: cannot insert NULL into ("BITUSER"."MEMBER"."NAME")

insert into member (userid, name, hobby) values ('park', '�ڱ�', '�౸')
select * from member;

-- �ǹݿ�
commit;
select * from member;

-- ������ ���� �ʴ� ��� ����� ������ �����ϼ���
desc emp;
select * from emp;
-- null�� �ٸ� ������(is null)
select * from emp where comm = null; -- �̷��� �� ���ϴ�

-- null �� *** ***
select * from emp where comm is null;
select * from emp where comm is not null; -- is null �ݴ�

-- ������ �޴� ��� ����� ������ ����ϼ���
select * from emp where comm is not null;

-- ��� ���̺��� ���, �̸�, �޿�, ����, �ѱ޿��� ����ϼ���
-- �ѱ޿� = �޿� + ����
select empno, ename, sal, comm, sal + comm as "�ѱ޿�" from emp;

-- Point: null
-- null���� ��� ������ �� ����� null
-- nvl () ź��: null�� ������ ��ü������ �ٲ��
-- nvl ()���� ������ nvl2
-- ms-sql: convert () ***
-- my-sql: IFNULL () ***
select 1000 + null from dual; -- ����� null
select 1000 + nvl (null, 0) from dual; -- ù ��° �Ķ���Ͱ� null�̸� �� ��° ������ �ٲ��
select 'A' || null from dual; -- ���ڿ��� �������
select 1000 + nvl (null, 1111) from dual;
select nvl (comm, 0) from emp;

select empno, ename, sal, comm, sal + nvl (comm, 0) as "�ѱ޿�" from emp;
-- nvl *****

-- ����� �޿��� 1,000�޷� �̻��̰� ������ ���� �ʴ� ����� ���, �̸�, ����, �޿�, ������ ����ϼ���
select empno, ename, job, sal, comm
from emp
where sal >= 1000 and comm is null;

-- DQL(Data Query Language): SELECT
-- DDL: ���Ǿ�(CREATE, ALTER, DROP(��ü ����, ����, ����))

create table board (
  boardid number not null, -- �ʼ��Է»���
  title varchar2(20) not null, -- �ʼ��Է»���(������, Ư������, ����: 1byte | �ѱ�: 2byte)
  content varchar2(2000) not null, -- �ʼ��Է»���
  hp varchar2(20) -- default null: �����Է»���
);

-- DML(������ ���۾�): insert, update, delete
-- �۾� �ÿ���(���� �ݿ�)�̳� ���ó���� ���� commit, rollback �ݵ�� ���

insert into board (boardid, title, content)
values (100, '����Ŭ', '�� ����');

select * from board;
commit; -- �ǹݿ�

insert into board (boardid, title, content)
values (200, '�ڹ�', '�׸���');
select * from board;
insert into board (boardid, title, content)
values (300, '�ڹ�', '�׸���');
select * from board;
rollback;
select * from board;
-- insert, update, delete �۾� ����Ŭ(������ commit, rollback �ݵ��)
-- ms-sql(Auto commit): default commit; , begin tran�� ���ָ� commit, rollback ������ ����� �Ѵ�
select * from board;

select boardid, nvl(hp, '�ڵ��� �����') as "hp" -- nvl ���ڿ�, ����, ��¥ ��� ����
from board;

-- ���ڿ� �˻�
-- �ּ� �˻�: ex) '����' �ܾ �˻��ϸ� '����'�̶�� �ܾ ���ԵǾ� �ִ� �ּҰ� �� ���´�
-- ���ڿ� ���� �˻�(LIKE ������)

-- like �����ڸ� �����ִ�: ���ϵ� ī�� ����: %(��� ���̶�� �ǹ�), _(�� ���� �ǹ�) �����ؼ� ���

select *
from emp
where ename like '%A%'; -- A �տ� � ���� �͵� �ǰ� �ڿ� � ���� �͵� �ȴ�: A�� ����ִ� ��� ���� �˻��ض�

select *
from emp
where ename like 'A%'; -- A�� �����ϴ� ��� ���� �˻��ض�

select *
from emp
where ename like '��%'; -- �达 ���� ���� ����� ��� �˻��ض�

select *
from emp
where ename like '%S'; -- S�� ������ �̸��� ���� ��� ����� �˻��ض�

select *
from emp
where ename like '%LL%'; -- LL�� �̸��� ���ԵǾ� �ִ� ��� ����� �˻��ض�

select *
from emp
where ename like '%A%A%'; -- A�� ������ 2�� �̻� �ִ� ����� �˻��ض�, AA, ABA

select *
from emp
where ename like '_A%'; -- ù ��° ���ڴ� � ���� �͵� �ǰ� �� ��° ���ڴ� A�̸� �ڿ��� � ���� �͵� �ȴ�

select *
from emp
where ename like '__A%'; -- �� ��° ���ڰ� A�� ��� ����� �˻��ض�

-- Oracle ����(regexp_like): ���� ���� �˻�
-- select * from emp where regexp_like (ename, ����ǥ����);
-- Oracle ����ǥ�� ����ؼ� �������� ����� 3~5��(����) >> �߰� ������Ʈ�� �ݿ�

-- ������ �����ϱ�
-- order by column��(����, ����, ��¥�� ���� column) asc or desc
-- �������� asc: ���� ��(�����ϸ� default)
-- �������� desc: ���� ��

select * from emp
order by sal; -- asc ����(default)
select * from emp
order by sal asc; -- ��Ȯ�� �ڵ�

-- �޿��� ���� �޴� ������ �����ϼ���
select * from emp
order by sal desc;

select * from emp
order by ename asc;

-- �Ի����� ���� ���� ������ �����ؼ� ���, �̸�, �޿�, �Ի����� ����ϼ���
select empno, ename, sal, hiredate from emp
order by hiredate desc;

/*
SELECT  3
FROM  1
WHERE 2
ORDER BY  4
�����͸� �����ͼ� �����ϱ� ������ �����ϰ� select�� ����� �����Ѵ�
*/
-- ������ MANAGER�� ������� ���, �̸�, �޿�, ����, �Ի����� �Ի����� ���� ������ �����ϼ���
-- ��� ���̺��� ������ MANAGER�� ����� ���, �̸�, �޿�, ����, �Ի����� ����ϵ�, �Ի����� ���� ������ ����ϼ���
-- ���� ������ ������ ���ϴ�
select empno, ename, sal, job, hiredate
frmo emp
where job = 'MANAGER'
order by hiredate desc;

-- ��� ���̺��� ����� �μ���ȣ, ������ ����ϵ�, �μ���ȣ�� ������������ ���� �� �׷�ȭ�� �����͸� ���� ������������ �����ϼ���
select deptno, job
from emp
order by deptno desc, job asc; -- ���� ���� 2��, grouping �߿�

-- ������
-- ������(union): ���̺�� ���̺��� �����͸� ���ļ� �������� ��(�ߺ��� ����)
-- ������(union all): �ߺ��� ���

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
union -- �ߺ��� ����
select name from uta;

select name from ut
union all
select name from uta;

-- union ��Ģ
-- 1. �����Ǵ� column�� Ÿ���� �����ؾ� �Ѵ�
select empno, ename from emp
union
select dname, deptno from dept;
-- "expression must have same datatype as corresponding expression"
select empno, ename from emp
union
select deptno, dname from dept;

-- 2. �����Ǵ� COLUMN�� ���� ����(NULL)
SELECT EMPNO, ENAME, JOB, SAL FROM EMP
UNION
SELECT DEPTNO, DNAME, LOC FROM DEPT;
-- query block has incorrect number of result columns"
SELECT EMPNO, ENAME, JOB, SAL FROM EMP
UNION
SELECT DEPTNO, DNAME, LOC, NULL FROM DEPT;

-- Oracle �Լ�(PDF 48P)
/*
���� �� �Լ�
1) ������ �Լ� : ���ڸ� �Է� �ް� ���ڿ� ���� �� ��θ� RETURN �� �� �ִ�.
2) ������ �Լ� : ���ڸ� �Է� �ް� ���ڸ� RETURN �Ѵ�.
3) ��¥�� �Լ� : ��¥���� ���� �����ϰ� ���ڸ� RETURN �ϴ� MONTHS_BETWEEN �Լ��� �����ϰ� ��� ��¥ ���������� ���� RETURN �Ѵ�.
4) ��ȯ�� �Լ� : � ���������� ���� �ٸ� ������������ ��ȯ�Ѵ�.
5) �Ϲ����� �Լ� : NVL, DECODE
*/

-- ���ڿ� �Լ�
SELECT INITCAP('the superman') FROM DUAL; -- INITCAP: �ܾ��� ù ���ڸ� �빮�ڷ�
SELECT LOWER('AAA'), UPPER('aaa') FROM DUAL; -- LOWER: �빮�ڸ� �ҹ��ڷ�, UPPER: �ҹ��ڸ� �빮�ڷ�
SELECT ENAME, LOWER (ENAME) AS "ename" FROM EMP;
SELECT * FROM EMP WHERE lower (ENAME) = 'king';

-- ������ ����(LENGTH)
SELECT LENGTH('ABCD') AS "LENGTH" FROM DUAL;
SELECT LENGTH('ȫ�浿 �ٺ�') AS "LENGTH" FROM DUAL;
SELECT LENGTH('ȫ �� �� ') AS "LENGTH" FROM DUAL;

-- ���� ������: ||
-- ���� �Լ�: CONCAT(PARAMETER�� �������̶� ���� �����ڸ� �� ���� ���)
SELECT 'A' || 'B' || 'C' FROM DUAL;

SELECT CONCAT('A', 'B') FROM DUAL;
SELECT CONCAT(ENAME, JOB) FROM EMP;
SELECT ENAME || '   ' || JOB AS "���� ������" FROM EMP;

-- �κ��� ���ڿ� �߿�
-- Java: substring
-- Oracle: substr

SELECT SUBSTR ('ABCDE', 2, 3) AS "���ڿ� ����" FROM DUAL;
SELECT SUBSTR ('ABCDE', 1, 1) AS "���ڿ� ����" FROM DUAL; -- �� ��° 1�� �ڱ� �ڽ� A
SELECT SUBSTR ('ABCDE', 3, 1) AS "���ڿ� ����" FROM DUAL; -- �� ��° 1�� �ڱ� �ڽ� C

SELECT SUBSTR ('ABCDE', 3) FROM DUAL;
SELECT SUBSTR ('ABCDE', -2, 1) FROM DUAL;
SELECT SUBSTR ('ABCDE', -2, 2) FROM DUAL;

-- ��� ���̺��� ENAME COLUMN �����Ϳ� ���� ù ���ڴ� �ҹ��ڷ�, �������� �빮�ڷ� ����ϵ� �ϳ��� COLUMN �����ͷ� ����ϼ���
-- �÷��� ����Ī�� fullname, ù ���ڿ� ������ ���� ���̿� ������ �ϳ�

SELECT LOWER (SUBSTR (ENAME, 1, 1)) || ' ' || UPPER (SUBSTR (ENAME, 2)) AS "FULLNAME"
FROM EMP;

-- LPAD(PAD: ä���): ����
-- RPAD: ������
SELECT LPAD ('ABC', 10, '*') FROM DUAL;
SELECT RPAD ('ABC', 10, '#') FROM DUAL;

-- QUIZ
-- ����� ���: hong1006
-- ȭ�鿡 ho******�� ���(�� �� ���ڴ� �����ְ� �������� Ư�����ڷ� ���)
SELECT RPAD ('hong1006', LENGTH ('hong1006'), '*') FROM DUAL; -- LENGTH�� ������ �� ����
SELECT RPAD (SUBSTR ('hong1006', 1, 2), LENGTH ('hong1006'), '*') AS "password"
FROM DUAL;
-- EMP ���̺��� ENAME COLUMN�� �����͸� ù ���ڸ� ����ϰ� �������� *�� ����ϼ���
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
-- ��°��: 100; 123456-*******
-- 200; 234567-*******
-- ����� ���� ����Ī�� JUMIN
SELECT ID || ' : ' || RPAD (SUBSTR (JUMIN, 1, 7), LENGTH (JUMIN), '*') AS "JUMIN"
FROM MEMBER2;

-- RTRIM �Լ�: ������ ���ڸ� ����
-- LTRIM �Լ�: ���� ���ڸ� ����
SELECT RTRIM('MILLER', 'ER') FROM DUAL;
SELECT LTRIM('MILLLLLER', 'MIL') FROM DUAL; -- �ߺ����� �ش�: ER

-- ġȯ �Լ�
SELECT ENAME, REPLACE (ENAME, 'A', '�Ϳ�') FROM EMP;

-- ��������� ���ڿ� �Լ� END

-- ���� �Լ�
-- ROUND(�ݿø�) �Լ�
-- TRUNC(����) �Լ�
-- MOD(������) �Լ�

-- -3 -2 -1 0(����: ������) 1 2 3
SELECT ROUND (12.345, 0) AS "R" FROM DUAL; -- 0: ������ ���ܶ�(�ݿø�)
SELECT ROUND (12.567, 0) AS "R" FROM DUAL;

SELECT ROUND (12.345, -2) AS "R" FROM DUAL;


SELECT ROUND (12.345, -1) AS "R" FROM DUAL;
SELECT ROUND (15.345, -1) AS "R" FROM DUAL;
SELECT ROUND (12.345, -2) AS "R" FROM DUAL;

-- TURNC: �ݿø� ���� �ʰ� ����
SELECT TRUNC (12.345, 0) AS "R" FROM DUAL;
SELECT TRUNC (12.567, 0) AS "R" FROM DUAL;

SELECT TRUNC (12.345, 1) AS "R" FROM DUAL;
SELECT TRUNC (12.567, 1) AS "R" FROM DUAL;

SELECT TRUNC (12.345, -1) AS "R" FROM DUAL;
SELECT TRUNC (15.345, -1) AS "R" FROM DUAL;
SELECT TRUNC (12.345, -2) AS "R" FROM DUAL;

-- MOD
SELECT 12/10 FROM DUAL; -- ��� �������� �ѹ��� ���´�
SELECT MOD (12, 10) FROM DUAL;
SELECT MOD (0, 0) FROM DUAL;

-- ���� �Լ��� ������� END

-- ��¥ �Լ�: SYSDATE
-- Point: ��¥ ����
SELECT SYSDATE FROM DUAL;
alter session set nls_date_format = 'YYYY-MM-DD HH24:MI:SS'; -- ����

SELECT HIREDATE FROM EMP;

-- DATE + NUMBER: DATE
-- DATE - NUMBER: DATE
-- DATE - DATE: NUMBER
-- ��¥: ROUND, TRUNC

SELECT MONTHS_BETWEEN ('2019-02-27', '2010-02-27') FROM DUAL; -- ���� �� ����
SELECT MONTHS_BETWEEN (SYSDATE, '2010-01-01') FROM DUAL; -- �ú��ʱ��� �� ����ؼ� ����
-- 116.795324074074074074074074074074074074
SELECT ROUND (MONTHS_BETWEEN (SYSDATE, '2010-01-01'), 0) FROM DUAL;
SELECT TRUNC (MONTHS_BETWEEN (SYSDATE, '2010-01-01'), 0) FROM DUAL;

SELECT TO_DATE ('2015-01-01') + 1000 FROM DUAL; -- '2015-01-01' �� ��ü�δ� ���ڿ��� �ν��ؼ� ����

SELECT SYSDATE + 100 FROM DUAL;

-- QUIZ
/*
1. ��� ���̺��� ������� �Ի��Ͽ��� ���� ��¥(SYSDATE)������ �ټӿ����� ���ϼ���
��, �ټӿ����� ������ �����
2. �� ���� 31���̶�� �����ϰ� �ټӿ����� ���ϼ���
*/
SELECT TRUNC (MONTHS_BETWEEN (SYSDATE, HIREDATE)) AS "�ټӿ���",
TRUNC ((SYSDATE - HIREDATE) / 31) AS "�ټӿ���2"
FROM EMP;

-- ��ȯ �Լ� ***Point***
-- Oracle: ����, ����, ��¥ ������
-- TO_CAHR (): ����(10000) -> ���ڷ�(10000 -> $10000), (100,000) | ��¥(1900-01-01) -> ����(1900��01��01��)
-- ����: ���� ����

-- TO_DATE (): ���� -> ��¥: SELECT '2019-12-12' + 1000 -> SELECT TO_DATE ('2019-12-12') + 100
-- TO_NUMBER (): ���� -> ����(�ڵ�����ȯ �ȴ�)
SELECT '100' + 100 AS "�ڵ�����ȯ" FROM DUAL;
SELECT TO_NUMBER('100') + 100 AS "��Ȯ�ϰ� ǥ���ϸ�" FROM DUAL;

Oracle �⺻ Ÿ��(������ Ÿ��)
create table ���̺�� (column�� Ÿ��);
create table member (age number); 100���� ������ insert
-- Java: class member { int age } >> member m = new member(); 1��
-- Java: List<member> list = new ArrayList<>(); list.add(new member()) ���� ��

���� Ÿ��
-- char(20) >> 20byte >> �ѱ� 10��, ������, Ư������, ���� 20�� >> �������� ���ڿ�
-- varchar2(20) >> 20byte >> �ѱ� 10��, ������, Ư������, ���� 20�� >> �������� ���ڿ�

������ ������: ��, �� >> ó�� >> char(2)
�ᱹ varchar2(20)

���� ���� ����
char () -- varchar2()���� �˻��� �켱

�ᱹ ������ �ѱ�
unicode(2byte): �ѱ�, ������, Ư������, ���� >> 2byte
nchar(20) >> 20�� ������ ���� >> ���� byte * 2 >> 40byte
nvarchar2(20) >> 20���� ����

�ѱ� 20��, ������ 20��

-- QUIZ 1. TO_NUMBER (): ���ڸ� ���ڷ�
SELECT 1 + 1 FROM DUAL;

SELECT '1' + 1 FROM DUAL;

SELECT TO_NUMBERS('1') + 1 FROM DUAL;

SELECT '1' + '1' FROM DUAL; -- �ڵ�����ȯ

SELECT '1A' + '1' FROM DUAL;

-- 2. TO_CHAR (): ���ڸ� ���ڷ�, ��¥�� ���ڷ�
SELECT SYSDATE FROM DUAL;
-- YYYY YY MM DD ���ǵǾ� �־��
SELECT SYSDATE || '��' FROM DUAL; -- �ڵ�����ȯ(��¥�� ���ڰ� ���� >> ����)


-- �Ի����� 12���� ������� ���, �̸�, �Ի���, �Ի�⵵, �Ի���� ����ϼ���
SELECT EMPNO, ENAME, HIREDATE, TO_CHAR (HIREDATE, 'YYYY') AS "��", TO_CHAR (HIREDATE, 'MM') AS "��", TO_CHAR (HIREDATE, 'DD') AS "��"
FROM EMP
WHERE TO_CHAR (HIREDATE, 'MM') = 12;

SELECT TO_CHAR (HIREDATE, 'YYYY MM DD') FROM EMP;

SELECT TO_CHAR (HIREDATE, 'YYYY''��''MM''��''DD''��') FROM EMP;

SELECT TO_CHAR (SAL, '$999,999') AS "SAL"
FROM EMP;

-- ���� ���� ����: BITUSER

-- ���� ���� ����: HR
SELECT * FROM EMPLOYEES;

/*
������̺��� ����� �̸��� last_name , first_name ���ļ� fullname ��Ī �ο��ؼ� ����ϰ�
�Ի�����  YYYY-MM-DD �������� ����ϰ� ����(�޿� *12)�� ���ϰ� ������ 10%(���� * 1.1)�λ��� ���� 
����ϰ� �� ����� 1000���� �޸� ó���ؼ� ����ϼ���
�� 2005�� ���� �Ի��ڵ鸸 ����ϼ��� �׸��� ������ ���� ������  ����ϼ���
*/
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES;
SELECT LAST_NAME || FIRST_NAME AS "FULLNAME", TO_CHAR (HIRE_DATE, 'YYYY-MM-DD') AS "�Ի���", TO_CHAR (SALARY, '999,999') AS "�޿�",
TO_CHAR (SALARY * 12, '999,999') AS "����", TO_CHAR ((SALARY * 12) * 1.1, '999,999') AS "�����λ�", HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR (HIRE_DATE, 'YYYY') >= '2005'
ORDER BY "����" DESC;

-- ����
-- ����
-- ��¥
-- ��ȯ(TO_CHAR ����)

-- �Ϲ� �Լ�
-- ���α׷� ������ ����
-- NVL (), NVL2 (): NULL
-- DECODE (): Java if ����
-- CASE (): Java switch ����

SELECT COMM, NVL (COMM, 0) FROM EMP;


CREATE TABLE T_EMP (
ID NUMBER(6), -- 6�ڸ� ���� ����
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
SELECT ID, JOB, NVL2 (JOB, JOB || '�Դϴ�', 'EMPTY')
FROM T_EMP;
-- if ~ else�� ����� ����
-- null���� ������ ��, null���̸� ��

SELECT ID, JOB, NVL2 (JOB, 'AAAA', 'BBBB')
FROM T_EMP;

-- 3. DECODE Point(sql��� ����� ����, ex) if, for)
-- DECODE (ǥ����, ����1, ���1, ����2, ���2, ����3, ���3...)
-- ��� ������ ���⿡ �ַ� ���
SELECT ID, JOB, DECODE (ID, 100, 'IT...', 
                            200, 'SALES...',
                            300, 'MGR...', 
                            'ETC...') AS "DECODE JOB"
FROM T_EMP;

SELECT JOB, DECODE (JOB, 'IT', 1) FROM T_EMP; -- DECODE ���ǿ� �ش����� �ʴ� �����ʹ� ���� NULL
SELECT JOB, DECODE (JOB, 'IT', 1, 1111) FROM T_EMP; -- NULL���� ������ DEFAULT ���� �ָ� �ȴ�

-- Ȱ��(��� ������)
SELECT DECODE (JOB, 'IT', 1) AS "IT", -- COLUMN 1��
       DECODE (JOB, 'SALES', 1) AS "SALES", -- COLUMN 1��
       DECODE (JOB, 'MGR', 1) AS "MGR" -- COLUMN 1��
FROM T_EMP;

SELECT * FROM T_EMP;

SELECT COUNT (DECODE (JOB, 'IT', 1)) AS "IT", -- COLUMN 1��
       COUNT (DECODE (JOB, 'SALES', 1)) AS "SALES", -- COLUMN 1��
       COUNT (DECODE (JOB, 'MGR', 1)) AS "MGR" -- COLUMN 1��
FROM T_EMP;

SELECT * FROM T_EMP;

/*
emp ���̺��� �μ���ȣ�� 10�̸� '�λ��' , 20 '������' , 30 'ȸ���' ������ �μ� ��ȣ��
'��Ÿ�μ�' ��� ����ϴ� �������� ���弼��
decode �� ����ؼ�
*/

SELECT ENAME, DEPTNO, DECODE (DEPTNO, 10, '�λ��',
                                      20, '������',
                                      30, 'ȸ���',
                                      '��Ÿ�μ�') AS "�μ��̸�"
FROM EMP;

CREATE TABLE T_EMP2 (
ID NUMBER(2),
JUMIN CHAR(7)
);

DROP TABLE T_EMP2; -- ���̺� ����

INSERT INTO T_EMP2 (ID, JUMIN) VALUES (1, '1234567');
INSERT INTO T_EMP2 (ID, JUMIN) VALUES (2, '2234567');
INSERT INTO T_EMP2 (ID, JUMIN) VALUES (3, '3234567');
INSERT INTO T_EMP2 (ID, JUMIN) VALUES (4, '4234567');
INSERT INTO T_EMP2 (ID, JUMIN) VALUES (5, '9234567');
COMMIT;

SELECT * FROM T_EMP2;
/*
T_EMP2 ���̺��� ID, JUMIN �����͸� ����ϵ� JUMIN COLUMN ���ڸ��� 1�̸� '����', 2�̸� '����', 3�̸� '�߼�', �� �ܴ� '��Ÿ'�� ����ϼ���
*/
SELECT ID, JUMIN, DECODE (SUBSTR (JUMIN, 1, 1), 1, '����',
                                         2, '����',
                                         3, '�߼�',
                                         '��Ÿ') AS "GENDER"
FROM T_EMP2;

-- ���̵� �߱�
-- Java if () { if () }
-- Oracle: DECODE ( DECODE ())

SELECT DEPTNO, ENAME, DECODE (DEPTNO, 20, DECODE (ENAME, 'SMITH', 'HELLO',
                                                         'WORLD'),
                                          'ETC') AS "DECODE"
FROM EMP;
-- EMP ���̺��� �μ���ȣ�� 20���̰� �̸��� SMITH�̸� HELLO��, �ƴϸ� WORLD�� ����ϰ� �μ���ȣ�� 20���� �ƴϸ� ETC�� ����ϼ���

-- CASE ��
-- Java: switch
/*
CASE ���� WHEN ���1 THEN ���1
         WHEN ���2 THEN ���2
         WHEN ���3 THEN ���3
         WHEN ���4 THEN ���4
         ELSE ���5
END 'COLUMN��'
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

SELECT '0' || TO_CHAR (ZIPCODE), CASE ZIPCODE WHEN 2 THEN '����'
                                              WHEN 31 THEN '���'
                                              WHEN 32 THEN '��õ'
                                              WHEN 41 THEN '����'
                                              ELSE '��Ÿ����'
                                 END "REGIONNAME"
FROM T_ZIP;

/*
������̺��� ����޿��� 1000�޷� ���ϸ� 4��   
1001 �޷� 2000�޷� ���ϸ� 3��
2001 �޷� 3000�޷� ���ϸ� 2��
3001 �޷� 4000�޷� ���ϸ� 1��
4001 �޷� �̻��̸� Ư���� �ο��ϴ� �����͸� ����ϼ���

CASE���� �������� ���� ���� ����
CASE WHEN COLUMN�� ���Ǻ� ��� THEN SAL <= 200
*/

SELECT ENAME, SAL, CASE WHEN SAL <= 1000 THEN ' 4��'
                   WHEN SAL BETWEEN 1001 AND 2000 THEN ' 3��'
                   WHEN SAL BETWEEN 2001 AND 3000 THEN ' 2��'
                   WHEN SAL BETWEEN 3001 AND 4000 THEN ' 1��'
                   ELSE ' Ư��'
               END "���"
FROM EMP;

-- ���� -> ���� -> ��¥ -> ��ȯ(TO_CHAR, TO_DATE, TO NUMBER) -> �Ϲ� �Լ� (NVL) ~ CASE ()
-- ���� �Լ�: �׷� �Լ�(MULTI ROW FUNCTION), PDF(75P)

-- ���� �Լ�
-- 1. COUNT (*), COUNT(COLUMN) >> ������ �Ǽ�
-- 2. SUM ()
-- 3. AVG ()
-- 4. MAX ()
-- 5. MIN ()
-- ���
/*
UNION: �����Ǵ� Ÿ�԰� COLUMN�� ������ ��ġ�ؾ� �Ѵ�
1. ���� �Լ��� �ݵ�� GROUP BY ���� ���� ���
2. Point: ��� ���� �Լ��� NULL���� �����Ѵ�
3. Point: SELECT���� ���� �Լ� �̿ܿ� �ٸ� COLUMN�� ���� �ݵ�� GROUP BY���� ���

*/

SELECT COUNT (*) FROM EMP; -- *: ROW�� �� COUNT
SELECT COUNT (EMPNO) FROM EMP; -- COLUMN �������� ���� COUNT
SELECT COUNT (COMM) FROM EMP; -- NULL���� ������ �������� ����

-- NULL �Ǽ�: NVL
SELECT COUNT (NVL (COMM, 0)) FROM EMP; -- NULL�� ó���� NVL �Լ�

-- �޿��� ��
SELECT SUM (SAL) AS "SUM" FROM EMP;

-- ��� �޿�(�޿��� ��/��� ��)
SELECT TRUNC ((AVG (SAL)), 0) AS "AVG" FROM EMP;

-- ����� ��: �츮 ȸ�� ������ �� �� ����(���)
SELECT SUM (COMM) AS "COMM" FROM EMP; -- 4330
-- ��� ����
SELECT TRUNC ((AVG (COMM)), 0) AS "AVG" FROM EMP; -- 721

SELECT COMM FROM EMP;
SELECT (300 + 200 + 30 + 300 + 3500 + 0) / 6 FROM DUAL; -- 721
-- ȸ�� ����� 14���ε� 6������ ����� ���

-- 14������ ����� ���
SELECT (300 + 200 + 30 + 300 + 3500 + 0) / 14 FROM DUAL; -- 309
SELECT SUM (COMM) / 14 FROM EMP;
SELECT AVG (NVL (COMM, 0)) FROM EMP;

-- ȸ�簡 �����ϴ� ��Ģ�� ���� ����ϱ� ������ 6��, 14�� �� �� �´� ���
-- ȸ�����: ��ü ��� ��: 309
-- ȸ�����: �޴� ��� ��: 721

SELECT COUNT (COMM) FROM EMP
WHERE COMM IS NOT NULL;
SELECT COUNT (COMM) FROM EMP; -- ������ NULL���� �������� ���ϱ� ������ NULL�� ������ �ʿ����

SELECT MAX (SAL) FROM EMP;
SELECT MIN (SAL) FROM EMP;

-- Point: ���� �Լ��� RETURN�ϴ� ���� 1��(1���� ROW�� ����� �� ������ ����)
SELECT SUM (SAL), AVG (SAL), MAX (SAL), MIN (SAL), COUNT (SAL), COUNT (*) FROM EMP;

-- �μ��� ��� �޿��� ���ϼ���
-- SELECT���� ���� �Լ� �̿ܿ� COLUMN�� ���� �� COLUMN�� GROUP BY���� ��õǾ�� �Ѵ�
SELECT DEPTNO, AVG (SAL)
FROM EMP
GROUP BY DEPTNO;

SELECT AVG (SAL) FROM EMP GROUP BY DEPTNO; -- ������ ���������� �����Ͱ� �ǹ��ϴ� ���� �� �� ����

-- ������ ��� �޿�, �޿��� ��, �ִ� �޿�, �ּ� �޿�, �Ǽ��� ����ϼ���
SELECT JOB, AVG (SAL) AS "��ձ޿�", SUM (SAL) AS "�޿�����", MAX (SAL) AS "�ִ�޿�", MIN (SAL) AS "�ּұ޿�", COUNT (SAL) AS "�Ǽ�"
FROM EMP
GROUP BY JOB;

/*
GROUPING ����(COLUMN ���� �߿�)
DISTINCT COLUMN��1, COLUMN��2

ORDER BY COLUMN ASC, COLUMN DESC

GROUP BY COLUMN��1, COLUMN��2
*/

-- �μ���, ������ �޿��� ���� ���ϼ���
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

-- ������ ��� �޿��� 3,000�޷� �̻��� ����� ������ ��� �޿��� ����ϼ���
SELECT JOB, AVG (SAL) AS "��ձ޿�"
FROM EMP
WHERE 
GROUP BY JOB, AVG (SAL);
-- ��� �޿� >= 3000: ��� �޿��� ���� �������� �ϰ� �� ������ GROUP BY�� ������� �� ���´�
-- WHERE�������� ��� �޿� �����͸� ����� �� ����(GROUP BY���� ���� ������ �����̱� ������)
-- GROUP BY ����� ������ �Ŵ� ��: HAVING
-- FROM���� ������: WHERE
-- GROUP BY���� ������: HAVING
SELECT JOB, AVG (SAL) -- AS "��ձ޿�"(HAVING�� ������ AS "" �Ұ�) -- 4
FROM EMP -- 1
GROUP BY JOB -- 2
HAVING AVG (SAL) >= 3000; -- 3

/*
1���� ���̺��� �����͸� ��ȸ�� �� �ִ� ���
SELECT 5
FROM 1
WHERE 2
GROUP BY 3
HAVING 4
ORDER BY 6
*/

/*
������̺��� ������ �޿����� ����ϵ� ������ ���� �ް� �޿��� ���� 5000 �̻��� ������� ����� ����ϼ���
--�޿��� ���� ���� ������ ����ϼ���
*/
SELECT JOB, SUM (SAL) AS "SUMSAL"
FROM EMP
WHERE COMM IS NOT NULL
GROUP BY JOB
HAVING SUM (SAL) >= 5000
ORDER BY SUM (SAL) DESC;

/*
������̺��� �μ� �ο��� 4���� ���� �μ��� �μ���ȣ ,�ο��� , �޿��� ���� ����ϼ���
*/
SELECT DEPTNO, COUNT (*) AS "�μ��� �ο�", SUM (SAL) AS "�޿��� ��"
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*) > 4;

/*
������̺��� ������ �޿��� ���� 5000�� �ʰ��ϴ� ������ �޿��� ���� ����ϼ���
�� �Ǹ�����(salesman) �� �����ϰ� �޿������� �������� �����ϼ���
*/
SELECT 


/*
������̺��� ������ �޿��� ����� 1500 �̻��� ����� ����, ��� �޿�, �μ���ȣ�� ����ϼ���. 
��, 'CLERK'�� �����ϰ� ��� �޿��� �μ���ȣ�� ������������ �����ϼ���. 
*/
SELECT JOB, AVG (SAL), DEPTNO
FROM EMP
WHERE 
GROUP BY
ORDER BY
/*
������̺��� �Ի����� 82�� �����̰� �޿��� ����� 2500�̻��� ����� �Ի���, ������ �޿��� ����� ����ϼ���
*/
select hiredate, job, avg(sal) as "�޿��� ���"
from emp
where to_char(hiredate,'YY') >= '82'
group by hiredate, job
having avg(sal)>=2500;

/*
������̺��� ������ ����(�޿�*12)�� ����� 5000 �̻��� ����� ����, ������ ����� ����ϼ���. 
��, 'CLERK'�� �����ϰ� ���� ����� ������������ �����ϼ���. 
*/
SELECT JOB, AVG (SAL * 12) AS "��տ���"
FROM EMP
WHERE JOB != 'CLERK'
GROUP BY JOB
HAVING AVG (SAL * 12) >= 5000
ORDER BY "��տ���" ASC;

/* 1
������̺��� ������ �޿��� ���� 2000 �̻�5000 ������ ������ �޿��� ����� �ݿø��ؼ� ������ ����ϼ���
��, ���� 'PRESIDENT'�� �����ϰ� �޿� ������� �ø����� �����ϼ���
*/
SELECT JOB, SUM (SAL) AS "�޿�����", ROUND (AVG (SAL), 0) AS "��ձ޿�"
FROM EMP
WHERE JOB != 'PRESIDENT'
GROUP BY JOB
HAVING SUM (SAL) BETWEEN 2000 AND 5000
ORDER BY "��ձ޿�";
/* 3
��� ���̺��� �̸��� M Ȥ�� A�� �����ϴ� ����� ����, ��� �޿��� ����ϼ���
�� Ŀ�̼��� ���� �ƴ� ��� �߿���.
*/
SELECT JOB, AVG (SAL) AS "��ձ޿�"
FROM EMP
WHERE (ENAME LIKE 'M%' or ENAME LIKE 'A%') AND COMM IS NOT NULL
GROUP BY JOB;
/* 2
������ �ȹ޴� �������� �μ���, ������ �޿��� ������ 1000�̻��� �μ��� ������ �μ���ȣ�� ����, �ѱ޿��� �μ���ȣ�� ������������, �ѱ޿��� ���� ������ ����Ͻÿ�
*/
select deptno,job,sum(sal)
from emp
where comm is null
group by deptno,job
having sum(sal)>=1000
order by deptno desc,sum(sal) desc;

-- ���ݱ��� SELECT ����� �ϳ��� ���̺�
-- RDBMS(�ּ� �ϳ� �̻��� ���̺�� �̷����)

-- Java: class �۾�: ����(���, ����, ����...)
-- DB: TABLE TABLE������ ���踦 ������ �ִ�
-- 1:1, 1:N, N:N ����
-- ���� ���ϴ� �����Ͱ� �ϳ��� ���̺� �ִ� ���� �ƴ϶� �� �� �̻��� ���̺� ������ �ִ�
-- �������� ���̺��� ���ϴ� �����͸� ����ϴ� ���: JOIN
-- SELECT�� ������ ���� ���̺��� ������ ������ �������� ���� ���� ��� ����� ������, �������� ���� ������ ���� ��쿡�� ���̺��� �����ϴ� ���� ����
-- ��Ģ: ���̺��� �ɰ� �� �ִ� ��� �ɰ��� �����Ѵ�(�ɰ��� ��: ����ȭ: ��1����ȭ, ��2����ȭ... , ������ȭ)
-- EMP ���̺��� DEPT COLUMN�� DEPT ���̺��� DEPTNO COLUMN �����͸� �����Ѵ�: ������ ��, NULL�� �Ұ�
-- �����̸Ӹ�Ƽ ��������Ʈ: ����(������ ���ϴ� ���̺�)
-- DEPT ���̺��� DEPTNO ������ ����� �����ϴ� ����: ����Ű(�ܷ�Ű): ������ �ϴ� ���̺�

-- ����
-- 1. �����(EQUI JOIN): 70%
-- �����̺�� ������� ���̺� �ִ� COLUMN�� ������ 1:1 ����
-- ANSI����(ǥ�ع���)
-- ����: JOIN ON-������, [INNER]JOIN ON-������(INNER ���� ���� ����)

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
-- NULL�� JOIN ������ ����� �ƴ�

SELECT M.M1, S.S2
FROM M, S
WHERE M.M1 = S.S1;

SELECT EMP.EMPNO, EMP.ENAME, EMP.DEPTNO, DEPT.DNAME
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;
-- (���� �ʴ�): ��������

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
FROM EMP E JOIN DEPT D -- ���̺� ����Ī�� �ο��Ͽ� ���(ANSI����)
ON E.DEPTNO = D.DEPTNO;

----------------------------------------------------
-- SQL JOIN����: � ���� FROM���� �����̰� � ���� JOIN�� �������� �Ǵ��� ��ƴ�
SELECT *
FROM M, S
WHERE M.M1 = S.S1 AND M.M1 = 'A';

SELECT *
FROM M JOIN S
ON M.M1 = S.S1
WHERE M.M1 = 'A'; -- ANSI����: �������

SELECT *
FROM S JOIN X
ON S.S1 = X.X1;

-- M.M1 = S.S1 AND S.S1 = X.X1
-- �� �� �̻��� ���̺��� JOIN
-- Oracle sql JOIN����
SELECT *
FROM M, S, X
WHERE M.M1 = S.S1 AND S.S1 = X.X1;

-- ANSI����
SELECT M.M1, M.M2, S.S2, X.X2
FROM M JOIN S ON M.M1 = S.S1
       JOIN X ON S.S1 = X.X1;
    -- JOIN Y ON
    -- JOIN Z ON
    
-- ���, �̸�, �μ���ȣ, �μ���, �޿�, �޿������ ����ϼ���
DESC DEPT;
DESC EMP;
DESC SALGRADE;

SELECT *
FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
           JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

SELECT E.EMPNO, E.ENAME, E.DEPTNO, E.SAL, D.DNAME, S.GRADE
FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
           JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL -- ������
ORDER BY E.EMPNO;

-- 1. HR �������� �̵�
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM LOCATIONS;

-- 1. ���, �̸�(LAST_NAME), �μ���ȣ, �μ��̸��� ����ϼ���
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY E.EMPLOYEE_ID;
-- ������: ����� ���� 107���ε� ���� ��µ� ����� 106��(������ ����): NULL(JOIN�� NULL�� ó������ �ʴ´�)
-- ��������δ� �� ������ �ذ��� �� ���� >> �ذ�: OUTER JOIN

-- 2. ���, �̸�, �μ���ȣ, �μ��̸�, ���ø��� ����ϼ���
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME, D.LOCATION_ID, L.CITY
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
                 JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID;

SELECT * FROM TABS; -- ������ ������ ������ �ִ� ���̺� ���
SELECT * FROM COLS;
-- 2. ������(NON-EQUI JOIN): �ǹ̸� ����: ������ �����
-- �����̺�� ������� ���̺� �ִ� COLUMN�� 1:1 ���ε��� �ʴ� ���
-- EMP, SALGRADE: SAL COLUMN�� ������... 2���� COLUMN(LOSAL, HISAL)

-- ��(1:1 ���εǴ� COLUMN�� �����)
SELECT * FROM EMP;
SELECT * FROM SALGRADE;

SELECT E.EMPNO, E.ENAME, E.DEPTNO, E.SAL, D.DNAME, S.GRADE
FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
           JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL -- ������
ORDER BY E.EMPNO;

-- 3. �ܺ�����(OUTER JOIN): NULL�� ������ >> EQUI JOIN NULL ó���� �� �ſ�
-- OUTER JOIN(�� ���� ���̺��� ��, �� ���� �ľ�)
-- ����
-- LEFT OUTER JOIN: ������ ��, �������� ��
-- RIGHT OUTER JOIN: �������� ��, ������ ��
-- FULL OUTER JOIN(LEFT, RIGHT >> UNION)

-- OUTER JOIN: ���������� ������� ���� �����ϰ� ��, �� ���踦 �ľ��ϰ�
-- ������ �Ǵ� ���̺� �����ִ� �����͸� �������� ���

SELECT *
FROM M JOIN S
ON M.M1 = S.S1;

SELECT *
FROM M LEFT OUTER JOIN S
ON M.M1 = S.S1;

-- ����: HR
-- 1. ���, �̸�(LAST_NAME), �μ���ȣ, �μ��̸��� ����ϼ���
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY E.EMPLOYEE_ID;

SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID IS NULL;
-- Grant�� �μ� NULL���̶� 107���� ����� ��µǱ⸦ ���Ѵ�
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY E.EMPLOYEE_ID;

-- 2. ���, �̸�, �μ���ȣ, �μ��̸�, ���ø��� ����ϼ���
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME, D.LOCATION_ID, L.CITY
FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
                 LEFT OUTER JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID;

SELECT *
FROM M FULL OUTER JOIN S
ON M.M1 = S.S1;

-- 4. SELF JOIN(�ڱ�����): ���̺� �ȿ��� COLUMN�� �ٸ� COLUMN�� �����ϴ� ���(�ǹ̸� ����): ������ �����
-- EMP ���̺��� SMITH ����� ������ �̸��� �����Դϱ�
-- �ϳ��� ���̺��� � COLUMN�� �ٸ� COLUMN�� �����ϴ� ��쿡 ����ϴ� ���
SELECT * FROM EMP;

SELECT E.EMPNO, E.ENAME, M.EMPNO, M.ENAME
FROM EMP E JOIN EMP M
ON E.MGR = M.EMPNO; -- �����Ͱ� ���ٸ� COLUMN������� ���� �ʾƵ� �ȴ�

SELECT E.EMPNO, E.ENAME, M.EMPNO, M.ENAME
FROM EMP E LEFT OUTER JOIN EMP M
ON E.MGR = M.EMPNO;

-- 1. ������� �̸�, �μ���ȣ, �μ��̸��� ����϶�.
SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO;
 
-- 2. DALLAS���� �ٹ��ϴ� ����� �̸�, ����, �μ���ȣ, �μ��̸���
-- ����϶�.
SELECT E.ENAME, E.JOB, E.DEPTNO, D.DNAME
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE D.LOC = 'DALLAS';

SELECT E.ENAME, E.JOB, D.DEPTNO, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO 
WHERE  D.LOC='DALLAS';

-- 3. �̸��� 'A'�� ���� ������� �̸��� �μ��̸��� ����϶�.
SELECT E.ENAME, D.DNAME
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE ENAME LIKE '%A%';

SELECT E.ENAME, D.DNAME
FROM EMP E  join DEPT D  on D.DEPTNO=E.DEPTNO
WHERE  E.ENAME LIKE '%A%';

-- 4. ����̸��� �� ����� ���� �μ��� �μ���, �׸��� ������
--����ϴµ� ������ 3000�̻��� ����� ����϶�.
SELECT E.ENAME, D.DNAME, E.SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE SAL >= 3000;

SELECT E.ENAME, D.DNAME, E.SAL ,D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE E.SAL>=3000;

-- 5. ����(����)�� 'SALESMAN'�� ������� ������ �� ����̸�, �׸���
-- �� ����� ���� �μ� �̸��� ����϶�.
SELECT E.JOB, E.ENAME, D.DNAME
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE JOB = 'SALESMAN';

SELECT E.JOB, E.ENAME, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE E.JOB='SALESMAN';

-- 6. Ŀ�̼��� å���� ������� �����ȣ, �̸�, ����, ����+Ŀ�̼�,
-- �޿������ ����ϵ�, ������ �÷����� '�����ȣ', '����̸�',
-- '����','�Ǳ޿�', '�޿����'���� �Ͽ� ����϶�.
--(�� ) 1 : 1 ���� ��� �÷��� ����
SELECT E.EMPNO AS "�����ȣ", E.ENAME AS "����̸�", E.SAL * 12 AS "����", (E.SAL * 12) + E.COMM AS "�Ǳ޿�", S.GRADE AS "�޿����"
FROM EMP E JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE COMM IS NOT NULL;

SELECT E.EMPNO AS "�����ȣ",
               E.ENAME AS "����̸�",
               E.SAL*12 AS "����",
           --E.SAL*12+NVL(COMM,0) AS "�Ǳ޿�",
               E.SAL*12+COMM AS "�Ǳ޿�",
               S.GRADE AS "�޿����"
FROM EMP E  join SALGRADE S on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.Comm is not null;

-- 7. �μ���ȣ�� 10���� ������� �μ���ȣ, �μ��̸�, ����̸�,
-- ����, �޿������ ����϶�.
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL, S.GRADE
FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
           JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.DEPTNO = 10;

SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL, S.GRADE
FROM EMP E   join DEPT D on E.DEPTNO=D.DEPTNO
                         join SALGRADE S on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.DEPTNO=10;
 
SELECT * FROM SALGRADE;

-- 8. �μ���ȣ�� 10��, 20���� ������� �μ���ȣ, �μ��̸�,
-- ����̸�, ����, �޿������ ����϶�. �׸��� �� ��µ�
-- ������� �μ���ȣ�� ���� ������, ������ ���� ������
-- �����϶�.
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

-- 9. �����ȣ�� ����̸�, �׸��� �� ����� �����ϴ� ��������
-- �����ȣ�� ����̸��� ����ϵ� ������ �÷����� '�����ȣ',
-- '����̸�', '�����ڹ�ȣ', '�������̸�'���� �Ͽ� ����϶�.
--SELF JOIN (�ڱ� �ڽ����̺��� �÷��� ���� �ϴ� ���)
SELECT E.EMPNO AS "�����ȣ", E.ENAME AS "����̸�", D.EMPNO AS "�����ڹ�ȣ", D.ENAME AS "�������̸�"
FROM EMP E LEFT OUTER JOIN EMP D
ON E.MGR = D.EMPNO;

SELECT E.EMPNO, E.ENAME , M.EMPNO, M.ENAME
FROM EMP E  left outer join EMP M
on e.MGR = m.EMPNO;

-- �ʱް�����: �Լ�, ����
-- SUBQUERY(PDF 100P)
-- SQL ���� �ذ��

-- ��� ���̺��� ������� ��տ��޺��� �� ���� �޿��� �޴� ����� ���, �̸�, �޿��� ����ϼ���

-- SUBQUERY
SELECT AVG (SAL) FROM EMP; -- 2073
-- MAIN QUERY
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > 2073;

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT AVG (SAL) FROM EMP);
-- () �ȿ� �ִ� SUBQUERY�� ���� ����ȴ�

-- QUERY
-- ���� >> ���� ���̺��� �� �Լ��� ���� �ذ� >> ���̺��� �ϳ� �̻��̸� JOIN >> JOIN���� �ذ��� �� �Ǹ� SUBQUERY(������ ���)
select * from emp;
/*
SUBQUERY ����
1. SINGLE ROW SUBQUERY: �ϳ��� COLUMN���� ���� ����� �ϳ�¥�� ROW���(���ϰ��̶��)
SELECT SUM (SAL) FROM EMP; -- �ϳ��� COLUMN�� �ϳ��� ROW
2. MULTI ROW SUBQUERY: SUBQUERY�� ����� �ϳ� �̻��� ROW(���߰�): COLUMN �ϳ�
SELECT SAL FROM EMP; -- �ϳ��� COLUMN�� ���� ���� ROW

�����ϴ� ����: ����ϴ� �����ڰ� �ٸ���
������: ���߰�(IN, NOT IN, ANY, ALL)
-- ALL: SAL > 1000 AND SAL > 2000 AND ... �����͸� AND�� �����
-- ANY: SAL > 1000 OR SAL > 2000 OR ... �����͸� OR�� �����

���� ����
1. SUBQUERY�� () �ȿ� �־�� �Ѵ�: (SELECT SAL FROM EMP)
2. SUBQUERY�� ���� COLUMN���� �����Ǿ�� �Ѵ�: SELECT SUM (SAL), AVG (SAL) FROM EMP (X)
3. SUBQUERY�� �ܵ����� ���� �����ؾ� �Ѵ�

SUBQUERY�� ������ QUERY����
1. SUBQUERY ����
2. SUBQUERY�� ����� ������ MAIN QUERY ����
*/

-- ��� ���̺��� JONES�� �޿����� �� ���� �޿��� �޴� ����� ���, �̸�, �޿��� ����ϼ���
SELECT SAL FROM EMP WHERE ENAME = 'JONES'; -- 2975 -- SINGLE ROW
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'JONES');

SELECT *
FROM EMP
WHERE SAL = (SELECT SAL FROM EMP WHERE DEPTNO = 30);

SELECT *
FROM EMP
WHERE SAL IN (SELECT SAL FROM EMP WHERE DEPTNO = 30); -- MULTI ROW -- IN�� �����͸� OR�� Ǭ��
-- WHERE SAL = 2975 OR SAL = 3000 OR ...

SELECT *
FROM EMP
WHERE SAL NOT IN (SELECT SAL FROM EMP WHERE DEPTNO = 30);
-- WHERE SAL != 2975 AND SAL != 3000 AND ... -- NOT IN�� ������ AND�� Ǭ��

-- ���������� �ִ� ����� ����� �̸��� ����ϼ���
SELECT *
FROM EMP
WHERE EMPNO IN (SELECT MGR FROM EMP);
-- EMPNO = 7839 OR EMPNO = 7698 OR EMPNO IS NULL OR
-- NULL�� OR�� ������ ���� �ʴ´�

-- NULL���� ��� ���� ����� NULL
-- ���������� ���� ����� ����� �̸��� ����ϼ���
SELECT EMPNO, ENAME
FROM EMP
WHERE EMPNO NOT IN (SELECT NVL (MGR, 0) FROM EMP);
-- EMPNO != 7839 AND EMPNO != 7698 AND EMPNO IS NULL AND >> NULL

-- KING���� �����ϴ�(��, ���ӻ���� KING) ����� ���, �̸�, ����, �����ڻ���� ����ϼ���
SELECT EMPNO, ENAME, JOB, MGR
FROM EMP
WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING');

-- 20�� �μ��� ��� �߿��� ���� ���� �޿��� �޴� ������� �� ���� �޿��� �޴� ����� ���, �̸�, �޿�, �μ���ȣ�� ����ϼ���
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL > (SELECT MAX (SAL) FROM EMP WHERE DEPTNO = 20);

SELECT * FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB = 'SALESMAN')
     AND SAL IN (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN');

--1. 'SMITH'���� ������ ���� �޴� ������� �̸��� ������ ����϶�.
SELECT SAL FROM EMP WHERE ENAME = 'SMITH';
SELECT ENAME, SAL
FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'SMITH');

SELECT ENAME, SAL
FROM EMP
WHERE SAL>(SELECT SAL
               FROM EMP
               WHERE ENAME='SMITH');
 
--2. 10�� �μ��� ������ ���� ������ �޴� ������� �̸�, ����, �μ���ȣ�� ����϶�.
SELECT DEPTNO FROM EMP WHERE DEPTNO = 10;
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL IN (SELECT SAL FROM EMP WHERE DEPTNO = 10);

SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL IN(SELECT SAL
                 FROM EMP
                 WHERE DEPTNO=10);
 
--3. 'BLAKE'�� ���� �μ��� �ִ� ������� �̸��� ������� �̴µ�
-- 'BLAKE'�� ���� ����϶�.
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

--4. ��ձ޿����� ���� �޿��� �޴� ������� �����ȣ, �̸�, ������ ����ϵ�, ������ ���� ��� ������ ����϶�.
SELECT AVG (SAL) FROM EMP;
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT AVG (SAL) FROM EMP)
ORDER BY SAL DESC;
 
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL>(SELECT  AVG(SAL)  FROM EMP)
ORDER BY SAL DESC;
 
--5. �̸��� 'T'�� �����ϰ� �ִ� ������ ���� �μ����� �ٹ��ϰ� �ִ� ����� �����ȣ�� �̸��� ����϶�.
SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%T%';
SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%T%');

SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                       FROM EMP
                       WHERE ENAME LIKE '%T%');

--6. 30�� �μ��� �ִ� ����� �߿��� ���� ���� ������ �޴� ������� ���� ������ �޴� ������� �̸�, �μ���ȣ, ������ ����϶�.
--(��, ALL(and) �Ǵ� ANY(or) �����ڸ� ����� ��)
SELECT MAX (SAL) FROM EMP WHERE DEPTNO = 30;
SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE SAL > (SELECT MAX (SAL) FROM EMP WHERE DEPTNO = 30);

SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO = 30);
-- where sal > 1600 and sal > 1250 and sal > 2850 and sal > 1500 and sal > 950
-- MAX �Լ��� �𸥴� �Ͽ��� ALL �������� �ϰ� �Ǹ� �ᱹ MAX������ ����ϰ� �ȴ�

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

--7. 'DALLAS'���� �ٹ��ϰ� �ִ� ����� ���� �μ����� ���ϴ� ����� �̸�, �μ���ȣ, ������ ����϶�.
SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS';
SELECT E.ENAME, E.DEPTNO, E.JOB
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS');
-- ����Ϸ��� ������� JOIN�� ���̺��� �ʿ��� ��Ȳ�� �ƴϱ� ������ JOIN���� �� �ʿ䰡 ����

SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO    -- = �� �´µ�  IN
                      FROM DEPT
                      WHERE LOC='DALLAS');

--8. SALES �μ����� ���ϴ� ������� �μ���ȣ, �̸�, ������ ����϶�.
SELECT DNAME FROM DEPT WHERE DNAME = 'SALES';
SELECT E.DEPTNO, E.ENAME, E.JOB
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES');
-- JOIN�� 7���� ����

SELECT DEPTNO, ENAME, JOB
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                      FROM DEPT
                      WHERE DNAME='SALES');
 
--9. 'KING'���� �����ϴ� ��� ����� �̸��� �޿��� ����϶�
--king �� ����� ��� (mgr �����Ͱ� king ���)
SELECT EMPNO FROM EMP WHERE ENAME = 'KING';
SELECT ENAME, SAL
FROM EMP
WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING');

SELECT ENAME, SAL
FROM EMP
WHERE MGR=(SELECT EMPNO
                FROM EMP
                WHERE ENAME='KING');
 
--10. �ڽ��� �޿��� ��� �޿����� ����, �̸��� 'S'�� ���� ����� ������ �μ����� �ٹ��ϴ� ��� ����� �����ȣ, �̸�, �޿��� ����϶�.
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

--11. Ŀ�̼��� �޴� ����� �μ���ȣ, ������ ���� ����� �̸�, ����, �μ���ȣ�� ����϶�.
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

--12. 30�� �μ� ������ ���ް� Ŀ�̼��� ���� ���� ������� �̸�, ����, Ŀ�̼��� ����϶�.
SELECT SAL, COMM FROM EMP WHERE DEPTNO = 30;
SELECT ENAME, SAL, COMM
FROM EMP
WHERE SAL NOT IN (SELECT SAL FROM EMP WHERE DEPTNO = 30)
      AND COMM NOT IN (SELECT COMM FROM EMP WHERE DEPTNO = 30 AND COMM IS NOT NULL); -- �� OR�� �ؼ� Ʋ��
      
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

�⺻ �Լ�(���� ~ �Ϲ� �Լ�)
���� ���̺�: JOIN
SUBQUERY
++++++++
DML(INSERT, UPDATE, DELETE): �ϱ�(�ʼ�)***
*/

-- INSERT, UPDATE, DELETE
/*
DDL(������ ���Ǿ�): CREATE, ALTER, DROP, TRUNCATE, RENAME, MODIFY >> DBA
DML(������ ���۾�): INSERT, UPDATE, DELETE >> ������
DQL(������ ���Ǿ�): SELECT >> ������(�Լ�, ����, ��������)
DCL(������ �����): ����(GRANT, REVOKE) >> DBA
TCL(Ʈ�����): COMMIT, ROLLBACK, SAVEPOINT >> ������
*/

-- DML �۾�
-- Oracle ���������� Ʈ������� ����
-- Oracle (BEGIN TRAN) �ڵ�����... >> ó���ϷῩ��(ROLLBACK(���), COMMIT(�ݿ�))
-- INSERT ����
-- MS-SQL (BEGIN TRAN) �������� ����

-- TRANSACTION: �ϳ��� ������ �۾� ����
-- ����(TRANSACTION)
-- �������
-- ����(A��� ���� ���� 1000����, B��� ���� �Ա�)
-- ����(A �� ���� ~~~~~~~~~~ B ���� �Ա�) �ϳ��� ����
/*
����
  A��� ���� ���
  UPDATE ����
  SET �ܾ� = �ܾ� - ��ݾ�
  
  B��� ���� �Ա�
  UPDATE ����
  SET �ܾ� = �ܾ� + �Աݾ�
��... COMMIT

������ ���� �ʰ� ������ �ϳ��� �߻��� ��� ���� ����: ROLLBACK
*/

-- ���̺� �⺻ ����
DESC EMP;

-- Oracle(SYSTEM ���̺� �پ��� ���� ����)
SELECT * FROM TAB; -- ���Ӱ����� �ٷ� �� �ִ� ���̺� ���
SELECT * FROM TAB WHERE TNAME = 'EMP'; -- ���̺� ���� ���� Ȯ��
SELECT * FROM COL WHERE TNAME = 'EMP';
SELECT * FROM USER_TABLES; -- ������, Ʃ���ϴ� ���
SELECT * FROM USER_TABLES WHERE TABLE_NAME = 'DEPT';

-- DML(PDF 168P)
/*
INSERT INTO table_name [(column1[, column2, . . . . . ])]
VALUES (value1[, value2, . . . . . . ]);
*/

CREATE TABLE TEMP (
  ID NUMBER PRIMARY KEY,
  -- ID COLUMN�� �����ʹ� NULL���� ���� ���ϰ� �ߺ����� ���� ���ϵ��� �����ϴ� ���: ��ǥ������ PRIMARY KEY
  NAME VARCHAR2(20) -- DEFAULT NULL: NULL���� ���� �ȴ�
);

INSERT INTO TEMP (ID, NAME)
VALUES (100, 'ȫ�浿');
SELECT * FROM TEMP;
COMMIT;

-- COLUMN ����Ʈ �����ϱ�
INSERT INTO TEMP -- COLUMN ����Ʈ ����: �����Ͱ� ������� �Է�(�ǵ����̸� �������� �� ��)
VALUES (200, '������');
SELECT * FROM TEMP;
COMMIT;

-- 1.
INSERT INTO TEMP (ID, NAME)
VALUES (100, '�ƹ���'); -- unique constraint (BITUSER.SYS_C007003) violated
                       -- PRIMARY KEY ���� ����(�ߺ��� (X))
-- 2.
INSERT INTO TEMP (NAME)
VALUES ('������'); -- ORA-01400: cannot insert NULL into ("BITUSER"."TEMP"."ID")
                  -- PRIMARY KEY ���� ����(NULL�� (X))
-- ��̻��
-- SQL ����, ��� (X)
-- PL-SQL: Java ���ó�� ��� ����
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
  REGDATE DATE DEFAULT SYSDATE -- INSERT ���� �ʾƵ� �ڵ����� �ý��� ��¥ ���� �Է�
);

INSERT INTO TEMP3(MEMBERID, NAME, REGDATE)
VALUES (100, 'ȫ�浿', '2019-09-27');

COMMIT;

INSERT INTO TEMP3(MEMBERID, NAME)
VALUES (200, '������');

SELECT * FROM TEMP3;

COMMIT;

INSERT INTO TEMP3(MEMBERID)
VALUES (300);

SELECT * FROM TEMP3;

COMMIT;

-- �ɼ� TIP
-- 1. �뷮 ������ �����ϱ�(INSERT)
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

-- �䱸����: TEMP4 ���̺� �ִ� ��� �����͸� TEMP5�� ��������
-- INSERT INTO TABLE�� (COLUMN��) VALUES
-- VALUES ��ſ� SELECT ����
-- ��, COLUMN�� ������ Ÿ���� ��ġ�Ѵٸ�

INSERT INTO TEMP5 (NUM)
SELECT ID FROM TEMP4;
-- VALUES

COMMIT;

-- 2. INSERT
-- ����(CLONE) INSERT
-- ���̺��� ���� ��Ȳ���� ���̺��� �ڵ����� �ϰ� �����͵� �����ϴ� ���
-- ��, ���������� ������� �ʴ´�(PRIMARY KEY...)

-- EMP >> COPYEMP ���̺��� ����� �����͵� �Ȱ��� �ֱ�
CREATE TABLE COPYEMP
AS
  SELECT * FROM EMP;

SELECT * FROM COPYEMP;
SELECT * FROM EMP;

-- DROP TABLE TMPE2; -- ���̺� ����

CREATE TABLE COPYEMP2
AS
  SELECT EMPNO, ENAME, SAL
  FROM EMP
  WHERE DEPTNO = 30;

SELECT * FROM COPYEMP2;

-- ������ �����ϰ� �����ʹ� �������� �ʾƿ�
CREATE TABLE COPYEMP3
AS
  SELECT * FROM EMP WHERE 1 = 2; -- FALSE ������
  -- SELECT * FROM EMP WHERE 1 = 1; -- ��ŷ

SELECT * FROM COPYEMP3;

COMMIT;

-- INSERT END

-- UPDATE
/*
����
UPDATE table_name
SET column1 = value1 [,column2 = value2, . . . . . . .]
[WHERE condition];

UPDATE table_name
SET (column1, column2, . . . . ) = (SELECT column1,column2, . . . -- SET���� SUBQUERY �� �� �ִ�
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
SET SAL = (SELECT SUM (SAL) FROM EMP); -- SUBQUERY�� �� �� �ִ�

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

������: CRUD �۾�
CREATE: INSERT
READ  : SELECT
UPDATE: UPDATE
DELETE: DELETE

C U D >> TRANSACTION ���� ����(COMMIT, ROLLBACK)

-- EMP ���̺�(Oracle)
-- Java
-- ����, ����, ����, ��ü��ȸ, ������ȸ(PK(PRIMARY KEY): WHERE EMPNO = 7788)
-- Java �Լ� 5��
-- public int insertEmp(Emp emp) { insert into emp... }
-- public List<Emp> getEmpList() { select * from emp }
-- public Emp getEmpListByEmpno(int empno) { select ... where empno = 7788 }

*/

-- Oracle 11g ���� �̻���� ���� COLUMN(���� COLUMN)
-- COLUMN: ����, ����, ���� >> ��, ���
-- COLUMN: ����, ����, ����, ��, ��� >> �ڵ�ȭ

CREATE TABLE VTABLE (
  NO1 NUMBER,
  NO2 NUMBER,
  NO3 NUMBER GENERATED ALWAYS AS (NO1 + NO2) VIRTUAL
);

INSERT INTO VTABLE (NO1, NO2) VALUES (100, 200);
INSERT INTO VTABLE (NO1, NO2) VALUES (80, 50);

SELECT * FROM VTABLE;

COMMIT;

INSERT INTO VTABLE (NO1, NO2, NO3) VALUES (10, 50, 60); -- ���� COLUMN�� �����͸� ���� ���� �� ����

SELECT COLUMN_NAME, DATA_TYPE, DATA_DEFAULT
FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'VTABLE';

-- �ǹ��� ���Ǵ� ������ �ڵ�
-- ��ǰ�� ����(�԰���) �������� �б� ���(1~4�б�)
-- 20190101, 20190520
CREATE TABLE VTABLE2 (
  NO NUMBER, -- ����
  P_CODE CHAR(4), -- ��ǰ�ڵ�(A001, B002)
  P_DATE CHAR(8), -- �԰���(20190101, ��¥�� �޾� ���ڷ� �޾Ƴ����� ���߿� ���� ���ϴ�, ���ڿ� �Լ� ���)
  P_QTY NUMBER, -- ������ ����
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

-- ���̺� ���� �� �ڵ����� ���� ���� �� �ִ� ��: DEFAULT, ���� COLUMN
-- �̷� ����� �ִٴ� �� ������ ����ߴٰ� ���߿� ã�� ������ ����

-- DDL: ���̺� �ٷ��
-- PDF(138P): �� 9 �� ���̺�(TABLE) ����

-- 1. ���̺� ����
CREATE TABLE TEMP6 (
  ID NUMBER
);

-- 2. ���̺� ���� �� COLUMN ����... COLUMN�� �߰��ϴ� ���
-- ���� ���̺� ���ο� COLUMN �߰��ϱ�(�ѹ��� �ϳ���)
ALTER TABLE TEMP6
ADD ENAME VARCHAR2(20);

DESC TEMP6;

-- 3. ���� ���̺� �ִ� COLUMN�� �̸� �߸� ǥ��(ENAME >> USERNAME)
-- ���� ���̺� �ִ� ���� COLUMN�� �̸��� ����: RENAME
ALTER TABLE TEMP6
RENAME COLUMN ENAME TO USERNAME;

DESC TEMP6;

-- 4. ���� ���̺� �ִ� COLUMN�� TYPE ����
-- MODIFY
ALTER TABLE TEMP6
MODIFY USERNAME VARCHAR2(2000);

DESC TEMP6;

-- 5. ���� ���̺� �ִ� ���� COLUMN ����
ALTER TABLE TEMP6
DROP COLUMN USERNAME;

DESC TEMP6;

-- 6. DELETE: ���̺� ������ ����(WHERE ����)
-- ������: ���̺��� ó�� �����ϸ� ũ�Ⱑ ������ �����͸� ������ ���̺� ũ�⵵ ���� >> DELETE�� �ص� ũ��� �״��...
-- Ex) ó�� 1M >> 10���� >> 100M >> 10������ ������ DELETE >> ���� ���̺��� ũ�Ⱑ 101M
-- ���̺� ������ ���� �� ������ ũ�⵵ ó�� ���·�
-- TRUNCATE: ������ ����̱� ������ WHERE ������ ����� �� ����
-- Ex) ó�� 1M >> 10���� >> 100M >> 10������ ������ TRUNCATE >> ���� ���̺��� ũ�Ⱑ 1M

-- DROP TABLE TEMP6
-- DELETE, DROP ������� ������ ������ ���� �Ұ�
-- BUT Oracle ������ ����� �ִ�(��Ģ���� ����� �ƴ�)

-- ���̺� ���� �����ϱ�
-- PDF 144P
-- ������ ���Ἲ Ȯ��(�ŷ�, ���������� �������ΰ�)
-- ����(CONSTRAINT): INSERT, UPDATE ...
/*
NOT NULL(NN) ���� NULL ���� ������ �� �����ϴ�.
-- MS-SQL������ ������ �ƴ����� Oracle������ ����

UNIQUE key(UK) ���̺��� ��� ���� �����ϰ� �ϴ� ���� ���� ��(NULL �� ���): �ߺ�����
-- UNIQUE ������ NULL���� ���� �� �ִ� >> NULL���� ������ ���ϰ� �Ϸ���(NAME UNIQUE, NOT NULL)
-- COLUMN�� ������ŭ ����
-- A UNIQUE, NOT NULL
-- B UNIQUE, NOT NULL
-- C UNIQUE, NOT NULL

PRIMARY KEY(PK) �����ϰ� ���̺��� ������ �ĺ�(NOT NULL �� UNIQUE ����(�ߺ�����)�� ����)
-- NOT NULL�ϰ� UNIQUE �����ϴ� ����
-- ���̺� �� 1���� ����(���� COLUMN�� ��� �ϳ��� ����� ������ ����): ���� KEY
-- �ֹι�ȣ, �Խ��� �� ��ȣ, �й�, �ڵ�����ȣ...
-- INDEX �ڵ�����(���� �˻�)
-- Oracle: BLOCK �����͸� �����ϴ� ����(PAGE >> BLOCK)
-- WHERE BOARDID = 100

-- ��ȣ: ��ȭ��... 50�� �ֹ�... �� �� �ѳ�... ���...�� ��: ������ȣ... 
-- ��ȭå 1000��...
-- ���... ���: ī�װ� �з�... ������ �з�...
-- ������: �˻�... ��ġ...
-- �������� ����: 1���� ���ļ�(������, ������...)
-- ������ ����: �̸�, ������(2000�� ���� 3��), ����...: ã�ư� �� �ִ� �ּ� >> ���̺� COLUMN�� ������ŭ ����
-- �����Ͱ� �߰�, �����Ǵ� ��찡 �ֱ� ������ INDEX�� ������ �ʿ��ϴ�: �ֱ������� ������Ʈ >> ���(CPU, MEMORY): DBA

***FOREIGN KEY(FK) ���� ������ �� ������ �ܷ�Ű ���踦 �����ϰ� �����մϴ�.***
-- ���� ����: ���̺�� ���̺� ���� ����
-- EMP, DEPT �������� �ʿ������� ������ ����(�ǽ��� ����� ������, �����ʹ� ���࿡ ���߾� ���Ҵ�)
-- ���� �Ǿ����� ���̺� �ɾ����� ���� PRIMARY KEY >> NOT NULL, UNIQUE ����(����) >> �ŷڼ�
-- ���� �ϴ� ���̺� �ɾ����� ���� FOREIGN KEY >> ���̺�� ���̺� ���� ���� >> 1:1, 1:N, N:N

CHECK(CK) ���̾�� �ϴ� ������ ������(��κ� ���� ��Ģ�� ����)
-- ���� ���ϴ� ���� �޴� ����(Ex) GENDER COLUMN�� �����ʹ� '��', '��'�� �ްڴ�)
-- �׻� �����͸� CHECK �ϰڴ�
-- Ex) WHERE GENDER IN ('��', '��')

-- 5���� ������ ����� ����
1. ���̺��� ������ �� �ٷ� ����(CREATE TABLE ���� �ȿ���)
2. ���̺��� ���� ����(CREATE TABLE ���� ��... �ʿ��ϴٸ� ALTER TABLE ADD CONSTRAINT: �ڵ�ȭ�� ��

*/
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMP';

-- ���� ǥ���(����ǥ��): ����(X)
CREATE TABLE TEMP7 (
  -- ID NUMBER CONSTRAINT PK_TEMP7_ID PRIMARY KEY -- �����̸��������(����)
  -- PK(�����̸�)_TEMP7(���̺��)_COLUMN��
  ID NUMBER PRIMARY KEY,
  NAME VARCHAR2(20) NOT NULL,
  ADDR VARCHAR2(50)
);

-- SYS_C007008: ���������� �����̸� SYS_������ȣ(�ý���)
-- SYS_C007009
-- ���� ���ϴ� ��� �̸� ����(FULL ǥ��)
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'TEMP7'; -- TABLE�� �빮��(�ҹ��ڷ� ���� (X))
-- SELECT * FROM USER_CONSTRAINTS WHERE LOWER (TABLE_NAME) = 'temp7';

INSERT INTO TEMP7 (NAME, ADDR) VALUES ('ȫ�浿', '����� ������'); -- cannot insert NULL into ("BITUSER"."TEMP7"."ID")
INSERT INTO TEMP7 (ID, NAME, ADDR) VALUES (10, 'ȫ�浿', '����� ������');
INSERT INTO TEMP7 (ID, NAME, ADDR) VALUES (10, '������', '����� ���ϱ�'); -- unique constraint (BITUSER.SYS_C007009) violated

-- PRIMARY KEY(WHERE ID ���� ���): PK ������ �ɸ� �� COLUMN�� ���� �ڵ����� INDEX �˻� �ӵ� ���
SELECT * FROM TEMP7 WHERE ID = 10;

COMMIT;

-- ���� ǥ��
CREATE TABLE TEMP8 (
  ID NUMBER CONSTRAINT PK_TEMP8_ID PRIMARY KEY,
  NAME VARCHAR2(20) NOT NULL, -- NOT NULL�� ���� �̸� �� �־��ش�
  JUMIN CHAR(6) CONSTRAINT UK_TEMP8_JUMIN UNIQUE, -- NOT NULL�� ������� �ʾұ� ������ NULL�� �ߺ� ����
  -- JUMIN CHAR(6) NOT NULL CONSTRAINT UK_TEMP8_JUMIN UNIQUE, -- UNIQUE + NOT NULL
  ADDR VARCHAR2(20)
);

SELECT * FROM USER_INDEXES WHERE TABLE_NAME = 'TEMP8';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'TEMP8';

INSERT INTO TEMP8 (ID, NAME, JUMIN, ADDR)
VALUES (10, 'ȫ�浿', '123456', '�����');

SELECT * FROM TEMP8;
COMMIT;

INSERT INTO TEMP8 (ID, NAME, JUMIN, ADDR)
VALUES (10, 'A', '456789', '�����');
-- unique constraint (BITUSER.PK_TEMP8_ID) violated -- PK UNIQUE ����
INSERT INTO TEMP8 (NAME, JUMIN, ADDR)
VALUES ('A', '456789', '�����');
-- cannot insert NULL into ("BITUSER"."TEMP8"."ID") -- PK NOT NULL ����
INSERT INTO TEMP8 (ID, NAME, JUMIN, ADDR)
VALUES (20, '�ƹ���', '123456', '�����');
-- unique constraint (BITUSER.UK_TEMP8_JUMIN) violated -- UNIQUE ����
INSERT INTO TEMP8 (ID, NAME, ADDR)
VALUES (20, '�ƹ���', '�����'); -- NOT NULL�� ���� �ʾұ� ������ NULL ���

SELECT * FROM TEMP8;

INSERT INTO TEMP8 (ID, NAME, ADDR)
VALUES (30, '�߹�����', '�����'); -- UNIQUE ������ NULL���� �ߺ�üũ ���� �ʴ´�

SELECT * FROM TEMP8;

COMMIT;

-- ���̺� ���� �� ����ɱ�
CREATE TABLE TEMP9 (
  ID NUMBER
);

-- ���� ���̺�, �����͵� ����(10, 10) 2�� >> PRIMARY KEY (X): ���� �ɱ� �� ������ ���� �˻� >> ������ ����(�ߺ������� ����) >> PK
ALTER TABLE TEMP9
ADD CONSTRAINT PK_TEMP9_ID PRIMARY KEY (ID);

-- �� ���� COLUMN ��� �� ���� ����
-- ALTER TABLE TEMP9
-- ADD CONSTRAINT PK_TEMP9_ID PRIMARY KEY(ID, JUMIN); �ߺ�Ű(����Ű)

SELECT * FROM USER_INDEXES WHERE TABLE_NAME = 'TEMP9';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'TEMP9'; -- CONSTRAINT_TYPE = P
DESC TEMP9;

-- ENAME COLUMN �߰�
ALTER TABLE TEMP9
ADD ENAME VARCHAR2(20);

DESC TEMP9;

-- NOT NULL �߰��ϱ�
ALTER TABLE TEMP9
MODIFY (ENAME NOT NULL);

DESC TEMP9;

-- CHECK
CREATE TABLE TEMP10 (
  ID NUMBER CONSTRAINT PK_TEMP10_ID PRIMARY KEY, -- �����̸� ������ �浹
  NAME VARCHAR2(20) NOT NULL, -- NOT NULL�� ���� �̸� �� �־��ش�
  JUMIN CHAR(6) CONSTRAINT UK_TEMP10_JUMIN UNIQUE, -- NOT NULL�� ������� �ʾұ� ������ NULL�� �ߺ� ����
  -- JUMIN CHAR(6) NOT NULL CONSTRAINT UK_TEMP8_JUMIN UNIQUE, -- UNIQUE + NOT NULL
  ADDR VARCHAR2(20),
  AGE NUMBER CONSTRAINT CK_TEMP10_AGE CHECK (AGE >= 19) -- WHERE AGE >= 19, GENDER IN ('��', '��')
);

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'TEMP10';

INSERT INTO TEMP10 (ID, NAME, JUMIN, ADDR, AGE)
VALUES (100, 'ȫ�浿', '123456', '�����', 20);
SELECT * FROM TEMP10;

COMMIT;

INSERT INTO TEMP10 (ID, NAME, JUMIN, ADDR, AGE)
VALUES (200, '������', '789456', '�����', 15); -- check constraint (BITUSER.CK_TEMP10_AGE) violated

-- ���� ����***: ���̺�� ���̺� ���� ����RDB)
CREATE TABLE C_EMP
AS
  SELECT EMPNO, ENAME, DEPTNO FROM EMP WHERE 1 = 2;

CREATE TABLE C_DEPT
AS
  SELECT DEPTNO, DNAME FROM DEPT WHERE 1 = 2;

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'C_EMP';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'C_DEPT';

-- ����Ű(C_EMP (DEPTNO) COLUMN�� C_DEPT (DEPTNO) COLUMN�� �����մϴ�)
-- C_DEPT (DEPTNO) COLUMN�� C_EMP (DEPTNO) COLUMN�� ���� ���� �Ǿ����ϴ�)

-- 2) �����۾� ��(����)
ALTER TABLE C_EMP
ADD CONSTRAINT FK_C_EMP_DEPTNO FOREIGN KEY (DEPTNO) REFERENCES C_DEPT (DEPTNO);
-- no matching unique or primary key for this column-list >> �ſ��� ����
-- ���� �Ǿ����� ���̺� �ִ� COLUMN�� �ſ��� �����ؾ� �Ѵ� >> PRIMARY KEY, UNIQUE ���� ����
-- 1. PK ����
-- 2. FK ����
-- 1) ����
ALTER TABLE C_DEPT
ADD CONSTRAINT PK_C_DEPT_DEPTNO PRIMARY KEY (DEPTNO);

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'C_EMP';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'C_DEPT';

INSERT INTO C_DEPT (DEPTNO, DNAME) VALUES (100, '�λ���');
INSERT INTO C_DEPT (DEPTNO, DNAME) VALUES (200, '������');
INSERT INTO C_DEPT (DEPTNO, DNAME) VALUES (300, 'ȸ����');
COMMIT;

SELECT * FROM C_DEPT;
SELECT * FROM C_EMP;

-- ��� �Ի�(����Ű)
INSERT INTO C_EMP (EMPNO, ENAME, DEPTNO)
VALUES (1, '������', 500); -- integrity constraint (BITUSER.FK_C_EMP_DEPTNO) violated - parent key not found
-- FOREIGN KEY: ���� ������ �ִ� DEPTNO�� �ʰ� ������ �ִ� DEPTNO �߿� �ϳ��� ����
INSERT INTO C_EMP (EMPNO, ENAME)
VALUES (1, '������');
-- FOREIGN KEY: NOT NULL�� ���� ���Ѵ�
SELECT * FROM C_EMP;
-- ȸ�簡 ������ �ݵ�� �μ���ȣ�� ������ �Ѵٸ� NOT NULL�� �־���� �ϰ� �ƴ϶�� �� �־��൵ �ȴ�(ȸ�� ����)
-- ȸ�� ���Ի���� ������ �μ���ȣ�� ������: NOT NULL FOREIGN KEY
-- ȸ�� ���Ի���� �μ���ȣ�� ���� ���� �ְ� �ƴ� ���� �ִ� FOREIGN KEY

INSERT INTO C_EMP (EMPNO, ENAME, DEPTNO)
VALUES (1, '�ƹ���', 100);

SELECT * FROM C_EMP;
COMMIT;

-- �� ���� ���迡�� ��, �� ���踦 �ľ��ϸ�
-- FK C_EMP_DEPTNO ���迡�� �θ�� DEPT(PK�� ������ �ִ� ���̺��� �� ���̺�, FK�� ������ �ִ� ���̺��� �� ���̺�)
-- MASTER TABLE(��), CHILD TABLE(��)
-- ��ü���� C_EMP ���̺��� �ٽ� ���̺�������, �� ���̺��� ���迡���� �� ���̺�

SELECT * FROM C_EMP;

DELETE FROM C_DEPT WHERE DEPTNO = 200; -- ���� ����: �������� �ʾұ� ������
DELETE FROM C_DEPT WHERE DEPTNO = 100; -- integrity constraint (BITUSER.FK_C_EMP_DEPTNO) violated - child record found

-- ���� 100�� �μ���ȣ�� ����ڴ�
-- C_EMP ���̺��� 100�� �μ���ȣ�� ã�� ������ �����ϰ� C_DEPT���� 100�� �μ���ȣ�� �����

/*
column datatype [CONSTRAINT constraint_name]
  REFERENCES table_ name (column1[,column2,..] [ON DELETE CASCADE])

column datatype,
. . . . . . . ,
  [CONSTRAINT constraint_name] FOREIGN KEY (column1[,column2,..])
  REFERENCES table_name (column1[,column2,..] [ON DELETE CASCADE])

ON DELETE CASCADE: �θ� ���̺�� ������ ���� �ϰڴ�
�θ� ���̺��� ����� �ڽ� ���̺����� �����ϴ� �����͸� ���� �����(����)
DELETE FROM C_DEPT WHERE DEPTNO = 100; -- ��Ģ�� ���� �Ұ���
ON DELETE CASCADE �ɼ��� �ɷ�������
DELETE FROM C_DEPT WHERE DEPTNO = 100; ���� ����
C_EMP DEPTNO 100�� ��� ��� �����͵� ���� ����

MS-SQL���� ON DELETE CASCADE, ON UPDATE CASCADE�� ����
*/

-- DDL END --

-- DDL �������� --
/*
--�л� ���� ���̺�
--�й��� �����ʹ� �ߺ��ǰų� NULL ���� ����ϸ� �ȵȴ�
--�̸� NULL ���� ������� �ʴ´�
--����
--����
--���� ���� �÷��� ���� Ÿ���̰� NULL ���� ���
--����, ����, ������ ���� �Է����� ������  default�� 0���� ���´�
--����, ��� �÷��� �����÷�����(�����÷�) �����Ѵ�
--�а��ڵ�� �а� ���̺� �а��ڵ带 �����Ѵ�
--�й�, �̸�, ����, ����, ����, ����, ���, �а��ڵ�

--�а� ���̺�
--�а��ڵ� �����ʹ� �ߺ��ǰų� NULL ���� ����ϸ� �ȵȴ�,
--�а����� null���� ������� �ʴ´�

--�а��ڵ� , �а���

--�׸��� select �����
--�й�, �̸�, ����, ���, �а��ڵ�, �а����� ����ϼ���
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
VALUES (10, '���а�');
INSERT INTO DEPARTMENT (DEPT_CD, DEPT_NAME)
VALUES (20, '������');
INSERT INTO DEPARTMENT (DEPT_CD, DEPT_NAME)
VALUES (30, '������');

INSERT INTO STUDENT (STD_ID, STD_NAME, KOREAN, ENGLISH, MATH, DEPT_CD)
VALUES ('10_123', '����ȣ', 100, 100, 100, 10);
INSERT INTO STUDENT (STD_ID, STD_NAME, KOREAN, ENGLISH, MATH, DEPT_CD)
VALUES ('20_234', '������', 90, 80, 85, 20);
INSERT INTO STUDENT (STD_ID, STD_NAME, KOREAN, ENGLISH, MATH, DEPT_CD)
VALUES ('30_345', '������', 95, 100, 85, 30);
INSERT INTO STUDENT (STD_ID, STD_NAME, KOREAN, ENGLISH, MATH, DEPT_CD)
VALUES ('10_567', '������', 90, 90, 80, 10);
INSERT INTO STUDENT (STD_ID, STD_NAME, KOREAN, ENGLISH, MATH, DEPT_CD)
VALUES ('20_789', '������', 80, 80, 90, 20);

SELECT S.STD_ID AS "�й�", S.STD_NAME AS "�л��̸�", S.SUM AS "����", S.AVG AS "���", S.DEPT_CD AS "�а��ڵ�", D.DEPT_NAME AS "�а��̸�"
FROM STUDENT S JOIN DEPARTMENT D
ON S.DEPT_CD = D.DEPT_CD;

DROP TABLE STUDENT; -- ���̺� ����

COMMIT;

-- VIEW: ���� ���̺�
-- PDF 192P
-- ���� ���̺�: ������(X), ��� �޸𸮿�...
-- VIEW ��ü��� ǥ���Ѵ�
-- CREATE VIEW ���̸� AS (VIEW�� ���� ���(SELECT ����))
-- VIEW�� ���̺�ó�� ��� ����(���� ���̺�: ���� ���̺�(EX) EMP, DEPT)�� ������ ����)
-- VIEW�� �޸𸮿��� �����ϴ� ���� ���̺�(SUBQUERY >> IN LINE VIEW >> ���� ���̺�ó��(��� ���))
-- VIEW: SQL ���� ���

-- ����
-- �Ϲ� ���̺�� �����ϰ� ���: FROM �� WHERE ��
-- DML�� ���������� VIEW�� ���� �������� ���̺� �����Ͽ� INSERT, UPDATE, DELETE �ϴ� ���� �����ϵ��� ����
-- VIEW�� ����
-- �������� ����(JOIN, SUBQUERY): ������ ����
-- ������ ������ �ܼ��ϰ�
-- ����: ���� ���� ó��

CREATE VIEW V_001
AS
  SELECT EMPNO, ENAME FROM EMP;

SELECT * FROM V_001; -- �����δ� VIEW�� ������ �ִ� SQL ������ ����

-- VIEW�� �� �� �ִ� �����Ϳ� ���ؼ� DML ����, ������ ����
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

-- �ڱ� �μ��� ��� ���޺��� �� ���� ������ �޴� ����� ���, �̸�, �μ���ȣ, �μ��� ��� ������ ����ϼ���
-- ���࿡ �μ��� ��� ������ ������ �ִ� ���̺��� �ִٸ�
-- IN LINE VIEW
SELECT E.EMPNO, E.ENAME, E.DEPTNO, E.SAL, TRUNC((S.AVGSAL), 0)
FROM EMP E JOIN V_003 S
ON E.DEPTNO = S.DEPTNO
WHERE E.SAL > S.AVGSAL;

SELECT E.EMPNO, E.ENAME, E.DEPTNO, E.SAL, TRUNC(S.AVGSAL)
FROM EMP E JOIN (SELECT DEPTNO, AVG(SAL) AS AVGSAL FROM EMP GROUP BY DEPTNO) S
ON E.DEPTNO = S.DEPTNO
WHERE E.SAL > S.AVGSAL;

-- JOIN ó��: ���� ���ϴ� ���� ���̺�� �����Ѵٸ� >> VIEW

/*
CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW view_name [(alias[,alias,...])]
AS Subquery
[WITH CHECK OPTION [CONSTRAINT constraint ]]
[WITH READ ONLY]

OR REPLACE �̹� �����Ѵٸ� �ٽ� �����Ѵ�.

FORCE Base Table ������ ������� VIEW �� �����.
NOFORCE �⺻ ���̺��� ������ ��쿡�� VIEW �� �����Ѵ�.

view_name VIEW �� �̸�
Alias Subquery �� ���� ���õ� ���� ���� Column ���� �ȴ�.
Subquery SELECT ������ ����Ѵ�.
WITH CHECK OPTION VIEW �� ���� �׼��� �� �� �ִ� �ุ�� �Է�,���ŵ� �� �ִ�.
Constraint CHECK OPTON ���� ���ǿ� ���� ������ �̸��̴�.
WITH READ ONLY �� VIEW ���� DML �� ����� �� ���� �Ѵ�.
*/
-- ������ ���� VIEW ����
-- CREATE OR REPLACE VIEW�̸�: OVERWRITE

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

SELECT * FROM V_EMP WHERE DEPTNO = 10; -- V_EMP�� �� �� �ִ� �����ʹ� DEPTNO = 20

-- VIEW: ���� ���̺� >> DML(INSERT, UPDATE, DELTE)
-- VIEW�� ���ؼ� �ٶ� �� �ִ� �����Ϳ� ���ؼ��� ����
-- DML�� ���� ���̺�� �۾��� ����

SELECT * FROM V_EMP;

DELETE FROM V_EMP; -- ������ VIEW�� ������ �ִ� ���̺� ������ ����

SELECT * FROM EMP WHERE DEPTNO = 20;
ROLLBACK;

UPDATE V_EMP
SET ENAME = 'AAA'
WHERE DEPTNO = 30;
-- VIEW�� �� �� �ִ� �����ʹ� DEPTNO = 20, DEPTNO = 30�� VIEW�� �� �� ����

--1. 30�� �μ� ������� ����, �̸�, ������ ��� VIEW�� ������.
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

--2. 30�� �μ� �������  ����, �̸�, ������ ��� VIEW�� ����µ�,
-- ������ �÷����� ����, ����̸�, �������� ALIAS�� �ְ� ������
-- 300���� ���� ����鸸 �����ϵ��� �϶�.
-- create or replace view view001 (�÷���, �÷���, .....)  
CREATE VIEW V_005
AS
  SELECT JOB AS "����", ENAME AS "����̸�", SAL AS "����"
  FROM EMP
  WHERE SAL > 300;

SELECT * FROM V_005;

CREATE OR REPLACE VIEW  VIEW101 (����, ����̸�, ����) -- ALIAS ���� �ٸ� ���
AS
 SELECT JOB , ENAME , SAL
 FROM EMP
 WHERE DEPTNO=30 AND SAL > 300
 
SELECT * FROM VIEW101

--3. �μ��� �ִ����, �ּҿ���, ��տ����� ��� VIEW�� ������.
CREATE OR REPLACE VIEW V_006
AS
  SELECT DEPTNO AS "�μ���ȣ", MAX (SAL) AS "�ִ����", MIN (SAL) AS "�ּҿ���", ROUND (AVG (SAL), 0) AS "��տ���"
  FROM EMP
  GROUP BY DEPTNO;

SELECT * FROM V_006;

CREATE OR REPLACE VIEW  VIEW102
AS
 SELECT DEPTNO, MAX(SAL) AS "�ִ����", -- ALIAS �� ���̸� VIEW�� �� �������(VIEW�� ���̺��̱� ������ COLUMN �̸��� �ʿ�)
  MIN(SAL) AS "�ּҿ���",
  AVG(SAL) AS "��տ���"
 FROM EMP
 GROUP BY DEPTNO

SELECT * FROM VIEW102;

--4. �μ��� ��տ����� ��� VIEW�� �����, ��տ����� 2000 �̻��� �μ��� ����ϵ��� �϶�.
CREATE OR REPLACE VIEW V_007
AS
  SELECT ROUND (AVG (SAL), 0) "��տ���"
  FROM EMP
  GROUP BY DEPTNO
  HAVING AVG (SAL) >= 2000;

SELECT * FROM V_007;

CREATE OR REPLACE VIEW VIEW103
AS
 SELECT DEPTNO, AVG(SAL) AS "��տ���"
 FROM EMP
 GROUP BY DEPTNO
 HAVING AVG(SAL) >=2000;
 
----------------------------------------
SELECT v.deptno,v.��տ��� , d.dname
FROM view103 v JOIN dept d
ON v.deptno = d.deptno;
-----------------------------------------

--5. ������ �ѿ����� ��� VIEW�� �����, ������ MANAGER�� ������� �����ϰ� �ѿ����� 3000�̻��� ������ ����ϵ��� �϶�.
CREATE OR REPLACE VIEW V_008
AS
  SELECT JOB, SUM (SAL) AS "�ѿ���"
  FROM EMP
  WHERE JOB != 'MANAGER'
  GROUP BY JOB
  HAVING SUM (SAL) >= 3000;

SELECT * FROM V_008;

CREATE OR REPLACE VIEW VIEW104
AS
 SELECT JOB, SUM(SAL) AS "�ѿ���"
 FROM EMP
 WHERE JOB!='MANAGER'
 GROUP BY JOB
 HAVING SUM(SAL)>=3000;
 
SELECT * FROM VIEW104;


-------------------------------------------------------------------------
--�� 11�� SEQUENCE pdf 185page
--������ ��ü
--���� ���� (ä����) -> �ڵ����� ��ȣ�� �����ؼ� �����ϴ� ��ü

/*
CREATE  SEQUENCE  sequence_name  
[INCREMENT  BY  n]  
[START  WITH  n]  
[{MAXVALUE n | NOMAXVALUE}]  
[{MINVALUE n | NOMINVALUE}]  
[{CYCLE | NOCYCLE}]  
[{CACHE | NOCACHE}];

sequence_name  SEQUENCE �� �̸��Դϴ�. 

INCREMENT  BY  n ���� ���� n ���� SEQUENCE ��ȣ ������ ������ ����. �� ���� �����Ǹ� SEQUENCE �� 1 �� ����.
                 
START  WITH  n  �����ϱ� ���� ù��° SEQUENCE �� ����. �� ���� �����Ǹ� SEQUENCE �� 1 �� ����. 
                      
MAXVALUE n  SEQUENCE �� ������ �� �ִ� �ִ� ���� ����. 

NOMAXVALUE   ���������� 10^27 �ִ밪�� ����������-1 �� �ּҰ��� ����. 

MINVALUE n  �ּ� SEQUENCE ���� ����. 

NOMINVALUE  ���������� 1 �� ����������-(10^26)�� �ּҰ��� ����. 

CYCLE | NOCYCLE  �ִ� �Ǵ� �ּҰ��� ������ �Ŀ� ��� ���� ������ ���� ���θ� ����. NOCYCLE �� ����Ʈ. 

CACHE | NOCACHE  �󸶳� ���� ���� �޸𸮿� ����Ŭ ������ �̸� �Ҵ��ϰ� ���� �ϴ°��� ����. ����Ʈ�� ����Ŭ ������ 20 �� CACHE. 
 
*/

--�Խ���
/*
create table board(
  boardid number primary key,
  title varchar2(50)
);

boardid �� ��ȣ�� >> �ߺ���, null (X)
���� �Ǽ� ���� �����͸� ���� �� ������?

where boardid = `0 -> �ϳ��� row return �ϴ� ���� ����

Q) insert into board _ boardid 1,
   insert into board _ boardid 2,
   insert into board _ boardid 3,

*/

CREATE TABLE KBOARD (
  NUM NUMBER CONSTRAINT PK_KBOARD_NUM PRIMARY KEY,
  TITLE VARCHAR2(50)
);

--ó�� ��
--num = 1
--���� ��
--num = 2

-- ��� 1.
INSERT INTO KBOARD (NUM, TITLE)
VALUES ((SELECT NVL (MAX (NUM), 0) + 1 FROM KBOARD), 'ó��'); -- MAX �ʱⰪ�� 0�̱� ������ NULL �� ������ ���� NVL
INSERT INTO KBOARD (NUM, TITLE)
VALUES ((SELECT NVL (MAX (NUM), 0) + 1 FROM KBOARD), '�ι�');
INSERT INTO KBOARD (NUM, TITLE)
VALUES ((SELECT NVL (MAX (NUM), 0) + 1 FROM KBOARD), '����');
SELECT * FROM KBOARD;
-- �� ����� ������ ���
DELETE KBOARD WHERE NUM = 1;
INSERT INTO KBOARD (NUM, TITLE)
VALUES ((SELECT NVL (MAX (NUM), 0) + 1 FROM KBOARD), '�׹�');

-- ��� 2.
CREATE TABLE TBOARD (
  num number constraint PK_TBOARD_NUM primary key,
  title varchar2(50)
);
INSERT INTO TBOARD (NUM, TITLE)
VALUES ((SELECT COUNT (NUM) + 1 FROM TBOARD), 'ó��');
INSERT INTO TBOARD (NUM, TITLE)
VALUES ((SELECT COUNT (NUM) + 1 FROM TBOARD), '�ι�');
INSERT INTO TBOARD (NUM, TITLE)
VALUES ((SELECT COUNT (NUM) + 1 FROM TBOARD), '����');

SELECT * FROM TBOARD;

COMMIT;
-- ������
DELETE FROM TBOARD WHERE NUM = 1;
INSERT INTO TBOARD (NUM, TITLE)
VALUES ((SELECT COUNT (NUM) + 1 FROM TBOARD), '�׹�'); -- unique constraint (BITUSER.PK_TBOARD_NUM) violated
-- ������ DELETE �� INSERT�� �ϰ� �Ǹ� ������ȣ�� �浹

-- ��ȣ�� �����ؼ� �ߺ����� ������ �ʰ� �������� �� ����
CREATE SEQUENCE SEQ_NUM; -- Oracle ������ ���
-- �ʱⰪ 1, MAX ���� ����, INCREMENT 1
-- ���� ������ �ִ� ������ ��ü Ȯ��
SELECT * FROM USER_SEQUENCES;

/*
 NEXTVAL �� CURRVAL �ǻ翭
��) Ư¡
1) NEXTVAL �� ���� ��� ������ SEQUENCE ���� ��ȯ �Ѵ�.
2) SEQUENCE �� ������ �� ����, �ٸ� ����ڿ��� ������ ������ ���� ��ȯ�Ѵ�.
3) CURRVAL �� ���� SEQUENCE ���� ��´�.
4) CURRVAL �� �����Ǳ� ���� NEXTVAL �� ���Ǿ�� �Ѵ�.
*/

-- ��ȣ �����ϱ�
SELECT SEQ_NUM.NEXTVAL FROM DUAL; -- ��ȣ����: ä����
-- ���� Ȯ���ϱ�
SELECT SEQ_NUM.CURRVAL FROM DUAL; -- ���������� ����� ����
SELECT SEQ_NUM.CURRVAL + 1 AS "���� ��ȣ" FROM DUAL; -- �� �޸�

CREATE TABLE SBOARD (
  NUM NUMBER CONSTRAINT PK_SBOARD_NUM PRIMARY KEY,
  TITLE VARCHAR2(50)
);

INSERT INTO SBOARD (NUM, TITLE)
VALUES (SEQ_NUM.NEXTVAL, 'ó����');
INSERT INTO SBOARD (NUM, TITLE)
VALUES (SEQ_NUM.NEXTVAL, '�ι�');
INSERT INTO SBOARD (NUM, TITLE)
VALUES (SEQ_NUM.NEXTVAL, '����');

DELETE SBOARD WHERE NUM = 9;

INSERT INTO SBOARD (NUM, TITLE)
VALUES (SEQ_NUM.NEXTVAL, '�׹�');

SELECT * FROM SBOARD;

ROLLBACK; -- ROLLBACK �� INSERT�� �Ͽ��� NEXTVAL�� �̾�����

COMMIT;

/*
�ǻ� �÷�(Pseudo-column)�� ���̺��� �÷�ó�� ���������� 
������ ���̺� ������� �ʴ� �÷��� �ǹ��Ѵ�.
SELECT �������� �ǻ��÷��� ����� �� ������, DML ���忡���� �� �� ����.
���������� ����ϴ� NEXTVAL�̳� CURRVAL �� �ǻ� �÷��� �����̸�, 
��ǥ���� ���� ROWNUM�̴�.
*/
-- �Խ��� 10��
-- �����Խ���, �����Խ���, ��������
-- 3�� �Խ����� �۹�ȣ�� ���� �����ϰ� �ʹ�
-- SEQUENCE 3��
-- 1. Q_NUM
-- 2. F_NUM
-- 3. N_NUM

-- �Խ��� 10��
-- �����Խ���, �����Խ���, ���������� �ϳ��� �۹�ȣ�� ����
-- SEQUENCE 1��: ���̹� ī��

CREATE SEQUENCE BOARD_SEQ;

-- INSERT INTO QBOARD () VALUES (BOARD_SEQ.NEXTVAL ...)
-- INSERT INTO FBOARD () VALUES (BOARD_SEQ.NEXTVAL ...)
-- INSERT INTO NBOARD () VALUES (BOARD_SEQ.NEXTVAL ...)

-- 1. SEQUENCE�� ROLLBACK �����մϱ�? >> NO (���� ��ȣǥ�� ����)
SELECT * FROM SBOARD;
INSERT INTO SBOARD (NUM, TITLE)
VALUES (SEQ_NUM.NEXTVAL, '�ȳ�');
ROLLBACK;
INSERT INTO SBOARD (NUM, TITLE)
VALUES (SEQ_NUM.NEXTVAL, '�ȳ�');

-- TIP
-- MS-SQL
-- CREATE TABLE BOARD (BOARDNUM INT IDENTITY(1, 1), TITLE VARCHAR(20)) -- 1�� �����ؼ� 1�� ����, ���̺� ������
-- INSERT INTO BOARD (TITLE) VALUES ('MS');
-- ����: 2012�������� SEQUENCE ��ü ����

-- MY-SQL
-- CREATE TABLE BOARD (BOARDNUM INT AUTO_INCREMENT, TITLE VARCHAR(2)) -- ���̺� ������
-- INSERT INTO BOARD (TITLE) VALUES ('MYSQL');

CREATE SEQUENCE SEQ2_NUM
START WITH 10
INCREMENT BY 2;

SELECT SEQ2_NUM.CURRVAL FROM DUAL; -- NEXTVAL �ϱ� ���� CURRVAL�� �ϸ� ����
SELECT SEQ2_NUM.NEXTVAL FROM DUAL;

SELECT * FROM USER_SEQUENCES;

/*
�Խ��� �۹�ȣ
NUM
1
2
4
6
10
15

�ֽű� ������ �Խñ� ����� �����ּ���
SELECT * FROM BOARD ORDER BY NUM DESC;
�Խ��� ������� �⺻
*/
/*
�ǻ� �÷�(Pseudo-column)�� ���̺��� �÷�ó�� ���������� 
������ ���̺� ������� �ʴ� �÷��� �ǹ��Ѵ�.
SELECT �������� �ǻ��÷��� ����� �� ������, DML ���忡���� �� �� ����.
���������� ����ϴ� NEXTVAL�̳� CURRVAL �� �ǻ� �÷��� �����̸�, 
��ǥ���� ���� ROWNUM�̴�.
*/

-- ������(SEQUENCE, ROWNUM)
-- ROWNUM: �ǻ� �÷�
-- ROWNUM: �����δ� ���̺� �������� �ʴ� COLUMN������ �ึ�� ��ȣ�� �ο�
-- ROWID: �ּҰ�: ���� ������ ����Ǵ� ����(�޸�) �ּҰ�(�������: DBA, Ʃ��)
SELECT EMPNO, ENAME FROM EMP;

SELECT ROWNUM AS ����, EMPNO, ENAME FROM EMP; -- ������ �����̶�� �����͸� �����
-- SELECT ���� �� ROW(��)�� ��ȣ �ο�
-- PAGING ó�� ����
-- TOP-N QUERY ���
-- ���̺��� ���ǿ� �´� ���� TOP ���ڵ�(ROW) N�� ����: ���ĵ� �����͸� ��������
-- �ٰ�: ���ĵ� ������(���� > �� > ����)
SELECT * FROM EMP ORDER BY SAL DESC; -- ����ó���� ���� ������

-- TIP
-- TOP-N QUERY
-- MS-SQL: SELECT TOP 10, * FROM EMP ORDER BY SAL DESC;
-- Oracle: ROWNUM

-- 1. ���� QUERY�� �����
-- 2. QUERY�� ����(ROWNUM)�� �ο��ϰ� ���� WHERE ROWNUM <= 10

-- 1�ܰ�
-- ���ؼ���
SELECT ROWNUM AS "NUM", E.*
FROM (
  SELECT *
  FROM EMP
  ORDER BY SAL DESC) E;

-- 2�ܰ�
-- ���Ǽ���
SELECT ROWNUM AS "NUM", E.* -- ����ó���� �� �ڿ� ROWNUM�� �ٿ���
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
WHERE ROWNUM <= 2; -- ���� ���ǰ��� ���� ���� �׶� �׶� �ٸ���(������ ó��)

SELECT *
FROM (
      SELECT ROWNUM AS "NUM", E.*
      FROM (
            SELECT *
            FROM EMP
            ORDER BY SAL DESC) E
      ) N
WHERE "NUM" <= 2

-- Oracle �⺻ END --
-- SQL 1�� �н��Ϸ� --

-- SQL 2�� �н� --
-- ��� QUERY
-- PL-SQL: ����, ���, Ŀ��, �Լ�, ���ν���, Ʈ����, ������



--������̺��� COUNTRY_ID�� US�̰� �޿��� �հ谡 5000�̻��� ����� ����, �޿��� �հ�("�հ�"�� ��Ī �ο��ϱ�),
--�μ��̸�, city�� city�� ���ĺ� ������ ���
select e.job_id, sum(e.salary) as "�հ�", d.department_name, l.city
from employees e join departments d on e.department_id=d.department_id join locations l on d.location_id=l.location_id
where l.country_id='US'
group by e.job_id, e.salary, d.department_name, l.city
having sum(e.salary)>5000
order by l.city asc;