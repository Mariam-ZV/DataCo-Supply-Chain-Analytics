CREATE TABLE dim_product (
    product_key INT AUTO_INCREMENT PRIMARY KEY,
    product_card_id INT NOT NULL,
    product_name VARCHAR(255),
    product_description TEXT,
    product_price DOUBLE,
    product_status INT,
    category_id INT
);

SELECT * FROM dim_product;