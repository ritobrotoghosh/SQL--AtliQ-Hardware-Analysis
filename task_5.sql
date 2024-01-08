SELECT dp.product_code, product, manufacturing_cost
FROM dim_product dp
JOIN fact_manufacturing_cost fmc
ON dp.product_code = fmc.product_code AND manufacturing_cost = (SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost)
UNION
SELECT dp.product_code, product, manufacturing_cost
FROM dim_product dp
JOIN fact_manufacturing_cost fmc
ON dp.product_code = fmc.product_code AND manufacturing_cost = (SELECT MIN(manufacturing_cost) FROM fact_manufacturing_cost)
