SELECT
    id AS customer_id
    , first_name 
    , last_name
FROM {{ ref('raw_customers') }}
