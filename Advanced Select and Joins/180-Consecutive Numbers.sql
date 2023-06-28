/* Write your T-SQL query statement below */
SELECT DISTINCT L.num AS ConsecutiveNums 
FROM Logs L
JOIN Logs LL
ON L.id = LL.id+1 AND L.num=LL.num
JOIN Logs LLL
ON LL.id = LLL.id+1 AND LLL.num=LL.num