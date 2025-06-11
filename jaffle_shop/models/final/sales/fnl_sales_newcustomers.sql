SELECT
    DATE_TRUNC('month', first_order) AS month_of_first_order,
    , COUNT(DISTINCT customer_id) AS number_of_new_customers
FROM {{ ref('wh_customers') }}
GROUP BY month_of_first_order