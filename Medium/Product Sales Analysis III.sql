1070. Product Sales Analysis III


Write a solution to select the product id, year, quantity, and price for the first year of every product sold.
Return the resulting table in any order.

SOLUTION:

SELECT PRODUCT_ID,YEAR AS FIRST_YEAR, QUANTITY, PRICE
FROM SALES
WHERE (PRODUCT_ID,YEAR) IN (
            SELECT PRODUCT_ID, MIN(YEAR) 
            FROM SALES
            GROUP BY PRODUCT_ID
    ); 

EPLANATION:

* SELECT PRODUCT_ID, YEAR AS FIRST_YEAR, QUANTITY, PRICE: Specifies the columns that will be selected in the output. 
  The selected columns are PRODUCT_ID, YEAR (aliased as FIRST_YEAR), QUANTITY, and PRICE.

* FROM SALES: Specifies the table from which the data will be retrieved. In this case, it is the SALES table.

* WHERE (PRODUCT_ID, YEAR) IN (...): This is a filtering condition. It checks if the combination of PRODUCT_ID and YEAR 
  in the SALES table is present in the result set of the subquery.

* SUBQUERY:
	* SELECT PRODUCT_ID, MIN(YEAR): Selects the PRODUCT_ID and the minimum YEAR for each distinct PRODUCT_ID in the SALES table.

	* FROM SALES: Specifies the table from which the data will be retrieved, in this case, it is the SALES table.

	* GROUP BY PRODUCT_ID: Groups the rows based on the PRODUCT_ID, and for each group, the minimum YEAR is calculated.