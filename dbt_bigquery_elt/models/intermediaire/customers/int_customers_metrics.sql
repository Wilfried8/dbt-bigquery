with customers as (
    select * from {{ ref('stg_customers') }}
),
orders as (
    select * from {{ ref('stg_orders') }}
),
orders_items as (
    select * from {{ ref('stg_orders_items') }}
),
orders_join_orders_items as (
    select
        o.customer_id,
        o.order_id,
        o.order_date,
        i.revenu
    from orders o
    left join orders_items i on o.order_id = i.order_id
),
aggregated as (
    select
        c.customer_id,
        count(distinct order_id) as nb_orders,
        sum(revenu) as total_revenue,
        max(order_date) as last_order_date
    from customers c
    left join orders_join_orders_items
    using(customer_id)
    group by customer_id
)
select * from aggregated