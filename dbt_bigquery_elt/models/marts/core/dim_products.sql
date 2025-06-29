with products as (
    select * from {{ ref('stg_products') }}
),
metrics as (
    select * from {{ ref('int_products_metrics') }}
)

select
    p.product_id,
    p.product_name,
    p.category_id,
    p.brand_id,
    p.model_year,
    p.list_price,
    m.nb_orders,
    m.total_quantity,
    m.total_revenue,
    m.avg_discount
from products p
join metrics m on p.product_id = m.product_id
