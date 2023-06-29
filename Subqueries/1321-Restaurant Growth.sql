/* Write your T-SQL query statement below */
/*
SOLUTION 1
*/
/*WITH CTE AS(
    SELECT DATEADD(DAY,6,C.visited_on) AS visited_on,(
        SELECT SUM(CC.amount)
        FROM Customer CC
        WHERE CC.visited_on BETWEEN C.visited_on AND DATEADD(DAY,6,C.visited_on) 
    ) AS amount
    FROM Customer C
    WHERE EXISTS((SELECT CC.visited_on FROM Customer CC 
    WHERE DATEADD(DAY,6,C.visited_on)=CC.visited_on))

)
SELECT DISTINCT *,ROUND((amount*1.00)/7,2) AS average_amount 
FROM CTE*/

/*
SOLUTION 2
*/
/* Write your T-SQL query statement below */

SELECT   visited_on, 
         SUM(SUM(amount)) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)   AS'amount',
         ROUND(CAST(SUM(SUM(amount)) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS FLOAT)/7.0 ,2) AS'average_amount' 
FROM     Customer 
GROUP BY visited_on
ORDER BY visited_on
OFFSET 6 ROWS