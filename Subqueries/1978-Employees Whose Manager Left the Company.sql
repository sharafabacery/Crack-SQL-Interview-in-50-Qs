/* Write your T-SQL query statement below */
SELECT E.employee_id 
FROM Employees E 
WHERE E.manager_id IS NOT NULL AND NOT EXISTS(SELECT EE.employee_id FROM Employees EE WHERE E.manager_id =EE.employee_id) AND E.salary<30000 
ORDER BY E.employee_id 
