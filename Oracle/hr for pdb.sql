SELECT
    *
FROM employees;
SELECT
    FIRST_NAME,JOB_ID
FROM employees;
SELECT first_name||' '||last_name "Name", job_id,salary*1.3 FROM employees;
select first_name||' '||last_name "Name",job_id,salary+NVL(commission_pct,0) from employees;
select first_name||' '||last_name || 'SA' "Name",job_id,salary from employees;
SELECT*FROM employees order by salary ASC;
SELECT*FROM employees order by salary DESC;
SELECT*FROM employees order by first_name asc;
SELECT*from employees where employee_id=100;
SELECT*from employees where salary >= 12000;
SELECT*from employees where salary < 12000;
SELECT*from employees where salary != 12000;
SELECT*from employees where salary <> 12000;
SELECT*from employees where salary > 17000;
SELECT*from employees where salary > 12000 and first_name='Steven';
SELECT*from employees where salary > 12000 or first_name='Steven';
SELECT*from employees where salary in (12000,13000,17000);
SELECT*from employees where salary >= 12000 and salary <= 17000;
SELECT*from employees where salary > 13000;
SELECT*from employees where first_name = 'Steven';
SELECT*from employees where first_name LIKE 'A%';
SELECT*from employees where first_name LIKE '%a';
SELECT*from employees where first_name LIKE '%a%';
SELECT*from employees where first_name LIKE '_a%';
SELECT*from employees where first_name LIKE '%a_';
SELECT*from employees where first_name LIKE '____%';
SELECT*from employees where first_name not LIKE 'A%';
SELECT*from employees where first_name < 'E';
SELECT*from employees where first_name > 'E';
SELECT*from employees where first_name <= 'B';
SELECT*from employees where salary > 10000 and job_id = 'SA_REP';
SELECT*from employees where salary > 12000 or salary < 10000; 
select * from employees where (first_name like 'A%' or first_name like 'B%' or first_name like 'C%') and (department_id = 10 or job_id = 'SH_CLERK') or (department_id = 20 and commission_pct > 0.3 or commission_pct < 0.1);
show user;
SELECT * FROM employees;
select (sysdate-hire_date) from employees;
select (sysdate-hire_date)/360 years from employees;
select (sysdate-hire_date)/360 years from employees order by years DESC;
select (sysdate-hire_date)/360 years from employees order by years;
select (sysdate-hire_date)/360 years, salary+NVL(commission_pct,0) total from employees;
SELECT * FROM employees WHERE (salary > 15000 OR commission_pct < 0.3) AND (department_id = 10 OR job_id = 'SH_CLERK') OR (job_id = 'AD_ASST' OR job_id = 'MK_REP') AND (department_id = 20 OR salary > 12000);
SELECT MAX(salary) AS "Height Salary" FROM employees;
SELECT MIN(salary) AS "Lowest Salary" FROM employees;
SELECT MAX(first_name) AS "Height Salary" FROM employees;
select sum(salary) as "Total" from employees;
select department_id,sum(salary) as "Total" from employees GROUP BY department_id having count(*) > 5 order by 1;
select avg(salary) as "Average Salary" , first_name from employees GROUP BY first_name;
SELECT first_name from employees where first_name = 'Steven';
SELECT COUNT(employee_id) as "Cou Sal" from employees;
select * from employees where salary = (SELECT MAX(salary) from employees);
select * from employees where salary > (select avg(salary)from employees);
select * from employees where job_id in (SELECT job_id from employees where first_name = 'James');
select * from employees where TO_DATE(hire_date,'yy-mm-dd') in (select TO_DATE(hire_date,'yy-mm-dd') from employees where first_name = 'Julia');
select * from employees where salary = (SELECT MAX(salary) from employees where department_id = 90) and department_id = 90;
SELECT * from employees where employee_id in (select manager_id from employees);
SELECT job_id  from employees GROUP BY job_id;
select department_id, max(salary),COUNT(*),SUM(salary) from employees GROUP BY department_id;
SELECT ROUND(15.193,1) from employees;
select TRUNC(15.79,1) from employees;
select MOD(11,4) from employees;
select TO_DATE(2001,'yyyy') from employees;
select *from employees where salary BETWEEN 10000 and 17000;
select sum(salary), count(*),job_id from employees where department_id is not null group by job_id having count(*) > 5;
select department_id from employees group by department_id having count(*) > 5 order by sum(salary) asc;
select * from employees where salary in (select max(salary) from employees GROUP by hire_date)
select * from employees where department_id in (select department_id from employees group by department_id having count(*) > 5);
select sum(salary), count(*) from employees group by to_char(hire_date,'yy');
select sum(salary), department_id from employees group by department_id;
select * from employees where salary in (select max(salary) from employees group by job_id);
select sum(salary), count(*) , max(salary) from employees where job_id = 'MK_REP';
select * from employees where department_id in (select department_id from employees where first_name = 'Steven') and first_name <> 'Steven';
select * from employees where to_char(hire_date,'yy') in (select to_char(hire_date,'yy') from employees where first_name = 'Steven');
select * from employees where employee_id in (select manager_id from employees) and department_id = 50;
select * from employees where salary < (select avg(salary) from employees where department_id = 50) and department_id = 50;  
select * from employees where employee_id in (select manager_id from employees) and manager_id is not null and commission_pct is null;
select * from employees where department_id in (select department_id from employees where first_name = 'Lex') and first_name <> 'Lex';
select * from employees where to_char(hire_date,'yyyy') in (select to_char(hire_date,'yyyy') from employees where first_name = 'Payam');
select * from employees where employee_id in (select manager_id from employees) and manager_id is not null;
select * from employees where salary < (select avg(salary) from employees) and department_id = 20;
select * from employees where employee_id in (select manager_id from employees) and manager_id is not null;
select * from employees where employee_id in (select manager_id from employees) and department_id = 20;
select * from employees where employee_id in (select manager_id from employees) and manager_id is not null;
select department_name , first_name from employees ,departments where employees.department_id = departments.department_id ;
select department_id , job_id , count(*) , sum(salary) from employees group by department_id , job_id;
select department_id , sum(salary) , count(*) from employees group by department_id , job_id having count(*) >= 5;
select DEPARTMENT_NAME , department_id from departments;
select first_name , job_id , hire_date , salary , sum(edate - sdate) from employees e , vac v where e.employee_id = v.employee_id and to_char(sdate,'yyyy') = 2021 group by first_name , job_id , hire_date , salary having sum(edate - sdate) > 20 
select * from employees where department_id in (select department_id from departments where DEPARTMENT_NAME = 'Sales')
select DEPARTMENT_NAME , count(*) , sum(salary) from employees e , departments d where e.department_id = d.department_id group by DEPARTMENT_NAME
select department_id , sum(salary), count(*) from employees group by department_id having count(*) > 5 or sum(salary) > 10000;
select department_id , sum(salary), count(*) from employees where salary > 6000 group by department_id having count(*) > 5 or sum(salary) > 10000;
select job_id from employees;
select department_id , sum(salary), count(*) from employees where job_id <> 'SA_REP' group by department_id having count(*) > 5 or sum(salary) > 10000;
select * from employees where department_id in (select department_id from employees group by department_id having count(*) > 5 or sum(salary) > 10000);
select department_id from employees group by department_id having sum(salary) in (select max(sum(salary)) from employees group by department_id);
select first_name from employees where (salary,department_id) in (select max(salary),department_id from employees group by department_id);
select * from employees where department_id in (select department_id from employees group by department_id having sum(salary) = (select max(sum(salary)) from employees group by department_id));
select sysdate,sysdate + 3 from dual;
select sysdate - hire_date from employees;
--Ahmed Tawfeek Delwan
select SUBSTR('Ahmed Tawfeek Delwan',1,instr('Ahmed Tawfeek Delwan',' ',1,1)-1) first_Name ,
substr('Ahmed Tawfeek Delwan',instr('Ahmed Tawfeek Delwan',' ',1,1)+1,instr('Ahmed Tawfeek Delwan',' ',1,2)-instr('Ahmed Tawfeek Delwan',' ',1,1)-1) Middle_Nmae,
substr('Ahmed Tawfeek Delwan',instr('Ahmed Tawfeek Delwan',' ',1,2)+1) Last_Name
from dual;
select department_id from employees group by department_id having count(*) > 5
select department_id ,sum(salary) , count(*) from employees group by department_id  having count(*) > 5
SELECT *FROM VAC
UNION
SELECT * FROM EMP
INSERT INTO VAC (SDATE , EDATE , EMPLOYEE_ID) VALUES (01-JUN-08 , 05-JUN-09 , 200);
SELECT * FROM EMP WHERE employee_id IN (SELECT employee_id FROM VAC)
create table SALGRADE 
(
    GRADE NUMBER NOT NULL,
    LOSAL NUMBER NOT NULL,
    HISAL NUMBER NOT NULL
)
SELECT E.* , GRADE FROM EMP E, SALGRADE WHERE E.SALARY BETWEEN LOSAL AND HISAL
SELECT * FROM EMP WHERE INSTR(FIRST_NAME , ' ' , 1 , 1 );
SELECT * FROM EMP ORDER BY job_id DESC
SELECT *FROM EMP WHERE job_id = 'SH_CLERK' AND SALARY > 3000 OR salary < 3500
SELECT first_name || 'SA' , job_id , salary + commission_pct FROM EMP
SELECT *FROM EMP ORDER BY first_name DESC , salary ASC
SELECT *FROM EMP WHERE employee_ID IN ('180', '190');
select * from emp where ((first_name like 'A%'or first_name like 'B%' or first_name like 'C%') and department_id = 154 or job_id = 'SH_CLERK') or (department_id = 187 and (commission_pct > 500 or commission_pct < 300))
select * from emp where job_id in (select job_id from emp where last_name = 'King')
select * from emp where to_char(hire_date,'yyyy') in (select to_char(hire_date,'yyyy') from emp where first_name = 'Clara');
select * from emp where salary = (select max(salary) from emp where department_id = 200) and department_id = 200
select * from emp where employee_id not in (select manager_id from emp)
select round(152.556 , 1) from dual
select trunc(152.556 , -1) from dual
select mod(15,4) from dual
select to_char(sysdate , 'dd/mm/yyyy') from dual
select *from emp where to_char(hire_date , 'yyyy') = 2001
select *from emp where to_date(hire_date,'dd/mm/yyyy') between to_date(01/01/2001 , 'dd/mm/yyyy') and to_date(07/07/2001 , 'dd/mm/yyyy')
select *from emp where department_id in (select department_id from emp where first_name = 'Clara') and first_name != 'Clara'
select *from emp where to_char(hire_date , 'yyyy') in (select to_char(hire_date , 'yyyy') from emp where first_name = 'Clara')
select *from emp where salary < (select avg(salary) from emp) and department_id = 70
select *from emp where employee_id in (select manager_id from emp) and manager_id is not null
select *from emp where employee_id in (select manager_id from emp )and department_id = 50
select *from emp where employee_id in (select manager_id from emp ) and manager_id is null
select to_char(hire_date , 'yyyy') - to_char(sysdate , 'yyyy') from emp
select * from emp where department_id in (select department_id from emp where first_name in ('Clara' , 'Steven'))
select sum(salary) , count(*) from emp where department_id is not null group by job_id having count(*) > 5
select department_id from emp group by department_id having count(*) > 5 order by sum(salary)
select e.* , d.* from emp e, dept d where e.department_id = d.department_id
select instr(first_name , 'M' ,1, 1) from emp
select * from emp where salary not in (select max(salary) from emp group by department_id) 
select * from emp where (salary,to_char(hire_date, 'yyyy')) in (select max(salary),to_char(hire_date, 'yyyy') from emp where job_id not in ('SH_CLERK','SA_REP') group by to_char(hire_date, 'yyyy'))
select * from emp where department_id in (select department_id from emp group by department_id having count(*) = 5)
select to_char(hire_date, 'yyyy') , sum(salary) , count(*)  from emp group by to_char(hire_date, 'yyyy') order by 1;
select department_id , sum(salary) from emp group by department_id
select job_id ,max(salary) from emp group by job_id
select sum(salary) , count(*) , max(salary) from emp where job_id = 'SH_CLERK';
select department_id , sum(salary), count(*) from emp group by department_id having count(*) > 5 or sum(salary) > 50000;
select department_id , sum(salary) , count(*) from emp where job_id != 'SH_CLERK' group by department_id having count(*) > 5 and sum(salary) > 25000
select * from emp where department_id in (select department_id from emp group by department_id having count(*) > 6 or sum(salary) > 25000)
select max(sum(salary)) from emp group by department_id;
select department_id from emp group by department_id having sum(salary) in (select max(sum(salary))) from emp group by department_id)
select first_name from emp where (salary,department_id) in (select max(salary),department_id from emp group by department_id)
select * from emp where department_id in (select department_id from emp group by department_id having sum(salary) in (select max(sum(salary)) from emp group by department_id))
select *from emp where salary < 8000 and job_id in ('SA_MAN','SA_REP') and department_id in (10,50)
select first_name , emp.employee_id , sdate , edate from emp , vac where emp.employee_id = vac.employee_id
select first_name , emp.employee_id , sum(edate - sdate) from emp , vac where emp.employee_id = vac.employee_id group by first_name , emp.employee_id having sum(edate - sdate) > 280
select * from emp where employee_id not in (select employee_id from vac)
select department_id , job_id , count(*) , sum(salary) from emp group by department_id , job_id
select department_id , count(*) , sum(salary) from emp group by department_id , job_id having count(*) > 5
select first_name , job_id, hire_date, salary, count(edate - sdate) from emp, vac where emp.employee_id = vac.employee_id and to_char(sdate, 'yyyy') = 2005 group by first_name, emp.employee_id, job_id, hire_date, salary having count(edate - sdate) > 2
select DEPARTMENT_NAME from dept
select * from emp where department_id in (select department_id from dept where DEPARTMENT_NAME = 'Sales')
select e.* from emp e , dept d where e.department_id = d.department_id and d.DEPARTMENT_NAME = 'Sales'
select DEPARTMENT_NAME , count(*) , sum(salary) from emp e , dept d where e.department_id = d.department_id group by DEPARTMENT_NAME , d.department_id
select first_name, e.employee_id, DEPARTMENT_NAME, sum(edate - sdate) days from emp e, dept d, vac v where (e.department_id = d.department_id and e.employee_id = v.employee_id) and (salary > 13000 or salary < 10000 and to_char(sdate, 'yyyy') in (2004, 2005)) group by first_name, e.employee_id, DEPARTMENT_NAME 
select first_name , DEPARTMENT_NAME from emp e , dept d where e.department_id = d.department_id (+)
select DEPARTMENT_NAME , count(employee_id), sum(salary) from emp e, dept d where e.department_id(+) = d.department_id group by DEPARTMENT_NAME , d.department_id
select * from emp where instr(first_name, ' ', 1, 3) = 0
select * from emp where instr(first_name, ' ', 1, 3) = 0 and instr(first_name, ' ', 1, 4) <> 0
select e.* from emp e, dept d, vac v where (e.department_id = d.department_id(+) and e.employee_id = v.employee_id(+)) and to_char(sdate(+), 'yyyy') = 2018
select first_name, e.employee_id, DEPARTMENT_NAME, sum(edate - sdate) from emp e, dept d, vac v where (e.department_id = d.department_id(+) and e.employee_id = v.employee_id(+)) and (salary < 12000 and salary > 15000 and to_char(sdate(+), 'yyyy') = 2020) group by first_name, e.employee_id, DEPARTMENT_NAME
select first_name from emp where instr(first_name, 'm', 1, 2) <> 0 and instr(first_name, 'm', 1, 3) = 0 and instr(first_name, 'mm', 1, 1) = 0
select first_name from emp where first_name like '%M%M%' and first_name not like '%MM%';
select *from emp where instr(first_name, ' ', 1, 2) <> 0 and instr(first_name, ' ', 1, 3) = 0
select *from emp where first_name like '%%%' and first_name not like '%%%%';
select *from emp where job_id like '%__%' and job_id not like '%___%';
select *from emp where job_id like '%*_%*_%' escape '*';
select *from emp where instr(job_id, '_', 1, 2) <> 0
select e.* , grade from emp e, salgrade where salary between losal(+) and hisal(+)
select e.* , grade from emp e, salgrade where salary(+) between losal and hisal
select * from emp where salary not between 10000 and 15000;
select * from emp where substr(first_name, 2, length(first_name)) not between 'a' and 'g'
select * from emp where (substr(first_name, 1 ,-1) between 'a' and 'g' and department_id is null) or ((salary between 6000 and 12000 or salary between 13000 and 24000) and job_id in('SA_MAN','SA_REP')) order by to_char(hire_date, 'yyyy') asc , salary desc
select * from emp where substr(first_name, 1, 1) = substr(first_name, 1, -1) order by to_char(hire_date, 'yyyy') asc , salary desc
select first_name from emp where hire_date < to_date('dd/mm/yyyy', 25/06/2001) or (to_char(hire_date,'Q') = 1 and to_char(hire_date,'yyyy' in (2001,2002,2003))
select * from emp where employee_id in (select manager_id from emp where hire_date between to_date('dd/mm/yyyy',) and to_date())
select * from emp where first_name = 'Donald' or first_name = 'Pat'
select * from emp where first_name in ('Donald','Pat')
select first_name from emp where instr(first_name, 'a', 1, 4) <> 0
select first_name from emp where (hire_date < to_date('15/05/2014', 'dd/mm/yyyy')) or (instr(first_name, ' ', 1, 5) = 0)
select sum(edate - sdate), hiredate from emp, vac where emp.employee_id = vac.employee_id(+) group by to_char(hiredate, 'yyyy')
select * from emp where substr(first_name, 1, 1) in ('A', 'D', 'G');
select * from emp where substr(first_name, 1, 3) in ('_', '%')
select * from emp x where SAL < (select avg(SAL) from emp where DEPTNO = x.DEPTNO group by DEPTNO)
select * from emp y where salary > (select salary from emp where employee_id = y.manager_id);
select * from emp e where salary < (select avg(salary) from emp where department_id = e.department_id);
select * from emp e where salary in (select max(salary) from emp where department_id = e.department_id);
select * from emp e where salary > (select salary from emp where employee_id = e.manager_id);
select * from emp where salary in (select max(salary) from emp) or salary in (select max(salary) from emp where salary not in (select max(salary) from emp));
select * from emp e where salary < (select avg(salary) from emp where department_id = e.department_id);
select * from emp e where salary in (select max(salary) from emp where department_id = e.department_id)
select * from emp e where salary > (select salary from emp where employee_id = e.manager_id);
select * from emp where salary in (select max(salary) from emp) or salary in (select max(salary) from emp where salary not in (select max(salary) from emp));
select m.first_name, e.first_name from emp e, emp m where e.manager_id = m.employee_id(+)
select e.first_name , x.first_name from emp e, emp x where e.employee_id(+) = x.manager_id
select e.ename, e.empno, m.empno, m.ename from emp e, emp m where m.manager_id = e.empno(+)
select e.*, m.ename, d.dname from emp e, emp m, dept d where m.manager_id = e.empno(+) and e.deptno = d.deptno and e.sal > m.sal
insert into nemp(deptno) values( 40) where ename = 'ALI';
select * from session_privs
grant insert to hr
CREATE TABLE "HR"."NEMP" 
   (	"EMPNO" NUMBER(6,0), 
	"ENAME" VARCHAR2(20 BYTE), 
	"HIRE_DATE" DATE , 
	"JOB" VARCHAR2(10 BYTE) , 
	"SAL" NUMBER(8,2), 
	"COMM" NUMBER(2,2), 
	"MANAGER_ID" NUMBER(6,0), 
	"DEPTNO" NUMBER(4,0)
   )
   update nemp set job = 'CLERK' where ename = 'ALI';
select * from nemp
update nemp set ename = upper(ename);
update nemp set sal = sal * 1.15;
update nemp set deptno = 40 where deptno is null
update nemp set deptno = decode(deptno, 40, 50, 50, 40);
update nemp set sal = sal*1.25, job = 'TYPING' , ename = Initcap(ename) where job = 'CLERK';
update nemp e set sal = sal*1.2 where sal < (select avg(sal) from nemp x where x.deptno = e.deptno);
update nemp e set sal = sal * 1.3 where sal < (select sal/2 salhalf from nemp m where m.manager_id = e.empno)
select * from user_views
create view v1 as select ename, empno, sal from emp where deptno = 50;
select * from v1
select * from v2
select * from v3
select * from v4
create view v3 as select ename, empno, sal from nemp where deptno = 40 with check option;
drop view v4;
update v3 set sal = sal + 1000 where sal > 4000
rollback
select * from nemp
delete from nemp where sal = 3000
insert into v4 values('Ahmed', 7200, 3000);
delete from v3 where ename = 'Samer'
create view v4 as select ename, empno, sal from nemp where ename = 'Ahmed' with check option;
Create Table OLD_EMP1(
    EMPNO Number(5) Primary Key,
    ENAME Varchar(100) not null,
    JOB Char(20) Default('PROGE') check(JOB = UPPER(JOB)),
    MGR Number(5) CONSTRAINT EE_MGR,
    HIRE_DATE Date Default(Trunc(sysdate, 'dd')),
    SAL Number(7,2) Default(2500),
    COMM Number(7,2) check(comm > 1000),
    DEPTNO Number(2) 
);
Create Table DEPT1(
    DEPTNO Number(2) Primary Key,
    DNAME Varchar(50) Not Null,
    MGR Number(5) References EMP1(EMPNO) ON DELETE CASCADE,
    Unique(DNAME)
);
ALTER TABLE EMP1 ADD FOREIGN KEY (DEPTNO) References DEPT1(DEPTNO) ON DELETE CASCADE
rollback
DROP TABLE EMP1 CASCADE CONSTRAINTS
DROP TABLE DEPT1 CASCADE CONSTRAINTS
SELECT * FROM EMP
SELECT COUNT(decode(DEPTNO,50,5)) FROM EMP
SELECT * FROM EMP1
SELECT * FROM DEPT1
INSERT INTO DEPT1(DEPTNO, DNAME) VALUES (20, 'MMM')
INSERT INTO EMP1(EMPNO, ENAME, DEPTNO) VALUES(8000, 'HAZEM', 10)
INSERT INTO EMP1(EMPNO, ENAME, DEPTNO) VALUES(7000, 'AHMED', 20)
UPDATE EMP1 SET MGR = 200 WHERE deptno = 20;
UPDATE DEPT1 SET MGR = 200 WHERE deptno = 20;
SELECT COUNT(MGR) FROM EMP1
Create View v5 as 
select * from vac where empno in (select empno from vac group by empno having sum(edate - sdate) < 30) with check option CONSTRAINT "VIEW_FIVE";

Drop view v5

select * from v5

select * from user_views

select * from user_constraints

select * from user_cons_columns

Alter Table Dept add(
     Unique(dname, location_id)
);

Delete from dept where deptno = 50
rollback

select *from salgrade
Create view v6 as
select e.ename, m.ename, e.sal, m.sal, de.dname, dm.dname, ge.grade, gm.grade, sum(ve.edate - ve.sdate), sum(vm.edate - vm.sdate)
from emp e, emp m, dept de, dept dm, salgrade ge, salgrade gm, vac ve, vac vm
where e.empno = m.manager_id and e.deptno = de.deptno and m.deptno = dm.deptno and (e.sal(+) between ge.losal and ge.hisal) and (m.sal(+) between gm.losal and gm.hisal) and e.empno = ve.empno and m.manager_id = vm.empno
group by e.ename, m.ename, e.sal, m.sal, de.dname, dm.dname, ge.grade, gm.grade


select * from user_sequences

Create Sequence squ1 Increment by -5 cycle start with 20 maxvalue 22 minvalue -100 
Create Sequence squ2 ; 
Alter Sequence squ2 Increment by +5 cycle maxvalue 100 
Drop Sequence squ2;

SELECT * FROM EMP WHERE ((substr(ename, 1, -1) between 'a' and 'g') and deptno is null) or (((sal between 2000 and 3000)or(sal between 5000 and 7000)) and job in ('Driver', 'Prog')) order by to_char(hire_date, 'yyyy') asc, sal desc
SELECT * FROM EMP WHERE SUBSTR(ENAME, 1, 1) = SUBSTR(ENAME, 1, -1) order by to_char(hire_date, 'yyyy') asc, sal desc
SELECT ENAME FROM EMP WHERE HIRE_DATE < TO_DATE('25/6/2000', 'DD/MM/YYYY') OR (TO_CHAR(HIRE_DATE, 'Q') = 1 AND TO_CHAR(HIRE_DATE, 'YYYY') IN (2001, 2002, 2003))
SELECT ENAME FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME IN ('Steven', 'David'))
select ename from emp where to_char(hire_date, 'dd') > 15 and to_char(hire_date, 'mm') in (3, 6, 8) and instr(ename, 'a', 1, 4) > 0
SELECT ENAME FROM EMP WHERE HIRE_DATE < TO_DATE('15/5/2014', 'DD/MM/YYYY') OR INSTR(ENAME, ' ', 1, 5) <> 0
SELECT ENAME FROM EMP WHERE (JOB = 'PROG' AND TO_CHAR(HIRE_DATE + 1, 'DD') = 1) OR HIRE_DATE IS NULL
SELECT TO_CHAR(HIRE_DATE, 'DD/MM/YYYY')  FROM EMP WHERE TO_CHAR(HIRE_DATE + 1, 'DD') = 1
SELECT * FROM  EMP WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB = 'CLERK' GROUP BY DEPTNO HAVING COUNT(EMPNO) > 3)
SELECT ENAME FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM EMP GROUP BY DEPTNO HAVING COUNT(EMPNO) = (SELECT MAX(COUNT(EMPNO)) FROM EMP GROUP BY DEPTNO) AND SUM(SAL) = (SELECT MAX(SUM(SAL)) FROM EMP GROUP BY DEPTNO))
SELECT TO_CHAR(HIRE_DATE, 'YYYY') FROM EMP GROUP BY TO_CHAR(HIRE_DATE, 'YYYY') HAVING COUNT(EMPNO) = (SELECT MAX(COUNT(EMPNO)) FROM EMP GROUP BY TO_CHAR(HIRE_DATE, 'YYYY'))
SELECT ENAME, NVL(SAL, 0) + (200*((SYSDATE - HIRE_DATE) / 365)) FULLSAL FROM EMP
UPDATE EMP1 E SET SAL = SAL * 1.1 WHERE SAL < (SELECT AVG(SAL) FROM EMP1 WHERE DEPTNO = E.DEPTNO)
UPDATE EMP1 E SET SAL = SAL * 1.1 WHERE SAL < (SELECT AVG(SAL) FROM EMP1 WHERE JOB = E.JOB)
SELECT SUM(DECODE(DEPTNO, 20, SAL, 0)) , SUM(DECODE(DEPTNO, 30, SAL, 0  )), SUM(DECODE(DEPTNO, 20, 0, 30, 0, SAL)) FROM EMP
create table old_emp as select * from emp where 2 > 3
select * from old_emp
insert into old_emp(*) select * from emp where sal > 15000
Alter table old_emp ADD sss number(2)
Alter table old_emp drop column sss
Alter table old_emp modify column sss number(3)
Alter table oold_emp rename to old_emp
Alter table old_emp Add constraint old_emp_sss unique(sss)
Alter table old_emp drop constraint old_emp_sss
Alter table old_emp disable job
Alter table old_emp enable constraint "old_emp_sss"
Alter table old_emp add JOB VARCHAR2(10) constraint "old_emp_job" not null
alter table old_emp drop primary key cascade
alter table old_emp add constraint PK_OLD_EMP primary key(empno)
alter table old_emp add constraint FK_OLD_EMP foreign key(deptno) references dept(deptno)
alter table old_emp drop constraint PK_OLD_EMP
drop table old_emp
select * from v1
select*from emp order by ename
update v1 set sal = sal + 400 where sal < 
delete from v1 where ename = 'aaa';

