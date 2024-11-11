WITH customers_ AS (
  SELECT *
  FROM {{ ref('stg_customers') }}
)

, orders_ AS (
  SELECT *
  FROM {{ ref('stg_orders') }}
)

, payments_ AS (
  SELECT *
  FROM {{ ref('stg_payments') }}
)

, customer_orders_ AS (
    SELECT
      customer_id
      , min(order_date) AS first_order
      , max(order_date) AS most_recent_order
      , count(order_id) AS number_of_orders
    FROM orders_
    GROUP BY customer_id
)

, customer_payments_ AS (
  SELECT
    orders_.customer_id
    , SUM(payments_.amount_aud) AS total_amount_aud
  FROM payments_
  LEFT JOIN orders_
    ON payments_.order_id = orders_.order_id
  GROUP BY orders_.customer_id
)

, final_ AS (
  SELECT
    customers_.customer_id
    , customer_orders_.first_order
    , customer_orders_.most_recent_order
    , customer_orders_.number_of_orders
    , customer_payments_.total_amount_aud AS total_order_amount_aud
  FROM customers_
  LEFT JOIN customer_orders_
    ON customers_.customer_id = customer_orders_.customer_id
  LEFT JOIN customer_payments_
    ON customers_.customer_id = customer_payments_.customer_id
)


SELECT *
FROM final_
