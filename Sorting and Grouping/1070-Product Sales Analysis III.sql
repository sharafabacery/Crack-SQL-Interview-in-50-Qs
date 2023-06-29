SELECT product_id, year AS first_year , quantity, price 
FROM (
  SELECT product_id, year , quantity, price, RANK() OVER (PARTITION BY product_id ORDER BY year) AS dr
FROM sales
) AS v
WHERE dr=1
