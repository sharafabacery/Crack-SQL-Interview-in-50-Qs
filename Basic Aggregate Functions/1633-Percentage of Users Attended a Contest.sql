/* Write your T-SQL query statement below */
DECLARE @user FLOAT = (SELECT CONVERT(FLOAT,COUNT(*)) FROM Users)
SELECT contest_id,ROUND(COUNT(contest_id)*100/@user,2) AS percentage 
FROM  Register 
GROUP BY contest_id
ORDER BY percentage DESC,contest_id
