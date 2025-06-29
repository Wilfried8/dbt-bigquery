select
    customer_id,
    phone,
    state,
    zip_code,
    lower(trim(first_name)) as first_name,
    lower(trim(last_name)) as last_name,
    lower(email) as email,
    lower(street) as street,
    lower(city) as city,
    safe_cast("{{ var("created_at") }}" as timestamp) as created_at
from {{ source('raw', 'raw_customers') }}
