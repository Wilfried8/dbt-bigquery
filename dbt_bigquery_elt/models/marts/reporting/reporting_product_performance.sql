with products as (
    select
        product_name,
        category_id,
        model_year,
        list_price,
        total_quantity,
        nb_orders,
        round(total_revenue, 2) as total_revenue,
        round(avg_discount, 2) as avg_discount,
        round(total_revenue / nullif(total_quantity, 0), 2) as revenue_per_unit
    from {{ ref('dim_products') }}
)

select * from products