select * from user_views

create view v6 as 
select e.ename enameEMP, d.dname dnameDept, m.ename enameMgr, sum(edate - sdate) sumDayVac from emp e, emp m, dept d, vac v
where e.mgr = m.empno and e.deptno = d.deptno and e.empno = v.empno
group by e.ename, d.dname, m.ename, to_char(sdate, 'yyyy')

select * from v6

select * from emp where deptno in (select deptno from emp group by deptno having count(*) = (select max(count(*)) from emp group by deptno))
select dname, count(empno), dept.deptno,  'A' A1 from emp, dept where emp.deptno = dept.deptno group by dname , dept.deptno
union
select ename, empno, deptno, 'B' from emp
order by deptno

select ename, empno, empno ee, 'A' A1 from emp
union
select To_char(sdate, 'yyyy'), sum(edate - sdate), empno,  'B' B1 from vac group by  To_char(sdate, 'yyyy'), empno, 'B'
order by A1, ee

select job, sum(sal), '1' A1 from emp group by job
union
select ename, sal, '2' A1 from emp
order by A1

select e.* from emp e, emp m where e.sal > m.sal and e.empno = m.manager_id
select * from emp e where sal > (select sal from emp where empno = e.manager_id)

select * from emp z where 2 > (select count(distinct sal) from emp where sal > z.sal)
CREATE VIEW V10 AS
Select * from emp Where sal in (select max(sal) from emp) or sal in (select max(sal) from emp 
Where sal not in (select max(sal) from emp ));
CREATE VIEW V11 AS
Select * from emp Where sal in (select MIN(sal) from emp) or sal in (select MIN(sal) from emp 
Where sal not in (select MIN(sal) from emp ));

CREATE VIEW V12 AS
Select * from  V10
UNION
Select * from  V11;

SELECT * FROM V12;

SELECT * FROM USER_VIEWS
DROP VIEW V12

Select e.empno , m.ename from emp m , emp e
Where m.mgr = e.empno(+)

Select e1.empno , e2.ename from emp e1 , emp e2 
Where e1.mgr = e2.empno(+)

select * from emp

select m.ename, e.empno from emp e, emp m where m.mgr = e.empno(+);

select e.ename, m.ename from emp e, emp m where e.mgr = m.empno(+)
select e.ename, m.ename from emp e, emp m where e.empno(+) = m.mgr

select e.ename, m.ename, m.sal, de.dname, dm.dname, ge.grade, gm.grade, sum(edate - sdate) sumday 
from emp e, emp m, dept de, dept dm, salgrade ge, salgrade gm, vac
where e.mgr = m.empno(+) and e.deptno = de.deptno(+) and m.deptno = dm.deptno(+) 
and (e.sal between ge.losal(+) and ge.hisal(+)) and (m.sal between gm.losal(+) and gm.hisal(+)) and e.empno = vac.empno 
group by e.ename, m.ename, m.sal, de.dname, dm.dname, ge.grade, gm.grade


select dname, count(*), dept.deptno, 1 A from emp, dept where emp.deptno = dept.deptno group by dname, dept.deptno
union
select ename, empno, deptno, 2 A from emp
order by deptno, A

select to_char(grade), count(*), grade, 1 A from emp, salgrade where sal between losal and hisal group by grade
union
select ename, sal, grade, 2 A from emp, salgrade where sal between losal and hisal
order by grade, A

update emp e set sal = sal*1.15 where sal < (select avg(sal) from emp where deptno = e.deptno)

Delete from vac where sdate between to_date('15/12/2021', 'dd/mm/yyyy') and to_date('25/12/2021', 'dd/mm/yyyy');

Create view v1 as
Select empno from emp Where (sal in (select max(sal) from emp) or sal in (select max(sal) from emp 
Where sal not in (select max(sal) from emp ))) or (sal in (select min(sal) from emp) or
sal in (select min(sal) from emp Where sal not in (select min(sal) from emp ))) 

Create table Managers(
  mgr Number(6) constraint FK_MANAGER foreign key (mgr) References emp(empno),
  mdate Date Default(Trunc(sysdate, 'dd') = 1) constraint M_DATE not null,
  edate Date constraint E_DATE check(edate > mdate) 
);
select To_Char(sdate, 'dd/mm/yyyy') from vac;
SELECT * FROM EMP;
update vac set sdate = To_date('5/4/yyyy', 'dd/mm/yyyy') where To_Char(sdate, 'dd/mm') = '25/4';
SELECT * FROM USER_VIEWS;
SELECT * from V6;
DROP VIEW V6;
SELECT * FROM EMP WHERE (INSTR(ENAME,'M' ,1 ,3)<>0 AND INSTR(ENAME, 'M', 1, 4)==0) AND INSTR(ENAME, 'MM', 1, 1)==0
AND INSTR(ENAME, ' ', 1, 1)==0 AND (SAL < 2000 OR SAL > 4000) OR (JOB IS NULL AND DEPTNO IN (10, 20))
ORDER BY JOB, SAL;
SELECT * FROM EMP WHERE EMPNO IN (SELECT EMPNO FROM VAC WHERE TO_CHAR(SDATE, 'MM') IN (3, 7, 12) AND TO_CHAR(SDATE, 'YYYY') IN (2018, 2020));
SELECT ENAME, GRADE, JOB, SUM(EDATE - SDATE) TOTAL FROM EMP, VAC, SALGRADE 
WHERE EMP.EMPNO = VAC.EMPNO AND SAL BETWEEN LOSAL AND HISAL AND TO_CHAR(SDATE, 'YYYY') IN (2015, 2016)
GROUP BY ENAME, GRADE, JOB, TO_CHAR(SDATE, 'YYYY') 
HAVING SUM(EDATE - SDATE) > 20;
SELECT DEPTNO FROM EMP GROUP BY DEPTNO HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM EMP GROUP BY DEPTNO)
SELECT * FROM EMP WHERE (INSTR(ENAME, 'O', 1, 2) != 0 AND INSTR(ENAME, 'O', 1, 3) == 0 AND INSTR(ENAME, 'OO', 1, 1) == 0
OR INSTR(ENAME, 'I', 1, 2) != 0 AND INSTR(ENAME, 'I', 1, 3) == 0 AND INSTR(ENAME, 'II', 1, 1) == 0
OR INSTR(ENAME, 'E', 1, 2) != 0 AND INSTR(ENAME, 'E', 1, 3) == 0 AND INSTR(ENAME, 'EE', 1, 1) == 0
AND (SAL < 1200 OR SAL IS NULL)) OR ((DEPTNO IN (10, 20) AND JOB = 'PROG') OR SAL > 10000)
ORDER BY DEPTNO ASC, ENAME DESC;
SELECT * FROM EMP WHERE EMPNO NOT IN (SELECT EMPNO FROM VAC WHERE TO_CHAR(SDATE, 'YYYY') IN (2015, 2020));
SELECT JOB, COUNT(*), SUM(SAL), DEPTNO FROM EMP WHERE NOT (JOB IS NULL OR DEPTNO IS NULL)
GROUP BY JOB, DEPTNO HAVING COUNT(*) > 10 OR SUM(SAL) < 20000;
SELECT ENAME, JOB, EMP.EMPNO, DNAME, SUM(EDATE - SDATE) FROM EMP, DEPT, VAC 
WHERE EMP.DEPTNO = DEPT.DEPTNO AND EMP.EMPNO = VAC.EMPNO AND
TO_CHAR(SDATE, 'YYYY') BETWEEN 2015 AND 2020 
GROUP BY  ENAME, JOB, EMP.EMPNO, DNAME, TO_CHAR(SDATE, 'YYYY')
HAVING SUM(EDATE - SDATE) > 20
SELECT DNAME, DEPTNO FROM DEPT WHERE DEPTNO IN (SELECT DEPTNO FROM EMP GROUP BY DEPTNO
HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM EMP GROUP BY DEPTNO));
SELECT DNAME, DEPTNO FROM DEPT WHERE DEPTNO IN (SELECT DEPTNO FROM EMP GROUP BY DEPTNO
HAVING SUM(SAL) = (SELECT MAX(SUM(SAL)) FROM EMP GROUP BY DEPTNO));
SELECT  * FROM EMP WHERE LENGTH(ENAME) > 10 AND INSTR(ENAME, 'M', 1, 1) = 0 OR INSTR(ENAME, 'I', 1, 1) = 0
OR INSTR(ENAME, 'E', 1, 1) = 0 OR (DEPTNO IN (10, 20) AND SAL > 5000 AND COMM IS NULL OR (SAL < 2000 AND COMM > 1000))
SELECT * FROM EMP WHERE HIRE_DATE < (SELECT MIN(HIRE_DATE) FROM EMP WHERE ENAME = 'Steven')
OR HIRE_DATE < (SELECT MIN(HIRE_DATE) FROM EMP WHERE ENAME = 'Susan');
SELECT TO_CHAR(HIRE_DATE, 'YYYY') YEARS, SUM(SAL) TOTA, COUNT(*) NUM FROM EMP WHERE TO_CHAR(HIRE_DATE, 'MM') NOT IN (1, 4, 8)
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY') HAVING COUNT(*) < 20
ORDER BY YEARS, TOTA
DROP TABLE OLD_EMP
UPDATE EMP1 E SET SAL = DECODE(DEPTNO, 20, DECODE(JOB, 'PROG', SAL*1.15, SAL*1.1),
                      DECODE(JOB, 'PROG', SAL*1.15, SAL)) 
                      WHERE EMPNO NOT IN (SELECT MGR FROM EMP1) ;
SELECT * FROM EMP1;
UPDATE EMP1 SET DEPTNO = DECODE(JOB, 'DRIVER', DECODE(DEPTNO, 20, 30), 'CLERK', DECODE(DEPTNO, 10, 20, 20, 10, DEPTNO), DEPTNO)
SELECT SUM(SAL), COUNT(*) FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME = 'SMITH' AND JOB = 'SALESMAN'
AND SAL BETWEEN 2000 AND 4000) GROUP BY DEPTNO
SELECT JOB, SUM(SAL), COUNT(*) FROM EMP WHERE NOT(DEPTNO IS NULL AND SAL < 1000)
GROUP BY JOB ORDER BY SUM(SAL), COUNT(*)
SELECT * FROM EMP WHERE (INSTR(ENAME, 'A', 1, 1) <> 0 AND INSTR(ENAME, 'A', 1, 2) = 0
AND INSTR(ENAME, 'S', 1, 1) <> 0 AND INSTR(ENAME, 'S', 1, 2) = 0
AND INSTR(ENAME, 'M', 1, 1) <> 0 AND INSTR(ENAME, 'M', 1, 2) = 0
AND TO_CHAR(HIRE_DATE, 'MM') = 1 AND TO_CHAR(HIRE_DATE, 'YYYY') IN (1990, 1993))
OR (COMM IS NULL AND(DEPTNO = 10 OR JOB = 'CLERK'))
SELECT * FROM EMP WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'SMITH' AND DEPTNO IN (10, 20))
SELECT SUM(SAL), TO_CHAR(HIRE_DATE, 'YYYY') FROM EMP WHERE NOT(SAL < 5000 AND JOB = 'DRIVER')
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY') HAVING COUNT(*) = 20
ORDER BY AVG(SAL)
SELECT * FROM EMP WHERE (INSTR(ENAME, ' ', 1, 2) <> 0 AND INSTR(ENAME, ' ', 1, 3) = 0
AND (SAL > 2000 OR SAL < 5000) AND COMM IS NULL) OR (SUBSTR(ENAME, 1, 1) IN ('M', 'I', 'S') AND INSTR(ENAME, ' ',1 ,1) = 0
AND JOB IN ('DRIVER', 'CLERK'))
DROP VIEW V7

<-- سؤال الأول -->
CREATE VIEW V1 AS
SELECT DEPTNO ,COUNT(*) CNT, SUM(SAL) TOL FROM EMP GROUP BY DEPTNO;

CREATE VIEW V2 AS
SELECT MAX(CNT) MXCNT, MAX(TOL) MXTOL FROM V1

CREATE VIEW V3 AS
SELECT DEPTNO FROM EMP ,V2 GROUP BY DEPTNO HAVING COUNT(*) = MAX(MXCNT) OR SUM(SAL) = MAX(MXTOL);

CREATE VIEW V4 AS
SELECT ENAME FROM EMP, V3 WHERE EMP.DEPTNO = V3.DEPTNO

SELECT * FROM V4

<-- سؤال الثاني -->
CREATE TABLE NEWVAC(
    EMPNO NUMBER(6), CONSTRAINT VAC_FK FOREIGN KEY (EMPNO) REFERENCES EMP(EMPNO),
    SDATE DATE DEFAULT(TRUNC(SYSDATE, 'DD')) CONSTRAINT VAC_SDATE NOT NULL,
    EDATE DATE, CONSTRAINT VAC_EDATE CHECK(SDATE > EDATE)
)
ALTER TABLE NEMP DROP PRIMARY KEY CASCADE;

<-- سؤال الثالث -->
DELETE FROM VAC WHERE EMPNO IN (SELECT EMPNO FROM EMP, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL AND GRADE = 5)

UPDATE VAC SET SDATE = TO_DATE('5/4/YYYY', 'DD/MM/YYYY') WHERE TO_CHAR(SDATE, 'DD/MM') = '25/4'
UPDATE VAC SET SDATE = DECODE(SDATE, TO_DATE('25/4', 'DD/MM'), TO_DATE('5/4/YYYY', 'DD/MM/YYYY'))

CREATE VIEW V5 AS
SELECT * FROM EMP E WHERE 3 > (SELECT COUNT(DISTINCT SAL) FROM EMP WHERE SAL > E.SAL)

CREATE VIEW V6 AS
SELECT EMPNO, ENAME FROM V5;

SELECT * FROM V6

CREATE VIEW V7 AS
SELECT EMPNO ,TO_CHAR(SDATE, 'YYYY') YEARS, SUM(EDATE - SDATE) SUMDAY FROM VAC 
WHERE TO_CHAR(SDATE, 'YYYY') IN (SELECT TO_CHAR(SDATE, 'YYYY') FROM VAC WHERE EMPNO = 200)
GROUP BY  EMPNO ,TO_CHAR(SDATE, 'YYYY')

CREATE VIEW V8 AS
SELECT V.EMPNO FROM VAC V, V7 
WHERE V.EMPNO = V7.EMPNO GROUP BY V.EMPNO HAVING SUM(EDATE - SDATE) = (SELECT MAX(SUMDAY) FROM V7)

CREATE VIEW V9 AS
SELECT E.EMPNO, E.ENAME, SAL, YEARS, SUMDAY
FROM EMP E, V7, V8 WHERE E.EMPNO = V7.EMPNO AND E.EMPNO = V8.EMPNO

SELECT * FROM V9;

SELECT * FROM VAC
DROP TABLE NEWVAC
INSERT INTO VAC VALUES(TO_DATE('12/7/2013', 'DD/MM/YYYY'), TO_DATE('25/7/2014', 'DD/MM/YYYY'),200)
SELECT * FROM USER_VIEWS

ename like 'M%' or ename like 'I%' or ename like 'S%'
SUBSTR(ENAME, 1, 1) IN ('M', 'I', 'S')

