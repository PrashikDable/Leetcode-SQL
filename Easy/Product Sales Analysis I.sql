1068. Product Sales Analysis I
Solved
Easy
Topics
Companies
SQL Schema
Pandas Schema
Table: Sales

+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| sale_id     | int   |
| product_id  | int   |
| year        | int   |
| quantity    | int   |
| price       | int   |
+-------------+-------+
(sale_id, year) is the primary key (combination of columns with unique values) of this table.
product_id is a foreign key (reference column) to Product table.
Each row of this table shows a sale on the product product_id in a certain year.
Note that the price is per unit.
 

Table: Product
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
+--------------+---------+
product_id is the primary key (column with unique values) of this table.
Each row of this table indicates the product name of each product.
 

Write a solution to report the product_name, year, and price for each sale_id in the Sales table.
Return the resulting table in any order.


SOLUTION:

SELECT PRODUCT_NAME, YEAR, PRICE 
FROM SALES , PRODUCT
WHERE SALES.PRODUCT_ID = PRODUCT.PRODUCT_ID; 

EXPLANATION:

1.SELECT clause: This part specifies the columns you want to retrieve from the tables. In this case, you want to fetch PRODUCT_NAME, YEAR, and PRICE.

2.FROM clause: This part indicates the tables from which the data will be retrieved. In this case, you're selecting data from the tables SALES and PRODUCT.

3.WHERE clause: This part specifies the condition that must be met for a row to be included in the result set. The condition is that the PRODUCT_ID 
  column in the SALES table must be equal to the PRODUCT_ID column in the PRODUCT table.

*The query essentially joins the SALES and PRODUCT tables based on the common column PRODUCT_ID. The result is a set of rows where the 
 PRODUCT_ID values match in both tables, and for each such match, the query selects the PRODUCT_NAME, YEAR, and PRICE columns.