/* Write your T-SQL query statement below */
SELECT W.id
FROM Weather W
JOIN Weather WW
ON DATEDIFF(DAY,WW.recordDate,W.recordDate)=1
WHERE W.temperature>WW.temperature
