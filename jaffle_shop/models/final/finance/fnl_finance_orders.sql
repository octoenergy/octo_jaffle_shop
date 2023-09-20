WITH orders AS (
    SELECT
        *
    FROM {{ ref('wh_orders') }}
)

SELECT
    customer_id
    , SUM(amount) AS total_amount
    , COUNT(order_id) AS total_orders
    , status AS order_status
FROM orders
