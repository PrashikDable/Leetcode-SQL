1045. Customers Who Bought All Products


product_key is the primary key (column with unique values) for this table.
Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.
Return the result table in any order.

SOLUTION:

SELECT CUSTOMER_ID
FROM CUSTOMER
GROUP BY CUSTOMER_ID
HAVING COUNT(DISTINCT PRODUCT_KEY) = (SELECT COUNT(PRODUCT_KEY) FROM PRODUCT)

EXPLANATION:

* SELECT CUSTOMER_ID: This part specifies the column that will be selected in the output. It indicates that you want to retrieve the distinct CUSTOMER_ID values.

* FROM CUSTOMER: Specifies the table from which the data will be retrieved. In this case, it is the CUSTOMER table.

* GROUP BY CUSTOMER_ID: Groups the rows in the result set by the CUSTOMER_ID. This is necessary when using aggregate functions in combination with non-aggregated columns.

* HAVING COUNT(DISTINCT PRODUCT_KEY) = (SELECT COUNT(PRODUCT_KEY) FROM PRODUCT):
 	*COUNT(DISTINCT PRODUCT_KEY): Counts the number of distinct PRODUCT_KEY values for each group of CUSTOMER_ID.
	*(SELECT COUNT(PRODUCT_KEY) FROM PRODUCT): Subquery that calculates the total count of distinct PRODUCT_KEY values from the PRODUCT table.
The HAVING clause is used to filter the groups (customers) based on the specified condition. It selects only those groups where the count of distinct PRODUCT_KEY values matches the total count of distinct PRODUCT_KEY values in the entire PRODUCT table.


