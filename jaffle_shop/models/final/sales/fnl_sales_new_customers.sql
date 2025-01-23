SELECT 
    DATE_TRUNC('MONTH', first_order) AS month,
    DATE_FORMAT(month, "MMM y") AS month_formatted,
    COUNT(*) as count_new_customer_orders
FROM {{ ref('wh_customers')}}
GROUP BY month
HAVING isnotnull(month)
ORDER BY month