SELECT
  DATE_TRUNC('MONTH', first_order) as date_month,
  COUNT(DISTINCT customer_id) as new_customers
FROM {{ ref('wh_customers') }}
GROUP BY DATE_TRUNC('MONTH', first_order)
