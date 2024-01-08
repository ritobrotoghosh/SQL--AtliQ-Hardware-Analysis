SELECT segment, COUNT(product) AS product_count
FROM dim_product 
GROUP BY segment
ORDER BY product_count DESC