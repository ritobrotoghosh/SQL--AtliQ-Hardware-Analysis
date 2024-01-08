WITH my_cte AS (
	SELECT 
		COUNT(CASE WHEN fiscal_year = 2020 THEN 1 ELSE NULL END) AS unique_products_2020,
		COUNT(CASE WHEN fiscal_year = 2021 THEN 1 ELSE NULL END) AS unique_products_2021
	FROM dim_product dp
	JOIN fact_gross_price fgp
	ON dp.product_code = fgp.product_code
    )
SELECT  *,
	ROUND((unique_products_2021 - unique_products_2020) / unique_products_2020 * 100, 2) AS percentage_change
FROM my_cte