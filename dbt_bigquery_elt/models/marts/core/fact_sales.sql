select
    i.order_id,
    i.item_id,
    o.order_date,
    o.customer_id,
    i.product_id,
    i.quantity,
    i.list_price,
    i.discount,
    i.revenu
from {{ ref('stg_orders_items') }} i
join {{ ref('stg_orders') }} o on i.order_id = o.order_id
