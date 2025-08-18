-- Database Management System
-- Practice Task 07
-- Objective: Data Retrieve: Tuple Variables, Nested queries, Any, All, Exists.
-- Task #1: Write a query to display their employee names where deptno in emp table matches deptno in dept table.
SELECT e.ename
FROM emp e
WHERE e.deptno IN (SELECT d.deptno FROM dept d);
-- Task #2: Display the details of those who draw the salary greater than the average salary
SELECT *
FROM emp
WHERE sal > (SELECT AVG(sal) FROM emp);
-- Task #3: Write a query to display information about employees who earn more than any employee in dept 10.
SELECT *
FROM emp
WHERE sal > ANY (SELECT sal FROM emp WHERE deptno = 10);
-- Task #5: Write a query to display the name, department number, and salary of any employee whose department number and salary both match the department number and salary of any employee who earns a commission.
SELECT e.ename, e.deptno, e.sal
FROM emp e
WHERE (e.deptno, e.sal) IN (
      SELECT deptno, sal
      FROM emp
      WHERE comm IS NOT NULL);
-- Task #6: Create a query to display the name, hiredate, and salary of any employee who have both the same salary and commission as Scott. 
SELECT ename, hiredate, sal
FROM emp
WHERE (sal, NVL(comm,0)) = (SELECT sal, NVL(comm,0) FROM emp WHERE ename='SCOTT');
-- Task #7: Create a query to display the employees who earn a salary that is higher than the salary of all of the sales managers (JOB_ID = salesmanager). Sort the results on salary from highest to lowest.
SELECT *
FROM emp
WHERE sal > ALL (SELECT sal FROM emp WHERE job = 'SALESMANAGER')
ORDER BY sal DESC;
-- Task #8: Display the details of the employee ID, name, and department ID of those employees who live in cities whose name begins with D.
SELECT e.empno, e.ename, e.deptno
FROM emp e
JOIN dept d ON e.deptno = d.deptno
WHERE d.loc LIKE 'D%';
-- Task #9: Write a query to display the enames, sal and mgr of every employee whose mgr is ‘BLAKE’
SELECT e.ename, e.sal, e.mgr
FROM emp e
WHERE e.mgr = (SELECT empno FROM emp WHERE ename='BLAKE');
-- Task #10: Create a query that displays enames, deptno, and hiredates of all employees hired after employee MARTIN.
SELECT ename, deptno, hiredate
FROM emp
WHERE hiredate > (SELECT hiredate FROM emp WHERE ename='MARTIN');
-- Task # 11: Write a query to display the empno, enames and salaries of all employees who earn more than the average salary in a department with any employee with a in their ename.
SELECT empno, ename, sal
FROM emp
WHERE sal > (SELECT AVG(sal) FROM emp WHERE deptno IN (
               SELECT deptno FROM emp WHERE ename LIKE '%A%'));
-- Task # 12: Write a query to display the enames, sal and mgr of every employee whose mgr is same of MARTIN and sal is greater than 800.
SELECT ename, sal, mgr
FROM emp
WHERE mgr = (SELECT mgr FROM emp WHERE ename='MARTIN')
  AND sal > 800;
-- Task #13: Write a query for table EMP and DEPT to retrieve enames , sal, job, deptno where length of job is greater than length of loc.
SELECT e.ename, e.sal, e.job, e.deptno
FROM emp e
JOIN dept d ON e.deptno = d.deptno
WHERE LENGTH(e.job) > LENGTH(d.loc);
-- Task #14: Write a query that displays employees whose job title is the same as that of employee 7369 and whose salary is greater than that of employee 7876.
SELECT * FROM emp
WHERE job = (SELECT job FROM emp WHERE empno=7369)
  AND sal > (SELECT sal FROM emp WHERE empno=7876);
