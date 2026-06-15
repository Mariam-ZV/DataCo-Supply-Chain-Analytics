CREATE TABLE dim_shipping_mode (
    shipping_mode_key INT AUTO_INCREMENT PRIMARY KEY,
    shipping_mode VARCHAR(50)
);

SELECT * FROM dim_shipping_mode;
--------------------------------------------------------------------

INSERT INTO dim_shipping_mode (
    shipping_mode
)
SELECT DISTINCT
    `Shipping Mode`
FROM dataco_raw;
--------------------------------------------------------------------

SELECT COUNT(*) FROM dim_shipping_mode;
