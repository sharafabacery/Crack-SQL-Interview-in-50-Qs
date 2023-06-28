/* Write your T-SQL query statement below */
WITH CTE AS (
    SELECT Q.*,
    (
        SELECT SUM(Weight)
        FROM Queue QQ
        WHERE QQ.turn<=Q.turn  
    ) AS TURNTOTAL
    FROM Queue Q 
    
)
SELECT C.person_name 
FROM CTE C
WHERE C.TURNTOTAL = (SELECT MAX(CC.TURNTOTAL) FROM CTE CC WHERE CC.TURNTOTAL <=1000)