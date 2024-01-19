577. Employee Bonus

Table: Employee
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| empId       | int     |
| name        | varchar |
| supervisor  | int     |
| salary      | int     |
+-------------+---------+
empId is the column with unique values for this table.
Each row of this table indicates the name and the ID of an employee in addition to their salary and the id of their manager.
 

Table: Bonus
+-------------+------+
| Column Name | Type |
+-------------+------+
| empId       | int  |
| bonus       | int  |
+-------------+------+
empId is the column of unique values for this table.
empId is a foreign key (reference column) to empId from the Employee table.
Each row of this table contains the id of an employee and their respective bonus.
 

Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.
Return the result table in any order.

SOLUTION:

SELECT E.NAME, B.BONUS 
FROM EMPLOYEE E 
LEFT JOIN BONUS B 
ON E.EMPID = B.EMPID 
WHERE B.BONUS < 1000 OR BONUS IS NULL; 


EXPLANATION:

1.SELECT clause:
	*It selects the NAME column from the EMPLOYEE table and the BONUS column from the BONUS table.

2.FROM clause:
	*It specifies that the data will be retrieved from the EMPLOYEE table (aliased as E).

3.LEFT JOIN clause:
	*It joins the EMPLOYEE table with the BONUS table based on the condition E.EMPID = B.EMPID. This means that all records from the EMPLOYEE table 
	 will be included in the result, and matching records from the BONUS table will be included as well.

4.ON clause:
	*Specifies the condition for joining the two tables, where the EMPID values must be equal.

5.WHERE clause:
	*Filters the result set based on the specified conditions:
		-B.BONUS < 1000: Includes only rows where the bonus is less than 1000.
		-BONUS IS NULL: Includes rows where there is no matching bonus in the BONUS table.

In summary, the query retrieves the NAME and BONUS columns from the EMPLOYEE and BONUS tables, respectively. It includes all employees from the EMPLOYEE table, 
and for each employee, it includes the corresponding bonus from the BONUS table if it is less than 1000 or if there is no matching bonus (i.e., the BONUS is NULL).


.