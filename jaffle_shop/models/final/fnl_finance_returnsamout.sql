WITH returned_ AS (
  SELECT
    customer_id
    , SUM(total_amount_aud) AS total_returned_amount_aud
  FROM {{ ref('wh_orders') }}
  WHERE status = 'returned'
  GROUP BY customer_id
)


SELECT
  customers_.customer_id
  , COALESCE(returned_.total_returned_amount_aud, 0) AS total_returned_amount_aud
FROM {{ ref('wh_customers') }} AS customers_
LEFT JOIN returned_
  ON customers_.customer_id = returned_.customer_id
