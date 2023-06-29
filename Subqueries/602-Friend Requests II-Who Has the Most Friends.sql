/* Write your T-SQL query statement below */
WITH CTE AS(
    SELECT  RA.requester_id AS id,
        COUNT(*)
       
    AS num
    FROM RequestAccepted RA
    GROUP BY RA.requester_id
),CTE2 AS(
    SELECT  RA.accepter_id  AS id,
         COUNT(*)
      AS num
    FROM RequestAccepted RA
    GROUP BY RA.accepter_id
)

SELECT TOP(1)CASE WHEN C.id IS NULL THEN C2.id
ELSE C.id END AS id,ISNULL(C.num,0)+ISNULL(C2.num,0) AS num
FROM CTE C
FULL OUTER JOIN CTE2 C2
ON C.id=C2.id
ORDER BY num DESC
