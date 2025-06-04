SELECT 
    DATE_TRUNC('month', first_order) AS first_order_month
    , COUNT(customer_id) AS customer_count
FROM {{ ref('wh_customers') }}
WHERE number_of_orders = 1 -- Only count customers with their first order
GROUP BY DATE_TRUNC('month', first_order)
