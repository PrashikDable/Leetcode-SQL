1321. Restaurant Growth
 

You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).
Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). 
average_amount should be rounded to two decimal places.
Return the result table ordered by visited_on in ascending order.

SOLUTION:

SELECT VISITED_ON, 
    (
        SELECT SUM(AMOUNT)
        FROM CUSTOMER
        WHERE VISITED_ON BETWEEN SUBDATE(C.VISITED_ON, INTERVAL 6 DAY) AND C.VISITED_ON
    ) AS AMOUNT,
    ROUND(
            (
                SELECT SUM(AMOUNT)/7
                FROM CUSTOMER
                WHERE VISITED_ON BETWEEN SUBDATE(C.VISITED_ON, INTERVAL 6 DAY) AND C.VISITED_ON
            ), 2
        ) AS AVERAGE_AMOUNT
FROM CUSTOMER C
WHERE VISITED_ON >= (
    SELECT ADDDATE(MIN(VISITED_ON), INTERVAL 6 DAY)
    FROM CUSTOMER
)
GROUP BY VISITED_ON;


EXPLANATION:

1.Main SELECT Statement:
	*The outermost SELECT statement retrieves data from the "CUSTOMER" table.
	*It selects the "VISITED_ON" column.
	*It also includes two subqueries that calculate the total "AMOUNT" and the rounded average "AVERAGE_AMOUNT" 
	 for each visit date within a specific range.

2.Subquery for AMOUNT:
	*The first subquery calculates the total "AMOUNT" by summing the "AMOUNT" column from the "CUSTOMER" table for 
	 the visits that occurred within the last 6 days (including the current visit date).

3.Subquery for AVERAGE_AMOUNT:
	*The second subquery calculates the average "AVERAGE_AMOUNT" by dividing the total "AMOUNT" from the first subquery by 7 (number of days) 
	 and rounding the result to 2 decimal places.

4.FROM Clause:
	*The main query is selecting data from the "CUSTOMER" table and is aliased as "C".

5.WHERE Clause:
	*The main query filters the rows to include only those where "VISITED_ON" is greater than or equal to the minimum "VISITED_ON" plus 6 days.

6.GROUP BY Clause:
	*The results are grouped by the "VISITED_ON" column.	




.