SELECT * FROM EMP WHERE INSTR(ENAME, 'M', 1, 1) <> 0 AND INSTR(ENAME, 'S', 1, 1) <> 0 AND INSTR(ENAME, 'M', 1, 1) = 0
AND INSTR(ENAME, 'S', 1, 1) = 0 ;
SELECT * FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB = 'ENG' AND SAL > 1000
GROUP BY DEPTNO HAVING COUNT(*) > 10)
SELECT * FROM EMP WHERE (TO_CHAR(HIRE_DATE + 1, 'DD') = 1 OR TO_CHAR(HIRE_DATE + 2, 'DD') = 1 OR TO_CHAR(HIRE_DATE + 3, 'DD') = 1)
AND TO_CHAR(HIRE_DATE, 'YYYY') BETWEEN 2005 AND 2017
SELECT E.ENAME, E.SAL, M.ENAME, DM.DNAME FROM EMP E, EMP M, DEPT DM 
WHERE E.MGR = M.EMPNO(+) AND M.DEPTNO = DM.DEPTNO(+) AND E.HIRE_DATE BETWEEN
TO_DATE('1/1/2014', 'DD/MM/YYYY') AND TO_DATE('25/7/2016', 'DD/MM/YYYY')
SELECT ENAME, DNAME, GRADE FROM EMP, DEPT, SALGRADE WHERE EMP.DEPTNO = DEPT.DEPTNO(+) AND
SAL BETWEEN LOSAL(+) AND HISAL(+) AND (SAL IS NULL OR GRADE = 1 OR DNAME = 'ARCH')
SELECT ENAME, EMP.EMPNO FROM EMP, VAC WHERE EMP.EMPNO = VAC.EMPNO AND TO_CHAR(SDATE, 'YYYY') IN ('2016', '2017')
GROUP BY EMP.EMPNO, ENAME HAVING SUM(EDATE - SDATE) > 500
SELECT * FROM EMP E WHERE SAL < (SELECT AVG(SAL) FROM EMP WHERE DEPTNO = E.DEPTNO)
UPDATE EMP1 SET DEPTNO = DECODE(JOB, 'ENG', DECODE(DEPTNO, 20, 30, 30, 20, DEPTNO), 'PROG', DECODE(DEPTNO, 10, 20,DEPTNO))
SELECT ENAME FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM EMP GROUP BY DEPTNO 
HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM EMP GROUP BY DEPTNO))
CREATE TABLE NEWEMP(
    EMPNO NUMBER(3) CONSTRAINT PK_EMPNO PRIMARY KEY,
    ENAME VARCHAR(50) CONSTRAINT EN_EMPTY CHECK(SUBSTR(ENAME, 1, 1) != ' '),
    JOB CHAR(50) CONSTRAINT JOB_EMP CHECK(JOB = UPPER(JOB)),
    HIRE_DATE DATE DEFAULT(TRUNC(SYSDATE, 'DD')),
    DEPTNO NUMBER(4) CONSTRAINT FK_NEDEPTNO REFERENCES DEPT(DEPTNO)
)
DROP TABLE NEWEMP
CREATE SEQUENCE SQ1 
START WITH 20 MAXVALUE 300 INCREMENT BY 10 CYCLE MINVALUE 1 CACHE 3
CREATE VIEW V13 AS
SELECT ENAME , SUM(EDATE - SDATE) VCT, EMP.EMPNO, 1 A FROM EMP, VAC WHERE EMP.EMPNO = VAC.EMPNO GROUP BY ENAME, EMP.EMPNO
UNION
SELECT TO_CHAR(SDATE, 'YYYY'), SUM(EDATE - SDATE), EMPNO, 2 A FROM VAC GROUP BY TO_CHAR(SDATE, 'YYYY'), EMPNO
ORDER BY EMPNO, A
CREATE VIEW V14 AS
SELECT ENAME, VCT FROM V13
CREATE VIEW V15 AS
SELECT ENAME, EMPNO, EMP.DEPTNO, DNAME FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO
SELECT * FROM EMP WHERE (DEPTNO = 30 AND SAL BETWEEN 20000 AND 30000 AND JOB IN ('CLERK', 'DRIVER')) 
OR (SAL IS NULL AND (COMM BETWEEN 3500 AND 4000 OR COMM BETWEEN 1000 AND 1500))
SELECT * FROM NEWEMP WHERE  INSTR(ENAME, ' ', 1, 1) <> 0 AND INSTR(ENAME, ' ', 1, 3) = 0 
INSERT INTO NEWEMP(EMPNO,ENAME) VALUES(172,'A HMEDSDFSD F') 
CREATE TABLE NEWEMP(
    EMPNO NUMBER(3) CONSTRAINT PK_EMPNO PRIMARY KEY,
    ENAME VARCHAR(50),
    JOB CHAR(50) CONSTRAINT JOB_EMP CHECK(JOB = UPPER(JOB)),
    HIRE_DATE DATE DEFAULT(TRUNC(SYSDATE, 'DD')),
    DEPTNO NUMBER(4) CONSTRAINT FK_NEDEPTNO REFERENCES DEPT(DEPTNO)
)
CREATE VIEW V16 AS
SELECT EMP.* FROM EMP, VAC WHERE EMP.EMPNO = VAC.EMPNO AND TO_CHAR(SDATE, 'YYYY') IN ('2020', '2021')
GROUP BY EMP.EMPNO HAVING SUM(EDATE - SDATE) > 500

SELECT * FROM EMP, V16 WHERE EMP.EMPNO = V16.EMPNO

UPDATE VAC SET SDATE = TO_CHAR('04', 'MM') WHERE TO_CHAR(SDATE, 'MM') = '07'
UPDATE VAC SET SDATE = DECODE(SDATE,'DD/4/YYYY', TO_DATE('DD/3/YYYY'), '31/MM/YYYY', TO_DATE('30/MM/YYYY'), TO_DATE(SDATE, 'YYYY'))
SELECT TO_CHAR(SDATE, 'DD/MM/YYYY') FROM VAC

<-- 1 -->
SELECT * FROM EMP WHERE (INSTR(ENAME, 'M', 1, 1) = 0 AND INSTR(ENAME, 'M', 1, 2) <> 0 AND INSTR(ENAME, 'M', 1, 3) = 0 
OR INSTR(ENAME, ' ', 1, 1) <> 0 AND INSTR(ENAME, ' ', 1, 2) = 0) AND (SAL > 5000 OR SAL BETWEEN 1000 AND 2000);

<-- 2 -->
SELECT DNAME, SUM(SAL), COUNT(*) FROM EMP, DEPT WHERE EMP.DEPTNO(+) = DEPT.DEPTNO AND NOT (JOB = 'CLERK' OR SAL IS NULL) GROUP BY DNAME

<-- 3 -->
SELECT E.ENAME, M.ENAME, GRADE, M.SAL, DM.DNAME FROM EMP E, EMP M, DEPT DM, SALGRADE 
WHERE E.MGR = M.EMPNO AND M.DEPTNO = DM.DEPTNO AND M.SAL BETWEEN LOSAL AND HISAL

<-- 4 -->
UPDATE EMP1 SET SAL = DECODE(DEPTNO, 10, DECODE(JOB, 'PROG', SAL*1.15, 'CLERK', SAL*1.07, SAL*1.05),
20, DECODE(JOB, 'DRIVER', SAL*1.11, 'SALESMAN', SAL*1.15, SAL));

<-- 5 -->
CREATE VIEW V17 AS
SELECT EMPNO FROM VAC WHERE TO_CHAR(SDATE, 'YYYY') = 2022 GROUP BY EMPNO 
HAVING SUM(EDATE - SDATE) < 30 WITH CHECK OPTION
CREATE VIEW V18 AS
SELECT VAC.* FROM VAC, V17 WHERE VAC.EMPNO = V17.EMPNO

SELECT * FROM EMP WHERE (DEPTNO = 30 AND SAL BETWEEN 20000 AND 30000 AND JOB IN ('CLERK', 'DRIVER')) 
OR (SAL IS NULL AND (COMM BETWEEN 3500 AND 4000 OR COMM BETWEEN 1000 AND 1500))
SELECT EMPNO FROM VAC WHERE SDATE IN (SELECT MAX(SDATE) FROM VAC WHERE EMPNO = 3458)
SELECT ENAME FROM EMP WHERE TO_CHAR(HIRE_DATE, 'DD') >= 15 AND TO_CHAR(HIRE_DATE, 'MM') IN (5, 6, 9)
AND INSTR(ENAME, 'I', 1, 3) = 0 AND INSTR(ENAME, 'I', 1, 4) <> 0
SELECT DEPT.DEPTNO, DNAME, SUM(SAL), COUNT(*) FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO
GROUP BY DEPT.DEPTNO, DNAME HAVING DNAME = 'SALES' OR AVG(SAL) < 25000
SELECT E.ENAME, M.ENAME, M.SAL, DM.DNAME FROM EMP E, EMP M, DEPT DM WHERE E.MGR = M.EMPNO(+) 
AND M.DEPTNO = DM.DEPTNO(+) AND  (E.DEPTNO = 30 OR DNAME = 'SALES') 
SELECT ENAME, GRADE FROM EMP, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL AND (SAL IS NULL OR GRADE IN (4, 5))
SELECT ENAME, EMP.EMPNO FROM EMP, VAC WHERE EMP.EMPNO = VAC.EMPNO GROUP BY ENAME, EMP.EMPNO ,TO_CHAR(SDATE, 'YYYY')
HAVING SUM(EDATE - SDATE) > 30 AND TO_CHAR(SDATE, 'YYYY') = 2016 OR SUM(EDATE - SDATE) > 20 AND TO_CHAR(SDATE, 'YYYY') = 2017
SELECT DNAME FROM DEPT WHERE DEPTNO IN (SELECT DEPTNO FROM EMP GROUP BY DEPTNO, JOB 
HAVING COUNT(*) > 11 AND JOB = 'ANALYST' OR COUNT(*) > 6 AND JOB = 'PROG')
SELECT DNAME, D.DEPTNO FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO GROUP BY DNAME, D.DEPTNO 
HAVING COUNT(DECODE(JOB, 'ANALYST', 1, NULL)) > 11 OR COUNT(DECODE(JOB, 'PROG', 1, NULL)) > 6
DELETE FROM VAC WHERE EMPNO IN (SELECT EMPNO FROM EMP WHERE ENAME = SCOTT) AND SDATE BETWEEN TO_DATE('12/2/2013', 'DD/MM/YYYY') AND
TO_DATE('20/3/2013', 'DD/MM/YYYY')
UPDATE EMP1 SET SAL = DECODE(DEPTNO, 20, SAL*1.2, 30, SAL*1.13) WHERE DEPTNO IN (20,30)
CREATE TABLE VVAC(
    EMPNO NUMBER(5) CONSTRAINT EMPNO_NN NOT NULL CONSTRAINT FK_EMPNO_VAC REFERENCES EMP(EMPNO),
    SDATE DATE DEFAULT(TRUNC(SYSDATE, 'DD')),
    EDATE DATE, CONSTRAINT ES_DATE CHECK(EDATE > SDATE),
    CONSTRAINT DA_10 CHECK((EDATE - SDATE) <= 10)
)
DROP TABLE VVAC
CREATE SEQUENCE SQQ START WITH 26 MAXVALUE 250 INCREMENT BY 16 CYCLE MINVALUE 4 CACHE 3

CREATE VIEW V19 AS 
SELECT E.EMPNO FROM EMP E, VAC V WHERE E.EMPNO = V.EMPNO AND TO_CHAR(SDATE, 'YYYY') = 2017
GROUP BY E.EMPNO HAVING SUM(EDATE - SDATE) > 500

CREATE VIEW V20 AS 
SELECT ENAME FROM EMP, V19 WHERE EMP.EMPNO = V19.EMPNO

CREATE VIEW V21 AS 
SELECT EMPNO, SUM(EDATE - SDATE) SUMDAY FROM VAC WHERE TO_CHAR(SDATE, 'YYYY') = 2018
GROUP BY EMPNO
CREATE VIEW V22 AS 
SELECT DNAME, DEPT.DEPTNO, SUM(SAL) TOTALSAL FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO
GROUP BY DNAME, DEPT.DEPTNO
CREATE VIEW V23 AS 
SELECT E.ENAME, E.EMPNO, SUMDAY, DNAME, TOTALSAL FROM EMP E, V21, V22
WHERE E.EMPNO = V21.EMPNO AND E.DEPTNO = V22.DEPTNO
CREATE VIEW V24 AS 
SELECT DEPTNO FROM EMP GROUP BY DEPTNO HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM EMP GROUP BY DEPTNO) 
OR SUM(SAL) = (SELECT MAX(SUM(SAL)) FROM EMP GROUP BY DEPTNO)
CREATE VIEW V25 AS 
SELECT ENAME FROM EMP, V24 WHERE EMP.DEPTNO = V24.DEPTNO
SELECT * FROM EMP WHERE SUBSTR(ENAME, -1, 1) BETWEEN 'A' AND 'K' AND (SAL < 2000 OR SAL > 5000)
SELECT ENAME, EMPNO FROM EMP WHERE EMPNO IN (SELECT EMPNO FROM VAC WHERE SDATE 
BETWEEN TO_DATE('20/6/2018', 'DD/MM/YYYY') AND TO_DATE('30/8/2018', 'DD/MM/YYYY'))
SELECT SUM(SAL), COUNT(*), TO_CHAR(HIRE_DATE, 'YYYY') FROM EMP WHERE NOT (DEPTNO = 20 
OR JOB = 'DRIVER' OR COMM IS NULL) GROUP BY TO_CHAR(HIRE_DATE, 'YYYY')
SELECT ENAME, DNAME, GRADE FROM EMP, DEPT, SALGRADE WHERE EMP.DEPTNO = DEPT.DEPTNO(+) AND
SAL BETWEEN LOSAL(+) AND HISAL(+) AND (JOB = 'PROG' OR GRADE = 1)
SELECT ENAME, EMP.EMPNO, TO_CHAR(SDATE, 'YYYY'), SUM(EDATE - SDATE) FROM EMP, VAC
WHERE EMP.EMPNO = VAC.EMPNO AND TO_CHAR(SDATE, 'YYYY') IN (2013, 2017, 2018) 
GROUP BY ENAME, EMP.EMPNO, TO_CHAR(SDATE, 'YYYY')
SELECT E.ENAME, E.EMPNO, M.ENAME, DM.DNAME FROM EMP E, EMP M, DEPT DM 
WHERE E.MGR = M.EMPNO(+) AND M.DEPTNO = DM.DEPTNO(+) AND (E.SAL > 3000 OR E.DEPTNO IN (20, 10))
UPDATE EMP1 SET SAL = DECODE(DEPTNO, 10, DECODE(JOB, 'DRIVER', SAL*1.1, SAL*1.05),
30, DECODE(JOB, 'ENG', SAL+500, SAL+300), SAL*1.07)
UPDATE EMP1 SET SAL = COMM , COMM = SAL WHERE EMPNO BETWEEN 7844 AND 7866;
UPDATE EMP1 SET ENAME = SUBSTR(ENAME, -1, 1) || SUBSTR(ENAME, 2, LENGTH(ENAME)-2) ||
SUBSTR(ENAME, 1, 1) WHERE INSTR(ENAME, ' ', 1, 3) <> 0 AND INSTR(ENAME, ' ', 1, 4) = 0
UPDATE VAC SET SDATE = TO_DATE(SDATE, 'DD') || TO_DATE(SDATE, 'MM') || TO_DATE(SDATE, 'YY')
SELECT ENAME FROM EMP1
UPDATE EMP1 SET ENAME = 'HAZEM' WHERE ENAME = 'HM'
DELETE FROM VAC WHERE EMPNO IN (SELECT EMPNO FROM EMP WHERE ENAME = 'MARTIN' AND JOB = 'ENG') 
AND TO_CHAR(SDATE, 'MM') IN (4, 5, 6) AND TO_CHAR(SDATE, 'YYYY') IN (2017, 2018)
UPDATE VAC SET SDATE = ADD_MONTHS('5-JAN-2012', TO_CHAR(SYSDATE, 'YYYY') - TO_CHAR(SDATE, 'YYYY')) WHERE TO_CHAR(SDATE, 'YYYY') = 2011
SELECT TO_CHAR(SDATE, 'DD/MM/YYYY') FROM VAC
CREATE TABLE EMP2(
    EMPNO NUMBER(5) CONSTRAINT PK_EMPNO_EMP PRIMARY KEY,
    ENAME VARCHAR(50) CHECK(ENAME = UPPER(ENAME)),
    SAL NUMBER(7) , COMM NUMBER(3,2),CHECK(SAL IS NOT NULL AND COMM IS NULL OR SAL IS NULL AND COMM IS NOT NULL),
    JOB CHAR(10) NOT NULL,
    HIRE_DATE DATE DEFAULT(TO_DATE('1/1/2019', 'DD/MM/YYYY')),
    DEPTNO NUMBER(3) REFERENCES DEPT(DEPTNO)
)
CREATE SEQUENCE SQ START WITH 40 MINVALUE -40 INCREMENT BY 6 CYCLE MAXVALUE 50
SELECT * FROM EMP WHERE HIRE_DATE < (SELECT HIRE_DATE FROM EMP WHERE ENAME = 'Steven')
UPDATE EMP1 SET SAL = DECODE(DEPTNO, 20, SAL*1.1, DECODE(JOB, 'PROG', SAL*1.15))
SELECT * FROM EMP1
SELECT * FROM EMP WHERE (INSTR(ENAME, ' ', 2, 1) <> 0 AND INSTR(ENAME, ' ', 2, 2) = 0
AND (COMM IS NULL OR DEPTNO IS NULL)) OR (JOB = 'DRIVER' AND (DEPTNO = 20 AND SAL < 2000 OR DEPTNO IN (10, 30) AND SAL > 4000))
SELECT * FROM EMP WHERE TO_CHAR(HIRE_DATE, 'DD') > 24 AND TO_CHAR(HIRE_DATE, 'MM') = 12 AND TO_CHAR(HIRE_DATE, 'YYYY') BETWEEN 2016 AND 2019
SELECT * FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE TO_CHAR(HIRE_DATE, 'YYYY') = 2019 GROUP BY DEPTNO HAVING COUNT(*) > 10)
SELECT EMPNO, ENAME FROM EMP WHERE EMPNO NOT IN (SELECT EMPNO FROM VAC WHERE TO_CHAR(SDATE, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY'))
SELECT E.ENAME, E.SAL, M.ENAME, DM.DNAME FROM EMP E, EMP M, DEPT DM 
WHERE E.MGR = M.EMPNO(+) AND M.DEPTNO = DM.DEPTNO(+) AND (E.JOB = 'ANALYST' OR E.SAL > 10000)
SELECT E.ENAME, D.DNAME, GRADE FROM EMP E, DEPT D, SALGRADE
WHERE E.DEPTNO = D.DEPTNO AND E.SAL BETWEEN LOSAL(+) AND HISAL(+) AND (GRADE IN (1, NULL))
SELECT ENAME, EMP.EMPNO, TO_CHAR(SDATE, 'YYYY') FROM EMP, VAC WHERE EMP.EMPNO = VAC.EMPNO
GROUP BY ENAME, EMP.EMPNO,TO_CHAR(SDATE, 'YYYY') HAVING SUM(EDATE - SDATE) > 500
DELETE FROM NEWVAC WHERE EMPNO IN (SELECT EMPNO FROM EMP WHERE ENAME = 'SMITH' AND JOB = 'ENG' AND
HIRE_DATE BETWEEN TO_DATE('12/2/2019', 'DD/MM/YYYY') AND TO_DATE('20/3/2019', 'DD/MM/YYYY'))
DROP TABLE EMP1 CASCADE CONSTRAINT
UPDATE NEMP E SET SAL = SAL * 1.1 WHERE SAL < (SELECT AVG(SAL) FROM EMP WHERE DEPTNO = E.DEPTNO)
SELECT EMPNO, ENAME FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM EMP GROUP BY DEPTNO
HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM EMP GROUP BY DEPTNO))
CREATE TABLE EMP0(
    EMPNO NUMBER(3) CONSTRAINT PK_E PRIMARY KEY,
    ENAME VARCHAR(50) CONSTRAINT S_SPACE CHECK(SUBSTR(ENAME, 1, 1) != ' '),
    JOB CHAR(20) CONSTRAINT C_LETTER CHECK(JOB = UPPER(JOB)),
    HIRE_DATE DATE DEFAULT(TRUNC(SYSDATE, 'DD')),
    DEPTNO NUMBER(5) CONSTRAINT FK_D REFERENCES DEPT(DEPTNO) ON DELETE CASCADE
)
CREATE SEQUENCE SSQQ START WITH 25 MAXVALUE 300 INCREMENT BY 50 CYCLE MINVALUE 10
DROP TABLE EMP0
CREATE VIEW V1 AS
SELECT MAX(SAL) FIRSTSAL, DEPTNO FROM EMP GROUP BY DEPTNO
UNION
SELECT MAX(SAL) SECONDSAL, DEPTNO FROM EMP 
WHERE (SAL,DEPTNO) NOT IN (SELECT MAX(SAL) FIRSTSAL, DEPTNO FROM EMP GROUP BY DEPTNO) GROUP BY DEPTNO
SELECT * FROM EMP WHERE SAL IN (SELECT FIRSTSAL FROM V1)
CREATE VIEW V2 AS 
SELECT COUNT(*) CNT ,JOB FROM EMP GROUP BY JOB
SELECT ENAME, DNAME, EMP.JOB, CNT FROM EMP, V2, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO AND EMP.JOB = V2.JOB
CREATE VIEW V3 AS 
SELECT * FROM VAC WHERE (EDATE - SDATE) <= 10 AND SDATE < EDATE AND TO_CHAR(SDATE, 'YYYY') = TO_CHAR(EDATE, 'YYYY') WITH CHECK OPTION
SELECT * FROM EMP WHERE (INSTR(ENAME, ' ', 1, 2) <> 0 AND INSTR(ENAME, ' ', 1, 3) = 0 AND 
SAL BETWEEN 2000 AND 5000 AND COMM IS NULL) OR ((TO_DATE('2018/3/22', 'DD/MM/YYYY') - HIRE_DATE) > 20 AND (DEPTNO = 20 AND JOB = 'PROG' OR DEPTNO = 10 AND JOB = 'ENG'))
SELECT * FROM EMP WHERE DEPTNO IN
(SELECT DEPTNO FROM EMP WHERE TO_CHAR(HIRE_DATE, 'YYYY') = 2004 GROUP BY DEPTNO HAVING COUNT(*) > 6)
DROP VIEW V2
CREATE VIEW V1 AS
SELECT TO_CHAR(HIRE_DATE, 'YYYY') HIREYEAR, SUM(SAL) TOTAL, COUNT(*) CNT, TO_CHAR(HIRE_DATE, 'YYYY') SHIREYEAR , 1 A FROM EMP
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY')
UNION
SELECT ENAME, SAL, EMPNO, TO_CHAR(HIRE_DATE, 'YYYY') SHIREYEAR, 2 A  FROM EMP
ORDER BY SHIREYEAR, A
CREATE VIEW V1 AS 
SELECT COUNT(*) CNT, TO_CHAR(HIRE_DATE , 'YYYY') YEAR FROM EMP
GROUP BY TO_CHAR(HIRE_DATE , 'YYYY'); 
CREATE VIEW V2 AS
SELECT SUM(SAL) SLARY , DEPTNO FROM EMP 
GROUP BY DEPTNO
CREATE VIEW V3 AS
SELECT ENAME , EMPNO , DNAME , SLARY , CNT FROM EMP E , DEPT D ,V1 , V2 
WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO = V2.DEPTNO AND TO_CHAR(HIRE_DATE , 'YYYY') = V1.YEAR
DROP VIEW V3
CREATE VIEW V3 AS
SELECT E.EMPNO , SUM(EDATE - SDATE) SUMDAY FROM EMP E , VAC V 
WHERE E.EMPNO = V.EMPNO AND TO_CHAR(SDATE , 'YYYY') = 2012
GROUP BY E.EMPNO , TO_CHAR(SDATE , 'YYYY')
HAVING SUM(EDATE - SDATE) > 700
SELECT ENAME FROM EMP , V3 WHERE EMP.EMPNO = V3.EMPNO
SELECT * FROM EMP
SELECT ENAME FROM EMP WHERE DEPTNO IN(SELECT DEPTNO FROM EMP WHERE ENAME = 'Steven')
SELECT ENAME, SAL, DEPTNO, 1 A FROM EMP
UNION
SELECT DNAME, SUM(SAL), EMP.DEPTNO, 2 A FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO GROUP BY DNAME, EMP.DEPTNO
ORDER BY DEPTNO, A
CREATE VIEW V1 AS
SELECT DEPTNO, SUM(SAL) TOTAL, TO_CHAR(HIRE_DATE, 'YYYY') YE FROM EMP GROUP BY DEPTNO ,YE
SELECT ENAME, EMPNO, DNAME, TOTAL, CNT FROM EMP , DEPT,V1 WHERE EMP.DEPTNO = DEPT.DEPTNO AND EMP.DEPTNO = V1.DEPTNO AND DEPT.DEPTNO = V1.DEPTNO
DROP VIEW V1
SELECT DNAME, DEPTNO FROM DEPT WHERE DEPTNO NOT IN (SELECT DEPTNO FROM EMP WHERE DEPTNO IS NOT NULL)
CREATE VIEW V1 AS
SELECT DEPTNO, SUM(SAL) TOTSAL, COUNT(*) CNT FROM EMP GROUP BY DEPTNO;
CREATE VIEW V2 AS
SELECT ENAME, EMPNO, DNAME, TOTSAL, CNT FROM EMP, DEPT, V1 WHERE EMP.DEPTNO = DEPT.DEPTNO AND EMP.DEPTNO = V1.DEPTNO;
SELECT * FROM V2;
SELECT * FROM EMP WHERE DEPTNO = 40
SELECT ENMAE FROM EMP WHERE DEPTNO IN (SELECT MAX(COUNT(*)) FROM EMP)
CREATE VIEW V1 AS
SELECT DEPTNO , COUNT(*) MXCNT FROM EMP GROUP BY DEPTNO
 HERE ((TO_DATE('12/11/2018', 'DD/MM/YYYY') - TO_DATE(HIRE_DATE, 'DD/MM/YYYY'))/365) > 20
