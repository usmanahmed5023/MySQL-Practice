-- Database Management System
-- Practice Task 01
-- Objective: To use basic categories of SQL statements.
-- Task # 1: List all information of ‘Emp’ and ‘Dept’ tables.
SELECT * FROM emp;
SELECT * FROM dept;
-- Task # 2: List the empno,ename,jobtitle,and hiredate of employee from the employee table.
SELECT empno, ename, job, hiredate
FROM emp;
-- Task # 3: List the name,salary of the employees who are clerks.

SELECT ename, sal
FROM emp
WHERE job = 'CLERK';
-- Task # 4: List name and annual salary of all the employees.
SELECT ename, (sal * 12) AS Annual_Salary
FROM emp;

-- Task # 5: List the department name & deptno for departments having deptno.>=20

SELECT dname, deptno
FROM dept
WHERE deptno >= 20;
-- Task # 6: Display employees’ names, salary and manager values of those employees whose salary is 5000 from EMP table using SELECT statement.

SELECT ename, sal, mgr
FROM emp
WHERE sal = 5000;
-- Task # 7: Select dname from DEPT table where location is BOSTON.
SELECT dname
FROM dept
WHERE loc = 'BOSTON';

-- Task # 8: Increment the salary of each employee 10 times and then display the annual salary along with emp#, employee names and dept# from EMP table.

SELECT empno, ename, deptno, (sal * 10 * 12) AS Annual_Salary
FROM emp;
-- Task # 9: List the employees who have salary between 1000&2000.

SELECT ename, sal
FROM emp
WHERE sal BETWEEN 1000 AND 2000;

-- Task # 10: List the name,salary,commision of the employees where commision is greater than their salary.
SELECT ename, sal, comm
FROM emp
WHERE comm > sal;

-- Task # 11: List the name,monthly salary and daily salary and hourly salary for employee; assume that there are 22 working days in a month,8 working hours in a day. Display the rows with column names as monthly,daily &hourly sal.
SELECT ename,
       sal AS Monthly_Sal,
       (sal / 22) AS Daily_Sal,
       (sal / (22*8)) AS Hourly_Sal
FROM emp;

-- Task # 12: List the name and empno of managers who earn more than  2000.display the result in alphabetical order of the name.
SELECT ename, empno
FROM emp
WHERE job = 'MANAGER' AND sal > 2000
ORDER BY ename;
-- Task # 13: Display all employee names which have ‘TH’or ‘LL’ in them.

SELECT ename FROM emp WHERE(ename LIKE '%TH%' OR ename LIKE '%LL%');

-- Task # 14: List the details of the employees in the depts of 10 & 20 in the order of empno.
SELECT * FROM emp where deptno IN (10,20) ORDER BY empno;

-- Task # 15: Display the information about the managers and clerks from the column ‘Job’ in the table emp,order the result by deptno.
SELECT * FROM `emp` WHERE job="manager" OR job="Clerk" ORDER BY deptno;

-- Task # 16: List the empnames that don’t end with ‘s’.
SELECT * FROM `emp` WHERE ename NOT LIKE "%s";

-- Task # 17: List the emp names that begin with ‘c’.
SELECT * FROM `emp` WHERE ename LIKE "c%";

-- Task # 18: List the names of the employees starts with T/t and ends with R/r.

SELECT * FROM `emp` WHERE ename LIKE "T%R%";

-- Task # 19: List all the type of jobs that employees do (No repetitions)

SELECT DISTINCT job FROM `emp`;

-- Task # 20: List all employees whose names have 'a' as the second character.
SELECT * FROM `emp` WHERE ename LIKE "_a%";

-- Task # 21: List the names of all employees who do not get any commission.
SELECT ename FROM emp WHERE comm IS NULL;
