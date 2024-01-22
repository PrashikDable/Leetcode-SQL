1633. Percentage of Users Attended a Contest
 

Write a solution to find the percentage of the users registered in each contest rounded to two decimals.
Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.

SOLUTION:

SELECT CONTEST_ID, ROUND(COUNT(DISTINCT USER_ID) * 100 / (SELECT COUNT(USER_ID) FROM USERS), 2) AS PERCENTAGE
FROM REGISTER
GROUP BY CONTEST_ID
ORDER BY PERCENTAGE DESC, CONTEST_ID;

EXPLANATION:

1.SELECT statement:
	*In this part of the query, you are selecting two columns:
		-CONTEST_ID: The unique identifier for contests.
		-ROUND(COUNT(DISTINCT USER_ID) * 100 / (SELECT COUNT(USER_ID) FROM USERS), 2) AS PERCENTAGE: This column calculates the percentage 
		 of unique users participating in each contest.

2.FROM clause:
	*The data is retrieved from the REGISTER table, which presumably contains information about users registering for contests.

3.GROUP BY clause:
	*The results are grouped by the CONTEST_ID column. This means that the calculations in the SELECT statement are performed separately for each unique contest.

4.ORDER BY clause:
	*The results are ordered in descending order based on the calculated percentage (PERCENTAGE) and, in case of ties, by the CONTEST_ID. 
	 The DESC keyword indicates a descending order.
