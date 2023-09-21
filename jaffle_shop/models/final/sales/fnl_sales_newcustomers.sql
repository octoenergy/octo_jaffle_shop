WITH first_orders AS (
    SELECT
        *
    FROM {{ ref('wh_customers') }}
)

SELECT
    TRUNC(first_order, "MM") AS first_order_month
    , COUNT(DISTINCT customer_id) AS new_customer_count
FROM first_orders
GROUP BY first_order_month
