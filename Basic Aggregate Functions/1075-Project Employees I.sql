/* Write your T-SQL query statement below */
SELECT P.project_id,ROUND(AVG(CONVERT(MONEY,E.experience_years)),2) AS average_years  
FROM Project P
JOIN Employee E
ON P.employee_id = E.employee_id 
GROUP BY P.project_id  
ORDER BY P.project_id