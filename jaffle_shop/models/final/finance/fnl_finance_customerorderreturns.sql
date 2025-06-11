SELECT
    customer_id
    , COUNT(DISTINCT order_id) AS number_of_returned_orders
    , SUM(amount) AS total_returned_value_aud
FROM {{ ref('wh_orders') }}
WHERE status = 'returned'
GROUP BY customer_id