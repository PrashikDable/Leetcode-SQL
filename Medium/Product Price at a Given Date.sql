1164. Product Price at a Given Date

Write a solution to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.
Return the result table in any order.

SOLUTION:

SELECT PRODUCT_ID, 10 AS PRICE 
FROM PRODUCTS
WHERE PRODUCT_ID NOT IN (
    SELECT PRODUCT_ID 
    FROM PRODUCTS
    WHERE CHANGE_DATE <='2019-08-16'
)
UNION
SELECT PRODUCT_ID, NEW_PRICE AS PRICE
FROM PRODUCTS
WHERE (PRODUCT_ID,CHANGE_DATE) IN (
            SELECT PRODUCT_ID, MAX(CHANGE_DATE) AS DATE
            FROM PRODUCTS
            WHERE CHANGE_DATE <= '2019-08-16'
            GROUP BY PRODUCT_ID
            );

EXPLANATION:

1.Query 1 (Selecting products with a fixed price of 10):
	*It selects PRODUCT_ID and sets a constant value of 10 as PRICE.
	*It filters out the rows where the PRODUCT_ID is present in another subquery that selects PRODUCT_ID from the PRODUCTS table 
	 where CHANGE_DATE is less than or equal to '2019-08-16'.

2.Union Operator:
	*The UNION operator combines the results of Query 1 and Query 3 while removing duplicate rows.

3.Query 3 (Selecting products with their latest prices before or on '2019-08-16'):
	*It selects PRODUCT_ID and the NEW_PRICE as PRICE.
	*It filters rows where the combination of PRODUCT_ID and the maximum CHANGE_DATE is present in another subquery. 
	 This subquery finds the maximum CHANGE_DATE for each PRODUCT_ID where 	 the CHANGE_DATE is less than or equal to '2019-08-16'.