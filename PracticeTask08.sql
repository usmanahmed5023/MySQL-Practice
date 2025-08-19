-- Database Management System
-- Practice Task 08
-- Objective: To use views and stored procedures.
-- 1. Create a view that shows each employee’s name, job title, department name, and location.
CREATE VIEW Record AS
SELECT e.ename,e.job,d.dname,d.loc 
FROM emp e
JOIN dept d ON e.deptno=d.deptno


-- 2. Create a view that displays employees earning more than 3000 salary.

CREATE VIEW HighSalary AS
SELECT ename,sal
FROM emp
WHERE sal > 3000;

-- 3. Create a view that lists all managers along with their department names.

CREATE VIEW Managers AS
SELECT e.ename, d.dname
FROM emp e
JOIN dept d ON e.deptno = d.deptno
WHERE e.job = 'MANAGER';

-- 4. Create a view to display employee names and their annual salary (monthly salary × 12).

CREATE VIEW EmployeeAnnualSalary AS
SELECT e.ename, e.sal * 12 AS AnnualSalary
FROM emp e;

-- 5. Create a view that shows employees who do not receive any commission.

CREATE VIEW NonCommissionedEmployees AS
SELECT e.ename, e.sal
FROM emp e
WHERE e.comm IS NULL;

-- 6. Write a stored procedure that accepts a department number as input and displays all employees working in that department.


CREATE PROCEDURE EmpByDept(IN deptno INT)
    SELECT e.ename, e.job
    FROM emp e
    WHERE e.deptno = deptno;

CALL EmpByDept(10);
-- 7.  Write a stored procedure that accepts a minimum salary as input and displays all employees earning more than that salary.

CREATE PROCEDURE GetEmployeesBySalary(IN min_salary DECIMAL )

    SELECT e.ename, e.sal
    FROM emp e
    WHERE e.sal > min_salary;
CALL GetEmployeesBySalary(2000);

-- 8. Write a stored procedure to update the salary of an employee when given their employee number and the new salary.
CREATE PROCEDURE UpdateEmployeeSalary(IN emp_no INT, IN new_salary DECIMAL )
    UPDATE emp
    SET sal = new_salary
    WHERE empno = emp_no;
CALL UpdateEmployeeSalary(7369, 3000);

-- 9. Write a stored procedure to display the total number of employees in each department.

CREATE PROCEDURE GetEmployeeCountByDepartment()
    SELECT d.DepartmentName, COUNT(e.EmployeeID) AS EmployeeCount
    FROM Departments d
    LEFT JOIN Employees e ON d.DepartmentID = e.DepartmentID
    GROUP BY d.DepartmentName;
CALL GetEmployeeCountByDepartment();

-- 10. Write a stored procedure that accepts a job title (e.g., ‘CLERK’) as input and displays all employees having that job.

CREATE PROCEDURE GetEmployeesByJobTitle(IN job_title VARCHAR(50))
    SELECT e.ename, e.job
    FROM emp e
    WHERE e.job = job_title;
CALL GetEmployeesByJobTitle('CLERK');
