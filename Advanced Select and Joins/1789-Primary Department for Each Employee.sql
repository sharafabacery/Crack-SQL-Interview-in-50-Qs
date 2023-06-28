/* Write your T-SQL query statement below */
SELECT E.employee_id, E.department_id
FROM Employee E
JOIN Employee  EE
ON E.employee_id = EE.employee_id AND E.department_id=EE.department_id  AND (E.primary_flag='Y' OR ((SELECT COUNT(*) FROM Employee EEE WHERE EEE.employee_id =E.employee_id )=1 AND E.primary_flag='N'))