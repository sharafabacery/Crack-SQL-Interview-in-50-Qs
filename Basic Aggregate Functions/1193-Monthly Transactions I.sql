/* Write your T-SQL query statement below */
SELECT DATENAME(yyyy,trans_date) +'-'+CASE WHEN DATEPART(m,trans_date)<10 THEN '0'+ CONVERT(VARCHAR,DATEPART(m,trans_date)) ELSE  CONVERT(VARCHAR,DATEPART(m,trans_date)) END  AS  month,country ,COUNT(*) AS trans_count ,
SUM(CASE WHEN state ='approved' THEN 1 ELSE 0 END) AS approved_count,
SUM(amount) AS trans_total_amount,
SUM(CASE WHEN state ='approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY DATENAME(yyyy,trans_date) +'-'+CASE WHEN DATEPART(m,trans_date)<10 THEN '0'+ CONVERT(VARCHAR,DATEPART(m,trans_date)) ELSE  CONVERT(VARCHAR,DATEPART(m,trans_date)) END,country