# Fact Tables

## Objective

Create the central fact table for the DataCo Smart Supply Chain star schema.

The fact table stores transactional business events and measurable metrics at the confirmed dataset grain.

---

## Confirmed Grain

One row = One Order Item

Business Key:

- Order Item Id

---

## Fact Table Created

### Fact_Order_Items

Stores transactional sales, profit, quantity and delivery metrics.

Primary Key:

- Order Item Key

Business Key:

- Order Item Id

---

## Foreign Keys

- Customer Key
- Product Key
- Category Key
- Department Key
- Geography Key
- Shipping Mode Key
- Order Date Key
- Shipping Date Key

These keys connect the fact table to the dimension tables.

---

## Measures

### Sales Metrics

- Sales
- Order Item Product Price
- Order Item Quantity
- Order Item Total
- Sales Per Customer

### Profit Metrics

- Benefit Per Order
- Order Profit Per Order
- Order Item Profit Ratio

### Discount Metrics

- Order Item Discount
- Order Item Discount Rate

### Delivery Metrics

- Days For Shipping (Real)
- Days For Shipment (Scheduled)
- Late Delivery Risk

---

## Transaction Attributes

- Type
- Order Status
- Delivery Status

---

## Design Principles

- The fact table follows the confirmed dataset grain.
- All measurable business metrics reside in the fact table.
- Descriptive attributes are stored in dimension tables.
- Relationships are established through surrogate keys.

---

## Next Step

05_business_analysis

- Populate dimensions.
- Populate fact table.
- Validate relationships.
- Begin business analysis queries.
