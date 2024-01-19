1661. Average Time of Process per Machine

Table: Activity
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| machine_id     | int     |
| process_id     | int     |
| activity_type  | enum    |
| timestamp      | float   |
+----------------+---------+
The table shows the user activities for a factory website.
(machine_id, process_id, activity_type) is the primary key (combination of columns with unique values) of this table.
machine_id is the ID of a machine.
process_id is the ID of a process running on the machine with ID machine_id.
activity_type is an ENUM (category) of type ('start', 'end').
timestamp is a float representing the current time in seconds.
'start' means the machine starts the process at the given timestamp and 'end' means the machine ends the process at the given timestamp.
The 'start' timestamp will always be before the 'end' timestamp for every (machine_id, process_id) pair.
 

There is a factory website that has several machines each running the same number of processes. Write a solution to find the average time each machine takes to complete a process.
The time to complete a process is the 'end' timestamp minus the 'start' timestamp. The average time is calculated by the total time to complete every process on the machine divided by the number of processes that were run.
The resulting table should have the machine_id along with the average time as processing_time, which should be rounded to 3 decimal places.
Return the result table in any order.

SOLUTION:

SELECT MACHINE_ID, ROUND(
    (SELECT AVG(A1.TIMESTAMP)
     FROM ACTIVITY A1
     WHERE A1.ACTIVITY_TYPE = 'end' AND A1.MACHINE_ID = A.MACHINE_ID)
     -
     (SELECT AVG(A1.TIMESTAMP)
      FROM ACTIVITY A1 
      WHERE A1.ACTIVITY_TYPE = 'start' AND A1.MACHINE_ID = A.MACHINE_ID),3) AS PROCESSING_TIME
FROM ACTIVITY A 
GROUP BY A.MACHINE_ID;


EXPLANATION:

1.Main Query:
	*The main query selects the distinct MACHINE_ID values from the ACTIVITY table and calculates the processing time for each machine.
	*The GROUP BY clause groups the results by MACHINE_ID.

2.Subqueries:
	*There are two subqueries inside the ROUND function, which are used to calculate the processing time for each machine.
	*First Subquery:
		-This subquery calculates the average timestamp for activities of type 'end' for the specific MACHINE_ID in the outer query.
	*Second Subquery:
		-This subquery calculates the average timestamp for activities of type 'start' for the specific MACHINE_ID in the outer query.
3.Calculation:
	*The main part of the calculation is (SELECT AVG(A1.TIMESTAMP) FROM ... - SELECT AVG(A1.TIMESTAMP) FROM ...).
	*It calculates the time difference between the average 'end' timestamp and the average 'start' timestamp for each machine.

4.ROUND Function:
	*The ROUND function is used to round the calculated processing time to 3 decimal places.








.