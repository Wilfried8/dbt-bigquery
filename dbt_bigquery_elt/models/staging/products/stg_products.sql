select
    product_id,
    brand_id,
    category_id,
    model_year,
    list_price,
    lower(trim(product_name)) as product_name,
    safe_cast("{{ var("created_at") }}" as timestamp) as created_at
from {{ source('raw', 'raw_products') }}
