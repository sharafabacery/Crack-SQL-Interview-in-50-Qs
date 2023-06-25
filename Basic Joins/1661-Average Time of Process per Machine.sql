/* Write your T-SQL query statement below */
SELECT machine_id ,ROUND(SUM(
    CASE WHEN activity_type ='start' THEN -1*timestamp
    ELSE timestamp 
    END 
)/(SELECT COUNT(DISTINCT process_id) FROM Activity),3) AS processing_time  
FROM Activity
GROUP BY machine_id