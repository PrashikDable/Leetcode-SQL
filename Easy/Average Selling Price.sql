1251. Average Selling Price


Write a solution to find the average selling price for each product. average_price should be rounded to 2 decimal places.
Return the result table in any order.

SOLUTION:

SELECT P.PRODUCT_ID, IFNULL(ROUND(SUM(UNITS*PRICE)/SUM(UNITS),2),0) AS AVERAGE_PRICE
FROM PRICES P 
LEFT JOIN UNITSSOLD U
ON P.PRODUCT_ID = U.PRODUCT_ID AND U.PURCHASE_DATE BETWEEN START_DATE AND END_DATE
GROUP BY PRODUCT_ID;

EXPLANATION:

1.SELECT statement:
	*SELECT P.PRODUCT_ID: This part selects the PRODUCT_ID column from the PRICES table.
	*IFNULL(ROUND(SUM(UNITS * PRICE) / SUM(UNITS), 2), 0) AS AVERAGE_PRICE: This part calculates the average price for each product. 
	 It uses the SUM function to calculate the total revenue (UNITS * PRICE) and divides it by the total number of units sold (SUM(UNITS)). 
	 The result is then rounded to two decimal places using the ROUND function. The IFNULL function is used to handle cases where the 
	 denominator (total units) is zero, and it replaces the result with 0 in such cases. The entire expression is given the alias AVERAGE_PRICE.

2.FROM clause:
	*FROM PRICES P: Specifies that the data is retrieved from the PRICES table, and the table is given the alias P.
	*LEFT JOIN UNITSSOLD U ON P.PRODUCT_ID = U.PRODUCT_ID AND U.PURCHASE_DATE BETWEEN START_DATE AND END_DATE: Performs a left join 
	 between the PRICES table and the UNITSSOLD table based on the common column PRODUCT_ID. Additionally, it includes a 
	 condition (U.PURCHASE_DATE BETWEEN START_DATE AND END_DATE) to filter the records from the UNITSSOLD table based on a date range. 
	 The START_DATE and END_DATE are assumed to be variables or constants.

3.GROUP BY clause:
	*GROUP BY PRODUCT_ID: Groups the result set by the PRODUCT_ID column. This means that the aggregation functions (like SUM) will 
	 be applied to each group of records with the same PRODUCT_ID.