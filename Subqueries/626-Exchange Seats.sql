/* Write your T-SQL query statement below */
WITH CTE AS(
    SELECT COUNT(*) AS NUM
    FROM Seat
)

SELECT S.id ,
(CASE WHEN
S.id%2=1 AND S.id<C.NUM
THEN (SELECT SS.student FROM Seat SS WHERE SS.id=S.id+1)
WHEN S.id%2=0 
THEN (SELECT SS.student FROM Seat SS WHERE SS.id=S.id-1)
WHEN S.id%2=1 AND S.id=C.NUM
THEN S.student
END) AS student 
FROM Seat S
CROSS JOIN CTE C