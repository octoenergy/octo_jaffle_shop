SELECT
    DATE_TRUNC('MONTH', first_order) AS first_order_month,
    COUNT(customer_id) AS no_of_new_customers

FROM {{ ref('wh_customers') }}

GROUP BY first_order_month
