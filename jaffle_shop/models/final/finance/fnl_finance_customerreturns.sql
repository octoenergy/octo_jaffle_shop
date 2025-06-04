SELECT
    customer_id
    , SUM(amount) AS total_amount_returned

FROM {{ ref('wh_orders') }}

WHERE status = 'returned'

GROUP BY customer_id
