WITH ecom_bad_data AS (
	SELECT 
		* 
	FROM 
		ecom_data.ecommerce_bad_data
)
,
customers AS (
	SELECT 
		e.customer_id,
        e.customer_name,
        e.customer_email
	FROM
		ecom_bad_data e
)

/*
# Calculating proportion of null values in customers table  
  
SELECT 
	COUNT(CASE WHEN customer_id IS NULL THEN 1 ELSE NULL END) / COUNT(*) AS pct_customer_id,
    COUNT(CASE WHEN customer_name IS NULL THEN 1 ELSE NULL END) / COUNT(*) AS pct_customer_name,
    COUNT(CASE WHEN customer_email IS NULL THEN 1 ELSE NULL END) / COUNT(*) AS pct_customer_email
FROM
	customers
    
# No null values exists 
*/

/*
# Calculating proportion of blank value in customers table  
  
SELECT 
	COUNT(CASE WHEN customer_id = '' THEN 1 ELSE NULL END) / COUNT(*) AS pct_customer_id,
    COUNT(CASE WHEN customer_name = '' THEN 1 ELSE NULL END) / COUNT(*) AS pct_customer_name,
    COUNT(CASE WHEN customer_email = '' THEN 1 ELSE NULL END) / COUNT(*) AS pct_customer_email
FROM
	customers

#  Blank values exists
*/

SELECT * FROM customers;