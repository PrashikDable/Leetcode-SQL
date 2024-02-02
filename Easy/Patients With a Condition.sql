1527. Patients With a Condition

Table: Patients
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| patient_id   | int     |
| patient_name | varchar |
| conditions   | varchar |
+--------------+---------+
patient_id is the primary key (column with unique values) for this table.
'conditions' contains 0 or more code separated by spaces. 
This table contains information of the patients in the hospital.
 

Write a solution to find the patient_id, patient_name, and conditions of the patients who have Type I Diabetes. Type I Diabetes always starts with DIAB1 prefix.
Return the result table in any order.

SOLUTION:

SELECT PATIENT_ID, PATIENT_NAME, CONDITIONS
FROM PATIENTS
WHERE CONDITIONS LIKE 'DIAB1%' OR CONDITIONS LIKE '% DIAB1%'

EXPLANATION:

1.SELECT PATIENT_ID, PATIENT_NAME, CONDITIONS: This part of the query specifies the columns you want to retrieve from the PATIENTS table. 
  It includes three columns: PATIENT_ID, PATIENT_NAME, and CONDITIONS.

2.FROM PATIENTS: This indicates that the data is being retrieved from the table named PATIENTS.

3.WHERE CONDITIONS LIKE 'DIAB1%' OR CONDITIONS LIKE '% DIAB1%': This part of the query filters the rows based on a condition. It is 
  looking for rows where the CONDITIONS column either starts with 'DIAB1' or contains 'DIAB1' anywhere in the string.
	*CONDITIONS LIKE 'DIAB1%': This part checks for rows where the CONDITIONS column starts with 'DIAB1'.
	*OR: This is a logical OR operator, which means the condition will be true if either the left or the right side is true.
	*CONDITIONS LIKE '% DIAB1%': This part checks for rows where the CONDITIONS column contains 'DIAB1' anywhere in the string.






.