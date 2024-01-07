1174. Immediate Food Delivery II

Table: Delivery
+-----------------------------+---------+
| Column Name                 | Type    |
+-----------------------------+---------+
| delivery_id                 | int     |
| customer_id                 | int     |
| order_date                  | date    |
| customer_pref_delivery_date | date    |
+-----------------------------+---------+
delivery_id is the column of unique values of this table.
The table holds information about food delivery to customers that make orders at some date and specify a preferred delivery 
date (on the same order date or after it).
If the customer's preferred delivery date is the same as the order date, then the order is called immediate; otherwise, 
it is called scheduled.
The first order of a customer is the order with the earliest order date that the customer made. It is guaranteed that a customer 
has precisely one first order.
Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.

SOLUTION:
SELECT  ROUND(AVG(ORDER_DATE = CUSTOMER_PREF_DELIVERY_DATE)*100, 2) AS IMMEDIATE_PERCENTAGE
FROM DELIVERY
WHERE (CUSTOMER_ID, ORDER_DATE) IN (
       SELECT CUSTOMER_ID, MIN(ORDER_DATE)
       FROM DELIVERY
       GROUP BY CUSTOMER_ID 
    );



EXPLANATION:

1.SUBQUERY:
SELECT CUSTOMER_ID, MIN(ORDER_DATE)
FROM DELIVERY
GROUP BY CUSTOMER_ID;
*The subquery finds the minimum ORDER_DATE for each unique CUSTOMER_ID in the DELIVERY table.

2.WHERE CLAUSE
WHERE (CUSTOMER_ID, ORDER_DATE) IN (
       SELECT CUSTOMER_ID, MIN(ORDER_DATE)
       FROM DELIVERY
       GROUP BY CUSTOMER_ID 
    );
*The WHERE clause filters the rows in the main query based on the condition that the (CUSTOMER_ID, ORDER_DATE) combination should be 
 in the result set of the subquery.

3.AVG and ROUND Functions:
SELECT ROUND(AVG(ORDER_DATE = CUSTOMER_PREF_DELIVERY_DATE)*100, 2) AS IMMEDIATE_PERCENTAGE
*ORDER_DATE = CUSTOMER_PREF_DELIVERY_DATE checks if the order date is equal to the customer's preferred delivery date, resulting in either 0 or 1.
*AVG calculates the average of these 0s and 1s.
*100 scales the result to percentage.
*ROUND(..., 2) rounds the result to two decimal places.




.