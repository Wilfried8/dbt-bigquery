with customers as (
    select * from {{ ref('stg_customers') }}
),
metrics as (
    select * from {{ ref('int_customers_metrics') }}
)

select
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.city,
    c.state,
    c.zip_code,
    m.nb_orders,
    m.total_revenue,
    m.last_order_date,
    case when m.last_order_date >= current_date() - interval 2500 day then true else false end as is_active
from customers c
left join metrics m on c.customer_id = m.customer_id
