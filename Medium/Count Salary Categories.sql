1907. Count Salary Categories

Table: Accounts
+-------------+------+
| Column Name | Type |
+-------------+------+
| account_id  | int  |
| income      | int  |
+-------------+------+
account_id is the primary key (column with unique values) for this table.
Each row contains information about the monthly income for one bank account.
 

Write a solution to calculate the number of bank accounts for each salary category. The salary categories are:

"Low Salary": All the salaries strictly less than $20000.
"Average Salary": All the salaries in the inclusive range [$20000, $50000].
"High Salary": All the salaries strictly greater than $50000.
The result table must contain all three categories. If there are no accounts in a category, return 0.

SOLUTION:

SELECT 'Low Salary' AS CATEGORY, SUM(INCOME < 20000) AS ACCOUNTS_COUNT
FROM ACCOUNTS
UNION
SELECT 'Average Salary' AS CATEGORY, SUM(INCOME BETWEEN 20000 AND 50000) AS ACCOUNTS_COUNT
FROM ACCOUNTS
UNION
SELECT 'High Salary' AS CATEGORY, SUM(INCOME > 50000) AS ACCOUNTS_COUNT
FROM ACCOUNTS


EXPLANATION:
1.The first SELECT statement:categorizes accounts as 'Low Salary' where the income is less than 20,000, and it calculates the 
			     count of such accounts.

2.The second SELECT statement:categorizes accounts as 'Average Salary' where the income is between 20,000 and 50,000 (inclusive), 
			      and it calculates the count of such accounts.

3.The third SELECT statement:This part categorizes accounts as 'High Salary' where the income is greater than 50,000, 
			     and it calculates the count of such accounts.

4.The UNION operator:
The UNION operator combines the results of the three SELECT statements into a single result set, stacking the results vertically. 
Each row in the result set represents a category ('Low Salary', 'Average Salary', or 'High Salary') along with the corresponding 
count of accounts in that category.






