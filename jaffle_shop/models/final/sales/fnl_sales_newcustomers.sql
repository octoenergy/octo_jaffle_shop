WITH first_orders AS (
    SELECT
        *
    FROM {{ ref('wh_orders') }}
    QUALIFY
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY created_at ASC) = 1
)

SELECT
    TRUNC(order_date, "MM") AS order_month
    , COUNT(DISTINCT customer_id) AS new_customer_count
FROM first_orders
