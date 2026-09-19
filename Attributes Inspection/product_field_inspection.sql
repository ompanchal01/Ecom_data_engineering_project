WITH ecom_bad_data AS (
	SELECT 
		DISTINCT *
	FROM
		ecom_data.ecommerce_bad_data
)
,
products AS (
	SELECT 
		e.product_id,
        e.product_name,
        e.product_description
	FROM
		ecom_bad_data e 
) 

/*
# Calculating proportion of null values in products table

SELECT 	
	COUNT(CASE WHEN product_id IS NULL THEN 1 ELSE NULL END) / COUNT(*) AS pnt_product_id,
    COUNT(CASE WHEN product_name IS NULL THEN 1 ELSE NULL END) / COUNT(*) AS pnt_product_name,
	COUNT(CASE WHEN product_description IS NULL THEN 1 ELSE NULL END) / COUNT(*) AS pnt_product_description
FROM
	products;
    
# product_description field contains null values
*/

/*
# product_id where product_description is NULL

SELECT 
	 DISTINCT *
FROM
	products
WHERE 
	product_description IS NULL ;
*/

/*
# Calculating proportion of blank values in products table

SELECT 	
	COUNT(CASE WHEN product_id = '' THEN 1 ELSE NULL END) / COUNT(*) AS pnt_product_id,
    COUNT(CASE WHEN product_name = '' THEN 1 ELSE NULL END) / COUNT(*) AS pnt_product_name,
	COUNT(CASE WHEN product_description = '' THEN 1 ELSE NULL END) / COUNT(*) AS pnt_product_description
FROM
	products;
    
# No blank value exists
*/

SELECT * FROM products;