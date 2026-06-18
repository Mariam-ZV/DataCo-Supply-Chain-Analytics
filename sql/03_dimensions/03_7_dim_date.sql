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
---------------------------------------------------

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
    CAST(DATE_FORMAT(dt, '%Y%m%d') AS UNSIGNED),
    DATE(dt),
    DAY(dt),
    MONTH(dt),
    MONTHNAME(dt),
    QUARTER(dt),
    YEAR(dt),
    DAYOFWEEK(dt),
    DAYNAME(dt)
FROM (
    SELECT STR_TO_DATE(
        `order date (DateOrders)`,
        '%m/%d/%Y %H:%i'
    ) AS dt
    FROM dataco_raw

    UNION

    SELECT STR_TO_DATE(
        `shipping date (DateOrders)`,
        '%m/%d/%Y %H:%i'
    ) AS dt
    FROM dataco_raw
) x
WHERE dt IS NOT NULL;
---------------------------------------------------

SELECT COUNT(*) FROM dim_date;
SELECT * FROM dim_date;