# 🛒 E-Commerce Sales & Customer Analytics

An end-to-end analytics project on the Sample Superstore dataset (9,994 order line items,
5,009 orders, 793 customers, 2014–2017), covering data cleaning, SQL business queries,
Python EDA, customer segmentation, and an interactive Power BI dashboard.

**[📊 View the full findings write-up →](insights/business_insights_and_recommendations.md)**

---

## Key Results

| Metric | Value |
|---|---|
| Total Revenue | $2,297,200.86 |
| Total Profit | $286,397.02 (12.5% margin) |
| Total Orders | 5,009 |
| Average Order Value | $458.61 |
| Repeat Customer Rate | 98.5% |

**Top finding:** Discounts above 21% reliably turn orders unprofitable — the 50%+ discount band
averages a **-119% margin**. See the [full insights document](insights/business_insights_and_recommendations.md)
for the complete, data-verified breakdown and prioritized recommendations.

---

## Dashboard Preview

*(Add a screenshot or GIF of your Power BI dashboard here — see `dashboard/README.md` for how to record one.)*

---

## Tech Stack

- **Excel** — initial data cleaning and QA
- **SQL (SQLite)** — business queries answering each core question
- **Python** (Pandas, NumPy, Matplotlib, Seaborn, mlxtend, scikit-learn) — EDA and customer segmentation
- **Power BI** — interactive 3-page dashboard

## Project Structure

```
├── data/                    Raw dataset + exported customer segment table
├── cleaning/                Excel cleaning workbook (raw + cleaned + QA log)
├── sql/                     9 SQL queries, one per business question
├── notebooks/               Python EDA notebook + customer segmentation notebook, and all charts
├── dashboard/               Power BI source data (.pbix not included — see below)
└── insights/                Business Insights & Recommendations write-up
```

## Business Questions Answered

- Which products/categories generate the most revenue and profit? → [`sql/01`](sql/01_top_products_by_revenue.sql), [`sql/02`](sql/02_category_profit_margins.sql)
- Which months have the highest sales? → [`sql/03`](sql/03_monthly_sales_trend.sql)
- Which customers are most valuable? → [`sql/04`](sql/04_top_customers.sql), [`notebooks/customer_segmentation.ipynb`](notebooks/customer_segmentation.ipynb)
- Which regions perform best? → [`sql/05`](sql/05_region_performance.sql)
- What is the average order value? → [`sql/06`](sql/06_average_order_value.sql)
- What % of customers are repeat customers? → [`sql/07`](sql/07_repeat_customer_pct.sql)
- Which products are frequently bought together? → [`sql/09`](sql/09_frequently_bought_together.sql), Apriori analysis in [`notebooks/ecommerce_eda.ipynb`](notebooks/ecommerce_eda.ipynb)
- Where are sales/profit declining? → [`sql/08`](sql/08_declining_sales_profit.sql)

## Methodology Notes

- **AOV and repeat-customer metrics are computed at the order level** (`GROUP BY Order ID`),
  not per line item, since each order can span multiple product rows.
- **Customer segmentation** uses both rule-based RFM scoring (business-explainable) and KMeans
  clustering (data-driven), shown side by side rather than picking one — see the segmentation
  notebook for why they don't perfectly agree, and why that's expected.
- Every number in the [insights document](insights/business_insights_and_recommendations.md)
  was re-verified directly against the SQL database, not read off a chart.

## Dataset

[Sample Superstore](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final) — a
widely-used retail dataset with Sales, Profit, Category, Region, and Customer data across
2014–2017.
