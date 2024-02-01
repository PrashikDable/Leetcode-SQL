610. Triangle Judgement

Table: Triangle
+-------------+------+
| Column Name | Type |
+-------------+------+
| x           | int  |
| y           | int  |
| z           | int  |
+-------------+------+
In SQL, (x, y, z) is the primary key column for this table.
Each row of this table contains the lengths of three line segments.
 

Report for every three line segments whether they can form a triangle.
Return the result table in any order.

SOLUTION:

SELECT X, Y, Z, IF(X+Y>Z AND X+Z>Y AND Y+Z>X, 'Yes', 'No') AS TRIANGLE 
FROM TRIANGLE;


EXPLANATION:

	*SELECT X, Y, Z: This part selects the columns X, Y, and Z from the specified table.

	*IF(X+Y>Z AND X+Z>Y AND Y+Z>X, 'Yes', 'No') AS TRIANGLE: This part uses the conditions X+Y>Z, X+Z>Y, and Y+Z>X to 
	 check if the values in columns X, Y, and Z can form a valid triangle. If the conditions are met, the 'TRIANGLE' column 
	 will have the value 'Yes'; otherwise, it will have the value 'No'.

	*FROM your_triangle_table: This specifies the table from which the data is being retrieved. Replace 'your_triangle_table' with 
	 the actual name of your table.



.