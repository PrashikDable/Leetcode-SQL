1193. Monthly Transactions I

Write an SQL query to find for each month and country, the number of transactions and their total amount, 
the number of approved transactions and their total amount.
Return the result table in any order.

SOLUTIOIN:

SELECT SUBSTR(TRANS_DATE,1,7) AS MONTH,
COUNTRY,
COUNT(ID) AS TRANS_COUNT, 
SUM(IF(STATE = 'approved',1,0)) AS APPROVED_COUNT,
SUM(AMOUNT) AS TRANS_TOTAL_AMOUNT, 
SUM(IF(STATE = 'approved',AMOUNT,0)) AS APPROVED_TOTAL_AMOUNT 
FROM TRANSACTIONS 
GROUP BY MONTH,COUNTRY;

EXPLANATION: 

1.SELECT Clause:
SUBSTR(TRANS_DATE, 1, 7) AS MONTH: Extracts the first 7 characters from the TRANS_DATE column, 
representing the month, and labels it as MONTH.
COUNTRY: Represents the country column.
COUNT(ID) AS TRANS_COUNT: Counts the number of records (transactions) and labels it as TRANS_COUNT.
SUM(IF(STATE = 'approved', 1, 0)) AS APPROVED_COUNT: Counts the number of transactions with 'approved' state 
and labels it as APPROVED_COUNT.
SUM(AMOUNT) AS TRANS_TOTAL_AMOUNT: Calculates the total amount of all transactions and 
labels it as TRANS_TOTAL_AMOUNT.
SUM(IF(STATE = 'approved', AMOUNT, 0)) AS APPROVED_TOTAL_AMOUNT: Calculates the total amount of 
approved transactions and labels it as APPROVED_TOTAL_AMOUNT.

2.FROM Clause:
FROM TRANSACTIONS: Specifies the table from which the data is retrieved, in this case, the TRANSACTIONS table.

3.GROUP BY Clause:
GROUP BY MONTH, COUNTRY: Groups the result set by the extracted month (MONTH) and the country (COUNTRY).