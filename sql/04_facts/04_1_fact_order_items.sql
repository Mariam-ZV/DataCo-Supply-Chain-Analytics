CREATE TABLE fact_order_items (
    order_item_key INT AUTO_INCREMENT PRIMARY KEY,

    order_item_id INT NOT NULL,
    order_id INT,
    customer_id INT,
    product_card_id INT,

    customer_key INT,
    product_key INT,
    category_key INT,
    department_key INT,
    market_key INT,
    shipping_mode_key INT,
    order_date_key INT,
    shipping_date_key INT,

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

    days_for_shipping_real INT,
    days_for_shipment_scheduled INT,
    late_delivery_risk INT,

    type VARCHAR(50),
    order_status VARCHAR(50),
    delivery_status VARCHAR(50)
);

SELECT * FROM fact_order_items;
--------------------------------------------------------------------

INSERT INTO fact_order_items (
    order_item_id,
    order_id,
    customer_id,
    product_card_id,
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
    `Order Item Id`,
    `Order Id`,
    `Order Customer Id`,
    `Order Item Cardprod Id`,
    `Order Item Quantity`,
    Sales,
    `Order Item Product Price`,
    `Order Item Discount`,
    `Order Item Discount Rate`,
    `Order Item Total`,
    `Benefit per order`,
    `Order Profit Per Order`,
    `Order Item Profit Ratio`,
    `Sales per customer`,
    `Days for shipping (real)`,
    `Days for shipment (scheduled)`,
    Late_delivery_risk,
    Type,
    `Order Status`,
    `Delivery Status`
FROM dataco_raw;
--------------------------------------------------------------------

SELECT COUNT(*) FROM fact_order_items;