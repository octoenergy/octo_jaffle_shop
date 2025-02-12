SELECT
  customer_id
  , SUM(amount) AS total_returned
FROM {{ ref('wh_orders') }}
WHERE status = 'returned'
GROUP BY customer_id
