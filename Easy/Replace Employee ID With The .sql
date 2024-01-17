1378. Replace Employee ID With The Unique Identifier

Table: Employees
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| name          | varchar |
+---------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table contains the id and the name of an employee in a company.
 

Table: EmployeeUNI
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| unique_id     | int     |
+---------------+---------+
(id, unique_id) is the primary key (combination of columns with unique values) for this table.
Each row of this table contains the id and the corresponding unique id of an employee in the company.
 

Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.
Return the result table in any order.

SOLUTION:

SELECT UN.UNIQUE_ID AS UNIQUE_ID, E.NAME AS NAME
FROM EMPLOYEES E 
LEFT JOIN EMPLOYEEUNI UN
ON E.ID = UN.ID;


EXPLANATION:

1.SELECT statement:
	*The query starts with the SELECT keyword, indicating that you want to retrieve data from the database.

2.Columns in the SELECT clause:
	*UN.UNIQUE_ID AS UNIQUE_ID: It selects the UNIQUE_ID column from the EMPLOYEEUNI table (aliased as UN) and renames it as UNIQUE_ID.
	*E.NAME AS NAME: It selects the NAME column from the EMPLOYEES table (aliased as E) and renames it as NAME.

3.FROM clause:
	*FROM EMPLOYEES E: Specifies the source table for the query as the EMPLOYEES table, and it is given the alias E.

4.LEFT JOIN clause:
	*LEFT JOIN EMPLOYEEUNI UN ON E.ID = UN.ID: This clause performs a LEFT JOIN between the EMPLOYEES table (aliased as E) and the EMPLOYEEUNI table (aliased as UN). 
	 It connects the tables using the ID column, where E.ID = UN.ID. The LEFT JOIN ensures that all records from the EMPLOYEES table are included in the result set, regardless of 	 	 whether there is a match in the EMPLOYEEUNI table.

5.Result:
	*The result of the query will be a set of rows, each containing the UNIQUE_ID from the EMPLOYEEUNI table (if available) and the corresponding NAME 
	 from the EMPLOYEES table. If there is no match in the EMPLOYEEUNI table, the UNIQUE_ID will be NULL for that record.


.