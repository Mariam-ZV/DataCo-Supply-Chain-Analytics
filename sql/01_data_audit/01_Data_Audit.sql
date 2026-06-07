-- Audit 01: Check for missing values in core business key columns

SELECT
    COUNT(*) AS total_rows,
    COUNT(`Customer Id`) AS customer_id_count,
    COUNT(`Category Id`) AS category_id_count,
    COUNT(`Product Card Id`) AS product_id_count,
    COUNT(`Order Id`) AS order_id_count,
    COUNT(`Order Item Id`) AS order_item_id_count
FROM dataco_raw;

---------------------------------------------------------------------------------------------------------------------------
-- Audit 02: Check uniqueness of Order Item Id (expected row-level key)

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT `Order Item Id`) AS unique_order_item_ids
FROM dataco_raw;

---------------------------------------------------------------------------------------------------------------------------
-- Audit 03: Check uniqueness of core business entity identifiers

SELECT
COUNT(DISTINCT `Customer Id`) AS customers,
COUNT(DISTINCT `Category Id`) AS categories,
COUNT(DISTINCT `Product Card Id`) AS products,
COUNT(DISTINCT `Department Id`) AS departments,
COUNT(DISTINCT `Order Id`) AS orders
FROM dataco_raw;

---------------------------------------------------------------------------------------------------------------------------
-- Audit 04: Check Product-Category Relationships

SELECT
COUNT(DISTINCT `Product Card Id`) AS products,
COUNT(DISTINCT `Product Category Id`) AS product_category_ids,
COUNT(DISTINCT `Category Id`) AS category_ids
FROM dataco_raw;

---------------------------------------------------------------------------------------------------------------------------
-- Audit 05: Check whether Product Category Id and Category Id are identical

SELECT COUNT(*) AS mismatches
FROM dataco_raw
WHERE `Product Category Id` <> `Category Id`;

---------------------------------------------------------------------------------------------------------------------------
-- Audit 06: Check Category-Department Relationship

SELECT
	COUNT(DISTINCT `Category Id`) AS categories,
	COUNT(DISTINCT CONCAT(`Category Id`, '-', `Department Id`)) AS category_department_pairs
FROM dataco_raw;

---------------------------------------------------------------------------------------------------------------------------
-- Audit 07: Check Customer-Segment Relationships

SELECT
	COUNT(DISTINCT `Customer Id`) AS customers,
	COUNT(DISTINCT CONCAT(`Customer Id`, '-', `Customer Segment`)) AS customer_segment_pairs
FROM dataco_raw;

---------------------------------------------------------------------------------------------------------------------------
-- Audit 08: Check Customer-Email Consistency

SELECT
	COUNT(DISTINCT `Customer Id`) AS customers,
	COUNT(DISTINCT CONCAT(`Customer Id`, '-', `Customer Email`)) AS customer_email_pairs
FROM dataco_raw;

---------------------------------------------------------------------------------------------------------------------------
-- Audit 09: Check Product-to-Category Mapping

SELECT
COUNT(DISTINCT `Product Card Id`) AS products,
COUNT(DISTINCT CONCAT(`Product Card Id`, '-', `Category Id`)) AS product_category_pairs
FROM dataco_raw;

---------------------------------------------------------------------------------------------------------------------------
-- Audit 10: Check Order-to-Customer Mapping

SELECT
	COUNT(DISTINCT `Order Id`) AS orders,
	COUNT(DISTINCT CONCAT(`Order Id`, '-', `Customer Id`)) AS order_customer_pairs
FROM dataco_raw;

---------------------------------------------------------------------------------------------------------------------------
-- Audit 11: Check Order-to-Shipping Mode Mapping

SELECT
	COUNT(DISTINCT `Order Id`) AS orders,
	COUNT(DISTINCT CONCAT(`Order Id`, '-', `Shipping Mode`)) AS order_shipping_pairs
FROM dataco_raw;

---------------------------------------------------------------------------------------------------------------------------
-- Audit 12: Check Order-to-Status Mapping

SELECT
	COUNT(DISTINCT `Order Id`) AS orders,
	COUNT(DISTINCT CONCAT(`Order Id`, '-', `Order Status`)) AS order_status_pairs
FROM dataco_raw;

---------------------------------------------------------------------------------------------------------------------------
-- Audit 13: Check Financial Value Ranges

SELECT
	MIN(`Sales`) AS min_sales,
	MAX(`Sales`) AS max_sales,
	MIN(`Order Profit Per Order`) AS min_profit,
	MAX(`Order Profit Per Order`) AS max_profit
FROM dataco_raw;

---------------------------------------------------------------------------------------------------------------------------
-- Audit 14: Check for Missing Values in Key Descriptive Fields

SELECT
	COUNT(*) AS total_rows,
	SUM(CASE WHEN `Customer Email` IS NULL OR `Customer Email` = '' THEN 1 ELSE 0 END) AS missing_emails,
	SUM(CASE WHEN `Product Name` IS NULL OR `Product Name` = '' THEN 1 ELSE 0 END) AS missing_products,
	SUM(CASE WHEN `Category Name` IS NULL OR `Category Name` = '' THEN 1 ELSE 0 END) AS missing_categories
FROM dataco_raw;

---------------------------------------------------------------------------------------------------------------------------
-- Audit 15: Check the Size of the Geographic Hierarchy

SELECT
	COUNT(DISTINCT `Market`) AS markets,
	COUNT(DISTINCT `Order Country`) AS countries,
	COUNT(DISTINCT `Order Region`) AS regions,
	COUNT(DISTINCT `Order State`) AS states
FROM dataco_raw;

