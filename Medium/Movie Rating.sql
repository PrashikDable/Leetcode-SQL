1341. Movie Rating

Write a solution to:

1.Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
2.Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.

SOLUTION:

( SELECT NAME AS RESULTS
FROM MOVIERATING
INNER JOIN USERS USING(USER_ID)
GROUP BY USER_ID
ORDER BY COUNT(USER_ID) DESC, NAME ASC 
LIMIT 1 )

UNION ALL

( SELECT TITLE AS RESULTS
FROM MOVIERATING 
INNER JOIN MOVIES 
USING(MOVIE_ID)
WHERE EXTRACT(YEAR_MONTH FROM CREATED_AT) = 202002
GROUP BY MOVIE_ID
ORDER BY AVG(RATING) DESC, TITLE ASC
LIMIT 1 )


EXPLANATION:

Subquery 1:

	*It selects the NAME from the MOVIERATING table, joining with the USERS table on USER_ID.
	*It groups the results by USER_ID.
	*The ORDER BY clause orders the groups by the count of USER_ID in descending order and the NAME in ascending order within each group.
	*The LIMIT 1 ensures that only the top result (with the highest count of USER_ID) is returned.

Union All Operator:
	*The UNION ALL operator combines the results of the two subqueries. UNION ALL includes all rows, even if there are duplicates.

Subquery 2:

	*It selects the TITLE from the MOVIERATING table, joining with the MOVIES table on MOVIE_ID.
	*It filters the results based on the condition that the CREATED_AT month and year should be equal to February 2020.
	*It groups the results by MOVIE_ID.
	*The ORDER BY clause orders the groups by the average of RATING in descending order and the TITLE in ascending order within each group.
	*The LIMIT 1 ensures that only the top result (with the highest average rating) is returned.





.