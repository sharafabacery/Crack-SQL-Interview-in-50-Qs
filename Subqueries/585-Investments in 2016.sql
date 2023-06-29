/* Write your T-SQL query statement below */
SELECT ROUND(SUM(i.tiv_2016), 2) AS tiv_2016
FROM Insurance AS i
WHERE EXISTS (SELECT *
              FROM Insurance AS i2
              WHERE i.tiv_2015 = i2.tiv_2015
                    AND i.pid <> i2.pid)
    AND not EXISTS (SELECT *
                    FROM Insurance AS i2
                    WHERE (i.lat = i2.lat
                            AND i.lon = i2.lon)
                          AND i.pid <> i2.pid)