SELECT * FROM EMP WHERE ((TO_DATE('12/11/2018', 'DD/MM/YYYY') - HIRE_DATE)/365) > 20
CREATE VIEW V1 AS
SELECT EMPNO FROM VAC WHERE TO_CHAR(SDATE, 'YYYY') = 2022 GROUP BY EMPNO HAVING SUM(EDATE - SDATE) > 30 WITH CHECK OPTION
CREATE VIEW V2 AS
SELECT VAC.* FROM VAC, V1 WHERE VAC.EMPNO = V1.EMPNO
SELECT * FROM VAC
DROP VIEW V3
CREATE VIEW V1 AS
SELECT * FROM VAC WHERE TO_CHAR(SDATE, 'YYYY') IN (SELECT TO_CHAR(SDATE, 'YYYY') FROM VAC WHERE EMPNO = 200)
SELECT TO_CHAR(SDATE, 'YYYY') FROM VAC WHERE EMPNO = 200
SELECT TO_CHAR(SDATE, 'YYYY') FROM VAC WHERE GROUP BY TO_CHAR(SDATE, 'YYYY') HAVING SUM(EDATE - SDATE) = (SELECT MAX(SUM(EDATE - SDATE)) FROM VAC GROUP BY TO_CHAR(SDATE, 'YYYY')) 
CREATE VIEW V2 AS
SELECT E.EMPNO, ENAME, SAL, SUM(EDATE - SDATE), TO_CHAR(SDATE, 'YYYY') FROM EMP E, V1 V WHERE E.EMPNO = V.EMPNO
GROUP BY E.EMPNO, ENAME, SAL,TO_CHAR(SDATE, 'YYYY')
HAVING SUM(EDATE - SDATE) = (SELECT MAX(SUM(EDATE - SDATE)) FROM V1 WHERE  GROUP BY TO_CHAR(SDATE, 'YYYY'))
CREATE VIEW V1 AS
SELECT EMP.EMPNO, ENAME, SAL, SUM(EDATE - SDATE) SUMDAY, TO_CHAR(SDATE, 'YYYY') YEARS FROM EMP, VAC 
WHERE EMP.EMPNO = 200
GROUP BY EMP.EMPNO, ENAME, SAL,TO_CHAR(SDATE, 'YYYY')
HAVING SUM(EDATE - SDATE) = (SELECT MAX(SUM(EDATE - SDATE)) FROM VAC 
WHERE TO_CHAR(SDATE, 'YYYY') IN (SELECT TO_CHAR(SDATE, 'YYYY') FROM VAC 
WHERE EMPNO = 200) GROUP BY TO_CHAR(SDATE, 'YYYY'));
CREATE VIEW V1 AS
SELECT DEPTNO, SUM(SAL) TOTAL FROM EMP GROUP BY DEPTNO
CREATE VIEW V2 AS
SELECT TO_CHAR(HIRE_DATE, 'YYYY') HIREYEAR, COUNT(*) CNT FROM EMP GROUP BY TO_CHAR(HIRE_DATE, 'YYYY')
CREATE VIEW V3 AS
SELECT ENAME, EMPNO, DNAME, TOTAL, HIREYEAR FROM EMP, DEPT, V1, V2 WHERE EMP.DEPTNO = DEPT.DEPTNO AND EMP.DEPTNO = V1.DEPTNO
AND TO_CHAR(HIRE_DATE, 'YYYY') = HIREYEAR
CREATE VIEW V1 AS
SELECT ENAME FROM EMP, VAC WHERE EMP.EMPNO = VAC.EMPNO AND TO_CHAR(SDATE, 'YYYY') = 2012 GROUP BY ENAME HAVING SUM(EDATE - SDATE) > 500
CREATE VIEW V1 AS
SELECT EMPNO, SUM(EDATE - SDATE) DAYTOTAL FROM VAC WHERE TO_CHAR(SDATE, 'YYYY') = 2012 GROUP BY EMPNO
CREATE VIEW V2 AS
SELECT DNAME, EMP.DEPTNO, SUM(SAL) SALTOTAL FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO GROUP BY DNAME, EMP.DEPTNO
CREATE VIEW V3 AS
SELECT ENAME, EMP.EMPNO, DAYTOTAL, DNAME, SALTOTAL FROM EMP, V1, V2 WHERE EMP.EMPNO = V1.EMPNO AND EMP.DEPTNO = V2.DEPTNO
DROP VIEW V1
CREATE VIEW V1 AS
SELECT DEPTNO FROM EMP GROUP BY DEPTNO HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM EMP GROUP BY DEPTNO)
OR SUM(SAL) = (SELECT MAX(SUM(SAL)) FROM EMP GROUP BY DEPTNO)
CREATE VIEW V2 AS
SELECT ENAME FROM EMP, V1 WHERE EMP.DEPTNO = V1.DEPTNO
CREATE VIEW V1 AS
SELECT EMPNO FROM VAC GROUP BY EMPNO HAVING SUM(EDATE - SDATE) <= 30 
CREATE VIEW V2 AS
SELECT VAC.* FROM VAC, V1 WHERE VAC.EMPNO = V1.EMPNO
SELECT * FROM VAC WHERE (EDATE - SDATE) >= 30
INSERT INTO VAC VALUES('23-JUL-13', '12-DEC-14', 197)
CREATE VIEW V1 AS
SELECT TO_CHAR(SDATE, 'YYYY') SDAYEAR, SUM(EDATE - SDATE) MXSUMDAY FROM VAC WHERE EMPNO = 200 GROUP BY TO_CHAR(SDATE, 'YYYY') 
CREATE VIEW V2 AS
SELECT EMP.EMPNO, ENAME, SAL, SUM(EDATE - SDATE) DAYSUM, TO_CHAR(SDATE, 'YYYY') FROM EMP, VAC ,V1
WHERE EMP.EMPNO = VAC.EMPNO AND TO_CHAR(SDATE, 'YYYY') = V1.SDAYEAR GROUP BY EMP.EMPNO, ENAME, SAL,TO_CHAR(SDATE, 'YYYY')
CREATE VIEW V1 AS
SELECT ENAME, EMPNO, SAL FROM EMP E WHERE 3 > (SELECT COUNT(SAL) FROM EMP WHERE SAL > E.SAL)
DROP VIEW V1
CREATE VIEW V1 AS
SELECT DEPTNO, SAL FROM EMP E WHERE 1 > (SELECT COUNT(DISTINCT SAL) FROM EMP WHERE SAL > E.SAL)
SELECT * FROM EMP WHERE (DEPTNO,SAL) IN (SELECT DEPTNO,SAL FROM V1)
CREATE VIEW V1 AS
SELECT JOB, COUNT(*) CNT FROM EMP GROUP BY JOB
CREATE VIEW V2 AS
SELECT ENAME, DNAME, E.JOB, CNT FROM EMP E, DEPT D, V1 WHERE  E.DEPTNO = D.DEPTNO AND E.JOB = V1.JOB
SELECT SUM(DECODE(DEPTNO, 50, SAL,NULL)) FROM EMP 
CREATE OR REPLACE VIEW V1 AS
SELECT * FROM VAC WHERE (EDATE - SDATE) <= 10 AND SDATE < EDATE AND TO_CHAR(SDATE, 'YYYY') = TO_CHAR(EDATE, 'YYYY')
DROP VIEW V1
ALTER TABLE DDD DROP PRIMARY KEY CASCADE
CREATE TABLE DDD(DEP NUMBER(3) CONSTRAINT PKDD PRIMARY KEY )
DROP TABLE DDD
SELECT SUM(DECODE(DEPTNO, 10, SAL)) SUM10, SUM(DECODE(DEPTNO, 20, SAL)) SUM20 FROM EMP
SELECT E.* FROM EMP E, EMP M WHERE E.MGR = M.EMPNO AND SUBSTR(M.ENAME, 1, 1) = SUBSTR(M.ENAME, -1, 1)
AND SUBSTR(E.ENAME, 1, 1) = SUBSTR(M.ENAME, -1, 1);
SELECT SAL FROM EMP WHERE SAL = (SELECT MAX(SAL) FROM EMP) 
OR SAL = (SELECT MAX(SAL) FROM EMP WHERE SAL != (SELECT MAX(SAL) FROM EMP)) 
OR SAL = (SELECT MAX(SAL) FROM EMP WHERE SAL != (SELECT MAX(SAL) FROM EMP) AND
SAL != (SELECT MAX(SAL) FROM EMP WHERE SAL != (SELECT MAX(SAL) FROM EMP) )) 
INSERT INTO EMP VALUES(999, 'AHMED', 'DELWAN', 'KING86370', '789.456.1231', '25-JUN-01', 'SH_CLERK', 18000, NULL, 124, 80)
SELECT * FROM EMP
CREATE VIEW V1 AS
SELECT EMPNO, TO_CHAR(SDATE, 'YYYY') SDYEAR, SUM(EDATE - SDATE) VACTOT FROM VAC
WHERE TO_CHAR(SDATE, 'YYYY') IN (2012, 2013) GROUP BY EMPNO, TO_CHAR(SDATE, 'YYYY')
CREATE VIEW V2 AS
SELECT EMPNO FROM V1 WHERE (VACTOT,SDYEAR) IN (SELECT MAX(VACTOT), SDYEAR FROM V1 GROUP BY SDYEAR)
CREATE VIEW V3 AS
SELECT EMP.* FROM EMP, V2 WHERE EMP.EMPNO = V2.EMPNO
SELECT * FROM EMP WHERE MGR IS NULL
DROP VIEW V2
CREATE VIEW V1 AS
SELECT EMPNO, ENAME, SAL FROM EMP E WHERE SAL IN (SELECT SAL FROM EMP WHERE 3 > (SELECT COUNT(DISTINCT SAL) FROM EMP WHERE SAL > E.SAL)) ;
CREATE VIEW V2 AS
SELECT EMP.EMPNO, ENAME FROM EMP, V1 WHERE EMP.EMPNO = V1.EMPNO;
SELECT * FROM V2;
SELECT TO_CHAR(SDATE, 'DD/MM/YYYY'), TO_CHAR(EDATE, 'DD/MM/YYYY') FROM VAC
TO_DATE('TO_CHAR(SDATE, YYYY)', 'YYYY')
UPDATE VAC SET EDATE = EDATE + (EDATE - SDATE), SDATE = TO_DATE('4/5/'||TO_CHAR(SDATE, 'YYYY'), 'DD/MM/YYYY')
WHERE TO_CHAR(SDATE, 'DD') = 25 AND TO_CHAR(SDATE, 'MM') = 4

UPDATE VAC SET SDATE = DECODE(TO_CHAR(SDATE,'DD'), 31, TO_DATE('30/3/2020', 'DD/MM/YYYY'), TO_DATE(
TO_CHAR(SDATE, 'DD'||'/4/2020'),'DD/MM/YYYY')) WHERE TO_CHAR(SDATE, 'MM') = 5 AND
TO_CHAR(SDATE, 'YYYY') = 2020
SELECT EMPNO FROM VAC WHERE TO_CHAR(SDATE, 'YYYY') = 2020 AND TO_CHAR(SDATE, 'MM') = 4 AND TO_CHAR(SDATE, 'DD') BETWEEN 1 AND 30
INSERT INTO DEPT1(DEPTNO, DNAME) SELECT DEPTNO, DNAME FROM DEPT
INSERT INTO NEMP(EMPNO, ENAME)
SELECT COUNT(EMPNO) FROM VAC WHERE TO_DATE('2/5/2014', 'DD/MM/YYYY') BETWEEN SDATE AND EDATE
DROP VIEW V2
CREATE VIEW V1 AS
SELECT EMPNO, ENAME, SAL, TO_CHAR(HIRE_DATE, 'YYYY') YEAR FROM EMP
CREATE VIEW V2 AS
SELECT YEAR, SUM(SAL) SUMSAL, COUNT(EMPNO) CNT, YEAR SORTYEAR, 1 A FROM V1 GROUP BY YEAR
UNION
SELECT ENAME, SAL, EMPNO, YEAR, 2 A FROM V1
ORDER BY SORTYEAR, A
CREATE VIEW V3 AS SELECT YEAR, SUMSAL, CNT FROM V2
SELECT TO_CHAR(HIRE_DATE, 'DD/MM/YYYY') FROM EMP WHERE TO_CHAR(HIRE_DATE, 'DD/MM/YYYY') = '21/06/2007'
SELECT * FROM SESSION_PRIVS
SELECT * FROM EMP 
GRANT INSERT ON HR.EMP TO Ahmed WITH GRANT OPTION
SELECT * FROM Ahmed.XX_EMP
UPDATE Ahmed.XX_EMP SET ENAME = 'SCOTT'
SELECT * FROM USER_COL_PRIVS_RECD 
SELECT * FROM USER_TABLES
SELECT * FROM USER_COL_PRIVS_MADE
REVOKE INSERT ON EMP FROM Ahmed

CREATE ROLE TUSYS;
SELECT * FROM USER_SYS_PRIVS;

GRANT CREATE TABLE TO TUSYS
REVOKE CREATE TABLE,  FROM AHMED

GRANT TUSYS TO AHMED
REVOKE TUSYS FROM AHMED
DROP ROLE TUSYS
SET SERVEROUTPUT ON
BEGIN
DBMS_OUTPUT.PUT_LINE('MY FIRST');
END;
/
SET SERVEROUTPUT ON
BEGIN
DBMS_OUTPUT.PUT_LINE('Ahmed Delwan');
DBMS_OUTPUT.PUT_LINE('Programming');
END;
/
SET SERVEROUTPUT ON
DECLARE
BEGIN
DBMS_OUTPUT.PUT_LINE('HELLO WORLD');
END;
/
SET SERVEROUTPUT ON
DECLARE
N NUMBER DEFAULT 5;
A VARCHAR2(50) DEFAULT 'HELLO WORLD';
BEGIN
DBMS_OUTPUT.PUT_LINE(N);
DBMS_OUTPUT.PUT_LINE(A);
DBMS_OUTPUT.PUT_LINE(N || ' ' || A);
END;
@E:\Workout\Oracle\Ahmed.sql

