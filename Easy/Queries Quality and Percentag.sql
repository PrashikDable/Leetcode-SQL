1211. Queries Quality and Percentage

Table: Queries
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| query_name  | varchar |
| result      | varchar |
| position    | int     |
| rating      | int     |
+-------------+---------+
This table may have duplicate rows.
This table contains information collected from some queries on a database.
The position column has a value from 1 to 500.
The rating column has a value from 1 to 5. Query with rating less than 3 is a poor query.
 

We define query quality as:
The average of the ratio between query rating and its position.
We also define poor query percentage as:
The percentage of all queries with rating less than 3.

Write a solution to find each query_name, the quality and poor_query_percentage.
Both quality and poor_query_percentage should be rounded to 2 decimal places.
Return the result table in any order.

SOLUTION:

SELECT QUERY_NAME, ROUND(AVG(RATING / POSITION), 2) AS QUALITY , 
ROUND(SUM(CASE WHEN RATING < 3 THEN 1 ELSE 0 END)/ COUNT(*) * 100, 2) AS POOR_QUERY_PERCENTAGE
FROM QUERIES
WHERE QUERY_NAME IS NOT NULL
GROUP BY QUERY_NAME;

EXPLANATION:

1.SELECT clause:
	*QUERY_NAME: This is the column that will be selected and displayed in the result set.
	*ROUND(AVG(RATING / POSITION), 2) AS QUALITY: It calculates the average quality by dividing the RATING by POSITION for each group and rounding the 
	 result to 2 decimal places. It's aliased as QUALITY in the result set.
	*ROUND(SUM(CASE WHEN RATING < 3 THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS POOR_QUERY_PERCENTAGE: It calculates the percentage of queries with a rating 
	 less than 3 and rounds the result to 2 decimal places. It's aliased as POOR_QUERY_PERCENTAGE in the result set.

2.FROM clause:
	*FROM QUERIES: This specifies the table named QUERIES from which the data will be retrieved.

4.WHERE clause:
	*WHERE QUERY_NAME IS NOT NULL: This filters out rows where the QUERY_NAME is NULL. It ensures that only rows with a non-null QUERY_NAME will be considered.

5.GROUP BY clause:
	*GROUP BY QUERY_NAME: This groups the result set by the unique values in the QUERY_NAME column. The aggregate functions in the SELECT clause will then be 
	 applied to each group.


.