/* Write your T-SQL query statement below */
SELECT user_id ,UPPER(LEFT(name,1))+LOWER(RIGHT(name,LEN(name)-1)) AS name  
FROM Users 
ORDER BY user_id