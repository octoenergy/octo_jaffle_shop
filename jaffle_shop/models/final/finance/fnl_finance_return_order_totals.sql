SELECT
    customer_id,
    COUNT(order_id) AS no_of_returned_orders,
    SUM(amount) AS total_value

FROM {{ ref('wh_orders') }}

WHERE status = 'returned'

GROUP BY customer_id
