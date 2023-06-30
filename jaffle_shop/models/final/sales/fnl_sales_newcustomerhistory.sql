SELECT
    DATE_TRUNC('month', cust.first_order) AS first_order_month
    , COUNT(DISTINCT cust.customer_id) AS number_customers
FROM {{ ref('wh_customers') }} AS cust
