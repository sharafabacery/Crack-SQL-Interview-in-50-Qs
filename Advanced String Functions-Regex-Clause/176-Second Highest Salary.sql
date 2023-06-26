/* Write your T-SQL query statement below */
SELECT MAX(salary) AS SecondHighestSalary 
FROM Employee
WHERE salary >= (SELECT MIN(salary) FROM Employee)  AND salary < (SELECT MAX(salary) FROM Employee) 
