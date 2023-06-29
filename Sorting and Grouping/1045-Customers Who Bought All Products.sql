SELECT DISTINCT C.customer_id
FROM Customer C
WHERE (
    SELECT COUNT(DISTINCT(CC.product_key ))
    FROM Customer CC
    WHERE CC.customer_id = C.customer_id
)=(SELECT COUNT(*) FROM Product)