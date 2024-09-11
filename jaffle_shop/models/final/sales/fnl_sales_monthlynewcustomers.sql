WITH first_order_month AS (
    SELECT
        wh_customers.customer_id
        ,DATE_FORMAT(wh_customers.first_order, 'yyyy-MM') AS order_month
    FROM {{ ref('wh_customers') }} 
)

SELECT
    first_order_month.order_month AS first_order_month
    ,COUNT(first_order_month.customer_id) AS new_customers
FROM first_order_month
GROUP BY first_order_month.order_month