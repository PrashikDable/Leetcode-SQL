550. Game Play Analysis IV

Table: Activity
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+
(player_id, event_date) is the primary key (combination of columns with unique values) of this table.
This table shows the activity of players of some games.
Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.
 

Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. 
In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, then 
divide that number by the total number of players.

SOLUTION:

SELECT ROUND(COUNT(DISTINCT PLAYER_ID) / (SELECT COUNT(DISTINCT PLAYER_ID) FROM ACTIVITY), 2) AS FRACTION
FROM ACTIVITY 
WHERE (PLAYER_ID, DATE_SUB(EVENT_DATE, INTERVAL 1 DAY))
    IN(
        SELECT PLAYER_ID, MIN(EVENT_DATE) 
        FROM ACTIVITY 
        GROUP BY PLAYER_ID
    );

EXPLANATION:

1.Main Query:
*SELECT ROUND(COUNT(DISTINCT PLAYER_ID) / (SELECT COUNT(DISTINCT PLAYER_ID) FROM ACTIVITY), 2) AS FRACTION:
*This part calculates the fraction of unique PLAYER_ID values divided by the total number of distinct PLAYER_ID values in the ACTIVITY table. The result is rounded to two decimal places and given the alias FRACTION.
FROM Clause:

2.FROM ACTIVITY:
*Specifies the table from which the data is retrieved, which is the ACTIVITY table in this case.

3.WHERE Clause:
*(PLAYER_ID, DATE_SUB(EVENT_DATE, INTERVAL 1 DAY)) IN (...):
*This is a subquery filter condition. It checks if the combination of PLAYER_ID and the date one day before EVENT_DATE is present in the result set of the subquery.

4.Subquery:
*SELECT PLAYER_ID, MIN(EVENT_DATE) FROM ACTIVITY GROUP BY PLAYER_ID:
*This subquery retrieves the minimum EVENT_DATE for each unique PLAYER_ID in the ACTIVITY table.
