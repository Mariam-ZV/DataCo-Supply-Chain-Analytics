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

SELECT * FROM dim_date;