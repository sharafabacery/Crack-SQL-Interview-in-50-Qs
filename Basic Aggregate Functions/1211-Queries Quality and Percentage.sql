/* Write your T-SQL query statement below */
SELECT query_name,ROUND(SUM(rating*1.0/position )/COUNT(*),2) AS quality,
ROUND(CONVERT(FLOAT,SUM(CASE WHEN rating <3 THEN 1 ELSE 0 END ))*100/COUNT(*) ,2) AS poor_query_percentage
FROM Queries 
GROUP BY query_name
ORDER BY  query_name

/* Write your T-SQL query statement below */
