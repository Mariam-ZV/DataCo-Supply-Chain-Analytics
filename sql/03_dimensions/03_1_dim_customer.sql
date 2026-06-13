CREATE TABLE dim_customer (
    customer_key INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    customer_fname VARCHAR(100),
    customer_lname VARCHAR(100),
    customer_email VARCHAR(255),
    customer_segment VARCHAR(50),
    customer_city VARCHAR(100),
    customer_state VARCHAR(100),
    customer_country VARCHAR(100),
    customer_street VARCHAR(255),
    customer_zipcode VARCHAR(20)
);

SELECT * FROM dim_customer;