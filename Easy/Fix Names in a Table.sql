1667. Fix Names in a Table

Table: Users
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| user_id        | int     |
| name           | varchar |
+----------------+---------+
user_id is the primary key (column with unique values) for this table.
This table contains the ID and the name of the user. The name consists of only lowercase and uppercase characters.
 

Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.
Return the result table ordered by user_id.

SOLUTION:

SELECT USER_ID, CONCAT(UCASE(SUBSTRING(NAME,1,1)),LCASE(SUBSTRING(NAME,2,LENGTH(NAME)))) AS NAME
FROM USERS
ORDER BY USER_ID;


EXPLANATION:


1.SELECT USER_ID, CONCAT(UCASE(SUBSTRING(NAME,1,1)),LCASE(SUBSTRING(NAME,2,LENGTH(NAME)))) AS NAME:

	*SELECT USER_ID: This part of the query selects the USER_ID column from the USERS table.
	*CONCAT(UCASE(SUBSTRING(NAME,1,1)),LCASE(SUBSTRING(NAME,2,LENGTH(NAME)))) AS NAME: This part creates a new column named NAME. Here's what's happening within this expression:
		*SUBSTRING(NAME,1,1): Takes the first character of the NAME column.
		*UCASE(...): Converts the first character to uppercase.
		*SUBSTRING(NAME,2,LENGTH(NAME)): Takes the rest of the characters in the NAME column, starting from the second character.
		*LCASE(...): Converts the rest of the characters to lowercase.
		*CONCAT(...): Concatenates the uppercase first character with the lowercase rest of the characters.

2.FROM USERS:
	*This specifies that the data is being selected from the USERS table.

3.ORDER BY USER_ID:
	*This orders the result set based on the USER_ID column in ascending order.



.