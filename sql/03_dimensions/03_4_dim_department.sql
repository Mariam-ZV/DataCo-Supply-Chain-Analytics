CREATE TABLE dim_department (
    department_key INT AUTO_INCREMENT PRIMARY KEY,
    department_id INT NOT NULL,
    department_name VARCHAR(100)
);

SELECT * FROM dim_department;
-------------------------------------------------------------

INSERT INTO dim_department (
    department_id,
    department_name
)
SELECT DISTINCT
    `Department Id`,
    `Department Name`
FROM dataco_raw;INSERT INTO dim_department (
    department_id,
    department_name
)
SELECT DISTINCT
    `Department Id`,
    `Department Name`
FROM dataco_raw;
-------------------------------------------------------------

SELECT COUNT(*) FROM dim_department;
