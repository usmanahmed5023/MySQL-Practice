-- Database Management System
-- Practice Task 05
-- Objective: Use joins on EMP & DEPT table.
-- Task #1:  Create a query that displays ename, deptno, and all enames of those employees who work in the same department as a given employee. Give each column an appropriate Label.
SELECT e1.ename AS Employee,
       e1.deptno AS Dept_No,
       e2.ename AS Colleague
FROM emp e1
JOIN emp e2
     ON e1.deptno = e2.deptno
WHERE e1.ename = 'SCOTT';
-- Task #2: Create a query that displays enames, deptno, and hiredates of all employees hired after employee MARTIN.
SELECT ename AS Employee,
       deptno AS Dept_No,
       hiredate AS Hire_Date
FROM emp
WHERE hiredate > (SELECT hiredate FROM emp WHERE ename = 'MARTIN');
-- Task #3:  Create a query that displays enames, deptno, and hiredates for all employees who were hired before their managers, along with their manager’s names and hiredates. Give the columns with appropriate labels.
SELECT e.ename AS Employee,
       e.deptno AS Dept_No,
       e.hiredate AS Emp_HireDate,
       m.ename AS Manager,
       m.hiredate AS Mgr_HireDate
FROM emp e
JOIN emp m
     ON e.mgr = m.empno
WHERE e.hiredate < m.hiredate;
-- Task #4: Display the employee name and employee number along with their manager’s name and manager number. Label the columns Employee, Emp#, Manager, and Mgr#, respectively.
SELECT e.ename AS Employee,
       e.empno AS Emp,
       m.ename AS Manager,
       m.empno AS Mgr
FROM emp e
LEFT JOIN emp m
       ON e.mgr = m.empno;
-- Task #5: Create a query to display the name and hire date of any employee hired after employee Ford.
SELECT ename AS Employee,
       hiredate AS Hire_Date
FROM emp
WHERE hiredate > (SELECT hiredate FROM emp WHERE ename = 'FORD');
-- Task #6:  Show the number of employees in each department. Show department name and location.
SELECT d.dname AS Department,
       d.loc AS Location,
       COUNT(e.empno) AS Num_Employees
FROM dept d
LEFT JOIN emp e
       ON d.deptno = e.deptno
GROUP BY d.dname, d.loc;
-- Task #7: Show the number of employees for each manager. Display manager’s name.
SELECT m.ename AS Manager,
       COUNT(e.empno) AS Num_Employees
FROM emp e
JOIN emp m
     ON e.mgr = m.empno
GROUP BY m.ename;