SET SERVEROUTPUT ON
DECLARE
V_DATE DATE;
V_NO NUMBER := 10;
V_NAME VARCHAR2(50) NOT NULL := 'AHMED';
BEGIN
DBMS_OUTPUT.PUT_LINE(V_DATE);
DBMS_OUTPUT.PUT_LINE(V_NO);
DBMS_OUTPUT.PUT_LINE(V_NAME);
V_DATE := '10-MAY-2012';
V_NO := V_NO + 10;
V_NAME := 'KHALED';
DBMS_OUTPUT.PUT_LINE(V_DATE);
DBMS_OUTPUT.PUT_LINE(V_NO);
DBMS_OUTPUT.PUT_LINE(V_NAME);
END;
/
SET SERVEROUTPUT ON
DECLARE
V_DATE DATE := SYSDATE;
V_NO NUMBER := 10 * 2;
V_PI CONSTANT NUMBER := 3.14;
BEGIN
DBMS_OUTPUT.PUT_LINE(V_DATE);
DBMS_OUTPUT.PUT_LINE(V_NO);
DBMS_OUTPUT.PUT_LINE(V_PI);
V_DATE := V_DATE + 10;
DBMS_OUTPUT.PUT_LINE(V_DATE);
V_NO := V_NO * 20;
DBMS_OUTPUT.PUT_LINE(V_NO);
END;
SET SERVEROUTPUT ON
BEGIN
DBMS_OUTPUT.PUT_LINE('Father''s day');
DBMS_OUTPUT.PUT_LINE(Q'XFather'''''''s dayX');
END;
SELECT Q'XAHMEDX' FROM DUAL
SET SERVEROUTPUT ON
DECLARE
V_EMPNO NUMBER(5) := 10;
V_ENAME VARCHAR2(50) := 'AHMED';
V_SAL EMP.SAL%TYPE;
V_HIRE INTERVAL YEAR TO MONTH;
V_EMPNO1 V_EMPNO%TYPE;
BEGIN
DBMS_OUTPUT.PUT_LINE(V_EMPNO);
DBMS_OUTPUT.PUT_LINE(V_ENAME);
V_SAL := 50;
DBMS_OUTPUT.PUT_LINE(V_SAL);
V_HIRE := '1-3';
DBMS_OUTPUT.PUT_LINE(V_HIRE);
DBMS_OUTPUT.PUT_LINE(V_EMPNO1);
END;
/
SET SERVEROUTPUT ON
DECLARE
FLAG BOOLEAN;
V_NO NUMBER := 2;
V_NO1 NUMBER := 20;
V_PRINT VARCHAR2(100);
BEGIN
FLAG := FALSE;
IF V_NO = V_NO1 THEN
FLAG := TRUE;
V_PRINT := 'THE NUMBERS EQUALS';
ELSE
V_PRINT := 'THE NUMBERS NOT EQUALS';
END IF;
IF FLAG = TRUE THEN
DBMS_OUTPUT.PUT_LINE(V_PRINT);
ELSE
DBMS_OUTPUT.PUT_LINE(V_PRINT);
END IF;
END;
/
SET SERVEROUTPUT ON
SET AUTOPRINT ON
BEGIN
SELECT SAL INTO :V_SAL FROM EMP WHERE EMPNO = 198;
END;
PRINT V_SAL;
SET SERVEROUTPUT ON
DECLARE
V_EMPNO EMP.EMPNO%TYPE;
V_ENAME EMP.ENAME%TYPE;
"HIRE DATE" EMP.HIRE_DATE%TYPE;
BEGIN
SELECT EMPNO, ENAME, HIRE_DATE INTO 
V_EMPNO, V_ENAME, "HIRE DATE" FROM EMP WHERE EMPNO = 100;
V_EMPNO := 101;
DBMS_OUTPUT.PUT_LINE(V_EMPNO);
DBMS_OUTPUT.PUT_LINE(V_ENAME);
DBMS_OUTPUT.PUT_LINE("HIRE DATE");
END;
/
SET SERVEROUTPUT ON
DECLARE
V_SAL NEMP.SAL%TYPE;
V_SAL1 NEMP.SAL%TYPE;
BEGIN
SELECT SAL, SAL INTO V_SAL, V_SAL1 FROM NEMP WHERE EMPNO = 7000;
DBMS_OUTPUT.PUT_LINE(V_SAL);
V_SAL := V_SAL + 100;
UPDATE NEMP SET SAL = DECODE(EMPNO, 7000, V_SAL);
DBMS_OUTPUT.PUT_LINE(V_SAL);
DBMS_OUTPUT.PUT_LINE(V_SAL1);
--INSERT INTO NEMP(DEPTNO) VALUES(1);
END;
SELECT * FROM NEMP
SET SERVEROUTPUT ON
DECLARE
V_ROW NUMBER := 0;
BEGIN
UPDATE NEMP SET SAL = SAL + 100;
V_ROW := SQL%ROWCOUNT;
DBMS_OUTPUT.PUT_LINE('SELECTED IS ROWS ' || V_ROW);
END;
SET SERVEROUTPUT ON
DECLARE
V_CHECK BOOLEAN := TRUE;
BEGIN
UPDATE NEMP SET SAL = SAL + 100;
V_CHECK := SQL%FOUND;
IF V_CHECK = FALSE THEN
DBMS_OUTPUT.PUT_LINE('SELECTED IS NOT ROWS ');
ELSE
DBMS_OUTPUT.PUT_LINE('SELECTED IS ROWS ' || SQL%ROWCOUNT);
END IF;
END;
SET SERVEROUTPUT ON
DECLARE
V_NO NUMBER := &V;
BEGIN
IF V_NO >= 10 THEN
DBMS_OUTPUT.PUT_LINE('TO NUMBER '|| V_NO ||' >= 10');
ELSE
DBMS_OUTPUT.PUT_LINE('TO NUMBER '|| V_NO ||' <= 10');
END IF;
END;
SET SERVEROUTPUT ON
DECLARE
V_NO NUMBER := &V;
BEGIN
IF V_NO BETWEEN 0 AND 100 THEN
    IF V_NO BETWEEN 90 AND 100 THEN
    DBMS_OUTPUT.PUT_LINE('NUMBER A');
    UPDATE NEMP SET EMPNO = 8000 WHERE EMPNO IS NULL;
    DBMS_OUTPUT.PUT_LINE('UPDATED DONE ' || SQL%ROWCOUNT);
    ELSIF V_NO BETWEEN 80 AND 89 THEN
    DBMS_OUTPUT.PUT_LINE('NUMBER B');
    UPDATE NEMP SET SAL = SAL + V_NO;
    DBMS_OUTPUT.PUT_LINE('UPDATED DONE ' || SQL%ROWCOUNT);
    ELSIF V_NO BETWEEN 70 AND 79 THEN
    DBMS_OUTPUT.PUT_LINE('NUMBER C');
    UPDATE NEMP SET SAL = SAL + V_NO;
    DBMS_OUTPUT.PUT_LINE('UPDATED DONE ' || SQL%ROWCOUNT);
    ELSIF V_NO BETWEEN 60 AND 69 THEN
    DBMS_OUTPUT.PUT_LINE('NUMBER D');
    UPDATE NEMP SET SAL = SAL + V_NO;
    DBMS_OUTPUT.PUT_LINE('UPDATED DONE ' || SQL%ROWCOUNT);
    ELSE
    DBMS_OUTPUT.PUT_LINE('NUMBER F');
    UPDATE NEMP SET SAL = SAL + V_NO;
    DBMS_OUTPUT.PUT_LINE('UPDATED DONE ' || SQL%ROWCOUNT);
    END IF;
ELSE
    DBMS_OUTPUT.PUT_LINE('INPUT NUMBER BETWEEN 0 AND 10');
END IF;
END;
ROLLBACK;
SELECT * FROM NEMP
CREATE TABLE regions (
	region_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	region_name VARCHAR2 (25) DEFAULT NULL
);

CREATE TABLE countries (
	country_id CHAR (2) PRIMARY KEY,
	country_name VARCHAR2 (40) DEFAULT NULL,
	region_id NUMBER NOT NULL,
	FOREIGN KEY (region_id) REFERENCES regions (region_id) ON DELETE CASCADE
);

CREATE TABLE locations (
	location_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	street_address VARCHAR2 (40) DEFAULT NULL,
	postal_code VARCHAR2 (12) DEFAULT NULL,
	city VARCHAR2 (30) NOT NULL,
	state_province VARCHAR2 (25) DEFAULT NULL,
	country_id CHAR (2) NOT NULL,
	FOREIGN KEY (country_id) REFERENCES countries (country_id) ON DELETE CASCADE
);

CREATE TABLE jobs (
	job_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	job_title VARCHAR2 (35) NOT NULL,
	min_salary NUMBER (8, 2) DEFAULT NULL,
	max_salary NUMBER (8, 2) DEFAULT NULL
);

CREATE TABLE departments (
	department_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	department_name VARCHAR2 (30) NOT NULL,
	location_id NUMBER DEFAULT NULL,
	FOREIGN KEY (location_id) REFERENCES locations (location_id) ON DELETE CASCADE
);

CREATE TABLE employees (
	employee_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	first_name VARCHAR2 (20) DEFAULT NULL,
	last_name VARCHAR2 (25) NOT NULL,
	email VARCHAR2 (100) NOT NULL,
	phone_number VARCHAR2 (20) DEFAULT NULL,
	hire_date DATE NOT NULL,
	job_id NUMBER NOT NULL,
	salary NUMBER (8, 2) NOT NULL,
	manager_id NUMBER DEFAULT NULL,
	department_id NUMBER DEFAULT NULL,
	FOREIGN KEY (job_id) REFERENCES jobs (job_id) ON DELETE CASCADE,
	FOREIGN KEY (department_id) REFERENCES departments (department_id) ON DELETE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES employees (employee_id)
);

CREATE TABLE dependents (
	dependent_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	first_name VARCHAR2 (50) NOT NULL,
	last_name VARCHAR2 (50) NOT NULL,
	relationship VARCHAR2 (25) NOT NULL,
	employee_id NUMBER NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE
);
SELECT * FROM SESSION_PRIVS
/*Data for the table regions*/
INSERT INTO regions(region_id,region_name) VALUES (1,'Europe');
INSERT INTO regions(region_id,region_name) VALUES (2,'Americas');
INSERT INTO regions(region_id,region_name) VALUES (3,'Asia');
INSERT INTO regions(region_id,region_name) VALUES (4,'Middle East and Africa');
 
 
/*Data for the table countries */
INSERT INTO countries(country_id,country_name,region_id) VALUES ('AR','Argentina',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('AU','Australia',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('BE','Belgium',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('BR','Brazil',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CA','Canada',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CH','Switzerland',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CN','China',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('DE','Germany',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('DK','Denmark',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('EG','Egypt',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('FR','France',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('HK','HongKong',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IL','Israel',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IN','India',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IT','Italy',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('JP','Japan',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('KW','Kuwait',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('MX','Mexico',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('NG','Nigeria',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('NL','Netherlands',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('SG','Singapore',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('UK','United Kingdom',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('US','United States of America',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('ZM','Zambia',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('ZW','Zimbabwe',4);
 
/*Data for the table locations */
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (2400,'8204 Arthur St',NULL,'London',NULL,'UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');
 
 
/*Data for the table jobs */
 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (1,'Public Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (2,'Accounting Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (3,'Administration Assistant',3000.00,6000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (4,'President',20000.00,40000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (5,'Administration Vice President',15000.00,30000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (6,'Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (7,'Finance Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (8,'Human Resources Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (9,'Programmer',4000.00,10000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (10,'Marketing Manager',9000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (11,'Marketing Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (12,'Public Relations Representative',4500.00,10500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (13,'Purchasing Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (14,'Purchasing Manager',8000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (15,'Sales Manager',10000.00,20000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (16,'Sales Representative',6000.00,12000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (17,'Shipping Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (18,'Stock Clerk',2000.00,5000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (19,'Stock Manager',5500.00,8500.00);
 
 
/*Data for the table departments */
 
INSERT INTO departments(department_id,department_name,location_id) VALUES (1,'Administration',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (2,'Marketing',1800);
INSERT INTO departments(department_id,department_name,location_id) VALUES (3,'Purchasing',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (4,'Human Resources',2400);
INSERT INTO departments(department_id,department_name,location_id) VALUES (5,'Shipping',1500);
INSERT INTO departments(department_id,department_name,location_id) VALUES (6,'IT',1400);
INSERT INTO departments(department_id,department_name,location_id) VALUES (7,'Public Relations',2700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (8,'Sales',2500);
INSERT INTO departments(department_id,department_name,location_id) VALUES (9,'Executive',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (10,'Finance',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (11,'Accounting',1700);
 
 
 
/*Data for the table employees */
 
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (100,'Steven','King','steven.king@sqltutorial.org','515.123.4567',DATE '1987-06-17',4,24000.00,NULL,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (101,'Neena','Kochhar','neena.kochhar@sqltutorial.org','515.123.4568',DATE '1989-09-21',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (102,'Lex','De Haan','lex.de haan@sqltutorial.org','515.123.4569',DATE '1993-01-13',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (103,'Alexander','Hunold','alexander.hunold@sqltutorial.org','590.423.4567',DATE '1990-01-03',9,9000.00,102,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (104,'Bruce','Ernst','bruce.ernst@sqltutorial.org','590.423.4568',DATE '1991-05-21',9,6000.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (105,'David','Austin','david.austin@sqltutorial.org','590.423.4569',DATE '1997-06-25',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (106,'Valli','Pataballa','valli.pataballa@sqltutorial.org','590.423.4560',DATE '1998-02-05',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (107,'Diana','Lorentz','diana.lorentz@sqltutorial.org','590.423.5567',DATE '1999-02-07',9,4200.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (108,'Nancy','Greenberg','nancy.greenberg@sqltutorial.org','515.124.4569',DATE '1994-08-17',7,12000.00,101,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (109,'Daniel','Faviet','daniel.faviet@sqltutorial.org','515.124.4169',DATE '1994-08-16',6,9000.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (110,'John','Chen','john.chen@sqltutorial.org','515.124.4269',DATE '1997-09-28',6,8200.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (111,'Ismael','Sciarra','ismael.sciarra@sqltutorial.org','515.124.4369',DATE '1997-09-30',6,7700.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (112,'Jose Manuel','Urman','jose manuel.urman@sqltutorial.org','515.124.4469',DATE '1998-03-07',6,7800.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (113,'Luis','Popp','luis.popp@sqltutorial.org','515.124.4567',DATE '1999-12-07',6,6900.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (114,'Den','Raphaely','den.raphaely@sqltutorial.org','515.127.4561',DATE '1994-12-07',14,11000.00,100,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (115,'Alexander','Khoo','alexander.khoo@sqltutorial.org','515.127.4562',DATE '1995-05-18',13,3100.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (116,'Shelli','Baida','shelli.baida@sqltutorial.org','515.127.4563',DATE '1997-12-24',13,2900.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (117,'Sigal','Tobias','sigal.tobias@sqltutorial.org','515.127.4564',DATE '1997-07-24',13,2800.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (118,'Guy','Himuro','guy.himuro@sqltutorial.org','515.127.4565',DATE '1998-11-15',13,2600.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (119,'Karen','Colmenares','karen.colmenares@sqltutorial.org','515.127.4566',DATE '1999-08-10',13,2500.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (120,'Matthew','Weiss','matthew.weiss@sqltutorial.org','650.123.1234',DATE '1996-07-18',19,8000.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (121,'Adam','Fripp','adam.fripp@sqltutorial.org','650.123.2234',DATE '1997-04-10',19,8200.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (122,'Payam','Kaufling','payam.kaufling@sqltutorial.org','650.123.3234',DATE '1995-05-01',19,7900.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (123,'Shanta','Vollman','shanta.vollman@sqltutorial.org','650.123.4234',DATE '1997-10-10',19,6500.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (126,'Irene','Mikkilineni','irene.mikkilineni@sqltutorial.org','650.124.1224',DATE '1998-09-28',18,2700.00,120,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (145,'John','Russell','john.russell@sqltutorial.org',NULL,DATE '1996-10-01',15,14000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (146,'Karen','Partners','karen.partners@sqltutorial.org',NULL,DATE '1997-01-05',15,13500.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (176,'Jonathon','Taylor','jonathon.taylor@sqltutorial.org',NULL,DATE '1998-03-24',16,8600.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (177,'Jack','Livingston','jack.livingston@sqltutorial.org',NULL,DATE '1998-04-23',16,8400.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (178,'Kimberely','Grant','kimberely.grant@sqltutorial.org',NULL,DATE '1999-05-24',16,7000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (179,'Charles','Johnson','charles.johnson@sqltutorial.org',NULL,DATE '2000-01-04',16,6200.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (192,'Sarah','Bell','sarah.bell@sqltutorial.org','650.501.1876',DATE '1996-02-04',17,4000.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (193,'Britney','Everett','britney.everett@sqltutorial.org','650.501.2876',DATE '1997-03-03',17,3900.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (200,'Jennifer','Whalen','jennifer.whalen@sqltutorial.org','515.123.4444',DATE '1987-09-17',3,4400.00,101,1);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (201,'Michael','Hartstein','michael.hartstein@sqltutorial.org','515.123.5555',DATE '1996-02-17',10,13000.00,100,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (202,'Pat','Fay','pat.fay@sqltutorial.org','603.123.6666',DATE '1997-08-17',11,6000.00,201,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (203,'Susan','Mavris','susan.mavris@sqltutorial.org','515.123.7777',DATE '1994-06-07',8,6500.00,101,4);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (204,'Hermann','Baer','hermann.baer@sqltutorial.org','515.123.8888',DATE '1994-06-07',12,10000.00,101,7);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (205,'Shelley','Higgins','shelley.higgins@sqltutorial.org','515.123.8080',DATE '1994-06-07',2,12000.00,101,11);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (206,'William','Gietz','william.gietz@sqltutorial.org','515.123.8181',DATE '1994-06-07',1,8300.00,205,11);
 
 
/*Data for the table dependents */
 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (1,'Penelope','Gietz','Child',206);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (2,'Nick','Higgins','Child',205);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (3,'Ed','Whalen','Child',200);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (4,'Jennifer','King','Child',100);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (5,'Johnny','Kochhar','Child',101);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (6,'Bette','De Haan','Child',102);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (7,'Grace','Faviet','Child',109);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (8,'Matthew','Chen','Child',110);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (9,'Joe','Sciarra','Child',111);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (10,'Christian','Urman','Child',112);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (11,'Zero','Popp','Child',113);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (12,'Karl','Greenberg','Child',108);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (13,'Uma','Mavris','Child',203);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (14,'Vivien','Hunold','Child',103);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (15,'Cuba','Ernst','Child',104);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (16,'Fred','Austin','Child',105);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (17,'Helen','Pataballa','Child',106);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (18,'Dan','Lorentz','Child',107);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (19,'Bob','Hartstein','Child',201);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (20,'Lucille','Fay','Child',202);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (21,'Kirsten','Baer','Child',204);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (22,'Elvis','Khoo','Child',115);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (23,'Sandra','Baida','Child',116);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (24,'Cameron','Tobias','Child',117);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (25,'Kevin','Himuro','Child',118);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (26,'Rip','Colmenares','Child',119);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (27,'Julia','Raphaely','Child',114);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (28,'Woody','Russell','Child',145);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (29,'Alec','Partners','Child',146);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (30,'Sandra','Taylor','Child',176);
select * FROM emp;
select * from SESSION_PRIVS
CREATE TABLE regions  
    ( region_id      NUMBER   
                     CONSTRAINT region_id_nn NOT NULL 
    ,                CONSTRAINT reg_id_pk  
                        PRIMARY KEY (region_id) 
    , region_name    VARCHAR2(25)   
    )
    CREATE TABLE countries   
    ( country_id      CHAR(2)   
                      CONSTRAINT country_id_nn NOT NULL 
    ,                 CONSTRAINT country_c_id_pk   
        	         PRIMARY KEY (country_id) 
    , country_name    VARCHAR2(40)   
    , region_id       NUMBER   
    ,                 CONSTRAINT countr_reg_fk  
        	         FOREIGN KEY (region_id)  
          	         REFERENCES regions (region_id)   
    )   
    ORGANIZATION INDEX
    CREATE TABLE locations  
    ( location_id    NUMBER(4)  NOT NULL 
                     CONSTRAINT loc_id_pk  
       		        PRIMARY KEY  
    , street_address VARCHAR2(40)  
    , postal_code    VARCHAR2(12)  
    , city           VARCHAR2(30)  
	             CONSTRAINT loc_city_nn  NOT NULL  
    , state_province VARCHAR2(25)  
    , country_id     CHAR(2)  
    ,                CONSTRAINT loc_c_id_fk  
       		        FOREIGN KEY (country_id)  
        	        REFERENCES countries(country_id) 
    )
CREATE TABLE departments  
    ( department_id    NUMBER(4) 
                       CONSTRAINT dept_id_pk  
       		          PRIMARY KEY 
    , department_name  VARCHAR2(30)  
	               CONSTRAINT dept_name_nn  NOT NULL  
    , manager_id       NUMBER(6)  
    , location_id      NUMBER(4)  
    ,                  CONSTRAINT dept_loc_fk  
       		          FOREIGN KEY (location_id)  
        	          REFERENCES locations (location_id)  
    )
    CREATE TABLE jobs  
    ( job_id         VARCHAR2(10)  
                     CONSTRAINT job_id_pk  
      		        PRIMARY KEY 
    , job_title      VARCHAR2(35)  
	             CONSTRAINT job_title_nn  NOT NULL  
    , min_salary     NUMBER(6)  
    , max_salary     NUMBER(6)  
    )
    CREATE TABLE employees  
    ( employee_id    NUMBER(6)  
                     CONSTRAINT emp_emp_id_pk  
                        PRIMARY KEY 
    , first_name     VARCHAR2(20)  
    , last_name      VARCHAR2(25)  
	             CONSTRAINT emp_last_name_nn  NOT NULL  
    , email          VARCHAR2(25)  
	             CONSTRAINT emp_email_nn  NOT NULL  
    , CONSTRAINT     emp_email_uk  
                     UNIQUE (email)  
    , phone_number   VARCHAR2(20)  
    , hire_date      DATE  
	             CONSTRAINT emp_hire_date_nn  NOT NULL  
    , job_id         VARCHAR2(10)  
	             CONSTRAINT emp_job_nn  NOT NULL  
    , salary         NUMBER(8,2)  
                     CONSTRAINT emp_salary_min  
                        CHECK (salary > 0)  
    , commission_pct NUMBER(2,2)  
    , manager_id     NUMBER(6)  
    ,                CONSTRAINT emp_manager_fk  
                        FOREIGN KEY (manager_id)  
                        REFERENCES employees 
    , department_id  NUMBER(4)  
    ,                CONSTRAINT emp_dept_fk  
                        FOREIGN KEY (department_id)  
                        REFERENCES departments 
    )
    ALTER TABLE departments  
   ADD (CONSTRAINT dept_mgr_fk  
      	FOREIGN KEY (manager_id)  
      	REFERENCES employees (employee_id)  
    )
    CREATE TABLE job_history  
    ( employee_id   NUMBER(6)  
	            CONSTRAINT jhist_employee_nn  NOT NULL  
    ,               CONSTRAINT jhist_emp_fk  
                       FOREIGN KEY (employee_id)  
                       REFERENCES employees  
    , start_date    DATE  
	            CONSTRAINT jhist_start_date_nn  NOT NULL  
    , end_date      DATE  
	            CONSTRAINT jhist_end_date_nn  NOT NULL  
    , job_id        VARCHAR2(10)  
	            CONSTRAINT jhist_job_nn  NOT NULL  
    ,               CONSTRAINT jhist_job_fk  
                       FOREIGN KEY (job_id)  
                       REFERENCES jobs  
    , department_id NUMBER(4)  
    ,               CONSTRAINT jhist_dept_fk  
                       FOREIGN KEY (department_id)  
                       REFERENCES departments 
    , CONSTRAINT    jhist_emp_id_st_date_pk  
                       PRIMARY KEY (employee_id, start_date) 
    , CONSTRAINT    jhist_date_interval  
                       CHECK (end_date > start_date)  
    ) 
    BEGIN  
INSERT INTO regions VALUES   
        ( 1  
        , 'Europe'   
        );  
  
INSERT INTO regions VALUES   
        ( 2  
        , 'Americas'   
        );  
  
INSERT INTO regions VALUES   
        ( 3  
        , 'Asia'   
        );  
  
INSERT INTO regions VALUES   
        ( 4  
        , 'Middle East and Africa'   
        );  
END; 
BEGIN  
INSERT INTO countries VALUES   
        ( 'IT'  
        , 'Italy'  
        , 1   
        );  
  
INSERT INTO countries VALUES   
        ( 'JP'  
        , 'Japan'  
	, 3   
        );  
  
INSERT INTO countries VALUES   
        ( 'US'  
        , 'United States of America'  
        , 2   
        );  
  
INSERT INTO countries VALUES   
        ( 'CA'  
        , 'Canada'  
        , 2   
        );  
  
INSERT INTO countries VALUES   
        ( 'CN'  
        , 'China'  
        , 3   
        );  
  
INSERT INTO countries VALUES   
        ( 'IN'  
        , 'India'  
        , 3   
        );  
  
INSERT INTO countries VALUES   
        ( 'AU'  
        , 'Australia'  
        , 3   
        );  
  
INSERT INTO countries VALUES   
        ( 'ZW'  
        , 'Zimbabwe'  
        , 4   
        );  
  
INSERT INTO countries VALUES   
        ( 'SG'  
        , 'Singapore'  
        , 3   
        );  
  
INSERT INTO countries VALUES   
        ( 'UK'  
        , 'United Kingdom'  
        , 1   
        );  
  
INSERT INTO countries VALUES   
        ( 'FR'  
        , 'France'  
        , 1   
        );  
  
INSERT INTO countries VALUES   
        ( 'DE'  
        , 'Germany'  
        , 1   
        );  
  
INSERT INTO countries VALUES   
        ( 'ZM'  
        , 'Zambia'  
        , 4   
        );  
  
INSERT INTO countries VALUES   
        ( 'EG'  
        , 'Egypt'  
        , 4   
        );  
  
INSERT INTO countries VALUES   
        ( 'BR'  
        , 'Brazil'  
        , 2   
        );  
  
INSERT INTO countries VALUES   
        ( 'CH'  
        , 'Switzerland'  
        , 1   
        );  
  
INSERT INTO countries VALUES   
        ( 'NL'  
        , 'Netherlands'  
        , 1   
        );  
  
INSERT INTO countries VALUES   
        ( 'MX'  
        , 'Mexico'  
        , 2   
        );  
  
INSERT INTO countries VALUES   
        ( 'KW'  
        , 'Kuwait'  
        , 4   
        );  
  
INSERT INTO countries VALUES   
        ( 'IL'  
        , 'Israel'  
        , 4   
        );  
  
INSERT INTO countries VALUES   
        ( 'DK'  
        , 'Denmark'  
        , 1   
        );  
  
INSERT INTO countries VALUES   
        ( 'ML'  
        , 'Malaysia'  
        , 3   
        );  
  
INSERT INTO countries VALUES   
        ( 'NG'  
        , 'Nigeria'  
        , 4   
        );  
  
INSERT INTO countries VALUES   
        ( 'AR'  
        , 'Argentina'  
        , 2   
        );  
  
INSERT INTO countries VALUES   
        ( 'BE'  
        , 'Belgium'  
        , 1   
        );  
END; 
BEGIN  
INSERT INTO locations VALUES   
        ( 1000   
        , '1297 Via Cola di Rie'  
        , '00989'  
        , 'Roma'  
        , NULL  
        , 'IT'  
        );  
  
INSERT INTO locations VALUES   
        ( 1100   
        , '93091 Calle della Testa'  
        , '10934'  
        , 'Venice'  
        , NULL  
        , 'IT'  
        );  
  
INSERT INTO locations VALUES   
        ( 1200   
        , '2017 Shinjuku-ku'  
        , '1689'  
        , 'Tokyo'  
        , 'Tokyo Prefecture'  
        , 'JP'  
        );  
  
INSERT INTO locations VALUES   
        ( 1300   
        , '9450 Kamiya-cho'  
        , '6823'  
        , 'Hiroshima'  
        , NULL  
        , 'JP'  
        );  
  
INSERT INTO locations VALUES   
        ( 1400   
        , '2014 Jabberwocky Rd'  
        , '26192'  
        , 'Southlake'  
        , 'Texas'  
        , 'US'  
        );  
  
INSERT INTO locations VALUES   
        ( 1500   
        , '2011 Interiors Blvd'  
        , '99236'  
        , 'South San Francisco'  
        , 'California'  
        , 'US'  
        );  
  
INSERT INTO locations VALUES   
        ( 1600   
        , '2007 Zagora St'  
        , '50090'  
        , 'South Brunswick'  
        , 'New Jersey'  
        , 'US'  
        );  
  
INSERT INTO locations VALUES   
        ( 1700   
        , '2004 Charade Rd'  
        , '98199'  
        , 'Seattle'  
        , 'Washington'  
        , 'US'  
        );  
  
INSERT INTO locations VALUES   
        ( 1800   
        , '147 Spadina Ave'  
        , 'M5V 2L7'  
        , 'Toronto'  
        , 'Ontario'  
        , 'CA'  
        );  
  
INSERT INTO locations VALUES   
        ( 1900   
        , '6092 Boxwood St'  
        , 'YSW 9T2'  
        , 'Whitehorse'  
        , 'Yukon'  
        , 'CA'  
        );  
  
INSERT INTO locations VALUES   
        ( 2000   
        , '40-5-12 Laogianggen'  
        , '190518'  
        , 'Beijing'  
        , NULL  
        , 'CN'  
        );  
  
INSERT INTO locations VALUES   
        ( 2100   
        , '1298 Vileparle (E)'  
        , '490231'  
        , 'Bombay'  
        , 'Maharashtra'  
        , 'IN'  
        );  
  
INSERT INTO locations VALUES   
        ( 2200   
        , '12-98 Victoria Street'  
        , '2901'  
        , 'Sydney'  
        , 'New South Wales'  
        , 'AU'  
        );  
  
INSERT INTO locations VALUES   
        ( 2300   
        , '198 Clementi North'  
        , '540198'  
        , 'Singapore'  
        , NULL  
        , 'SG'  
        );  
  
INSERT INTO locations VALUES   
        ( 2400   
        , '8204 Arthur St'  
        , NULL  
        , 'London'  
        , NULL  
        , 'UK'  
        );  
  
INSERT INTO locations VALUES   
        ( 2500   
        , 'Magdalen Centre, The Oxford Science Park'  
        , 'OX9 9ZB'  
        , 'Oxford'  
        , 'Oxford'  
        , 'UK'  
        );  
  
INSERT INTO locations VALUES   
        ( 2600   
        , '9702 Chester Road'  
        , '09629850293'  
        , 'Stretford'  
        , 'Manchester'  
        , 'UK'  
        );  
  
INSERT INTO locations VALUES   
        ( 2700   
        , 'Schwanthalerstr. 7031'  
        , '80925'  
        , 'Munich'  
        , 'Bavaria'  
        , 'DE'  
        );  
  
INSERT INTO locations VALUES   
        ( 2800   
        , 'Rua Frei Caneca 1360 '  
        , '01307-002'  
        , 'Sao Paulo'  
        , 'Sao Paulo'  
        , 'BR'  
        );  
  
INSERT INTO locations VALUES   
        ( 2900   
        , '20 Rue des Corps-Saints'  
        , '1730'  
        , 'Geneva'  
        , 'Geneve'  
        , 'CH'  
        );  
  
INSERT INTO locations VALUES   
        ( 3000   
        , 'Murtenstrasse 921'  
        , '3095'  
        , 'Bern'  
        , 'BE'  
        , 'CH'  
        );  
  
INSERT INTO locations VALUES   
        ( 3100   
        , 'Pieter Breughelstraat 837'  
        , '3029SK'  
        , 'Utrecht'  
        , 'Utrecht'  
        , 'NL'  
        );  
  
INSERT INTO locations VALUES   
        ( 3200   
        , 'Mariano Escobedo 9991'  
        , '11932'  
        , 'Mexico City'  
        , 'Distrito Federal,'  
        , 'MX'  
        );  
END; 
ALTER TABLE departments   
  DISABLE CONSTRAINT dept_mgr_fk
BEGIN  
INSERT INTO departments VALUES   
        ( 10  
        , 'Administration'  
        , 200  
        , 1700  
        );  
  
INSERT INTO departments VALUES   
        ( 20  
        , 'Marketing'  
        , 201  
        , 1800  
        );  
                                  
INSERT INTO departments VALUES   
        ( 30  
        , 'Purchasing'  
        , 114  
        , 1700  
	);  
                  
INSERT INTO departments VALUES   
        ( 40  
        , 'Human Resources'  
        , 203  
        , 2400  
        );  
  
INSERT INTO departments VALUES   
        ( 50  
        , 'Shipping'  
        , 121  
        , 1500  
        );  
                  
INSERT INTO departments VALUES   
        ( 60   
        , 'IT'  
        , 103  
        , 1400  
        );  
                  
INSERT INTO departments VALUES   
        ( 70   
        , 'Public Relations'  
        , 204  
        , 2700  
        );  
                  
INSERT INTO departments VALUES   
        ( 80   
        , 'Sales'  
        , 145  
        , 2500  
        );  
                  
INSERT INTO departments VALUES   
        ( 90   
        , 'Executive'  
        , 100  
        , 1700  
        );  
  
INSERT INTO departments VALUES   
        ( 100   
        , 'Finance'  
        , 108  
        , 1700  
        );  
                  
INSERT INTO departments VALUES   
        ( 110   
        , 'Accounting'  
        , 205  
        , 1700  
        );  
  
INSERT INTO departments VALUES   
        ( 120   
        , 'Treasury'  
        , NULL  
        , 1700  
        );  
  
INSERT INTO departments VALUES   
        ( 130   
        , 'Corporate Tax'  
        , NULL  
        , 1700  
        );  
  
INSERT INTO departments VALUES   
        ( 140   
        , 'Control And Credit'  
        , NULL  
        , 1700  
        );  
  
INSERT INTO departments VALUES   
        ( 150   
        , 'Shareholder Services'  
        , NULL  
        , 1700  
        );  
  
INSERT INTO departments VALUES   
        ( 160   
        , 'Benefits'  
        , NULL  
        , 1700  
        );  
  
INSERT INTO departments VALUES   
        ( 170   
        , 'Manufacturing'  
        , NULL  
        , 1700  
        );  
  
INSERT INTO departments VALUES   
        ( 180   
        , 'Construction'  
        , NULL  
        , 1700  
        );  
  
INSERT INTO departments VALUES   
        ( 190   
        , 'Contracting'  
        , NULL  
        , 1700  
        );  
  
INSERT INTO departments VALUES   
        ( 200   
        , 'Operations'  
        , NULL  
        , 1700  
        );  
  
INSERT INTO departments VALUES   
        ( 210   
        , 'IT Support'  
        , NULL  
        , 1700  
        );  
  
INSERT INTO departments VALUES   
        ( 220   
        , 'NOC'  
        , NULL  
        , 1700  
        );  
  
INSERT INTO departments VALUES   
        ( 230   
        , 'IT Helpdesk'  
        , NULL  
        , 1700  
        );  
  
INSERT INTO departments VALUES   
        ( 240   
        , 'Government Sales'  
        , NULL  
        , 1700  
        );  
  
INSERT INTO departments VALUES   
        ( 250   
        , 'Retail Sales'  
        , NULL  
        , 1700  
        );  
  
INSERT INTO departments VALUES   
        ( 260   
        , 'Recruiting'  
        , NULL  
        , 1700  
        );  
  
INSERT INTO departments VALUES   
        ( 270   
        , 'Payroll'  
        , NULL  
        , 1700  
        );  
END; 
BEGIN  
INSERT INTO jobs VALUES   
        ( 'AD_PRES'  
        , 'President'  
        , 20080  
        , 40000  
        );  
INSERT INTO jobs VALUES   
        ( 'AD_VP'  
        , 'Administration Vice President'  
        , 15000  
        , 30000  
        );  
  
INSERT INTO jobs VALUES   
        ( 'AD_ASST'  
        , 'Administration Assistant'  
        , 3000  
        , 6000  
        );  
  
INSERT INTO jobs VALUES   
        ( 'FI_MGR'  
        , 'Finance Manager'  
        , 8200  
        , 16000  
        );  
  
INSERT INTO jobs VALUES   
        ( 'FI_ACCOUNT'  
        , 'Accountant'  
        , 4200  
        , 9000  
        );  
  
INSERT INTO jobs VALUES   
        ( 'AC_MGR'  
        , 'Accounting Manager'  
        , 8200  
        , 16000  
        );  
  
INSERT INTO jobs VALUES   
        ( 'AC_ACCOUNT'  
        , 'Public Accountant'  
        , 4200  
        , 9000  
        );  
INSERT INTO jobs VALUES   
        ( 'SA_MAN'  
        , 'Sales Manager'  
        , 10000  
        , 20080  
        );  
  
INSERT INTO jobs VALUES   
        ( 'SA_REP'  
        , 'Sales Representative'  
        , 6000  
        , 12008  
        );  
  
INSERT INTO jobs VALUES   
        ( 'PU_MAN'  
        , 'Purchasing Manager'  
        , 8000  
        , 15000  
        );  
  
INSERT INTO jobs VALUES   
        ( 'PU_CLERK'  
        , 'Purchasing Clerk'  
        , 2500  
        , 5500  
        );  
  
INSERT INTO jobs VALUES   
        ( 'ST_MAN'  
        , 'Stock Manager'  
        , 5500  
        , 8500  
        );  
INSERT INTO jobs VALUES   
        ( 'ST_CLERK'  
        , 'Stock Clerk'  
        , 2008  
        , 5000  
        );  
  
INSERT INTO jobs VALUES   
        ( 'SH_CLERK'  
        , 'Shipping Clerk'  
        , 2500  
        , 5500  
        );  
  
INSERT INTO jobs VALUES   
        ( 'IT_PROG'  
        , 'Programmer'  
        , 4000  
        , 10000  
        );  
  
INSERT INTO jobs VALUES   
        ( 'MK_MAN'  
        , 'Marketing Manager'  
        , 9000  
        , 15000  
        );  
  
INSERT INTO jobs VALUES   
        ( 'MK_REP'  
        , 'Marketing Representative'  
        , 4000  
        , 9000  
        );  
  
INSERT INTO jobs VALUES   
        ( 'HR_REP'  
        , 'Human Resources Representative'  
        , 4000  
        , 9000  
        );  
  
INSERT INTO jobs VALUES   
        ( 'PR_REP'  
        , 'Public Relations Representative'  
        , 4500  
        , 10500  
        );  
END; 
BEGIN    
INSERT INTO employees VALUES     
        ( 100    
        , 'Steven'    
        , 'King'    
        , 'SKING'    
        , '515.123.4567'    
        , TO_DATE('17-06-2003', 'dd-MM-yyyy')    
        , 'AD_PRES'    
        , 24000    
        , NULL    
        , NULL    
        , 90    
        );    
    
INSERT INTO employees VALUES     
        ( 101    
        , 'Neena'    
        , 'Kochhar'    
        , 'NKOCHHAR'    
        , '515.123.4568'    
        , TO_DATE('21-09-2005', 'dd-MM-yyyy')    
        , 'AD_VP'    
        , 17000    
        , NULL    
        , 100    
        , 90    
        );    
    
INSERT INTO employees VALUES     
        ( 102    
        , 'Lex'    
        , 'De Haan'    
        , 'LDEHAAN'    
        , '515.123.4569'    
        , TO_DATE('13-01-2001', 'dd-MM-yyyy')    
        , 'AD_VP'    
        , 17000    
        , NULL    
        , 100    
        , 90    
        );    
    
INSERT INTO employees VALUES     
        ( 103    
        , 'Alexander'    
        , 'Hunold'    
        , 'AHUNOLD'    
        , '590.423.4567'    
        , TO_DATE('03-01-2006', 'dd-MM-yyyy')    
        , 'IT_PROG'    
        , 9000    
        , NULL    
        , 102    
        , 60    
        );    
    
INSERT INTO employees VALUES     
        ( 104    
        , 'Bruce'    
        , 'Ernst'    
        , 'BERNST'    
        , '590.423.4568'    
        , TO_DATE('21-05-2007', 'dd-MM-yyyy')    
        , 'IT_PROG'    
        , 6000    
        , NULL    
        , 103    
        , 60    
        );    
    
INSERT INTO employees VALUES     
        ( 105    
        , 'David'    
        , 'Austin'    
        , 'DAUSTIN'    
        , '590.423.4569'    
        , TO_DATE('25-06-2005', 'dd-MM-yyyy')    
        , 'IT_PROG'    
        , 4800    
        , NULL    
        , 103    
        , 60    
        );    
    
INSERT INTO employees VALUES     
        ( 106    
        , 'Valli'    
        , 'Pataballa'    
        , 'VPATABAL'    
        , '590.423.4560'    
        , TO_DATE('05-02-2006', 'dd-MM-yyyy')    
        , 'IT_PROG'    
        , 4800    
        , NULL    
        , 103    
        , 60    
        );    
    
INSERT INTO employees VALUES     
        ( 107    
        , 'Diana'    
        , 'Lorentz'    
        , 'DLORENTZ'    
        , '590.423.5567'    
        , TO_DATE('07-02-2007', 'dd-MM-yyyy')    
        , 'IT_PROG'    
        , 4200    
        , NULL    
        , 103    
        , 60    
        );    
    
INSERT INTO employees VALUES     
        ( 108    
        , 'Nancy'    
        , 'Greenberg'    
        , 'NGREENBE'    
        , '515.124.4569'    
        , TO_DATE('17-08-2002', 'dd-MM-yyyy')    
        , 'FI_MGR'    
        , 12008    
        , NULL    
        , 101    
        , 100    
        );    
    
INSERT INTO employees VALUES     
        ( 109    
        , 'Daniel'    
        , 'Faviet'    
        , 'DFAVIET'    
        , '515.124.4169'    
        , TO_DATE('16-08-2002', 'dd-MM-yyyy')    
        , 'FI_ACCOUNT'    
        , 9000    
        , NULL    
        , 108    
        , 100    
        );    
    
INSERT INTO employees VALUES     
        ( 110    
        , 'John'    
        , 'Chen'    
        , 'JCHEN'    
        , '515.124.4269'    
        , TO_DATE('28-09-2005', 'dd-MM-yyyy')    
        , 'FI_ACCOUNT'    
        , 8200    
        , NULL    
        , 108    
        , 100    
        );    
    
INSERT INTO employees VALUES     
        ( 111    
        , 'Ismael'    
        , 'Sciarra'    
        , 'ISCIARRA'    
        , '515.124.4369'    
        , TO_DATE('30-09-2005', 'dd-MM-yyyy')    
        , 'FI_ACCOUNT'    
        , 7700    
        , NULL    
        , 108    
        , 100    
        );    
    
INSERT INTO employees VALUES     
        ( 112    
        , 'Jose Manuel'    
        , 'Urman'    
        , 'JMURMAN'    
        , '515.124.4469'    
        , TO_DATE('07-03-2006', 'dd-MM-yyyy')    
        , 'FI_ACCOUNT'    
        , 7800    
        , NULL    
        , 108    
        , 100    
        );    
    
INSERT INTO employees VALUES     
        ( 113    
        , 'Luis'    
        , 'Popp'    
        , 'LPOPP'    
        , '515.124.4567'    
        , TO_DATE('07-12-2007', 'dd-MM-yyyy')    
        , 'FI_ACCOUNT'    
        , 6900    
        , NULL    
        , 108    
        , 100    
        );    
    
INSERT INTO employees VALUES     
        ( 114    
        , 'Den'    
        , 'Raphaely'    
        , 'DRAPHEAL'    
        , '515.127.4561'    
        , TO_DATE('07-12-2002', 'dd-MM-yyyy')    
        , 'PU_MAN'    
        , 11000    
        , NULL    
        , 100    
        , 30    
        );    
    
INSERT INTO employees VALUES     
        ( 115    
        , 'Alexander'    
        , 'Khoo'    
        , 'AKHOO'    
        , '515.127.4562'    
        , TO_DATE('18-05-2003', 'dd-MM-yyyy')    
        , 'PU_CLERK'    
        , 3100    
        , NULL    
        , 114    
        , 30    
        );    
    
INSERT INTO employees VALUES     
        ( 116    
        , 'Shelli'    
        , 'Baida'    
        , 'SBAIDA'    
        , '515.127.4563'    
        , TO_DATE('24-12-2005', 'dd-MM-yyyy')    
        , 'PU_CLERK'    
        , 2900    
        , NULL    
        , 114    
        , 30    
        );    
    
INSERT INTO employees VALUES     
        ( 117    
        , 'Sigal'    
        , 'Tobias'    
        , 'STOBIAS'    
        , '515.127.4564'    
        , TO_DATE('24-07-2005', 'dd-MM-yyyy')    
        , 'PU_CLERK'    
        , 2800    
        , NULL    
        , 114    
        , 30    
        );    
    
INSERT INTO employees VALUES     
        ( 118    
        , 'Guy'    
        , 'Himuro'    
        , 'GHIMURO'    
        , '515.127.4565'    
        , TO_DATE('15-11-2006', 'dd-MM-yyyy')    
        , 'PU_CLERK'    
        , 2600    
        , NULL    
        , 114    
        , 30    
        );    
    
INSERT INTO employees VALUES     
        ( 119    
        , 'Karen'    
        , 'Colmenares'    
        , 'KCOLMENA'    
        , '515.127.4566'    
        , TO_DATE('10-08-2007', 'dd-MM-yyyy')    
        , 'PU_CLERK'    
        , 2500    
        , NULL    
        , 114    
        , 30    
        );    
END; 
begin 
INSERT INTO employees VALUES     
        ( 120    
        , 'Matthew'    
        , 'Weiss'    
        , 'MWEISS'    
        , '650.123.1234'    
        , TO_DATE('18-07-2004', 'dd-MM-yyyy')    
        , 'ST_MAN'    
        , 8000    
        , NULL    
        , 100    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 121    
        , 'Adam'    
        , 'Fripp'    
        , 'AFRIPP'    
        , '650.123.2234'    
        , TO_DATE('10-04-2005', 'dd-MM-yyyy')    
        , 'ST_MAN'    
        , 8200    
        , NULL    
        , 100    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 122    
        , 'Payam'    
        , 'Kaufling'    
        , 'PKAUFLIN'    
        , '650.123.3234'    
        , TO_DATE('01-05-2003', 'dd-MM-yyyy')    
        , 'ST_MAN'    
        , 7900    
        , NULL    
        , 100    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 123    
        , 'Shanta'    
        , 'Vollman'    
        , 'SVOLLMAN'    
        , '650.123.4234'    
        , TO_DATE('10-10-2005', 'dd-MM-yyyy')    
        , 'ST_MAN'    
        , 6500    
        , NULL    
        , 100    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 124    
        , 'Kevin'    
        , 'Mourgos'    
        , 'KMOURGOS'    
        , '650.123.5234'    
        , TO_DATE('16-11-2007', 'dd-MM-yyyy')    
        , 'ST_MAN'    
        , 5800    
        , NULL    
        , 100    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 125    
        , 'Julia'    
        , 'Nayer'    
        , 'JNAYER'    
        , '650.124.1214'    
        , TO_DATE('16-07-2005', 'dd-MM-yyyy')    
        , 'ST_CLERK'    
        , 3200    
        , NULL    
        , 120    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 126    
        , 'Irene'    
        , 'Mikkilineni'    
        , 'IMIKKILI'    
        , '650.124.1224'    
        , TO_DATE('28-09-2006', 'dd-MM-yyyy')    
        , 'ST_CLERK'    
        , 2700    
        , NULL    
        , 120    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 127    
        , 'James'    
        , 'Landry'    
        , 'JLANDRY'    
        , '650.124.1334'    
        , TO_DATE('14-01-2007', 'dd-MM-yyyy')    
        , 'ST_CLERK'    
        , 2400    
        , NULL    
        , 120    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 128    
        , 'Steven'    
        , 'Markle'    
        , 'SMARKLE'    
        , '650.124.1434'    
        , TO_DATE('08-03-2008', 'dd-MM-yyyy')    
        , 'ST_CLERK'    
        , 2200    
        , NULL    
        , 120    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 129    
        , 'Laura'    
        , 'Bissot'    
        , 'LBISSOT'    
        , '650.124.5234'    
        , TO_DATE('20-08-2005', 'dd-MM-yyyy')    
        , 'ST_CLERK'    
        , 3300    
        , NULL    
        , 121    
        , 50    
        );    
END; 
begin  
INSERT INTO employees VALUES     
        ( 130    
        , 'Mozhe'    
        , 'Atkinson'    
        , 'MATKINSO'    
        , '650.124.6234'    
        , TO_DATE('30-10-2005', 'dd-MM-yyyy')    
        , 'ST_CLERK'    
        , 2800    
        , NULL    
        , 121    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 131    
        , 'James'    
        , 'Marlow'    
        , 'JAMRLOW'    
        , '650.124.7234'    
        , TO_DATE('16-02-2005', 'dd-MM-yyyy')    
        , 'ST_CLERK'    
        , 2500    
        , NULL    
        , 121    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 132    
        , 'TJ'    
        , 'Olson'    
        , 'TJOLSON'    
        , '650.124.8234'    
        , TO_DATE('10-04-2007', 'dd-MM-yyyy')    
        , 'ST_CLERK'    
        , 2100    
        , NULL    
        , 121    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 133    
        , 'Jason'    
        , 'Mallin'    
        , 'JMALLIN'    
        , '650.127.1934'    
        , TO_DATE('14-06-2004', 'dd-MM-yyyy')    
        , 'ST_CLERK'    
        , 3300    
        , NULL    
        , 122    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 134    
        , 'Michael'    
        , 'Rogers'    
        , 'MROGERS'    
        , '650.127.1834'    
        , TO_DATE('26-08-2006', 'dd-MM-yyyy')    
        , 'ST_CLERK'    
        , 2900    
        , NULL    
        , 122    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 135    
        , 'Ki'    
        , 'Gee'    
        , 'KGEE'    
        , '650.127.1734'    
        , TO_DATE('12-12-2007', 'dd-MM-yyyy')    
        , 'ST_CLERK'    
        , 2400    
        , NULL    
        , 122    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 136    
        , 'Hazel'    
        , 'Philtanker'    
        , 'HPHILTAN'    
        , '650.127.1634'    
        , TO_DATE('06-02-2008', 'dd-MM-yyyy')    
        , 'ST_CLERK'    
        , 2200    
        , NULL    
        , 122    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 137    
        , 'Renske'    
        , 'Ladwig'    
        , 'RLADWIG'    
        , '650.121.1234'    
        , TO_DATE('14-07-2003', 'dd-MM-yyyy')    
        , 'ST_CLERK'    
        , 3600    
        , NULL    
        , 123    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 138    
        , 'Stephen'    
        , 'Stiles'    
        , 'SSTILES'    
        , '650.121.2034'    
        , TO_DATE('26-10-2005', 'dd-MM-yyyy')    
        , 'ST_CLERK'    
        , 3200    
        , NULL    
        , 123    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 139    
        , 'John'    
        , 'Seo'    
        , 'JSEO'    
        , '650.121.2019'    
        , TO_DATE('12-02-2006', 'dd-MM-yyyy')    
        , 'ST_CLERK'    
        , 2700    
        , NULL    
        , 123    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 140    
        , 'Joshua'    
        , 'Patel'    
        , 'JPATEL'    
        , '650.121.1834'    
        , TO_DATE('06-04-2006', 'dd-MM-yyyy')    
        , 'ST_CLERK'    
        , 2500    
        , NULL    
        , 123    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 141    
        , 'Trenna'    
        , 'Rajs'    
        , 'TRAJS'    
        , '650.121.8009'    
        , TO_DATE('17-10-2003', 'dd-MM-yyyy')    
        , 'ST_CLERK'    
        , 3500    
        , NULL    
        , 124    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 142    
        , 'Curtis'    
        , 'Davies'    
        , 'CDAVIES'    
        , '650.121.2994'    
        , TO_DATE('29-01-2005', 'dd-MM-yyyy')    
        , 'ST_CLERK'    
        , 3100    
        , NULL    
        , 124    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 143    
        , 'Randall'    
        , 'Matos'    
        , 'RMATOS'    
        , '650.121.2874'    
        , TO_DATE('15-03-2006', 'dd-MM-yyyy')    
        , 'ST_CLERK'    
        , 2600    
        , NULL    
        , 124    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 144    
        , 'Peter'    
        , 'Vargas'    
        , 'PVARGAS'    
        , '650.121.2004'    
        , TO_DATE('09-07-2006', 'dd-MM-yyyy')    
        , 'ST_CLERK'    
        , 2500    
        , NULL    
        , 124    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 145    
        , 'John'    
        , 'Russell'    
        , 'JRUSSEL'    
        , '011.44.1344.429268'    
        , TO_DATE('01-10-2004', 'dd-MM-yyyy')    
        , 'SA_MAN'    
        , 14000    
        , .4    
        , 100    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 146    
        , 'Karen'    
        , 'Partners'    
        , 'KPARTNER'    
        , '011.44.1344.467268'    
        , TO_DATE('05-01-2005', 'dd-MM-yyyy')    
        , 'SA_MAN'    
        , 13500    
        , .3    
        , 100    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 147    
        , 'Alberto'    
        , 'Errazuriz'    
        , 'AERRAZUR'    
        , '011.44.1344.429278'    
        , TO_DATE('10-03-2005', 'dd-MM-yyyy')    
        , 'SA_MAN'    
        , 12000    
        , .3    
        , 100    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 148    
        , 'Gerald'    
        , 'Cambrault'    
        , 'GCAMBRAU'    
        , '011.44.1344.619268'    
        , TO_DATE('15-10-2007', 'dd-MM-yyyy')    
        , 'SA_MAN'    
        , 11000    
        , .3    
        , 100    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 149    
        , 'Eleni'    
        , 'Zlotkey'    
        , 'EZLOTKEY'    
        , '011.44.1344.429018'    
        , TO_DATE('29-01-2008', 'dd-MM-yyyy')    
        , 'SA_MAN'    
        , 10500    
        , .2    
        , 100    
        , 80    
        );    
end;
-------------------------------------------------------------------------
BEGIN
INSERT INTO employees VALUES     
        ( 150    
        , 'Peter'    
        , 'Tucker'    
        , 'PTUCKER'    
        , '011.44.1344.129268'    
        , TO_DATE('30-01-2005', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 10000    
        , .3    
        , 145    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 151    
        , 'David'    
        , 'Bernstein'    
        , 'DBERNSTE'    
        , '011.44.1344.345268'    
        , TO_DATE('24-03-2005', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 9500    
        , .25    
        , 145    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 152    
        , 'Peter'    
        , 'Hall'    
        , 'PHALL'    
        , '011.44.1344.478968'    
        , TO_DATE('20-08-2005', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 9000    
        , .25    
        , 145    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 153    
        , 'Christopher'    
        , 'Olsen'    
        , 'COLSEN'    
        , '011.44.1344.498718'    
        , TO_DATE('30-03-2006', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 8000    
        , .2    
        , 145    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 154    
        , 'Nanette'    
        , 'Cambrault'    
        , 'NCAMBRAU'    
        , '011.44.1344.987668'    
        , TO_DATE('09-12-2006', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 7500    
        , .2    
        , 145    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 155    
        , 'Oliver'    
        , 'Tuvault'    
        , 'OTUVAULT'    
        , '011.44.1344.486508'    
        , TO_DATE('23-11-2007', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 7000    
        , .15    
        , 145    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 156    
        , 'Janette'    
        , 'King'    
        , 'JKING'    
        , '011.44.1345.429268'    
        , TO_DATE('30-01-2004', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 10000    
        , .35    
        , 146    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 157    
        , 'Patrick'    
        , 'Sully'    
        , 'PSULLY'    
        , '011.44.1345.929268'    
        , TO_DATE('04-03-2004', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 9500    
        , .35    
        , 146    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 158    
        , 'Allan'    
        , 'McEwen'    
        , 'AMCEWEN'    
        , '011.44.1345.829268'    
        , TO_DATE('01-08-2004', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 9000    
        , .35    
        , 146    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 159    
        , 'Lindsey'    
        , 'Smith'    
        , 'LSMITH'    
        , '011.44.1345.729268'    
        , TO_DATE('10-03-2005', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 8000    
        , .3    
        , 146    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 160    
        , 'Louise'    
        , 'Doran'    
        , 'LDORAN'    
        , '011.44.1345.629268'    
        , TO_DATE('15-12-2005', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 7500    
        , .3    
        , 146    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 161    
        , 'Sarath'    
        , 'Sewall'    
        , 'SSEWALL'    
        , '011.44.1345.529268'    
        , TO_DATE('03-11-2006', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 7000    
        , .25    
        , 146    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 162    
        , 'Clara'    
        , 'Vishney'    
        , 'CVISHNEY'    
        , '011.44.1346.129268'    
        , TO_DATE('11-11-2005', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 10500    
        , .25    
        , 147    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 163    
        , 'Danielle'    
        , 'Greene'    
        , 'DGREENE'    
        , '011.44.1346.229268'    
        , TO_DATE('19-03-2007', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 9500    
        , .15    
        , 147    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 164    
        , 'Mattea'    
        , 'Marvins'    
        , 'MMARVINS'    
        , '011.44.1346.329268'    
        , TO_DATE('24-01-2008', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 7200    
        , .10    
        , 147    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 165    
        , 'David'    
        , 'Lee'    
        , 'DLEE'    
        , '011.44.1346.529268'    
        , TO_DATE('23-02-2008', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 6800    
        , .1    
        , 147    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 166    
        , 'Sundar'    
        , 'Ande'    
        , 'SANDE'    
        , '011.44.1346.629268'    
        , TO_DATE('24-03-2008', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 6400    
        , .10    
        , 147    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 167    
        , 'Amit'    
        , 'Banda'    
        , 'ABANDA'    
        , '011.44.1346.729268'    
        , TO_DATE('21-04-2008', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 6200    
        , .10    
        , 147    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 168    
        , 'Lisa'    
        , 'Ozer'    
        , 'LOZER'    
        , '011.44.1343.929268'    
        , TO_DATE('11-03-2005', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 11500    
        , .25    
        , 148    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 169      
        , 'Harrison'    
        , 'Bloom'    
        , 'HBLOOM'    
        , '011.44.1343.829268'    
        , TO_DATE('23-03-2006', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 10000    
        , .20    
        , 148    
        , 80    
        );    
        INSERT INTO employees VALUES     
        ( 170    
        , 'Tayler'    
        , 'Fox'    
        , 'TFOX'    
        , '011.44.1343.729268'    
        , TO_DATE('24-01-2006', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 9600    
        , .20    
        , 148    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 171    
        , 'William'    
        , 'Smith'    
        , 'WSMITH'    
        , '011.44.1343.629268'    
        , TO_DATE('23-02-2007', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 7400    
        , .15    
        , 148    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 172    
        , 'Elizabeth'    
        , 'Bates'    
        , 'EBATES'    
        , '011.44.1343.529268'    
        , TO_DATE('24-03-2007', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 7300    
        , .15    
        , 148    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 173    
        , 'Sundita'    
        , 'Kumar'    
        , 'SKUMAR'    
        , '011.44.1343.329268'    
        , TO_DATE('21-04-2008', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 6100    
        , .10    
        , 148    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 174    
        , 'Ellen'    
        , 'Abel'    
        , 'EABEL'    
        , '011.44.1644.429267'    
        , TO_DATE('11-05-2004', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 11000    
        , .30    
        , 149    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 175    
        , 'Alyssa'    
        , 'Hutton'    
        , 'AHUTTON'    
        , '011.44.1644.429266'    
        , TO_DATE('19-03-2005', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 8800    
        , .25    
        , 149    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 176    
        , 'Jonathon'    
        , 'Taylor'    
        , 'JTAYLOR'    
        , '011.44.1644.429265'    
        , TO_DATE('24-03-2006', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 8600    
        , .20    
        , 149    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 177    
        , 'Jack'    
        , 'Livingston'    
        , 'JLIVINGS'    
        , '011.44.1644.429264'    
        , TO_DATE('23-04-2006', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 8400    
        , .20    
        , 149    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 178    
        , 'Kimberely'    
        , 'Grant'    
        , 'KGRANT'    
        , '011.44.1644.429263'    
        , TO_DATE('24-05-2007', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 7000    
        , .15    
        , 149    
        , NULL    
        );    
    
INSERT INTO employees VALUES     
        ( 179    
        , 'Charles'    
        , 'Johnson'    
        , 'CJOHNSON'    
        , '011.44.1644.429262'    
        , TO_DATE('04-01-2008', 'dd-MM-yyyy')    
        , 'SA_REP'    
        , 6200    
        , .10    
        , 149    
        , 80    
        );    
    
INSERT INTO employees VALUES     
        ( 180    
        , 'Winston'    
        , 'Taylor'    
        , 'WTAYLOR'    
        , '650.507.9876'    
        , TO_DATE('24-01-2006', 'dd-MM-yyyy')    
        , 'SH_CLERK'    
        , 3200    
        , NULL    
        , 120    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 181    
        , 'Jean'    
        , 'Fleaur'    
        , 'JFLEAUR'    
        , '650.507.9877'    
        , TO_DATE('23-02-2006', 'dd-MM-yyyy')    
        , 'SH_CLERK'    
        , 3100    
        , NULL    
        , 120    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 182    
        , 'Martha'    
        , 'Sullivan'    
        , 'MSULLIVA'    
        , '650.507.9878'    
        , TO_DATE('21-06-2007', 'dd-MM-yyyy')    
        , 'SH_CLERK'    
        , 2500    
        , NULL    
        , 120    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 183    
        , 'Girard'    
        , 'Geoni'    
        , 'GGEONI'    
        , '650.507.9879'    
        , TO_DATE('03-02-2008', 'dd-MM-yyyy')    
        , 'SH_CLERK'    
        , 2800    
        , NULL    
        , 120    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 184    
        , 'Nandita'    
        , 'Sarchand'    
        , 'NSARCHAN'    
        , '650.509.1876'    
        , TO_DATE('27-01-2004', 'dd-MM-yyyy')    
        , 'SH_CLERK'    
        , 4200    
        , NULL    
        , 121    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 185    
        , 'Alexis'    
        , 'Bull'    
        , 'ABULL'    
        , '650.509.2876'    
        , TO_DATE('20-02-2005', 'dd-MM-yyyy')    
        , 'SH_CLERK'    
        , 4100    
        , NULL    
        , 121    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 186    
        , 'Julia'    
        , 'Dellinger'    
        , 'JDELLING'    
        , '650.509.3876'    
        , TO_DATE('24-06-2006', 'dd-MM-yyyy')    
        , 'SH_CLERK'    
        , 3400    
        , NULL    
        , 121    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 187    
        , 'Anthony'    
        , 'Cabrio'    
        , 'ACABRIO'    
        , '650.509.4876'    
        , TO_DATE('07-02-2007', 'dd-MM-yyyy')    
        , 'SH_CLERK'    
        , 3000    
        , NULL    
        , 121    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 188    
        , 'Kelly'    
        , 'Chung'    
        , 'KCHUNG'    
        , '650.505.1876'    
        , TO_DATE('14-06-2005', 'dd-MM-yyyy')    
        , 'SH_CLERK'    
        , 3800    
        , NULL    
        , 122    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 189    
        , 'Jennifer'    
        , 'Dilly'    
        , 'JDILLY'    
        , '650.505.2876'    
        , TO_DATE('13-08-2005', 'dd-MM-yyyy')    
        , 'SH_CLERK'    
        , 3600    
        , NULL    
        , 122    
        , 50    
        );    
        INSERT INTO employees VALUES     
        ( 190    
        , 'Timothy'    
        , 'Gates'    
        , 'TGATES'    
        , '650.505.3876'    
        , TO_DATE('11-07-2006', 'dd-MM-yyyy')    
        , 'SH_CLERK'    
        , 2900    
        , NULL    
        , 122    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 191    
        , 'Randall'    
        , 'Perkins'    
        , 'RPERKINS'    
        , '650.505.4876'    
        , TO_DATE('19-12-2007', 'dd-MM-yyyy')    
        , 'SH_CLERK'    
        , 2500    
        , NULL    
        , 122    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 192    
        , 'Sarah'    
        , 'Bell'    
        , 'SBELL'    
        , '650.501.1876'    
        , TO_DATE('04-02-2004', 'dd-MM-yyyy')    
        , 'SH_CLERK'    
        , 4000    
        , NULL    
        , 123    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 193    
        , 'Britney'    
        , 'Everett'    
        , 'BEVERETT'    
        , '650.501.2876'    
        , TO_DATE('03-03-2005', 'dd-MM-yyyy')    
        , 'SH_CLERK'    
        , 3900    
        , NULL    
        , 123    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 194    
        , 'Samuel'    
        , 'McCain'    
        , 'SMCCAIN'    
        , '650.501.3876'    
        , TO_DATE('01-07-2006', 'dd-MM-yyyy')    
        , 'SH_CLERK'    
        , 3200    
        , NULL    
        , 123    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 195    
        , 'Vance'    
        , 'Jones'    
        , 'VJONES'    
        , '650.501.4876'    
        , TO_DATE('17-03-2007', 'dd-MM-yyyy')    
        , 'SH_CLERK'    
        , 2800    
        , NULL    
        , 123    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 196    
        , 'Alana'    
        , 'Walsh'    
        , 'AWALSH'    
        , '650.507.9811'    
        , TO_DATE('24-04-2006', 'dd-MM-yyyy')    
        , 'SH_CLERK'    
        , 3100    
        , NULL    
        , 124    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 197    
        , 'Kevin'    
        , 'Feeney'    
        , 'KFEENEY'    
        , '650.507.9822'    
        , TO_DATE('23-05-2006', 'dd-MM-yyyy')    
        , 'SH_CLERK'    
        , 3000    
        , NULL    
        , 124    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 198    
        , 'Donald'    
        , 'OConnell'    
        , 'DOCONNEL'    
        , '650.507.9833'    
        , TO_DATE('21-06-2007', 'dd-MM-yyyy')    
        , 'SH_CLERK'    
        , 2600    
        , NULL    
        , 124    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 199    
        , 'Douglas'    
        , 'Grant'    
        , 'DGRANT'    
        , '650.507.9844'    
        , TO_DATE('13-01-2008', 'dd-MM-yyyy')    
        , 'SH_CLERK'    
        , 2600    
        , NULL    
        , 124    
        , 50    
        );    
    
INSERT INTO employees VALUES     
        ( 200    
        , 'Jennifer'    
        , 'Whalen'    
        , 'JWHALEN'    
        , '515.123.4444'    
        , TO_DATE('17-09-2003', 'dd-MM-yyyy')    
        , 'AD_ASST'    
        , 4400    
        , NULL    
        , 101    
        , 10    
        );    
    
INSERT INTO employees VALUES     
        ( 201    
        , 'Michael'    
        , 'Hartstein'    
        , 'MHARTSTE'    
        , '515.123.5555'    
        , TO_DATE('17-02-2004', 'dd-MM-yyyy')    
        , 'MK_MAN'    
        , 13000    
        , NULL    
        , 100    
        , 20    
        );    
    
INSERT INTO employees VALUES     
        ( 202    
        , 'Pat'    
        , 'Fay'    
        , 'PFAY'    
        , '603.123.6666'    
        , TO_DATE('17-08-2005', 'dd-MM-yyyy')    
        , 'MK_REP'    
        , 6000    
        , NULL    
        , 201    
        , 20    
        );    
    
INSERT INTO employees VALUES     
        ( 203    
        , 'Susan'    
        , 'Mavris'    
        , 'SMAVRIS'    
        , '515.123.7777'    
        , TO_DATE('07-06-2002', 'dd-MM-yyyy')    
        , 'HR_REP'    
        , 6500    
        , NULL    
        , 101    
        , 40    
        );    
    
INSERT INTO employees VALUES     
        ( 204    
        , 'Hermann'    
        , 'Baer'    
        , 'HBAER'    
        , '515.123.8888'    
        , TO_DATE('07-06-2002', 'dd-MM-yyyy')    
        , 'PR_REP'    
        , 10000    
        , NULL    
        , 101    
        , 70    
        );    
    
INSERT INTO employees VALUES     
        ( 205    
        , 'Shelley'    
        , 'Higgins'    
        , 'SHIGGINS'    
        , '515.123.8080'    
        , TO_DATE('07-06-2002', 'dd-MM-yyyy')    
        , 'AC_MGR'    
        , 12008    
        , NULL    
        , 101    
        , 110    
        );    
    
INSERT INTO employees VALUES     
        ( 206    
        , 'William'    
        , 'Gietz'    
        , 'WGIETZ'    
        , '515.123.8181'    
        , TO_DATE('07-06-2002', 'dd-MM-yyyy')    
        , 'AC_ACCOUNT'    
        , 8300    
        , NULL    
        , 205    
        , 110    
        );    
        INSERT INTO job_history  
VALUES (102  
       , TO_DATE('13-01-2001', 'dd-MM-yyyy')  
       , TO_DATE('24-07-2006', 'dd-MM-yyyy')  
       , 'IT_PROG'  
       , 60);  
  
INSERT INTO job_history  
VALUES (101  
       , TO_DATE('21-09-1997', 'dd-MM-yyyy')  
       , TO_DATE('27-10-2001', 'dd-MM-yyyy')  
       , 'AC_ACCOUNT'  
       , 110);  
  
INSERT INTO job_history  
VALUES (101  
       , TO_DATE('28-10-2001', 'dd-MM-yyyy')  
       , TO_DATE('15-03-2005', 'dd-MM-yyyy')  
       , 'AC_MGR'  
       , 110);  
  
INSERT INTO job_history  
VALUES (201  
       , TO_DATE('17-02-2004', 'dd-MM-yyyy')  
       , TO_DATE('19-12-2007', 'dd-MM-yyyy')  
       , 'MK_REP'  
       , 20);  
  
INSERT INTO job_history  
VALUES  (114  
        , TO_DATE('24-03-2006', 'dd-MM-yyyy')  
        , TO_DATE('31-12-2007', 'dd-MM-yyyy')  
        , 'ST_CLERK'  
        , 50  
        );  
  
INSERT INTO job_history  
VALUES  (122  
        , TO_DATE('01-01-2007', 'dd-MM-yyyy')  
        , TO_DATE('31-12-2007', 'dd-MM-yyyy')  
        , 'ST_CLERK'  
        , 50  
        );  
  
INSERT INTO job_history  
VALUES  (200  
        , TO_DATE('17-09-1995', 'dd-MM-yyyy')  
        , TO_DATE('17-06-2001', 'dd-MM-yyyy')  
        , 'AD_ASST'  
        , 90  
        );  
  
INSERT INTO job_history  
VALUES  (176  
        , TO_DATE('24-03-2006', 'dd-MM-yyyy')  
        , TO_DATE('31-12-2006', 'dd-MM-yyyy')  
        , 'SA_REP'  
        , 80  
        );  
  
INSERT INTO job_history  
VALUES  (176  
        , TO_DATE('01-01-2007', 'dd-MM-yyyy')  
        , TO_DATE('31-12-2007', 'dd-MM-yyyy')  
        , 'SA_MAN'  
        , 80  
        );  
  
INSERT INTO job_history  
VALUES  (200  
        , TO_DATE('01-07-2002', 'dd-MM-yyyy')  
        , TO_DATE('31-12-2006', 'dd-MM-yyyy')  
        , 'AC_ACCOUNT'  
        , 90  
        );  
END;
ALTER TABLE departments   
  ENABLE CONSTRAINT dept_mgr_fk
  SELECT * FROM employees
SELECT * FROM DEPARTMENTS
SET SERVEROUTPUT ON
DECLARE
V_CNT NUMBER := 0;
BEGIN
LOOP
DBMS_OUTPUT.PUT_LINE('AHMED');
V_CNT := V_CNT + 1;
EXIT WHEN V_CNT = 3;
END LOOP;
END;
SET SERVEROUTPUT ON
DECLARE
V_CNT NUMBER := 100;
F_NAME EMP.ENAME%TYPE;
BEGIN
WHILE V_CNT != 103 LOOP
SELECT ENAME INTO F_NAME FROM EMP WHERE EMPNO = V_CNT;
DBMS_OUTPUT.PUT_LINE(F_NAME);
V_CNT := V_CNT + 1;
END LOOP;
END;
SET SERVEROUTPUT ON
DECLARE
V_CNT NUMBER := 100;
BEGIN
FOR I IN REVERSE 1..V_CNT LOOP
DBMS_OUTPUT.PUT_LINE('WELCOME' || I);
END LOOP;
END;
SET SERVEROUTPUT ON
DECLARE
STAR VARCHAR2(100);
BEGIN
FOR I IN 1..5 LOOP
        FOR J IN 1..I LOOP
        STAR := STAR || '*';
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(STAR);
        STAR := NULL;
END LOOP;
END;
SET SERVEROUTPUT ON
DECLARE
TYPE T_EMP IS RECORD(
        V_EMP_ID EMP.EMPNO%TYPE,
        V_EMP_EN EMP.ENAME%TYPE,
        V_EMP_SA EMP.SAL%TYPE
);
V_EMP T_EMP;
BEGIN
SELECT EMPNO, ENAME, SAL INTO V_EMP FROM EMP WHERE EMPNO = 100;
DBMS_OUTPUT.PUT_LINE(V_EMP.V_EMP_ID || ' ' || V_EMP.V_EMP_EN || ' ' || V_EMP.V_EMP_SA);
END;
CREATE TABLE COPY_DEPT AS SELECT * FROM DEPT WHERE DEPTNO = 10;
SELECT * FROM COPY_DEPT
SET SERVEROUTPUT ON
TYPE T_COPY_DEPT IS RECORD(
        V_DEPTNO DEPT.DEPTNO%TYPE,
        V_DNAME DEPT.DNAME%TYPE,
        V_MGR DEPT.MGR%TYPE,
        V_LOCATION_ID DEPT.LOCATION_ID%TYPE
);
V_DE T_COPY_DEPT;
DECLARE
T_COPY_DEPT DEPT%ROWTYPE;
BEGIN
SELECT * INTO T_COPY_DEPT FROM DEPT WHERE DEPTNO = 40;
INSERT INTO COPY_DEPT VALUES T_COPY_DEPT;
END;
DECLARE
T_COPY_DEPT DEPT%ROWTYPE;
BEGIN
T_COPY_DEPT.DEPTNO := 10;
T_COPY_DEPT.DNAME := 'TEST';
UPDATE COPY_DEPT SET ROW = T_COPY_DEPT WHERE DEPTNO = 40;
END;
SELECT * FROM COPY_DEPT;
SET SERVEROUTPUT ON
DECLARE
TYPE TAB_NO IS TABLE OF VARCHAR2(100) INDEX BY BINARY_INTEGER;
V_TAB_NO TAB_NO;
BEGIN
V_TAB_NO(1) := 'AHMED';
V_TAB_NO(5) := 'KHALED';
V_TAB_NO(3) := 'MHMD';

DBMS_OUTPUT.PUT_LINE(V_TAB_NO(1));
END;
DECLARE
TYPE V_TAB IS TABLE OF VARCHAR2(100) INDEX BY BINARY_INTEGER;
V_TA V_TAB;
BEGIN
V_TA(6) := 'WQRE';
DBMS_OUTPUT.PUT_LINE(V_TA(6));
END;
DECLARE
TYPE V_TAB IS TABLE OF EMP%ROWTYPE INDEX BY BINARY_INTEGER;
E_TAB V_TAB;
BEGIN
FOR I IN 100..104 LOOP
SELECT * INTO E_TAB(I) FROM EMP WHERE EMPNO = I;
DBMS_OUTPUT.PUT_LINE(E_TAB(I).EMPNO || ' ' || E_TAB(I).ENAME);
END LOOP;
/*
E_TAB(4).EMPNO := 654;
E_TAB(4).ENAME := 'AHMED';
E_TAB(6).EMPNO := 741;
E_TAB(6).ENAME := 'MHMD';

DBMS_OUTPUT.PUT_LINE(E_TAB(4).EMPNO || ' ' || E_TAB(4).ENAME);
*/

END;
SELECT * FROM EMP
SET SERVEROUTPUT ON
DECLARE
TYPE V_TAB IS TABLE OF EMP%ROWTYPE INDEX BY BINARY_INTEGER;
E_TAB V_TAB;
BEGIN
FOR I IN 100..104 LOOP
SELECT * INTO E_TAB(I) FROM EMP WHERE EMPNO = I;
END LOOP;
FOR I IN E_TAB.NEXT(100)..E_TAB.LAST LOOP
DBMS_OUTPUT.PUT_LINE(E_TAB(I).EMPNO || ' ' || E_TAB(I).ENAME || ' ' || E_TAB(I).SAL || ' ' || E_TAB(I).JOB);
END LOOP;
END;
DECLARE
TYPE X IS RECORD(E EMP%ROWTYPE);
R X;
BEGIN
SELECT * INTO R.E FROM EMP WHERE EMPNO = 104;
DBMS_OUTPUT.PUT_LINE(R.E.ENAME);
SELECT DNAME, DEPTNO INTO R.E.ENAME, R.E.DEPTNO FROM DEPT WHERE DEPTNO = R.E.DEPTNO;
DBMS_OUTPUT.PUT_LINE(R.E.ENAME || ' ' || R.E.DEPTNO);
--SELECT DEPTNO INTO R.E.DEPTNO FROM DEPT WHERE DNAME = R.E.ENAME;
--DBMS_OUTPUT.PUT_LINE(R.E.DEPTNO);
END;
SELECT * FROM EMP WHERE EMPNO = 104
SELECT * FROM DEPT WHERE DEPTNO = 60;
DECLARE
TYPE R IS RECORD(V_EN VARCHAR2(100));
TYPE T_TAB IS TABLE OF R INDEX BY BINARY_INTEGER;
V_TAB T_TAB;
BEGIN
FOR I IN 100..200 LOOP
SELECT ENAME INTO V_TAB(I).V_EN FROM EMP WHERE EMPNO = I;
END LOOP;
FOR I IN V_TAB.FIRST..V_TAB.LAST LOOP
DBMS_OUTPUT.PUT_LINE(V_TAB(I).V_EN);    
END LOOP;
END;
SET SERVEROUTPUT ON
DECLARE
TYPE T_LOC IS TABLE OF VARCHAR2(100);
LOC T_LOC;
BEGIN
LOC := T_LOC('SYRIA');
LOC.EXTEND;
LOC(2) := 'USA';
DBMS_OUTPUT.PUT_LINE(LOC(2));
END;
SET SERVEROUTPUT ON
DECLARE
TYPE R IS RECORD(
        V_EMPNO EMP.EMPNO%TYPE,
        V_ENAME EMP.ENAME%TYPE
        );
        V_R R;
TYPE TABE IS TABLE OF R INDEX BY BINARY_INTEGER;
T TABE;
TYPE TABE1 IS TABLE OF EMP%ROWTYPE INDEX BY BINARY_INTEGER;
T1 TABE1;
BEGIN
FOR I IN 200..206 LOOP
SELECT * INTO T1(I) FROM EMP WHERE EMPNO = I;
END LOOP;
FOR I IN 100..200 LOOP
SELECT EMPNO, ENAME INTO T(I).V_EMPNO, T(I).V_ENAME FROM EMP WHERE EMPNO = I;
END LOOP;
FOR I IN T.PRIOR(123)..T.NEXT(198) LOOP
DBMS_OUTPUT.PUT_LINE(T(I).V_EMPNO || ' ' || T(I).V_ENAME);
END LOOP;
SELECT EMPNO, ENAME INTO T(54).V_EMPNO, T(54).V_ENAME FROM EMP WHERE EMPNO = 200;
V_R.V_EMPNO := 45;
V_R.V_ENAME := 'AHMED';
DBMS_OUTPUT.PUT_LINE(V_R.V_EMPNO || ' ' || V_R.V_ENAME);
DBMS_OUTPUT.PUT_LINE(T(54).V_EMPNO || ' ' || T(54).V_ENAME);
DBMS_OUTPUT.PUT_LINE(T.COUNT);
DBMS_OUTPUT.PUT_LINE(T1.COUNT);
END;
SELECT * FROM EMP WHERE EMPNO > 199
DECLARE
TYPE R IS RECORD(ENAME VARCHAR2(100), EMPNO NUMBER);
TYPE TAB IS TABLE OF R;
T TAB := TAB();
BEGIN
T.EXTEND;
T(T.FIRST).EMPNO := 50;
DBMS_OUTPUT.PUT_LINE(T(1).EMPNO);
END;
DECLARE
TYPE ARR IS VARRAY(3) OF EMP%ROWTYPE;
A ARR := ARR();
BEGIN
A.EXTEND;
A(A.LAST).ENAME := 'AHMED';
DBMS_OUTPUT.PUT_LINE(A(1).ENAME);
END;
DECLARE CURSOR C IS SELECT * FROM EMP;TYPE T IS TABLE OF EMP%ROWTYPE INDEX BY BINARY_INTEGER;V_T T;BEGIN FOR REC IN C LOOP T(REC.EMPNO) := REC;END LOOP;END;
SET SERVEROUTPUT ON
DECLARE
CURSOR C IS SELECT * FROM EMP WHERE DEPTNO = 50;
V_ENAME C%ROWTYPE;
BEGIN
OPEN C;
LOOP
FETCH C INTO V_ENAME;
EXIT WHEN C%NOTFOUND;
IF V_ENAME.EMPNO > 150 THEN
DBMS_OUTPUT.PUT_LINE(V_ENAME.EMPNO);
ELSE
DBMS_OUTPUT.PUT_LINE(V_ENAME.ENAME);
END IF;
END LOOP;
CLOSE C;
END;
DECLARE
CURSOR C IS SELECT * FROM EMP;
CH BOOLEAN := TRUE;
BEGIN
FOR I IN C LOOP
IF I.EMPNO = 100 THEN
RETURN CH;
DBMS_OUTPUT.PUT_LINE(I.EMPNO);
END IF;
END LOOP;
END;
SET SERVEROUTPUT ON
DECLARE
TYPE R IS RECORD(VEMPNO EMP.EMPNO%TYPE, VENAME EMP.ENAME%TYPE);
TYPE T IS TABLE OF R INDEX BY BINARY_INTEGER;
CURSOR C IS SELECT EMPNO, ENAME, DEPTNO FROM EMP;
VT T;
BEGIN
FOR I IN C LOOP
IF I.DEPTNO = 30 THEN
VT(I.EMPNO).VENAME := I.ENAME;
VT(I.EMPNO).VEMPNO := I.EMPNO;
DBMS_OUTPUT.PUT_LINE(VT(I.EMPNO).VEMPNO || ' ' || VT(I.EMPNO).VENAME);
END IF;
END LOOP;
END;
DECLARE
VENAME EMP.ENAME%TYPE;
BEGIN
SELECT ENAME INTO VENAME FROM EMP WHERE DEPTNO = 50;
DBMS_OUTPUT.PUT_LINE(VENAME);
EXCEPTION
        WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('NOT FOUND');
        WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('TO MANY');
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('OTHERS');
END;
DECLARE
VEMPNO EMP.EMPNO%TYPE;
VENAME EMP.ENAME%TYPE;
BEGIN
FOR I IN 99..105 LOOP
BEGIN
SELECT EMPNO, ENAME INTO VEMPNO, VENAME FROM EMP WHERE EMPNO = I;
DBMS_OUTPUT.PUT_LINE(VEMPNO || ' ' || VENAME);
EXCEPTION
        WHEN NO_DATA_FOUND THEN
        NULL;
END;
END LOOP;
END;
DESC EMP;
CREATE PROCEDURE UPDATE_SAL(ID_DEPT NUMBER, ID_MGR NUMBER) IS
BEGIN
UPDATE COPY_DEPT SET MGR = ID_MGR WHERE DEPTNO = ID_DEPT;
END;
GRANT CREATE PROCEDURE TO HR
ALTER SESSION SET CONTAINER = XEPDB1
SELECT * FROM COPY_DEPT
EXECUTE UPDATE_SAL(30, 200);
DROP PROCEDURE UPDATE_SAL
SET SERVEROUTPUT ON
CREATE PROCEDURE P_EMP(ID_EMP EMP.EMPNO%TYPE, F_NAME OUT EMP.ENAME%TYPE, SAL_EMP EMP.SAL%TYPE) IS
BEGIN
SELECT ENAME, SAL INTO F_NAME, SAL_EMP FROM EMP WHERE EMPNO = ID_EMP;
END;
DROP PROCEDURE P_EMP
SELECT * FROM SESSION_PRIVS
CREATE OR REPLACE FUNCTION SELNAME(NUM NUMBER) RETURN VARCHAR2 IS
NM VARCHAR2(50);
BEGIN
SELECT ENAME INTO NM FROM EMP WHERE EMPNO = NUM;
RETURN NM;
EXCEPTION 
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('NO DATA');
END;
SET SERVEROUTPUT ON
BEGIN
DBMS_OUTPUT.PUT_LINE(SELNAME(121));
END;
SELECT * FROM EMP ORDER BY ENAME;
CREATE OR REPLACE FUNCTION SELNAME(NUM NUMBER) RETURN NUMBER IS
TX NUMBER(5) := 0;
SALARY NUMBER(7,2);
BEGIN
SELECT SAL INTO SALARY FROM EMP WHERE EMPNO = NUM;
IF SALARY <= 1000 THEN
TX := TX * (10/100);
RETURN TX;
ELSIF SALARY <= 2200 THEN
TX := 1000 * (1/100) + (SALARY - 1000) * (3/100);
RETURN TX;
ELSIF SALARY <= 3500 THEN
TX := 1000 * (1/100) + (2200 - 1000) * (3/100) + (SALARY - 2200) * (5/100);
RETURN TX;
ELSIF SALARY <= 7000 THEN
TX := 1000 * (1/100) + (2200 - 1000) * (3/100) + (3500 - 2200) * (5/100) + (SALARY - 3500) * (8/100);
RETURN TX;
END IF;
END;
SELECT EMPNO, SAL FROM EMP WHERE EMPNO = 178
BEGIN
DBMS_OUTPUT.PUT_LINE(SELNAME(180));
END;
SELECT SELNAME(178) FROM DUAL
SELECT SUM(SAL) FROM EMP WHERE DEPTNO = 10;
SET SERVEROUTPUT ON
DECLARE
NAME VARCHAR2(100);
SALARY NUMBER(7,2);
BEGIN
SELECT ENAME, SAL INTO NAME, SALARY FROM EMP
WHERE EMPNO = 180;
DBMS_OUTPUT.PUT_LINE(NAME || 'GETS' || SALARY);
END;
CREATE TABLE COPY_EMP AS SELECT EMPNO FROM EMP WHERE 2 > 3;
SELECT * FROM COPY_EMP
DESC COPY_EMP
INSERT INTO COPY_EMP VALUES(100);
COMMIT;
DELETE FROM COPY_EMP;
SELECT * FROM COPY_EMP;
ROLLBACK;
SELECT * FROM COPY_EMP;
AUTOCOMMIT = OFF
set autocommit off;
SELECT DEPTNO, (SELECT DNAME, DEPTNO FROM DEPT WHERE DEPTNO = EMP.DEPTNO) AS NUD FROM EMP
SELECT EMPNO, DEPTNO FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE EMP.DEPTNO = DEPTNO)
SELECT EMPNO, EMP.DEPTNO FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO
SELECT * FROM USER_USERS
SELECT * FROM SESSION_PRIVS
SELECT * FROM ALL_USERS
SELECT TO_CHAR(HIRE_DATE, 'YYYY') FROM EMP
SELECT COUNT(*) FROM EMP WHERE TO_CHAR(HIRE_DATE, 'YYYY') = 2007
SELECT SUM(SAL) FROM EMP WHERE JOB = 'IT_PROG'
SELECT JOB FROM EMP
SELECT USER FROM DUAL

CREATE PROCEDURE PRO1(DNUM NUMBER) IS
CURSOR C1 IS SELECT ENAME FROM EMP WHERE DEPTNO = DNUM;
BEGIN
FOR I IN C1
LOOP
DBMS_OUTPUT.PUT_LINE(I.ENAME);
END LOOP;
END;

CREATE OR REPLACE FUNCTION FUN1(D NUMBER) RETURN NUMBER IS
CNT NUMBER(5);
BEGIN
SELECT COUNT(*) INTO CNT FROM EMP WHERE TO_CHAR(HIRE_DATE, 'YYYY') = D;
RETURN CNT;
END;

CREATE OR REPLACE PROCEDURE PRO2(J VARCHAR2, S OUT NUMBER) IS 
BEGIN
SELECT SUM(SAL) INTO S FROM EMP WHERE JOB = J;
END;

DECLARE
SU NUMBER;
BEGIN
PRO2('IT_PROG', SU);
DBMS_OUTPUT.PUT_LINE(SU);
END;
/

SELECT SUM(SAL)||DNAME FROM EMP , DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO GROUP BY DNAME;
SELECT * FROM USER_TAB_PRIVS_MADE
SELECT * FROM USER_TAB_PRIVS_RECD
SELECT * FROM TABLE_PRIVILEGES
SELECT * FROM COLUMN_PRIVILEGES
grant EXECUTE on fun1 TO DN
REVOKE EXECUTE ON FUN1 FROM DN
DROP PROCEDURE PRO2
DROP FUNCTION SELNAME

SELECT * FROM COPY_EMP
CREATE SEQUENCE SQU
DELETE FROM COPY_EMP WHERE EMPNO = 2;
INSERT INTO COPY_EMP VALUES(SQU.NEXTVAL)

CREATE PACKAGE PAK1 IS
PROCEDURE INS_COPY_EMP(PK NUMBER);
PROCEDURE UPD_COPY_EMP(PK NUMBER);
PROCEDURE DEL_COPY_EMP(PK NUMBER);
PROCEDURE PRINT_COPY_EMP;
END;
EXCEPTION
WHEN DUP_VAL_ON_INDEX THEN
DBMS_OUTPUT.PUT_LINE('EMP EXISTING');
DROP PACKAGE PAK1
CREATE OR REPLACE PACKAGE BODY PAK1 IS
        PROCEDURE INS_COPY_EMP(PK NUMBER) IS
        BEGIN
        INSERT INTO COPY_EMP VALUES(PK);
        DBMS_OUTPUT.PUT_LINE('DONE INSERTED');
        END;
        PROCEDURE UPD_COPY_EMP(PK NUMBER) IS
        BEGIN
        UPDATE COPY_EMP SET EMPNO = PK WHERE EMPNO = PK;
        DBMS_OUTPUT.PUT_LINE('DONE UPDATED ' || SQL%ROWCOUNT);
        END;
        PROCEDURE DEL_COPY_EMP(PK NUMBER) IS
        BEGIN
        DELETE FROM COPY_EMP WHERE EMPNO = PK;
        DBMS_OUTPUT.PUT_LINE('DONE DELETED ' || SQL%ROWCOUNT);
        END;
        PROCEDURE PRINT_COPY_EMP IS
        CURSOR C1 IS SELECT * FROM COPY_EMP;
        BEGIN
        DBMS_OUTPUT.PUT_LINE('EMPNO');
        FOR I IN C1
        LOOP
        DBMS_OUTPUT.PUT_LINE(I.EMPNO);
        END LOOP;
        END;
END PAK1;
SET SERVEROUTPUT ON
EXECUTE PAK1.INS_COPY_EMP(5);
EXECUTE PAK1.UPD_COPY_EMP(100);
EXECUTE PAK1.DEL_COPY_EMP(5);
EXECUTE PAK1.PRINT_COPY_EMP;

create or replace package emp_pkg
is
type emp_table_type is table of emp%rowtype
index by binary_integer;


FUNCTION FUN RETURN NUMBER;
end;
  procedure get_employees(p_emps out emp_table_type )
  is
  begin
    for emp_record in (select * from emp)
    loop
   p_emps( emp_record.empno):=emp_record;
    end loop;
-------------------------------
create or replace package body emp_pkg
is
FUNCTION FUN RETURN NUMBER IS
BEGIN
RETURN 1;
END;
end;
-----------------------------------
declare
v_employees emp_pkg.emp_table_type;
begin
emp_pkg.get_employees(v_employees);
dbms_output.put_line(v_employees(101).ename);
end;
DECLARE
CURSOR C1 IS SELECT * FROM EMP;
BEGIN
FOR I IN C1.ENAME
LOOP
dbms_output.put_line(I);
END LOOP;
END;