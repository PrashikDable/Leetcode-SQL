180. Consecutive Numbers

Table: Logs
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
In SQL, id is the primary key for this table.
id is an autoincrement column.
 

Find all numbers that appear at least three times consecutively.
Return the result table in any order.

//SOLUTION

SELECT DISTINCT L1.NUM AS CONSECUTIVENUMS
FROM LOGS L1,
     LOGS L2,
     LOGS L3
WHERE L1.ID = L2.ID + 1 AND
      L2.ID = L3.ID + 1 AND
      L1.NUM = L2.NUM AND
      L2.NUM = L3.NUM ;

EXPLANATION:

1.The query is using the "LOGS" table three times, aliasing it as L1, L2, and L3.

2.The WHERE clause contains conditions to filter the rows based on the following criteria:
	*L1.ID is equal to L2.ID + 1
	*L2.ID is equal to L3.ID + 1
	*L1.NUM is equal to L2.NUM
	*L2.NUM is equal to L3.NUM

3.The conditions in the WHERE clause are meant to find three consecutive rows where the values in the "ID" column 
  are in sequence and the values in the "NUM" column are equal.

4.The SELECT clause selects the distinct values from the "NUM" column of the rows that satisfy the conditions.