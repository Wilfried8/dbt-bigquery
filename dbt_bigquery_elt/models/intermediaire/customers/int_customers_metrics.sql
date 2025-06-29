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
    from orders as o
    left join orders_items as i on o.order_id = i.order_id
),

aggregated as (
    select
        c.customer_id,
        count(distinct oi.order_id) as nb_orders,
        sum(oi.revenu) as total_revenue,
        max(oi.order_date) as last_order_date
    from customers as c
    left join orders_join_orders_items as oi
        on c.customer_id = orders_join_orders_items.customer_id
    group by c.customer_id
)

select * from aggregated
