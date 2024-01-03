WITH fnl_finance_returnsvalue AS (
    SELECT
        orders.customer_id AS customer_id
        , SUM(orders.amount) AS total_return_value
    FROM {{ref('wh_jaffle_orders')}} as orders
    WHERE orders.status = 'returned'
    GROUP BY orders.customer_id
)

SELECT * FROM fnl_finance_returnsvalue
