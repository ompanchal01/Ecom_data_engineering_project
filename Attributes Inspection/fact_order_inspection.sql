WITH ecom_bad_data AS (
	SELECT 
		*
	FROM
		ecom_data.ecommerce_bad_data
)
,
fact_orders AS (
	SELECT 
		e.order_id,
        e.customer_id,
        e.product_id,
        e.order_date,
        e.quantity,
        e.unit_price,
        e.total_price
	FROM
		ecom_bad_data e 
)
/*
# Ensuring that order_id is not null
SELECT 
	order_id,
    COUNT(CASE WHEN order_id IS NULL THEN 1 ELSE NULL END) AS n_order_id
FROM
	fact_orders
GROUP BY 1
*/

/*
# Multiple products have same order_id
SELECT 
	order_id,
    COUNT(product_id)
FROM
	ecom_bad_data
GROUP BY 1
HAVING COUNT(product_id) > 1
*/

SELECT * FROM fact_orders;