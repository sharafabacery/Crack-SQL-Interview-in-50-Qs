SELECT COALESCE ((
  SELECT TOP( 1) num 
  FROM mynumbers
  GROUP BY num
  HAVING COUNT(*) = 1
  ORDER BY num DESC
), NULL) AS num;