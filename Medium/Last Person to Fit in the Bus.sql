1204. Last Person to Fit in the Bus


There is a queue of people waiting to board a bus. However, the bus has a weight limit of 1000 kilograms, so there may be some people who cannot board.
Write a solution to find the person_name of the last person that can fit on the bus without exceeding the weight limit. The test cases are generated 
such that the first person does not exceed the weight limit.

SOLUTION:

SELECT Q.PERSON_NAME
FROM QUEUE Q 
JOIN QUEUE Q2
ON Q.TURN >= Q2.TURN
GROUP BY Q.TURN
HAVING SUM(Q2.WEIGHT) <= 1000
ORDER BY SUM(Q2.WEIGHT) DESC
LIMIT 1;

EXPLANATION:

SELECT Q.PERSON_NAME
FROM QUEUE Q 
JOIN QUEUE Q2
ON Q.TURN >= Q2.TURN
This part of the query performs a self-join on the QUEUE table using aliases Q and Q2. It joins the table on the condition that the turn 
in the first queue (Q.TURN) is greater than or equal to the turn in the second queue (Q2.TURN). This essentially pairs each record in the 
QUEUE table with all the records that have a turn less than or equal to the current record.

GROUP BY Q.TURN
The GROUP BY clause groups the results by the turn in the first queue (Q.TURN). This means that the subsequent calculations will be performed for 
each unique turn.

HAVING SUM(Q2.WEIGHT) <= 1000
The HAVING clause filters the grouped results based on the sum of weights (SUM(Q2.WEIGHT)) from the second queue being less than or equal to 1000.

ORDER BY SUM(Q2.WEIGHT) DESC
The ORDER BY clause orders the results based on the sum of weights from the second queue in descending order.

LIMIT 1 
Finally, the LIMIT 1 restricts the output to only the top result, effectively giving you the record with the highest sum of weights from the 
second queue that satisfies the conditions specified in the HAVING clause.
