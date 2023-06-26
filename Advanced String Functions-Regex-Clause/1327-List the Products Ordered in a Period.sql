/* Write your T-SQL query statement below */
SELECT P.product_name,SUM(O.unit) AS unit 
FROM Products P
JOIN Orders O
ON P.product_id = O.product_id
WHERE O.order_date >= CONVERT(DATETIME,'2020-02-01') AND O.order_date <= CONVERT(DATETIME,'2020-02-29')
GROUP BY P.product_name 
HAVING SUM(O.unit)>=100