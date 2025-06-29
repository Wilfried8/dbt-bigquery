
# Les vélos de Didier – dbt Project

This dbt project models the sales and customer data for **Les vélos de Didier**, a local bike retailer aiming to improve business decisions through analytics.

## 🎯 Objective

Enable two business dashboards:
- **Customer Dashboard**: Understand client behavior and lifetime value
- **Product Dashboard**: Track product performance and revenue

## 📐 Data Modeling Architecture

We use a modular layered architecture:

```
staging → intermediate → marts (dim_/fact_) → reporting
```

- `staging/`: Raw data cleanup and standardization
- `intermediate/`: Joins and business aggregations
- `marts/`: Final dimensional and fact tables
    - `reporting/`: Views ready for BI dashboards


## 🧩 Key Models

| Model                        | Description                                        | Grain                        |
|-----------------------------|----------------------------------------------------|------------------------------|
| `dim_customers`             | Customer profiles with behavioral KPIs            | 1 row per customer           |
| `dim_products`              | Products with revenue, quantity sold, discount     | 1 row per product            |
| `fact_sales`                | Detailed sales facts (revenue, quantity, discount) | 1 row per order item         |
| `reporting_revenue_by_day`  | Daily revenue breakdown by category & customer type| 1 row per day × category × is_active |
| `reporting_top_customers`   | Top 10 customers by total revenue                 | 1 row per customer           |
| `reporting_product_performance` | Product sales summary                           | 1 row per product            |
| `reporting_detailed_sales`  | Detailed enriched sales for dashboard display      | 1 row per order item         |

## 🧪 Data Testing

All models include data tests such as:
- `not_null`, `unique`
- `relationships` across dimensions and facts
- Business logic validations via `dbt_utils.expression_is_true`

Run tests:
```bash
dbt test
```

## 📚 Documentation

Documentation is embedded in YAML files and generated with:
```bash
dbt docs generate && dbt docs serve
```

This provides a browsable UI including descriptions, column details, DAGs, and test coverage.

## 🚀 Requirements

- Python 3.8+
- dbt-core and dbt-bigquery
- A BigQuery dataset and service account with the right permissions

Install dependencies:
```bash
pip install dbt-bigquery
```

## 📊 Dashboards Enabled

- **Customer insights**: activity, frequency, LTV, segmentation
- **Product analytics**: revenue, discount trends, category performance
- **Operational KPIs**: daily orders, revenue, top clients/products

## 🧠 Notes

- This project follows dbt best practices.
- Model naming conventions:
  - `stg_`: staging
  - `int_`: intermediate
  - `dim_`: dimensions
  - `fact_`: facts
  - `reporting_`: dashboard views

---
