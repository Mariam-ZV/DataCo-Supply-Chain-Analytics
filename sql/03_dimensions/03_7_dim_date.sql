CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    full_date DATE,
    day_number INT,
    month_number INT,
    month_name VARCHAR(20),
    quarter_number INT,
    year_number INT,
    weekday_number INT,
    weekday_name VARCHAR(20)
);
--------------------------------------------------------------------

INSERT INTO dim_date (
    date_key,
    full_date,
    day_number,
    month_number,
    month_name,
    quarter_number,
    year_number,
    weekday_number,
    weekday_name
)
SELECT DISTINCT
    CAST(DATE_FORMAT(order_date, '%Y%m%d') AS UNSIGNED),
    DATE(order_date),
    DAY(order_date),
    MONTH(order_date),
    MONTHNAME(order_date),
    QUARTER(order_date),
    YEAR(order_date),
    DAYOFWEEK(order_date),
    DAYNAME(order_date)
FROM (
    SELECT STR_TO_DATE(
        `order date (DateOrders)`,
        '%m/%d/%Y %H:%i'
    ) AS order_date
    FROM dataco_raw
) d
WHERE order_date IS NOT NULL;
--------------------------------------------------------------------

SELECT COUNT(*) FROM dim_date;

