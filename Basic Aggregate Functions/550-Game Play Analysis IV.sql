WITH CTE AS (
    SELECT player_id, event_date, DENSE_RANK()OVER(PARTITION BY player_id ORDER BY event_date)AS ranking
FROM  activity)

SELECT ROUND(COUNT(C1.player_id)*1.0/ (SELECT COUNT(DISTINCT player_id) FROM CTE),2)AS fraction
FROM CTE C1
JOIN  CTE C2
ON C1.player_id=C2.player_id AND C1.ranking=1 AND C2.ranking=2 AND DATEDIFF(DAY,C2.event_date,C1.event_date)=-1