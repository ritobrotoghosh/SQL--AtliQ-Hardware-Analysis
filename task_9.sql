WITH my_cte AS (
	SELECT channel, CONCAT(ROUND(SUM(sold_quantity * gross_price)/1000000,2), 'M') AS gross_sales
	FROM dim_customer dc
	JOIN fact_sales_monthly fsm
	ON dc.customer_code = fsm.customer_code
	JOIN fact_gross_price fgp
	ON fsm.product_code = fgp.product_code AND fsm.fiscal_year = 2021
	GROUP BY channel
)
SELECT *,
	ROUND(gross_sales/(SELECT SUM(gross_sales) FROM my_cte)*100,2) AS percentage
FROM my_cte
ORDER BY percentage DESC