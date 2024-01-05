570. Managers with at Least 5 Direct Reports

Write a solution to find managers with at least five direct reports.Return the result table in any order.
The result format is in the following example.

Example 1:
Input: 
Employee table:
+-----+-------+------------+-----------+
| id  | name  | department | managerId |
+-----+-------+------------+-----------+
| 101 | John  | A          | null      |
| 102 | Dan   | A          | 101       |
| 103 | James | A          | 101       |
| 104 | Amy   | A          | 101       |
| 105 | Anne  | A          | 101       |
| 106 | Ron   | B          | 101       |
+-----+-------+------------+-----------+
Output: 
+------+
| name |
+------+
| John |
+------+

solution 1:

SELECT NAME
FROM EMPLOYEE
WHERE ID IN (
        SELECT MANAGERID
        FROM EMPLOYEE
        GROUP BY MANAGERID
        HAVING COUNT(*) >= 5
);

SOLUTION 2:

SELECT E.NAME
FROM EMPLOYEE E
JOIN EMPLOYEE M
ON E.ID = M.MANAGERID
GROUP BY M.MANAGERID
HAVING COUNT(M.MANAGERID) >= 5 ;