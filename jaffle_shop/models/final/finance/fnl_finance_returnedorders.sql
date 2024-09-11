SELECT
    wh_orders.customer_id
    ,SUM(wh_orders.amount) AS returned_order_value
FROM {{ ref('wh_orders') }}
WHERE wh_orders.status = 'returned'
GROUP BY wh_orders.customer_id
