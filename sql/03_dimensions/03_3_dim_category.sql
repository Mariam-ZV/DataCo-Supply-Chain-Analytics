CREATE TABLE dim_category (
    category_key INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    category_name VARCHAR(100),
    department_id INT
);

SELECT * FROM dim_category;