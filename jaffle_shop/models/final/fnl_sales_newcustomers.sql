WITH customers_ AS (
  SELECT
    customer_id
    , DATE_TRUNC('MONTH', first_order) AS first_order_month
  FROM {{ ref('wh_customers') }}
)


SELECT
  first_order_month
  , COUNT(*) AS num_new_customers
FROM customers_
GROUP BY first_order_month
