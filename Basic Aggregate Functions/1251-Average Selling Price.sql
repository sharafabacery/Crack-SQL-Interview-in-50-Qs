/* Write your T-SQL query statement below */
SELECT P.product_id,ROUND(CONVERT(FLOAT,SUM(P.price*US.units),2)/SUM(US.units),2) AS average_price
FROM Prices P
JOIN UnitsSold US
ON P.product_id = US.product_id AND US.purchase_date BETWEEN P.start_date AND P.end_date
GROUP BY P.product_id
