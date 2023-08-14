SELECT
    customer_id
    , customer_lifetime_value
FROM {{ ref('wh_customers') }}
