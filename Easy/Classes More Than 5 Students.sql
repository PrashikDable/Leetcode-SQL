596. Classes More Than 5 Students

Table: Courses
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| student     | varchar |
| class       | varchar |
+-------------+---------+
(student, class) is the primary key (combination of columns with unique values) for this table.
Each row of this table indicates the name of a student and the class in which they are enrolled.
 

Write a solution to find all the classes that have at least five students.
Return the result table in any order.

SOLUTION:

SELECT CLASS 
FROM COURSES
GROUP BY CLASS
HAVING COUNT(CLASS) >= 5;

EXPLANATION:

1.SELECT CLASS: This part specifies that you want to retrieve the values in the "CLASS" column from the "COURSES" table.

2.FROM COURSES: This part indicates that you are querying the "COURSES" table.

3.GROUP BY CLASS: This clause groups the result set by the values in the "CLASS" column. It means that the query will aggregate 
		  the data based on unique values in the "CLASS" column.

4.HAVING COUNT(CLASS) >= 5: This is a conditional filter applied after the grouping. It states that you only want to include groups 
			    where the count of occurrences of a specific class is greater than or equal to 5.





.