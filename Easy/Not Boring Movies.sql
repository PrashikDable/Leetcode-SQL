620. Not Boring Movies

Table: Cinema
+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| id             | int      |
| movie          | varchar  |
| description    | varchar  |
| rating         | float    |
+----------------+----------+
id is the primary key (column with unique values) for this table.
Each row contains information about the name of a movie, its genre, and its rating.
rating is a 2 decimal places float in the range [0, 10]
 

Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".
Return the result table ordered by rating in descending order.

SOLUTION:

SELECT * 
FROM CINEMA
WHERE ID % 2 != 0 AND DESCRIPTION != 'boring'
ORDER BY RATING DESC;

EXPLANATION:


1.*SELECT : This part of the query retrieves all columns (*) from the specified table, which is assumed to be named "CINEMA."

2.FROM CINEMA: Specifies the table from which to retrieve the data, in this case, the "CINEMA" table.

3.WHERE ID % 2 != 0 AND DESCRIPTION != 'boring': This is the filtering condition. It retrieves only those rows where the ID is not 
 an even number (ID % 2 != 0) and the DESCRIPTION column is not equal to 'boring'. The % operator calculates the remainder of the division.

4.ORDER BY RATING DESC: Orders the result set based on the RATING column in descending order (DESC), meaning higher ratings will appear first.