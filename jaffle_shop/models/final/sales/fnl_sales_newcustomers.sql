SELECT
    DATE_TRUNC('month', first_order) AS first_order_month,
    COUNT(DISTINCT customer_id) AS number_first_orders
FROM {{ ref('wh_customers') }}
GROUP BY first_order_month
