{% set payment_methods = ['credit_card', 'coupon', 'bank_transfer', 'gift_card'] %}

WITH order_payments AS (

    SELECT
        payments.order_id

        {% for payment_method in payment_methods -%}
        , sum(CASE WHEN payment_method = '{{ payment_method }}' THEN payments.amount ELSE 0 END) AS {{ payment_method }}_amount
        {% endfor -%}

        , sum(payments.amount) AS total_amount

    FROM {{ ref('stg_payments') }} payments

    GROUP BY payments.order_id

)

SELECT
    orders.order_id
    , orders.customer_id
    , orders.order_date
    , orders.status

    {% for payment_method in payment_methods -%}

    , order_payments.{{ payment_method }}_amount

    {% endfor -%}

    , order_payments.total_amount AS amount_dollars

FROM {{ ref('stg_orders') }} orders

LEFT JOIN order_payments
    ON orders.order_id = order_payments.order_id
