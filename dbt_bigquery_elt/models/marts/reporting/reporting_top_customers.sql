with customers as (
    select
        customer_id,
        first_name || ' ' || last_name as full_name,
        round(total_revenue, 2) as total_revenue,
        nb_orders,
        last_order_date,
        is_active
    from {{ ref('dim_customers') }}
)

select *
from customers
order by total_revenue desc
limit 10
