select
    order_id,
    item_id,
    product_id,
    quantity,
    list_price,
    discount,
    (quantity * list_price * (1 - discount)) as revenu,
    safe_cast("{{ var("created_at") }}" as timestamp) as created_at
from {{ source('raw', 'raw_orders_items') }}