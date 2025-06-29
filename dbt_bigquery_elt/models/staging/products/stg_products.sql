select
    product_id,
    lower(trim(product_name)) as product_name,
    brand_id,
    category_id,
    model_year,
    list_price,
    safe_cast("{{ var("created_at") }}" as timestamp) as created_at
from {{ source('raw', 'raw_products') }}