SELECT
    customer_id,
    SUM(amount) AS total_returned_order_amount
FROM {{ ref('wh_orders') }}
WHERE status = 'returned'
GROUP BY customer_id
