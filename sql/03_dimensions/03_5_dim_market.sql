CREATE TABLE dim_market (
    market_key INT AUTO_INCREMENT PRIMARY KEY,
    market VARCHAR(50),
    order_country VARCHAR(100),
    order_region VARCHAR(100),
    order_state VARCHAR(100),
    order_city VARCHAR(100),
    order_zipcode VARCHAR(20),
    latitude DOUBLE,
    longitude DOUBLE
);

SELECT * FROM dim_market;