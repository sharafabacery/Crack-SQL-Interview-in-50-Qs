SELECT name 
FROM Employee E
WHERE   (SELECT COUNT(*) FROM Employee EE WHERE E.id=EE.managerId) >=5