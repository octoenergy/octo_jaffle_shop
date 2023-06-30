SELECT
    orders.customer_id
    , customers.first_name_hash
    , customers.last_name_hash
    , MIN(orders.order_date) AS first_order
    , MAX(orders.order_date) AS most_recent_order
    , COUNT(orders.order_id) AS number_of_orders
    , SUM(payments.amount) AS customer_lifetime_value
FROM {{ ref('stg_orders') }} orders
LEFT JOIN {{ ref('stg_customers') }} customers
    ON orders.customer_id = customers.customer_id
LEFT JOIN {{ ref('stg_payments') }} payments
    ON orders.order_id = payments.order_id

GROUP BY orders.customer_id, customers.first_name_hash, customers.last_name_hash
