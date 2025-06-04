WITH customer_orders as (
    SELECT
        customer_id
        , MIN(order_date) AS first_order
        , MAX(order_date) as most_recent_order
        , COUNT(order_id) as number_of_orders
    FROM {{ ref('stg_orders') }}

    GROUP BY customer_id

),

customer_payments as (
    SELECT
        orders.customer_id
        , SUM(payments.amount) AS total_amount

    FROM {{ ref('stg_payments') }} AS payments

    LEFT JOIN orders ON
         payments.order_id = orders.order_id

    GROUP BY orders.customer_id

),

SELECT
    customers.customer_id
    , customers.first_name
    , customers.last_name
    , customer_orders.first_order
    , customer_orders.most_recent_order
    , customer_orders.number_of_orders
    , customer_payments.total_amount AS customer_lifetime_value

FROM {{ ref('stg_customers') }} AS customers

LEFT JOIN customer_orders
    ON customers.customer_id = customer_orders.customer_id

LEFT JOIN customer_payments
    ON customers.customer_id = customer_payments.customer_id
