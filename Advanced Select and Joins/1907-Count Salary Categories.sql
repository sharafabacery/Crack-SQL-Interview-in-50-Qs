/*  this code accept for mysql and get time limit in MS SQL Server */
WITH CTE1 AS(
  SELECT 'Low Salary' AS category 
  UNION 
  SELECT 'Average Salary'
  UNION
  SELECT 'High Salary' 
),CTE2 AS(
  SELECT 
  CASE WHEN income <20000 THEN 'Low Salary'
  WHEN income>=20000 AND income<=50000 THEN 'Average Salary'
  ELSE 'High Salary'
  END
  AS category,income
  FROM Accounts
)
SELECT C1.category,COUNT(C2.income) AS accounts_count 
FROM CTE1 C1
LEFT JOIN CTE2 C2
ON C1.category =C2.category
GROUP BY C1.category