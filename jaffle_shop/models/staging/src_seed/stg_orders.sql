SELECT
    id AS order_id
    , user_id AS customer_id
    , order_date
    , NULLIF(status, '') AS status

FROM {{ ref('raw_orders') }}
