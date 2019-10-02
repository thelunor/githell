-- 1. ������ 12000 �̻�Ǵ� �������� LAST_NAME �� ������ ��ȸ�Ѵ�.
SELECT LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > 12000;

-- 2. �����ȣ�� 176 �� ����� LAST_NAME �� �μ� ��ȣ�� ��ȸ�Ѵ�.
SELECT EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 176;

-- ***3. ������ 5000 ���� 12000�� ���� �̿��� ������� LAST_NAME �� ������ ��ȸ����.
SELECT LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY NOT BETWEEN 5000 AND 12000;

-- 4. 1998/02/20 �Ϻ��� 1998/05/01 ���̿� ���� ������� LAST_NAME ���, ������ڸ� ��ȸ�Ѵ�.
-- ������� ������ �����Ѵ�.
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN;

-- 5. 20 �� �� 50 �� �μ����� �ٹ��ϴ� ��� ������� LAST_NAME �� �μ� ��ȣ�� ���ĺ������� ��ȸ�Ѵ�.
SELECT LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (20, 50)
ORDER BY LAST_NAME ASC;

-- ***6. 20 �� �� 50 �� �μ��� �ٹ��ϸ�, ������ 5000 ~ 12,000 ������ ������� LAST_NAME �� ������ ��ȸ�Ѵ�.
SELECT LAST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (20, 50) AND SALARY BETWEEN 5000 AND 12000;

-- 7. 1994�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ѵ�.

-- 8. �Ŵ����� ���� ������� LAST_NAME �� JOB_ID �� ��ȸ�Ѵ�.
SELECT LAST_NAME, JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- 9. Ŀ�̼��� ���� ��� ������� LAST_ANME, ���� �� Ŀ�̼��� ��ȸ�Ѵ�.
-- ���� ����, Ŀ�̼� �������� �����Ѵ�.
SELECT LAST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY SALARY DESC, COMMISSION_PCT DESC;

-- 10. LAST_NAME �� �׹�° ���ڰ� a �� ������� LAST_NAME �� ��ȸ�Ѵ�.
SELECT LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE '___a%';

-- ***11. LAST_NAME �� a �� e ���ڰ� �ִ� ������� LAST_NAME �� ��ȸ����.
SELECT LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE '%a%' OR LAST_NAME LIKE '%e%';

-- 12. ������ 2,500, 3,500, 7,000 �� �ƴϸ� ������ SA_REP �̳� ST_CLERK �� ������� ��ȸ�Ѵ�.
SELECT LAST_NAME, JOB_ID
FROM EMPLOYEES
WHERE SALARY NOT IN (2500, 3500, 7000) AND JOB_ID IN ('SA_REP', 'ST_CLERK');

-- 13. ������ AD_PRESS �� ����� A �����, ST_MAN �� ����� B �����, IT_PROG �� ����� C �����, SA_REP �� ����� D �����, ST_CLEAK �� ����� E ����� ��Ÿ�� 0 �� �ο��Ͽ� ��ȸ�Ѵ�.
SELECT JOB_ID, DECODE (JOB_ID, 'AD_PRESS', 'A',
                              'ST_MAN', 'B',
                              'IT_PROG', 'C',
                              'SA_REP', 'D',
                              '0') AS "���"
FROM EMPLOYEES;

-- 14. ��� ������� LAST_NAME, �μ� ��ȣ �� �μ� �̸��� ��ȸ�Ѵ�.
SELECT E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- 15. �μ���ȣ 30 ���� ��� �������� ������ �������� ��ȸ�Ѵ�. 
-- 90 �μ� ���� �����Ѵ�.
SELECT DEPARTMENT_ID, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;

-- 16. Ŀ�̼��� ���� ��� ������� LAST_NAME, �μ� ��, ���� ID �� ���� ���� ��ȸ�Ѵ�.
SELECT E.LAST_NAME, D.DEPARTMENT_NAME, L.COUNTRY_ID, L.CITY
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
                 JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
WHERE COMMISSION_PCT IS NOT NULL;

-- 17. LAST_NAME �� DAVIES �� ������� �Ŀ� ���� ������� LAST_NAME �� HIRE_DATE �� ��ȸ�Ѵ�.
SELECT LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE LAST_NAME = 'DAVIES' ;

-- 18. �ڽ��� �Ŵ������� ���� ���� ������� LAST_NAME �� ������� ��ȸ�Ѵ�.


-- 19. ȸ�� ��ü�� �ִ� ����, �ּ� ����, ���� �� �� �� ��� ������ �ڿ����� �����Ͽ� ��ȸ�Ѵ�.
SELECT TRUNC (MAX (SALARY), 0) AS "�ִ뿬��",
       TRUNC (MIN (SALARY), 0) AS "�ּҿ���",
       TRUNC (SUM (SALARY), 0) AS "�ѿ���",
       TRUNC (AVG (SALARY), 0) AS "��տ���"
FROM EMPLOYEES;

