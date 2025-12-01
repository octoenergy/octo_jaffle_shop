SELECT
    TO_DATE(DATE_TRUNC('month', first_order)) AS new_customers_month,
    COUNT(DISTINCT customer_id) AS count_new_customers
FROM {{ ref('wh_customers_pii') }}
GROUP BY new_customers_month
