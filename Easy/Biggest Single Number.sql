619. Biggest Single Number

Table: MyNumbers
+-------------+------+
| Column Name | Type |
+-------------+------+
| num         | int  |
+-------------+------+
This table may contain duplicates (In other words, there is no primary key for this table in SQL).
Each row of this table contains an integer.
 

A single number is a number that appeared only once in the MyNumbers table.
Find the largest single number. If there is no single number, report null.

SOLUTION:

SELECT MAX(NUM) AS NUM
FROM (SELECT NUM FROM MYNUMBERS GROUP BY NUM HAVING COUNT(*)=1) AS N

EXPLANATION:

1.Inner Query (Subquery):
	*SELECT NUM FROM MYNUMBERS GROUP BY NUM HAVING COUNT(*)=1: This inner query selects distinct values of NUM from the MYNUMBERS table and groups them together. 
	 The HAVING COUNT(*)=1 condition ensures that only those values with a count of 1 (i.e., occurring only once) are considered.

2.Derived Table Alias:
	*AS N: The result of the inner query is given the alias N. This is essentially a derived table containing the unique values of NUM that occur exactly once 
	 in the MYNUMBERS table.

3.Outer Query:
	*SELECT MAX(NUM) AS NUM FROM ...: The outer query selects the maximum (largest) value from the derived table N and aliases it as NUM.




.