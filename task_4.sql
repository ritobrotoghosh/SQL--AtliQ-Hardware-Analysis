WITH my_cte AS (
	SELECT segment,
		COUNT(CASE WHEN fiscal_year = 2020 THEN 1 ELSE NULL END) AS product_count_2020,
		COUNT(CASE WHEN fiscal_year = 2021 THEN 1 ELSE NULL END) AS product_count_2021
	FROM dim_product dp
	JOIN fact_gross_price fgp
	ON dp.product_code = fgp.product_code
	GROUP BY segment
)
SELECT *,
	product_count_2021 - product_count_2020 AS difference
FROM my_cte
ORDER BY difference DESC