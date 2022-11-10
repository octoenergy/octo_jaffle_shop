SELECT customer_id
       , SUM(amount) as returned_value
FROM {{ ref('wh_orders') }}
WHERE status = 'returned'
GROUP BY customer_id
ORDER BY SUM(amount) DESC