196. Delete Duplicate Emails

Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.
For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.
For Pandas users, please note that you are supposed to modify Person in place.
After running your script, the answer shown is the Person table. The driver will first compile and run your piece of code and then show the Person table. The final order of the Person table does not matter.

SOLUTION:

DELETE P1 
FROM PERSON P1 , PERSON P2
WHERE P1.EMAIL = P2.EMAIL AND P1.ID > P2.ID;

EXPLANATION:

1.DELETE P1: This indicates that you want to delete rows from the alias P1, which represents the PERSON table.

2.FROM PERSON P1, PERSON P2: This is a self-join on the PERSON table. It creates two aliases (P1 and P2) for the same table.

3.WHERE P1.EMAIL = P2.EMAIL AND P1.ID > P2.ID: This is the condition for deleting rows. It specifies that you want to keep 
  only the row with the lowest ID for each unique EMAIL. Rows with higher ID values for the same email will be deleted.