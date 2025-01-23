WITH returned as (
    SELECT 
        customer_id,
        COUNT(status) as number_of_returned_orders,
        SUM(amount) as total_returned_amount
    FROM {{ ref('wh_orders') }}
    WHERE status='returned'
    GROUP BY customer_id
    )

SELECT
    r.customer_id,
    r.number_of_returned_orders,
    r.total_returned_amount,
    c.first_name_hash,
    c.last_name_hash,
    c.first_order,
    c.most_recent_order,
    c.number_of_orders,
    c.customer_lifetime_value
FROM returned r
LEFT JOIN {{ ref('wh_customers') }} c
ON r.customer_id = c.customer_id