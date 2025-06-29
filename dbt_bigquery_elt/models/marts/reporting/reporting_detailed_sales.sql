with sales as (
    select * from {{ ref('fact_sales') }}
),
customers as (
    select customer_id, first_name || ' ' || last_name as full_name from {{ ref('dim_customers') }}
),
products as (
    select product_id, product_name, category_id, model_year from {{ ref('dim_products') }}
)

select
    s.order_date,
    s.order_id,
    s.item_id,
    c.full_name as customer_name,
    p.product_name,
    p.category_id,
    s.quantity,
    s.list_price,
    s.discount,
    round(s.revenu, 2) as revenu
from sales s
left join customers c on s.customer_id = c.customer_id
left join products p on s.product_id = p.product_id
