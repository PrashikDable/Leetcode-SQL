1731. The Number of Employees Which Report to Each Employee

Table: Employees
+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| employee_id | int      |
| name        | varchar  |
| reports_to  | int      |
| age         | int      |
+-------------+----------+

Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.
Return the result table ordered by employee_id.

SOLUTION:

SELECT E.EMPLOYEE_ID, E.NAME, COUNT(M.REPORTS_TO) AS REPORTS_COUNT, ROUND(AVG(M.AGE),0) AS AVERAGE_AGE
FROM EMPLOYEES E 
INNER JOIN EMPLOYEES M
ON E.EMPLOYEE_ID = M.REPORTS_TO
GROUP BY M.REPORTS_TO
ORDER BY E.EMPLOYEE_ID;

EXPLANATION:

1.SELECT Clause:
	*E.EMPLOYEE_ID: Selects the EMPLOYEE_ID from the EMPLOYEES table (aliased as E).
	*E.NAME: Selects the NAME from the EMPLOYEES table (aliased as E).
	*COUNT(M.REPORTS_TO) AS REPORTS_COUNT: Counts the number of reports for each employee and aliases it as REPORTS_COUNT.
	*ROUND(AVG(M.AGE), 0) AS AVERAGE_AGE: Calculates the average age of the reports for each employee and rounds it to the nearest whole number. 
	 The result is aliased as AVERAGE_AGE.

2.FROM Clause:
	*EMPLOYEES E: Specifies the EMPLOYEES table and aliases it as E.
	*INNER JOIN EMPLOYEES M ON E.EMPLOYEE_ID = M.REPORTS_TO: Performs an inner join with the EMPLOYEES table (aliased as M) based 
	 on the condition that the EMPLOYEE_ID in table E matches the REPORTS_TO in table M.

3.GROUP BY Clause:
	*GROUP BY M.REPORTS_TO: Groups the result set by the REPORTS_TO column in the EMPLOYEES table (aliased as M). This groups 
	 the records by the employees who have the same manager (REPORTS_TO).

4.ORDER BY Clause:
	*ORDER BY E.EMPLOYEE_ID: Orders the final result set based on the EMPLOYEE_ID in ascending order.




.