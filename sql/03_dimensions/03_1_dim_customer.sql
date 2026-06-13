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
------------------------------------------------------------------------------

INSERT INTO dim_customer (
    customer_id,
    customer_fname,
    customer_lname,
    customer_email,
    customer_segment,
    customer_city,
    customer_state,
    customer_country,
    customer_street,
    customer_zipcode
)
SELECT DISTINCT
    `Customer Id`,
    `Customer Fname`,
    `Customer Lname`,
    `Customer Email`,
    `Customer Segment`,
    `Customer City`,
    `Customer State`,
    `Customer Country`,
    `Customer Street`,
    `Customer Zipcode`
FROM dataco_raw;
------------------------------------------------------------------------------

SELECT COUNT(*) FROM dim_customer;
