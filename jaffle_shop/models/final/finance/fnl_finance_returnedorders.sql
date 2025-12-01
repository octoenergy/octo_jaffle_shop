SELECT
    customers.customer_id,
    SUM(orders.amount) AS total_returned_order_amount
FROM {{ ref('wh_customers_pii') }} AS customers
LEFT JOIN {{ ref('wh_orders') }} AS orders
    ON customers.order_id = orders.order_id
WHERE orders.status = 'returned'
GROUP BY customers.customer_id
