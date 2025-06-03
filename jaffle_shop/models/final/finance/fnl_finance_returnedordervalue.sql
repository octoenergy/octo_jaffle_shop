SELECT
  customer_id,
  SUM(amount) as total_amount
FROM {{ ref('wh_orders') }}
WHERE status = 'returned'
GROUP BY customer_id
