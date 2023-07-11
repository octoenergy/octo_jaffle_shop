{% set return_states = ['returned', 'return_pending'] %}

SELECT
    orders.customer_id 

    {% for return_state in return_states -%}
    , SUM(orders.amount_dollars) FILTER (WHERE orders.status =' {{ return_state }}') AS {{ return_state }}_amount_dollars
    {% endfor -%}
    
    , SUM(orders.amount_dollars) AS sum_return_amount_dollars

FROM {{ ref('wh_orders') }} AS orders
WHERE orders.status IN ('returned', 'return_pending')
GROUP BY orders.customer_id