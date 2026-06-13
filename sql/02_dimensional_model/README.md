# Dimensional Modelling

## Objective

Design the dimensional model for the DataCo Smart Supply Chain dataset before creating any physical tables.

This phase focuses on identifying business entities, defining fact and dimension tables, and designing the final star schema.

---

## Confirmed Dataset Grain

One row represents one Order Item.

Primary business key:

- Order Item Id

This grain was confirmed during the Data Audit phase.

---

## Step 2.1 - Identified Business Entities

### Customer

- Customer Id
- Customer Fname
- Customer Lname
- Customer Email
- Customer Segment

### Product

- Product Card Id
- Product Name
- Product Description
- Product Price
- Product Status

### Category

- Category Id
- Category Name

### Department

- Department Id
- Department Name

### Order

- Order Id
- Order Status
- Order Date

### Shipment

- Shipping Mode
- Shipping Date
- Delivery Status
- Days for Shipping (Real)
- Days for Shipment (Scheduled)
- Late Delivery Risk

### Geography

- Market
- Country
- Region
- State
- City

---

## Proposed Fact Table

### Fact_Order_Items

Reason:

- Matches dataset grain.
- Contains all transactional measures.
- Supports sales, profit, customer, product and supply chain analysis.

---

## Proposed Dimension Tables

### Dim_Customer

Customer information and segmentation.

### Dim_Product

Product-level attributes.

### Dim_Category

Product category hierarchy.

### Dim_Department

Department hierarchy.

### Dim_Date

Order and shipment date analysis.

### Dim_Market

Market and geographic analysis.

### Dim_Shipping_Mode

Shipping method analysis.

---

## Modelling Decisions

- Fact_Order_Items will be the primary fact table.
- Fact_Shipments will not be created initially.
- Star schema design will be completed before any table creation.
- Surrogate keys will be evaluated during dimension design.

---
  
## Step 2.2 - Define Fact and Dimension Tables

---

## Fact Table

### Fact_Order_Items

Contains transactional and measurable business events at the order item level.

#### Keys

- Order Item Id
- Order Id
- Order Customer Id
- Order Item Cardprod Id

#### Measures

- Order Item Quantity
- Sales
- Order Item Product Price
- Order Item Discount
- Order Item Discount Rate
- Order Item Total
- Benefit per order
- Order Profit Per Order
- Order Item Profit Ratio
- Sales per customer
- Days for shipping (real)
- Days for shipment (scheduled)
- Late_delivery_risk

#### Transaction Attributes

- Type
- Order Status
- Delivery Status

---

## Dimension Tables

### Dim_Customer

- Customer Id
- Customer Fname
- Customer Lname
- Customer Email
- Customer Segment
- Customer City
- Customer State
- Customer Country
- Customer Street
- Customer Zipcode

### Dim_Product

- Product Card Id
- Product Name
- Product Description
- Product Price
- Product Status
- Category Id

### Dim_Category

- Category Id
- Category Name
- Department Id

### Dim_Department

- Department Id
- Department Name

### Dim_Market

- Market
- Order Country
- Order Region
- Order State
- Order City
- Order Zipcode
- Latitude
- Longitude

### Dim_Shipping_Mode

- Shipping Mode

### Dim_Date

Source date fields:

- order date (DateOrders)
- shipping date (DateOrders)

A dedicated date dimension will be created during the dimension build process.

---

## Excluded Columns

The following columns will not be included in the dimensional model:

- Customer Password
- Product Image
- Product Category Id

### Exclusion Reasons

#### Customer Password

Operational field with no analytical value.

#### Product Image

Image URL field with no analytical value.

#### Product Category Id

Duplicates Category Id and was validated during the audit phase.

---

## Modelling Decisions

- Fact_Order_Items will be the primary fact table.
- All analytical measures will reside in Fact_Order_Items.
- Dimension tables will store descriptive business attributes.
- Date analysis will be handled through a dedicated Dim_Date table.
- Excluded columns will remain in the raw staging table only.

---

## Next Step

03_dimensions

- Define primary keys.
- Define surrogate keys.
- Design individual dimension tables.
- Prepare dimension creation scripts.
