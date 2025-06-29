select 
    customer_id,
    lower(trim(first_name)) as first_name,
    lower(trim(last_name)) as last_name,
    lower(email) as email,
    phone,
    lower(street) as street,
    lower(city) as city,
    state,
    zip_code,
    safe_cast("{{ var("created_at") }}" as timestamp) as created_at
from {{ source('raw', 'raw_customers') }}