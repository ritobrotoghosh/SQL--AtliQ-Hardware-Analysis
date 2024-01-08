WITH my_cte AS (
	SELECT division, dp.product_code, product, SUM(sold_quantity) AS sold_quantity
	FROM dim_product dp
	JOIN fact_sales_monthly fsm
	ON dp.product_code = fsm.product_code
	GROUP BY division, dp.product_code, product
), my_cte2 AS (
	SELECT *,
		RANK() OVER(PARTITION BY division ORDER BY sold_quantity DESC) AS rnk
    FROM my_cte
)
SELECT *
FROM my_cte2
WHERE rnk <= 3