-- 20. �� JOB_ID ��, �ִ� ����, �ּ� ����, ���� �� �� �� ��� ������ �ڿ����� �����Ͽ� ��ȸ�Ѵ�.
SELECT JOB_ID, TRUNC (MAX (SALARY), 0) AS "�ִ뿬��",
       TRUNC (MIN (SALARY), 0) AS "�ּҿ���",
       TRUNC (SUM (SALARY), 0) AS "�ѿ���",
       TRUNC (AVG (SALARY), 0) AS "��տ���"
FROM EMPLOYEES
GROUP BY JOB_ID;
-- ORDER BY JOB_ID;

-- ***21. ������ ������ ���� ������� �� ���� ��ȸ�Ѵ�.
SELECT JOB_ID, COUNT (JOB_ID)
FROM EMPLOYEES
GROUP BY JOB_ID;

-- 22. �Ŵ����� �ٹ��ϴ� ������� �� ���� ��ȸ�Ѵ�.
SELECT JOB_ID, COUNT (JOB_ID)
FROM EMPLOYEES
WHERE JOB_ID LIKE ('___MGR')
GROUP BY JOB_ID;

-- 23. �系�� �ִ� ���� �� �ּ� ������ ���̸� ��ȸ�Ѵ�.
SELECT (MAX (SALARY) - MIN (SALARY)) AS "��������"
FROM EMPLOYEES;

/*
��� ���̺� 2002�� ���� �Ի��ڵ� �߿��� ������ ������ ���� �ǿ����� 1000���� �޸�ó���Ͽ� ����� �̸�, ����, �Ի���, ����, �ǿ����� ����ϼ���
��, �Ի��� ������ YYYY-MM-DD�� �ϰ� �Ի����� ������ ������ �����ϼ���
HINT) SELECT ~ ; �� ��
*/
alter session set nls_date_format = 'YYYY-MM-DD';
SELECT LAST_NAME, JOB_ID, HIRE_DATE, TO_CHAR (SALARY, '999,999') AS "SALARY"
FROM EMPLOYEES
WHERE TO_CHAR (HIRE_DATE, 'YYYY') >= '2002'
ORDER BY HIRE_DATE ASC;

/*
������̺��� COUNTRY_ID�� US�̰� �޿��� �հ谡 5000�̻��� ����� ����,
�޿��� �հ�("�հ�"�� ��Ī �ο��ϱ�), �μ��̸�, city�� city�� ���ĺ� ������ ���
*/
SELECT E.JOB_ID, E.SALARY, D.DEPARTMENT_NAME, L.CITY
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
                 JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID;
/*
Ŀ�̼��� å���� ������� �̸�(frist_name), (last_name), �Ի糯¥, ����+Ŀ�̼�, �μ���ȣ, �μ� ������ ����Ѵ�.
-- ��, ����+Ŀ�̼��� 5000�̻��̸� �Ի� ��¥�� 04�� �̻��� ����鸸 ����϶�.
*/





/*
1. union ����
���� ���� ����Ÿ �������� 1���� ���� ���̺��� �����(���� ���� ��)
���Ͽ��� ����ؼ� 1���� 3���� �̸��� ���������� �����ּ���.

2. HR �������� ��
employees ���̺��� ������̵� ��, �̸��� ��� �ϵ�, ���� ��� �빮�ڷ�,
�̸��� ù �����ڸ�(ex, 'James' --> 'Jam') ����Ͻÿ�.

3. HR �������� ��
employees ���̺��� ����� Ǯ���Ӱ� ���ѹ��� ����ϵ�, �� �ѹ� ������ ������ �ױ��ڸ� �����ּ���
(��  123.123.1234 --->  123.123.***********)

4. HR �������� ��
employees ���̺��� ����� Ǯ���Ӱ� �Ի���, �׸��� �ټ� ����, 17% �λ�� �޿� �� ����ϼ���.
�� �ٹ����� ������ ��� ���� ����ϼ���. �׸��� �λ�� �޿��� ������ ǥ���� �ּ���. ����
�� ����� 1000���� �޸� ó���� �ֽð� �޿� �տ� $ �ٿ� �ּ��� �̻ڰ�.

5. HR �������� ��
employees ���̺���. ����� �̸��� �Ի����� ����� �ּ���. �� �Ի����� YYYY-MM ���·� ǥ�����ּ���.

*/

/*
1. ������̺��� ���, �̸�, �޿�, �Ի����� ����ϵ� ����� �����ϰ�, �� �׷�ȿ��� �Ի����� �ֱ� �Ի��� ������ ����ϼ���.

2. ������̺��� �̸��� 'IN'�� ���� �̸��� ���ĺ� ������ ����ϼ���.

3. group3 ���̺� �����̸�(name), ����(sex), �¾�⵵(ex.1991), ���(hobby)�� �����, 3���� �������� ������ �־����. 
    / �¾ �⵵ ��¥���Ŀ� ����������. �׳� ���ڵ����ͷ� �ۼ�
    / �����̸�, ����, �¾�� �� �ʼ�����   
    / ��̴� �ɼǻ���

4. group3 ���̺��� �¾�⵵�� 1991 �Ǵ� 1995�� �ƴ� ������ �����̸�, ����, �¾�⵵�� ����ϼ���.
*/