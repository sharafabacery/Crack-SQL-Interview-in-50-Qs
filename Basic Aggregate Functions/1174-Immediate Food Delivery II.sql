/* Write your T-SQL query statement below */
WITH CTE AS(
SELECT DENSE_RANK() OVER (PARTITION BY D.customer_id ORDER BY D.order_date) AS DRNK,*
FROM Delivery D
)
SELECT ROUND(SUM(CASE WHEN C.DRNK=1 AND C.order_date = C.customer_pref_delivery_date THEN 1.0 ELSE 0.0 END)*100/COUNT(DISTINCT C.customer_id),2) AS immediate_percentage 
FROM CTE C 