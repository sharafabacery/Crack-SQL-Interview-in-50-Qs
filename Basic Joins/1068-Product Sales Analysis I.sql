/* Write your T-SQL query statement below */
SELECT P.product_name,S.year,S.price
FROM Product P
JOIN Sales S
ON P.product_id = S.product_id 