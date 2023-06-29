/* Write your T-SQL query statement below */
WITH CTE AS(
SELECT TOP(1)U.user_id,U.name,COUNT(M.movie_id) AS RES
FROM Users U
JOIN MovieRating M 
ON  U.user_id = M.user_id
GROUP BY U.user_id,U.name
ORDER BY RES DESC,U.name
), CTE2 AS(
SELECT TOP(1)MM.movie_id,MM.title,ROUND(AVG(M.rating*1.0),2) AS RES
FROM Movies  MM
JOIN MovieRating M 
ON  MM.movie_id = M.movie_id
WHERE M.created_at BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY MM.movie_id,MM.title
ORDER BY RES DESC,MM.title
)
SELECT C.name AS results   
FROM CTE C
UNION ALL 
SELECT C2.title AS results   
FROM CTE2 C2
