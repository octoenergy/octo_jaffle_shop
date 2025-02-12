SELECT
  DATE(DATE_TRUNC('MONTH', first_order)) AS order_month_year
  , COUNT(customer_id) AS count_new_customers
FROM {{ ref('wh_customers') }}
WHERE first_order IS NOT NULL
GROUP BY order_month_year
