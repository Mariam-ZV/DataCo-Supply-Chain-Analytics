# Dimension Tables

## Objective

Create the dimension tables required for the DataCo Smart Supply Chain star schema.

The dimension layer stores descriptive business attributes that provide context for the transactional data stored in the fact table.

---

## Dimension Tables Created

### Dim_Customer

Stores customer information and segmentation.

Business Key:

- Customer Id

Surrogate Key:

- Customer Key

---

### Dim_Product

Stores product attributes.

Business Key:

- Product Card Id

Surrogate Key:

- Product Key

---

### Dim_Category

Stores product category information.

Business Key:

- Category Id

Surrogate Key:

- Category Key

---

### Dim_Department

Stores department information.

Business Key:

- Department Id

Surrogate Key:

- Department Key

---

### Dim_Market

Stores geographic and market attributes.

Surrogate Key:

- Market Key

---

### Dim_Shipping_Mode

Stores shipping method information.

Surrogate Key:

- Shipping Mode Key

---

### Dim_Date

Stores calendar attributes for time-based analysis.

Primary Key:

- Date Key

---

## Design Principles

- Surrogate keys are used for dimension table relationships.
- Business keys are retained from the source system.
- Dimension tables contain descriptive business attributes.
- Dimension tables support filtering, grouping and drill-down analysis in Power BI.

---

## Next Step

04_facts

- Create Fact_Order_Items.
- Define foreign key relationships.
- Build the central fact table for the star schema.
