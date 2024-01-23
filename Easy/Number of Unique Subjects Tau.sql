2356. Number of Unique Subjects Taught by Each Teacher

Table: Teacher
+-------------+------+
| Column Name | Type |
+-------------+------+
| teacher_id  | int  |
| subject_id  | int  |
| dept_id     | int  |
+-------------+------+
(subject_id, dept_id) is the primary key (combinations of columns with unique values) of this table.
Each row in this table indicates that the teacher with teacher_id teaches the subject subject_id in the department dept_id.
 

Write a solution to calculate the number of unique subjects each teacher teaches in the university.
Return the result table in any order.

SOLUTION:

SELECT TEACHER_ID, COUNT(DISTINCT SUBJECT_ID) AS CNT 
FROM TEACHER 
GROUP BY TEACHER_ID;

EXPLANATION:

1.SELECT clause:
	*TEACHER_ID: This is the column that will be selected in the result set.
	*COUNT(DISTINCT SUBJECT_ID) AS CNT: This part calculates the count of distinct SUBJECT_ID values for each TEACHER_ID and aliases the result as "CNT."

2.FROM clause:
	*FROM TEACHER: This specifies the table from which the data will be retrieved, which is the TEACHER table in this case.

3.GROUP BY clause:
GROUP BY TEACHER_ID: This groups the result set by the TEACHER_ID column. The COUNT function in the SELECT clause will then be applied for each group of TEACHER_ID values.




.