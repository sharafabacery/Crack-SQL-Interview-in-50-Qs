/* Write your T-SQL query statement below */
SELECT EN.unique_id,E.name     
FROM Employees E
LEFT JOIN EmployeeUNI EN
ON E.id=EN.id