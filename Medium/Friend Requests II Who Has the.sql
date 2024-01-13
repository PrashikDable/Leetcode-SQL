602. Friend Requests II: Who Has the Most Friends

Table: RequestAccepted
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| requester_id   | int     |
| accepter_id    | int     |
| accept_date    | date    |
+----------------+---------+
(requester_id, accepter_id) is the primary key (combination of columns with unique values) for this table.
This table contains the ID of the user who sent the request, the ID of the user who received the request, and the date when the request was accepted.
 

Write a solution to find the people who have the most friends and the most friends number.
The test cases are generated so that only one person has the most friends.

SOLUTION:

SELECT TEMP.ID, COUNT(*) AS NUM 
FROM (
     SELECT REQUESTER_ID AS ID FROM REQUESTACCEPTED
        union all
     SELECT ACCEPTER_ID AS ID FROM REQUESTACCEPTED
    ) TEMP 
GROUP BY TEMP.ID
ORDER BY NUM DESC
LIMIT 1 ;


EXPLANATION:

1.The innermost part of the query uses a UNION ALL to combine two sets of data:
		*It selects the REQUESTER_ID values as ID from the REQUESTACCEPTED table, and then it combines them with the 
  		 ACCEPTER_ID values as ID from the same REQUESTACCEPTED table. The use of UNION ALL includes duplicate values in the result.

2.The result of the inner query is aliased as TEMP

3.The outer query uses the TEMP table and performs a GROUP BY on the ID column, counting the occurrences of each ID

4.Finally, the result is ordered by the count (NUM) in descending order

5.The LIMIT 1 at the end of the query ensures that only the top row (with the highest count) is returned.