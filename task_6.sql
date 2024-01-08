SELECT dc.customer_code, customer, pre_invoice_discount_pct AS average_discount_percentage
FROM dim_customer dc
JOIN fact_pre_invoice_deductions fd
ON dc.customer_code = fd.customer_code AND market = 'India' AND fiscal_year = 2021
WHERE pre_invoice_discount_pct >= (SELECT AVG(pre_invoice_discount_pct) FROM fact_pre_invoice_deductions)
ORDER BY pre_invoice_discount_pct DESC
LIMIT 5