1581. Customer Who Visited but Did Not Make Any Transactions

Table: Visits
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| visit_id    | int     |
| customer_id | int     |
+-------------+---------+
visit_id is the column with unique values for this table.
This table contains information about the customers who visited the mall.
 

Table: Transactions
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| transaction_id | int     |
| visit_id       | int     |
| amount         | int     |
+----------------+---------+
transaction_id is column with unique values for this table.
This table contains information about the transactions made during the visit_id.
 

Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.
Return the result table sorted in any order.

SOLUTION:

SELECT CUSTOMER_ID, COUNT(V.VISIT_ID) AS COUNT_NO_TRANS
FROM VISITS V 
LEFT JOIN TRANSACTIONS TR
ON V.VISIT_ID = TR.VISIT_ID
WHERE TR.TRANSACTION_ID IS NULL 
GROUP BY V.CUSTOMER_ID;

EXPLANATION:

1.SELECT statement:
	*SELECT CUSTOMER_ID: This part of the query selects the CUSTOMER_ID column from the VISITS table.
	*COUNT(V.VISIT_ID) AS COUNT_NO_TRANS: It uses the COUNT function to count the occurrences of V.VISIT_ID for each customer. The result is given 
	 the alias COUNT_NO_TRANS.

2.FROM clause:
	*FROM VISITS V: Specifies the source table as VISITS and assigns it the alias V.

3.LEFT JOIN clause:
	*LEFT JOIN TRANSACTIONS TR ON V.VISIT_ID = TR.VISIT_ID: Performs a left join between the VISITS table (V) and the TRANSACTIONS table (TR) 
	 based on the common column VISIT_ID.

4.WHERE clause:
	*WHERE TR.TRANSACTION_ID IS NULL: Filters the results to include only rows where there is no matching transaction, i.e., where TRANSACTION_ID is NULL. 
	 This effectively selects visits without transactions.

5.GROUP BY clause:
	*GROUP BY V.CUSTOMER_ID: Groups the results by the CUSTOMER_ID column. This is used in conjunction with the aggregate function COUNT to count the number 
	 of visits without transactions for each customer.



.