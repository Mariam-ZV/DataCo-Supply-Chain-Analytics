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
----------------------------------------------------------

INSERT INTO dim_product (
    product_card_id,
    product_name,
    product_description,
    product_price,
    product_status,
    category_id
)
SELECT DISTINCT
    `Product Card Id`,
    `Product Name`,
    `Product Description`,
    `Product Price`,
    `Product Status`,
    `Category Id`
FROM dataco_raw;
----------------------------------------------------------

SELECT COUNT(*) FROM dim_product;