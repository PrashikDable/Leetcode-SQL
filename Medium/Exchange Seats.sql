626. Exchange Seats

Table: Seat
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| student     | varchar |
+-------------+---------+
id is the primary key (unique value) column for this table.
Each row of this table indicates the name and the ID of a student.
id is a continuous increment.
 
Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.
Return the result table ordered by id in ascending order.

SOLUTION:

SELECT CASE
            WHEN ID = (SELECT MAX(ID) FROM SEAT) AND ID % 2 = 1
            THEN ID
            WHEN ID % 2 = 1
            THEN ID + 1
            WHEN ID % 2 = 0
            THEN ID - 1
        END AS ID, STUDENT
FROM SEAT
ORDER BY ID 


EXPLANATION:

1.CASE Statement:
	*The CASE statement is used to conditionally determine the value of the "ID" column.
	*The first condition checks if the current "ID" is the maximum in the "SEAT" table and is odd. If true,it keeps the current "ID."
	*The second condition checks if the "ID" is odd. If true, it increments the "ID" by 1.
	*The third condition checks if the "ID" is even. If true, it decrements the "ID" by 1.

2.SELECT Clause:
	*The CASE statement is used to determine the value of the "ID" column, and the "STUDENT" column is selected as is.

3.FROM Clause:
	*The query retrieves data from the "SEAT" table.

4.ORDER BY Clause:
	*The result set is ordered by the modified "ID" column.