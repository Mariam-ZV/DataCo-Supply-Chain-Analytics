# Phase 1: Data Audit & Entity Validation

## Overview

Before building a star schema, creating dashboards, or writing business analysis queries, the raw DataCo dataset was audited to assess its quality, structure, and business relationships.

The dataset was imported into MySQL as a staging table called `dataco_raw`.

The purpose of this phase was to answer a simple question:

> Can this flat transactional dataset be safely transformed into a professional dimensional model?

---

## Audit Objectives

- Confirm dataset grain
- Check for missing values
- Check for duplicate records
- Validate business relationships
- Identify redundant columns
- Assess data quality
- Prepare for dimensional modelling

---

## Dataset Grain

The audit confirmed that:

> One row = One product within one order.

Evidence:

- 180,516 rows
- 180,516 unique Order Item IDs
- 65,749 unique Orders

This means `Order Item Id` is the natural row-level identifier and establishes the future grain of the fact table.

---

## Data Quality Findings

### Missing Values

No missing values were found in key business identifiers:

- Customer Id
- Product Card Id
- Category Id
- Order Id
- Order Item Id

No missing values were found in important descriptive attributes:

- Customer Email
- Product Name
- Category Name

### Duplicate Records

No duplicate records were identified at the dataset grain level.

- Total Rows: 180,516
- Unique Order Item IDs: 180,516

---

## Business Relationship Validation

The following relationships were validated:

### Customer → Segment

Each customer belongs to a single customer segment.

### Customer → Email

Each customer is associated with a single email address.

### Product → Category

Each product belongs to one category.

### Category → Department

Each category belongs to one department.

### Order → Customer

Each order belongs to one customer.

### Order → Shipping Mode

Each order uses one shipping method.

### Order → Status

Each order has one status.

These findings indicate stable business entities suitable for dimensional modelling.

---

## Redundant Columns Identified

The audit found that:

- `Product Category Id`
- `Category Id`

contain identical values.

Result:

- 0 mismatches

This means only one of these columns will be required in the final model.

---

## Geographic Structure

The dataset contains:

| Level | Count |
|---------|--------:|
| Markets | 5 |
| Countries | 164 |
| Regions | 23 |
| States | 1,089 |

This supports future geographic and market-level analysis.

---

## Conclusion

The audit phase confirmed that the DataCo dataset is structurally sound and suitable for dimensional modelling.

Key achievements:

- Dataset grain confirmed
- Data quality validated
- Business entities identified
- Relationships validated
- Redundant fields identified
- Geographic hierarchy understood

The project is now ready to move into the Dimensional Modelling phase, where the flat transactional table will be transformed into a professional star schema.
