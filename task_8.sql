WITH my_cte AS (
	SELECT date, MONTH(DATE_ADD(date, INTERVAL 4 MONTH)) AS fy_month_num, sold_quantity
	FROM fact_sales_monthly
    WHERE fiscal_year = 2020
)
SELECT 
	CASE 
		WHEN fy_month_num/3 <= 1 THEN 'Q1'
        WHEN fy_month_num/3 <= 2 THEN 'Q2'
        WHEN fy_month_num/3 <= 3 THEN 'Q3'
        WHEN fy_month_num/3 <= 4 THEN 'Q4'
	END AS quarter,
    CONCAT(ROUND(SUM(sold_quantity)/1000000,2), 'M') AS sold_quantity
FROM my_cte
GROUP BY quarter
ORDER BY sold_quantity DESC