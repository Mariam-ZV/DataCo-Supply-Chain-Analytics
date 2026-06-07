# Raw Data

## Dataset Source

This project uses the **DataCo Smart Supply Chain Dataset** from Kaggle.

Dataset link:

https://www.kaggle.com/datasets/shashwatwork/dataco-smart-supply-chain-for-big-data-analysis

## Files Used

The original dataset contains:

- DataCoSupplyChainDataset.csv
- DescriptionDataCoSupplyChain.csv

The project focuses on analysing the order, customer, product, shipping, delivery, and profitability data contained within these files.

## Project Workflow

The raw CSV files were imported into MySQL and stored in a staging table called:

```sql
dataco_raw
```

The workflow for this project is:

```text
CSV Files
    ↓
MySQL Staging Table (dataco_raw)
    ↓
Data Audit
    ↓
Dimensional Modelling
    ↓
Fact & Dimension Tables
    ↓
SQL Business Analysis
    ↓
Power BI
    ↓
Business Recommendations
```

## Note

The raw dataset is not stored in this repository.

Please download the dataset directly from Kaggle using the link above.
