with sales as (
    select
        order_date,
        sum(quantity) as total_quantity,
        round(sum(revenu), 2) as total_revenue,
        count(distinct order_id) as nb_orders,
        avg(discount) as avg_discount
    from {{ ref('fact_sales') }}
    group by order_date
)

select * from sales
