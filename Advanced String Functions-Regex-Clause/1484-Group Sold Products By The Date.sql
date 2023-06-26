/* Write your T-SQL query statement below */
WITH CTE AS (
  SELECT DISTINCT * 
  FROM Activities AS A
)
SELECT C.sell_date,COUNT(C.product) AS num_sold ,STRING_AGG (C.product,',') AS products  
FROM CTE C
GROUP BY C.sell_date