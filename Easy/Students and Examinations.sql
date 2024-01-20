1280. Students and Examinations
 

Write a solution to find the number of times each student attended each exam.
Return the result table ordered by student_id and subject_name.

SOLUTION:

SELECT ST.STUDENT_ID, ST.STUDENT_NAME, SUB.SUBJECT_NAME, COUNT(EX.SUBJECT_NAME) AS ATTENDED_EXAMS
FROM STUDENTS ST
CROSS JOIN SUBJECTS SUB
LEFT OUTER JOIN EXAMINATIONS EX 
ON ST.STUDENT_ID = EX.STUDENT_ID AND SUB.SUBJECT_NAME = EX.SUBJECT_NAME
GROUP BY ST.STUDENT_ID, ST.STUDENT_NAME, SUB.SUBJECT_NAME 
ORDER BY ST.STUDENT_ID, SUB.SUBJECT_NAME;


EXPLANATION:

1.FROM Clause:
	*The query starts with a FROM clause, where three tables are involved: STUDENTS (aliased as ST), SUBJECTS (aliased as SUB), and EXAMINATIONS (aliased as EX).

2.CROSS JOIN:
	*There is a CROSS JOIN between STUDENTS and SUBJECTS. This means that each row from the STUDENTS table is combined with every row from the SUBJECTS table, 
	 resulting in a Cartesian product.

3.LEFT OUTER JOIN:
	*There is a LEFT OUTER JOIN between the result of the CROSS JOIN and the EXAMINATIONS table. 
	 This join is based on two conditions: matching STUDENT_ID and SUBJECT_NAME. 
	 The LEFT OUTER JOIN ensures that all rows from the left side (CROSS JOIN result) are included in the output, and matching rows from 
	 the right side (EXAMINATIONS table) are included as well. If there is no match, NULL values will be included for columns from the EXAMINATIONS table.

4.SELECT Clause:
	*The SELECT clause specifies the columns to be included in the output:
	*ST.STUDENT_ID: Student ID from the STUDENTS table.
	*ST.STUDENT_NAME: Student name from the STUDENTS table.
	*SUB.SUBJECT_NAME: Subject name from the SUBJECTS table.
	*COUNT(EX.SUBJECT_NAME) AS ATTENDED_EXAMS: Count of attended exams for each student and subject.

5.GROUP BY Clause:
	*The GROUP BY clause groups the results by STUDENT_ID, STUDENT_NAME, and SUBJECT_NAME. This means that the count of attended 
	 exams is calculated for each unique combination of student and subject.

6.ORDER BY Clause:
The ORDER BY clause sorts the final result set by STUDENT_ID and SUBJECT_NAME.



.