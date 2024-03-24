SELECT COALESCE(date_trunc('MM', first_order),'2018-01-01') as first_order_month
     , COUNT(customer_id) as new_customer_count
FROM {{ ref('wh_customers') }}
GROUP BY date_trunc('MM', first_order)
ORDER BY date_trunc('MM', first_order) ASC