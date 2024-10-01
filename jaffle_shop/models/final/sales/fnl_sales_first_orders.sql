WITH customer_first_orders AS (
  SELECT
    customer_id
    -- Get just the month from the first order date
    , DATE_FORMAT(first_order, 'MMMM') As first_order_month
  FROM {{ ref('wh_customers') }}
)

SELECT
  first_order_month
  , COUNT(*) AS number_of_customers
FROM customer_first_orders
GROUP BY first_order_month

