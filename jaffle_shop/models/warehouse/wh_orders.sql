{% set payment_methods = ['credit_card', 'coupon', 'bank_transfer', 'gift_card'] %}

WITH order_payments AS (

    SELECT
        order_id

        , {% for payment_method in payment_methods -%}
          SUM(CASE WHEN payment_method = '{{ payment_method }}' THEN amount ELSE 0 END) AS {{ payment_method }}_amount
          {% endfor -%}

        , SUM(amount) AS total_amount

    FROM {{ ref('stg_payments') }}
    GROUP BY order_id

)
SELECT
    , orders.order_id
    , orders.customer_id
    , orders.order_date
    , orders.status

    {% for payment_method in payment_methods -%}

    order_payments.{{ payment_method }}_amount

    {% endfor -%}

    , order_payments.total_amount as amount

FROM {{ ref('stg_orders') }} AS orders 
LEFT JOIN order_payments
    ON orders.order_id = order_payments.order_id
