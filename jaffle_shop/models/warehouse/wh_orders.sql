{% set payment_methods = ['credit_card', 'coupon', 'bank_transfer', 'gift_card'] %}

WITH orders_ AS (
  SELECT *
  FROM {{ ref('stg_orders') }}
)

, payments_ AS (
  SELECT *
  FROM {{ ref('stg_payments') }}
)

, order_payments_ AS (
  SELECT
    order_id
    {% for payment_method in payment_methods -%}
    , SUM(
      CASE
        WHEN payment_method = '{{ payment_method }}'
          THEN amount_aud
        ELSE 0
      END
    ) AS {{ payment_method }}_amount_aud
    {% endfor -%}
    , SUM(amount_aud) AS total_amount_aud
  FROM payments_
  GROUP BY order_id
)

, final_ AS (
  select
    orders_.order_id
    , orders_.customer_id
    , orders_.order_date
    , orders_.status
    {% for payment_method in payment_methods -%}
    , order_payments_.{{ payment_method }}_amount_aud
    {% endfor -%}
    , order_payments_.total_amount_aud
  FROM orders_
  LEFT JOIN order_payments_
    ON orders_.order_id = order_payments_.order_id
)


SELECT *
FROM final_
