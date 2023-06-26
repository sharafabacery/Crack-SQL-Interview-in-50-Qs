/* 
 Please write a DELETE statement and DO NOT write a SELECT statement.
 Write your T-SQL query statement below
 */
 DELETE P2
 FROM Person P1,Person P2
 WHERE P1.email = P2.email AND P1.id < P2.id