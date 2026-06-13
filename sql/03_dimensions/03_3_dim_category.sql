CREATE TABLE dim_category (
    category_key INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    category_name VARCHAR(100),
    department_id INT
);

SELECT * FROM dim_category;
-----------------------------------------------------------

INSERT INTO dim_category (
    category_id,
    category_name,
    department_id
)
SELECT DISTINCT
    `Category Id`,
    `Category Name`,
    `Department Id`
FROM dataco_raw;
-----------------------------------------------------------

SELECT COUNT(*) FROM dim_category;
