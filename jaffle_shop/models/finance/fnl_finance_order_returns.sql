SELECT 
    customer_id 
    , SUM(amount) AS total_value_returned_per_customer
FROM {{ ref('wh_orders') }}
WHERE status = 'returned'
GROUP BY customer_id
