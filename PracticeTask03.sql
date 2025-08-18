-- Database Management System
-- Practice Task 03
-- Objective: Single Row Functions for Dates ,date/time formats.

-- 1.	For each employee, display the enames, hiredate, salary and calculate the number of months between today and hiredate. Round the number of months up to the closest whole number.
SELECT ename, hiredate, sal, ROUND(TIMESTAMPDIFF(MONTH, hiredate, CURDATE())) AS "Total Months" FROM emp;
-- 2.	Display the empno, ename and hiredate of all employees. The hiredate should be displayed in the given format. (i.e. 12 DEC 2014).
SELECT empno,ename,DATE_FORMAT(hiredate, '%d %b %Y') AS Hiredate FROM emp;
-- 3.	Extend the previous question to display the hiredate as 12*Dec%2014.
SELECT empno, ename, DATE_FORMAT(hiredate, '%d*%b%%%Y') AS Hiredate FROM emp;
-- 4.	Now display the employee’s first three characters of name and hiredate as 12 December, 2014.
SELECT SUBSTR(ename,1,3) AS Name,DATE_FORMAT(hiredate, '%d %M, %Y') AS Hiredate FROM emp;
-- 5.	Show all fields in EMP table of those employees whose length of ename is less than 5. The hiredate should be displayed as 12th December 2014.
SELECT *,DATE_FORMAT(hiredate, CONCAT('%D ', '%M %Y')) AS Hiredate FROM emp WHERE LENGTH(ename) < 5;
-- 6.	Display the empno, ename of all employees alongwith the hiredate but hiredate should be displayed in three different columns i.e. day, month and year in three different columns.

SELECT empno, ename, DATE_FORMAT(hiredate, '%d') AS Day, DATE_FORMAT(hiredate, '%M') AS Month, DATE_FORMAT(hiredate, '%Y') AS Year FROM emp;
-- 7.	List the records of those employees whose hiring month has 31 days.
SELECT * FROM emp WHERE DAY(LAST_DAY(hiredate)) = 31;


-- 8.	Display the ename, salary, hiredate and the date when “Friday” comes after the hiredate for all employees.
SELECT ename, sal, hiredate, DATE_ADD(hiredate, INTERVAL (7 - DAYOFWEEK(hiredate) + 6) % 7 + 1) DAY) AS Next_Friday FROM emp;

-- 9.	Display the week difference in first column and hours difference in second column between any two dates.
SELECT TIMESTAMPDIFF(WEEK, '2023-01-01', '2023-12-31') AS Week_Difference,
       TIMESTAMPDIFF(HOUR, '2023-01-01', '2023-12-31') AS Hour_Difference;

