/* Write your T-SQL query statement below */
WITH CTE AS (
    SELECT DISTINCT product_id
    FROM Products
),CTE2 AS(
SELECT  C.product_id , MAX(P.change_date) AS NEWDATE
FROM CTE C
LEFT JOIN Products P
ON C.product_id = P.product_id AND P.change_date<='2019-08-16'
GROUP BY C.product_id
)
SELECT DISTINCT C2.product_id,CASE WHEN C2.NEWDATE IS NULL THEN 10 
ELSE P.new_price END AS price 
FROM CTE2 C2
JOIN Products P
ON C2.product_id  = P.product_id AND (C2.NEWDATE = P.change_date OR C2.NEWDATE IS NULL )