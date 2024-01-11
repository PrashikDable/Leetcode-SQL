585. Investments in 2016

 

Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:

have the same tiv_2015 value as one or more other policyholders, and
are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
Round tiv_2016 to two decimal places.

SOLUTION:

SELECT ROUND(SUM(TIV_2016),2) AS TIV_2016 
FROM INSURANCE 
WHERE TIV_2015 IN (
    SELECT TIV_2015
    FROM INSURANCE 
    GROUP BY TIV_2015
    HAVING COUNT(*) >1 
) AND (LAT, LON) IN (
    SELECT LAT, LON 
    FROM INSURANCE 
    GROUP BY LAT, LON
    HAVING COUNT(*) = 1
)

EXPLANATION:

* The first subquery selects distinct TIV_2015 values from the INSURANCE table where there are more than one occurrence of each TIV_2015 value.
* The second subquery selects distinct pairs of LAT and LON from the INSURANCE table where there is exactly one occurrence of each pair.
* Main Query Conditions:
	*The main query then filters rows from the INSURANCE table where TIV_2015 is in the result set of Subquery 1, 
	 and the pair (LAT, LON) is in the result set of Subquery 2.
	*It calculates the rounded sum of the TIV_2016 column for the filtered rows and aliases it as TIV_2016.