1075. Project Employees I


Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.
Return the result table in any order.

SOLUTION:

SELECT P.PROJECT_ID , ROUND(AVG(E.EXPERIENCE_YEARS),2) AS AVERAGE_YEARS
FROM PROJECT P 
LEFT JOIN EMPLOYEE E
ON P.EMPLOYEE_ID = E.EMPLOYEE_ID
GROUP BY PROJECT_ID;

EXPLANATION:

1.SELECT statement:
	*SELECT P.PROJECT_ID: This part selects the PROJECT_ID column from the PROJECT table.
	*ROUND(AVG(E.EXPERIENCE_YEARS), 2) AS AVERAGE_YEARS: This part calculates the average experience years (EXPERIENCE_YEARS column) from the EMPLOYEE 
	 table and rounds the result to two decimal places. It is given an alias AVERAGE_YEARS.

2.FROM clause:
	*FROM PROJECT P: Specifies that the data is retrieved from the PROJECT table, and the table is given the alias P.
	*LEFT JOIN EMPLOYEE E ON P.EMPLOYEE_ID = E.EMPLOYEE_ID: Performs a left join between the PROJECT table and the EMPLOYEE table based on the 
	 common column EMPLOYEE_ID. This means that all records from the PROJECT table will be included, and matching records from the EMPLOYEE table will be joined.

3.GROUP BY clause:
	*GROUP BY PROJECT_ID: Groups the result set by the PROJECT_ID column. This means that the aggregation functions (like AVG)
	 will be applied to each group of records with the same PROJECT_ID.