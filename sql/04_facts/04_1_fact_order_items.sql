CREATE TABLE fact_order_items (
    order_item_key INT AUTO_INCREMENT PRIMARY KEY,

    -- Source business identifiers
    order_item_id INT NOT NULL,
    order_id INT NOT NULL,
    customer_id INT,
    product_card_id INT,

    -- Dimension surrogate keys
    customer_key INT,
    product_key INT,
    category_key INT,
    department_key INT,
    geography_key INT,
    shipping_mode_key INT,
    order_date_key INT,
    shipping_date_key INT,

    -- Measures
    order_item_quantity INT,
    sales DOUBLE,
    order_item_product_price DOUBLE,
    order_item_discount DOUBLE,
    order_item_discount_rate DOUBLE,
    order_item_total DOUBLE,
    benefit_per_order DOUBLE,
    order_profit_per_order DOUBLE,
    order_item_profit_ratio DOUBLE,
    sales_per_customer DOUBLE,

    -- Shipping / operational measures
    days_for_shipping_real INT,
    days_for_shipment_scheduled INT,
    late_delivery_risk INT,

    -- Degenerate dimensions / statuses
    type VARCHAR(50),
    order_status VARCHAR(50),
    delivery_status VARCHAR(50)
);

-------------------------------------------------------------------------------------------------
INSERT INTO fact_order_items (
    order_item_id,
    order_id,
    customer_id,
    product_card_id,

    customer_key,
    product_key,
    category_key,
    department_key,
    geography_key,
    shipping_mode_key,
    order_date_key,
    shipping_date_key,

    order_item_quantity,
    sales,
    order_item_product_price,
    order_item_discount,
    order_item_discount_rate,
    order_item_total,
    benefit_per_order,
    order_profit_per_order,
    order_item_profit_ratio,
    sales_per_customer,

    days_for_shipping_real,
    days_for_shipment_scheduled,
    late_delivery_risk,

    type,
    order_status,
    delivery_status
)
SELECT
    r.`Order Item Id`,
    r.`Order Id`,
    r.`Order Customer Id`,
    r.`Order Item Cardprod Id`,

    c.customer_key,
    p.product_key,
    cat.category_key,
    d.department_key,
    g.geography_key,
    sm.shipping_mode_key,
    od.date_key,
    sd.date_key,

    r.`Order Item Quantity`,
    r.Sales,
    r.`Order Item Product Price`,
    r.`Order Item Discount`,
    r.`Order Item Discount Rate`,
    r.`Order Item Total`,
    r.`Benefit per order`,
    r.`Order Profit Per Order`,
    r.`Order Item Profit Ratio`,
    r.`Sales per customer`,

    r.`Days for shipping (real)`,
    r.`Days for shipment (scheduled)`,
    r.Late_delivery_risk,

    r.Type,
    r.`Order Status`,
    r.`Delivery Status`
FROM dataco_raw r
JOIN dim_customer c
    ON r.`Order Customer Id` = c.customer_id
JOIN dim_product p
    ON r.`Order Item Cardprod Id` = p.product_card_id
JOIN dim_category cat
    ON p.category_id = cat.category_id
JOIN dim_department d
    ON cat.department_id = d.department_id
JOIN dim_geography g
    ON r.Market = g.market
   AND r.`Order Country` = g.order_country
   AND r.`Order Region` = g.order_region
   AND r.`Order State` = g.order_state
   AND r.`Order City` = g.order_city
   AND r.`Order Zipcode` = g.order_zipcode
JOIN dim_shipping_mode sm
    ON r.`Shipping Mode` = sm.shipping_mode
JOIN dim_date od
    ON DATE(STR_TO_DATE(r.`order date (DateOrders)`, '%m/%d/%Y %H:%i')) = od.full_date
JOIN dim_date sd
    ON DATE(STR_TO_DATE(r.`shipping date (DateOrders)`, '%m/%d/%Y %H:%i')) = sd.full_date;
    
-------------------------------------------------------------------------------------------------
SELECT COUNT(*) FROM fact_order_items;