-- Database Management System
-- Practice Task 06
-- Objective: Group by clause and Having statement
-- Task #1:  Show the total number of employees in each department.
SELECT deptno, COUNT(*) AS total_employees
FROM emp
GROUP BY deptno;
-- Task #2: Show the total number of employees in an organization in department 20.

SELECT deptno, COUNT(*) AS total_employees FROM emp WHERE deptno=20;

-- Task #3:  Show the department number that have less than 5 employees.
SELECT deptno, COUNT(*) AS total_employees
FROM emp
GROUP BY deptno
HAVING COUNT(*) < 5;

-- Task #4: Show the department names of employees and the number of employees in the department.
SELECT dept.dname, COUNT(empno) AS total_employees FROM emp JOIN dept ON emp.deptno = dept.deptno GROUP BY dept.dname;
-- Task #5: Show the department names that have less than 5 employees.
SELECT dept.dname, COUNT(empno) AS total_employees FROM emp JOIN dept ON emp.deptno = dept.deptno GROUP BY dept.dname HAVING total_employees <5;
-- Task #6:  Show the total salary for the whole organization.
SELECT SUM(sal) AS total_salary
FROM emp;
-- Task #7: Show the total salary for each department.
SELECT SUM(sal) AS total_salary FROM emp GROUP BY deptno;

-- Task #8: Show the total salary for department number 30.
SELECT SUM(sal) AS total_salary FROM emp WHERE deptno=30;
-- Task #9: Show the department number that have budget more than 10,000
SELECT deptno, SUM(sal) AS budget FROM emp GROUP BY deptno HAVING SUM(sal) > 10000;
-- Task #10: Show the department name and location that have budget more than 10,000
SELECT d.dname, d.loc, SUM(e.sal) AS budget
FROM emp e
JOIN dept d ON e.deptno = d.deptno
GROUP BY d.dname, d.loc
HAVING SUM(e.sal) > 10000;
-- Task #11: Display the number of employee’s department-wise and jobwise. The output look like as:
-- DEPTNO   JOB        COUNT (*)
SELECT deptno, job, COUNT(*) AS total_employees
FROM emp
GROUP BY deptno, job
ORDER BY deptno, job;

-- Task #12: Display the highest and lowest salaries department wise. The output look like as:
--               DEPTN0      LOWEST	               HIGHEST
-- 10	          1200		52000
-- 20	          800		6950
-- 30	         4560		19856
SELECT deptno,
       MIN(sal) AS lowest,
       MAX(sal) AS highest
FROM emp
GROUP BY deptno;
-- Task #13: Display the departments that have at least 1 employee
SELECT deptno, COUNT(*) AS total_employees
FROM emp
GROUP BY deptno
HAVING COUNT(*) >= 1;

