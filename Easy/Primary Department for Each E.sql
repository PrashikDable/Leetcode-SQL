1789. Primary Department for Each Employee

Table: Employee
+---------------+---------+
| Column Name   |  Type   |
+---------------+---------+
| employee_id   | int     |
| department_id | int     |
| primary_flag  | varchar |
+---------------+---------+


Write a solution to report all the employees with their primary department. For employees who belong to one department, report their only department.
Return the result table in any order.


SOLUTION:

SELECT EMPLOYEE_ID, DEPARTMENT_ID
FROM EMPLOYEE
WHERE PRIMARY_FLAG='Y'
UNION
SELECT EMPLOYEE_ID, DEPARTMENT_ID
FROM EMPLOYEE
GROUP BY EMPLOYEE_ID
HAVING COUNT(*) = 1
ORDER BY EMPLOYEE_ID;

EXPLANATION:

1.The first part of the query retrieves rows from the EMPLOYEE table where the PRIMARY_FLAG is set to 'Y'. This means it selects employees 
  who have a primary flag indicating some significance.

2.The UNION operator combines the result set from the first part with the result set from the second part of the query.

3.The second part of the query retrieves rows from the EMPLOYEE table again, but this time it groups the rows by EMPLOYEE_ID. 
  The HAVING COUNT(*) = 1 condition ensures that only those groups (employees) with a count of 1 are included in the result. 
  This means it selects employees who do not have the PRIMARY_FLAG set to 'Y' and have a unique EMPLOYEE_ID.

4.Finally, the ORDER BY EMPLOYEE_ID sorts the combined result set by EMPLOYEE_ID in ascending order.






.