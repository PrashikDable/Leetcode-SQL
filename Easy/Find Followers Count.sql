1729. Find Followers Count

Table: Followers
+-------------+------+
| Column Name | Type |
+-------------+------+
| user_id     | int  |
| follower_id | int  |
+-------------+------+
(user_id, follower_id) is the primary key (combination of columns with unique values) for this table.
This table contains the IDs of a user and a follower in a social media app where the follower follows the user.
 

Write a solution that will, for each user, return the number of followers.
Return the result table ordered by user_id in ascending order.

SOLUTION:

SELECT USER_ID, COUNT(FOLLOWER_ID) AS FOLLOWERS_COUNT
FROM FOLLOWERS
GROUP BY USER_ID
ORDER BY USER_ID;

EXPLANATION:

*SELECT: Specifies the columns to be included in the result set.
*USER_ID: Refers to the column in the FOLLOWERS table representing the user ID.
*COUNT(FOLLOWER_ID) AS FOLLOWERS_COUNT: Uses the COUNT function to count the number of occurrences of FOLLOWER_ID for 
				        each unique USER_ID. The result is aliased as FOLLOWERS_COUNT for easier reference.

*FROM: Specifies the source table from which to retrieve the data.
*FOLLOWERS: Represents the name of the table from which the data is being retrieved.

*GROUP BY: Groups the results by the specified column(s), in this case, USER_ID. This means that the COUNT function will be applied separately for each unique USER_ID.

*ORDER BY: Arranges the result set in ascending order based on the values in the specified column(s), in this case, USER_ID.



.