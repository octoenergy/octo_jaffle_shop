SELECT
DATE_TRUNC('month', first_order) AS first_order_month
-- No need to use count distinct here, as wh_customers has one row per customer
, COUNT(customer_id) AS new_customers

FROM {{ ref('wh_customers') }} AS customers

GROUP BY DATE_TRUNC('month', first_order)