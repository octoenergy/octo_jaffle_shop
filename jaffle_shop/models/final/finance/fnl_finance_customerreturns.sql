SELECT
    customer_id
    , SUM(amount) AS total_returned_amount
FROM {{ ref('wh_orders') }}
WHERE status IN ('return_pending', 'returned')
GROUP BY customer_id