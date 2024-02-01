1978. Employees Whose Manager Left the Company

Table: Employees
+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| employee_id | int      |
| name        | varchar  |
| manager_id  | int      |
| salary      | int      |
+-------------+----------+
In SQL, employee_id is the primary key for this table.
This table contains information about the employees, their salary, and the ID of their manager. Some employees do not have a manager (manager_id is null). 
 

Find the IDs of the employees whose salary is strictly less than $30000 and whose manager left the company. When a manager leaves the company, their information is deleted from the Employees table, but the reports still have their manager_id set to the manager that left.

Return the result table ordered by employee_id.

SOLUTION:

SELECT EMPLOYEE_ID 
FROM EMPLOYEES
WHERE SALARY < 30000 AND MANAGER_ID NOT IN (
    SELECT EMPLOYEE_ID FROM EMPLOYEES
)
ORDER BY EMPLOYEE_ID;


EXPLANATION:

1.SELECT EMPLOYEE_ID: This part of the query specifies that you want to retrieve the EMPLOYEE_ID from the EMPLOYEES table.

2.FROM EMPLOYEES: This indicates that you are querying the EMPLOYEES table.

3.WHERE SALARY < 30000 AND MANAGER_ID NOT IN (...): This is the filtering condition. It selects only those rows where the SALARY
  is less than 30000 and the MANAGER_ID is not found in the subquery.
	*SALARY < 30000: Filters employees with a salary less than 30000.
	*MANAGER_ID NOT IN (...): Excludes employees whose MANAGER_ID is found in the subquery.

4.SELECT EMPLOYEE_ID FROM EMPLOYEES: This is a subquery that selects EMPLOYEE_ID from the EMPLOYEES table. It is used to find manager IDs.

5.ORDER BY EMPLOYEE_ID: Orders the result set based on the EMPLOYEE_ID in ascending order.













.