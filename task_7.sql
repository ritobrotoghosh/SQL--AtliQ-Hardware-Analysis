WITH my_cte AS (
	SELECT MONTHNAME(date) AS month, YEAR(date) AS year, gross_price * sold_quantity AS gross_sales
	FROM fact_sales_monthly fsm
	JOIN dim_customer dc
	ON fsm.customer_code = dc.customer_code AND customer = 'Atliq Exclusive'
	JOIN fact_gross_price fgp
	ON fsm.product_code = fgp.product_code
    )
SELECT month, year, CONCAT(ROUND(SUM(gross_sales)/1000000,2), 'M') AS gross_sales
FROM my_cte
GROUP BY month, year