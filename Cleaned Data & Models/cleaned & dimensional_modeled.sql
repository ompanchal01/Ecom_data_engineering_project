WITH ECOM_CTE AS (
	SELECT 
		DISTINCT *
	FROM
		ecom_data.ecommerce_bad_data
)
,
CLEANED_CUSTOMERS AS (
	SELECT 
		order_id,
        order_date,
        CASE WHEN customer_id = '' THEN NULL ELSE customer_id END AS customer_id,
		CASE WHEN customer_name = '' THEN NULL ELSE customer_name END AS customer_name,
		CASE WHEN customer_email = '' THEN NULL ELSE customer_email END AS customer_email,
        product_id,
        product_name,
        product_description,
        quantity,
        unit_price,
        total_price
	FROM 
		ECOM_CTE
)
,
CLEANED_PRODUCTS AS (	
    SELECT 
		order_id,
        order_date,
        customer_id,
		customer_name,
		customer_email,
        product_id,
        product_name,
        MAX(product_description) OVER(PARTITION BY product_id) AS product_description,
        quantity,
        MAX(unit_price) OVER(PARTITION BY product_id) AS unit_price,
        total_price
	FROM 
		CLEANED_CUSTOMERS 
)
,
CLEAN_ECOM AS (
	SELECT
		order_id,
		order_date,
		customer_id,
		customer_name,
		customer_email,
		product_id,
		product_name,
		product_description,
		quantity,
		unit_price,
		CASE WHEN total_price = 0 THEN (quantity*unit_price) ELSE total_price END AS total_price
	FROM 
		CLEANED_PRODUCTS
)
,
dim_customers AS (
	SELECT 
		customer_id,
        customer_name,
        customer_email
	FROM
		CLEAN_ECOM
)
,
dim_products AS (
	SELECT 
		product_id,
        product_name,
        product_description
	FROM
		CLEAN_ECOM
)
,
fact_orders AS (
	SELECT 
		order_id,
        customer_id,
        product_id,
        order_date,
        quantity,
        unit_price,
        total_price
	FROM
		CLEAN_ECOM