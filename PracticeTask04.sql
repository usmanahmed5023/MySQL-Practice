-- Database Management System
-- Practice Task 04
-- Objective: Use joins on EMP & DEPT table.
-- Task # 1: Write a query to combine all rows of table EMP and table DEPT. Sort the columns in ascending order by employee names.
SELECT emp.empno, emp.ename,emp.job,emp.mgr,emp.hiredate, emp.sal,emp.comm,emp.deptno, dept.deptno,dept.dname,dept.loc 
FROM emp
INNER JOIN dept ON emp.deptno=dept.deptno
ORDER BY emp.ename;
-- Task # 2: Write a query to display the name, department number, and department name for all employees.
SELECT emp.ename, dept.deptno,dept.dname FROM emp INNER JOIN dept ON emp.deptno=dept.deptno;
-- Task # 3: Create a unique listing of all jobs that are in department 30. Include the location of the department in the output
SELECT DISTINCT emp.job,
       dept.loc
FROM emp
INNER JOIN dept ON emp.deptno = dept.deptno
WHERE emp.deptno = 30;
-- Task # 4: Write a query to display the employee name, job, department number, and department name
SELECT emp.ename, emp.job, dept.deptno,
       dept.loc
FROM emp
INNER JOIN dept ON emp.deptno = dept.deptno;
-- Task # 5: Write a query to retrieve ename, length of enames, loc , deptno and sal  by join table EMP with table DEPT where deptno is 30 and sal is greater than 800. Sort the sal in descending order.
SELECT emp.ename,COUNT(emp.ename) AS Length, dept.deptno,
       dept.loc
FROM emp
INNER JOIN dept ON emp.deptno = dept.deptno
WHERE emp.deptno = 30 AND sal > 800
ORDER BY sal DESC;
-- Task # 6: Write a query for table EMP and DEPT to retrieve enames , sal, job, deptno, loc where length of job is greater than length of loc.
SELECT emp.ename,emp.sal,emp.job,dept.deptno,dept.loc FROM emp INNER JOIN dept ON emp.deptno = dept.deptno WHERE LENGTH(emp.job) > LENGTH(dept.loc);
-- Task #7: Display all employees including King, who has no manager.
SELECT e1.ename AS employee FROM emp e1 LEFT JOIN emp e2 ON e1.mgr = e2.empno;
