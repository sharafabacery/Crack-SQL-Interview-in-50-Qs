/* Write your T-SQL query statement below */
SELECT child.reports_to AS employee_id,parent.name ,COUNT(child.employee_id) AS reports_count,ROUND(AVG(child.age*1.0),0) AS average_age
FROM Employees parent
JOIN Employees child
ON parent.employee_id = child.reports_to
GROUP BY child.reports_to,parent.name
ORDER BY employee_id