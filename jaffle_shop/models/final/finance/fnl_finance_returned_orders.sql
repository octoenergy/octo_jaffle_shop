WITH returned_orders AS (
    SELECT
      customer_id
      , amount AS value
    FROM {{ ref('wh_orders') }}
    WHERE status = 'returned'
    GROUP BY customer_id
)

SELECT
  customer_id
  , SUM(value) AS total_value
FROM returned_orders
GROUP BY customer_id
