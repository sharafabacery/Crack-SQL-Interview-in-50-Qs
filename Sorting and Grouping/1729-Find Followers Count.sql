/* Write your T-SQL query statement below */
SELECT user_id ,COUNT(*) AS followers_count
FROM Followers
GROUP BY user_id