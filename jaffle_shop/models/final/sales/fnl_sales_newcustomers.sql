WITH customer_first_orders AS (
  SELECT
    DATE_TRUNC('MONTH', first_order) AS year_month
  FROM {{ ref('wh_customers') }}
  WHERE first_order IS NOT NULL
)

SELECT
    year_month
    , COUNT(1) AS new_customers
FROM customer_first_orders
GROUP BY year_month
