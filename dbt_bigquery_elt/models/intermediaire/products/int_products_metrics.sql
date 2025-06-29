with items as (
    select * from {{ ref('stg_orders_items') }}
),
aggregated as (
    select
        product_id,
        count(distinct order_id) as nb_orders,
        sum(quantity) as total_quantity,
        sum(revenu) as total_revenue,
        avg(discount) as avg_discount
    from items
    group by product_id
)
select * from aggregated