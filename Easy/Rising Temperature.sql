197. Rising Temperature

Table: Weather
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the column with unique values for this table.
This table contains information about the temperature on a certain day.
 

Write a solution to find all dates' Id with higher temperatures compared to its previous dates (yesterday).
Return the result table in any order.

SOLUTION:

SELECT W1.ID 
FROM WEATHER W1 , WEATHER W2
WHERE DATEDIFF(W1.RECORDDATE , W2.RECORDDATE) = 1 AND W1.TEMPERATURE > W2.TEMPERATURE;

EXPLANATION:

1.Table Aliases: The query uses aliases for the same table WEATHER, denoted as W1 and W2. This allows you to reference the same table twice in the query.

2.WHERE Clause:
	*DATEDIFF(W1.RECORDDATE, W2.RECORDDATE) = 1: This condition checks if the difference in days between the RECORDDATE of W1 and W2 is 
	 equal to 1. It implies that W2 represents the previous day's record compared to W1.
	*W1.TEMPERATURE > W2.TEMPERATURE: This condition ensures that the temperature of the record on day W1 is greater than the 
	 temperature of the record on the previous day W2.

3.SELECT Clause: It selects the ID from the WEATHER table for the records that satisfy the conditions in the WHERE clause.