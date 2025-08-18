-- Database Management System
-- Practice Task 02
-- Objective: To use single row functions.
-- 1.	Display the Employee name and designation in one column.
SELECT CONCAT(ename," ",job) AS Employee FROM emp;
-- 2.	Display all records from table whose name is Smith using all uppercases in where clause.
SELECT * FROM emp WHERE UPPER(ename) = "SMITH";
-- 3.	Display all records from table whose name is Smith using all lowercases in where clause.
SELECT * FROM emp WHERE LOWER(ename) = 'SMITH';
-- 4.	Show the result of those employees whose name length exceeds 6.
SELECT * FROM emp WHERE Length(ename)>=6;
-- 5.	Display ename, salary and concatenated result of deptno and empno from table EMP where salary is less than 2500 or job is equal to MANAGER.
SELECT ename,sal,job, CONCAT(deptno," ", empno) AS "DeptNO EmpNo" FROM emp WHERE sal <2500 OR job ="Manager";
-- 6.	Display first 3 characters of ename, deptno and job from table EMP where second character of ename is ‘A’ and deptno is 30 or job is SALESMAN.
SELECT SUBSTR(ename,1,3) AS Name, deptno,job FROM `emp` WHERE ename LIKE "_a%" And (deptno ="30" Or job= "SALESMAN");
-- 7.	Right Append dollar sign in Employee table to make salary 8 digit value.
SELECT *, LPAD(sal, 8, '$') AS sal from emp;

-- 8.	Calculate annual salary and rename it as PER_ANNUM_SALARY of the employee whose ename is KING and salary is greater than 1500 from table EMP.
SELECT (sal*12) AS PER_ANNUM_SALARY from emp where ename="KING" AND sal > 1500;
-- 9.	Round 345.6665 upto 2 digits from table DUAL.
SELECT Round(sal,2) AS Salary from emp;
-- 10.	Write a query that displays enames with first letter capitalized and all other letters in lowercase and length of enames whose enames start with J, A or N.
SELECT CONCAT(SUBSTR(ename,1,1),SUBSTR(LOWER(ename),2,LENGTH(ename))) AS Name FROM `emp` WHERE ename LIKE 'a%' OR ename LIKE 'j%' OR ename Like 'n%';
