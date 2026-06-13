# Phase 3 - Dimensional Modelling

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

## Identified Business Entities

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

## Next Step

Phase 4 - Dimension Design

- Define columns for each dimension.
- Define primary keys.
- Define surrogate keys.
- Prepare dimension table creation scripts.
