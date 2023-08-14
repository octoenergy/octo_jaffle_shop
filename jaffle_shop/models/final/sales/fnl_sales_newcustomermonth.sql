SELECT
  DATE_TRUNC('month', first_order) AS first_order_month
  , COUNT(DISTINCT customer_id) AS num_customers
FROM {{ ref('wh_customers') }}