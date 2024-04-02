SELECT
  customer_id
  , SUM(amount) as customer_lifetime_returns
FROM {{ ref('wh_orders') }}
WHERE status = 'returned'
GROUP BY customer_id
