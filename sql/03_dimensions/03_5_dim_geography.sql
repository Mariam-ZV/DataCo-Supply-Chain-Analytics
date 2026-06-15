CREATE TABLE dim_geography (
    geography_key INT AUTO_INCREMENT PRIMARY KEY,
    market VARCHAR(50),
    order_country VARCHAR(100),
    order_region VARCHAR(100),
    order_state VARCHAR(100),
    order_city VARCHAR(100),
    order_zipcode VARCHAR(20),
    latitude DOUBLE,
    longitude DOUBLE
);
--------------------------------------------------------------------

INSERT INTO dim_geography (
    market,
    order_country,
    order_region,
    order_state,
    order_city,
    order_zipcode,
    latitude,
    longitude
)
SELECT DISTINCT
    Market,
    `Order Country`,
    `Order Region`,
    `Order State`,
    `Order City`,
    `Order Zipcode`,
    Latitude,
    Longitude
FROM dataco_raw;
--------------------------------------------------------------------

SELECT COUNT(*) FROM dim_geography;
