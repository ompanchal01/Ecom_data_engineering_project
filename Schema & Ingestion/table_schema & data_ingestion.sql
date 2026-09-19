CREATE TABLE ecommerce_bad_data (
	order_id INT,
    order_date DATE,
    customer_id VARCHAR(50),
    customer_name VARCHAR(50),
    customer_email VARCHAR(200),
    product_id VARCHAR(50),
    product_name VARCHAR(100),
    product_description TEXT,
    quantity INT,
    unit_price DECIMAL(10,2),
    total_price DECIMAL(10,2)
);

-- 1. Enable server-side local streaming
SET GLOBAL local_infile = 1;

-- 2. Execute the high-performance bulk load
LOAD DATA LOCAL INFILE 'path of you csv' 
INTO TABLE ecommerce_bad_data 
FIELDS TERMINATED BY ','  
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;