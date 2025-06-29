select
    order_id,
    customer_id,
    order_status,
    safe_cast(order_date as date) as order_date,
    safe_cast(required_date as date) as required_date,
    safe_cast(shipped_date as date) as shipped_date,
    store_id,
    staff_id,
    safe_cast("{{ var("created_at") }}" as timestamp) as created_at
from {{ source('raw', 'raw_orders') }}