1934. Confirmation Rate

The confirmation rate of a user is the number of 'confirmed' messages divided by the total number of requested confirmation messages. The confirmation rate of a user that did not request any confirmation messages is 0. Round the confirmation rate to two decimal places.

Write a solution to find the confirmation rate of each user.
Return the result table in any order.

solution:
SELECT S.USER_ID , ROUND(AVG(IF(C.ACTION='confirmed',1,0)),2) AS CONFIRMATION_RATE 
FROM SIGNUPS S
LEFT JOIN CONFIRMATIONS C
ON S.USER_ID = C.USER_ID
GROUP BY USER_ID;

EXPLANATION:

1.SELECT Clause:

S.USER_ID: Selecting the USER_ID column from the SIGNUPS table.
ROUND(AVG(IF(C.ACTION='confirmed',1,0)),2) AS CONFIRMATION_RATE: Calculating the confirmation rate for each user. The IF statement is used to check if the action in the CONFIRMATIONS table is 'confirmed'. If true, it assigns 1, otherwise 0. The AVG function then calculates the average of these values for each user. The result is rounded to two decimal places using the ROUND function, and the alias CONFIRMATION_RATE is assigned to this calculated value.

2.FROM Clause:

SIGNUPS S: This specifies the source table for the user information, using the alias S.
LEFT JOIN CONFIRMATIONS C ON S.USER_ID = C.USER_ID: This performs a LEFT JOIN between the SIGNUPS table (S) and the CONFIRMATIONS table (C) based on the common column USER_ID.

3.GROUP BY Clause:

GROUP BY USER_ID: Groups the results by the USER_ID column. This means that the subsequent calculations and aggregations are applied on a per-user basis.