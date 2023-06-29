/* Write your T-SQL query statement below */
WITH CTE AS(
    SELECT E.*,DENSE_RANK() OVER (PARTITION BY E.departmentId ORDER BY E.salary DESC) AS RANKING
    FROM Employee E
)
SELECT E.name AS Department,C.name AS Employee,C.Salary 
FROM CTE C
JOIN Department E
ON C.departmentId =E.id 
WHERE C.RANKING<=3