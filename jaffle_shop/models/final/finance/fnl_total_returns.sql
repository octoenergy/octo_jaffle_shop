select
    customer_id
    ,sum(amount) as total_returns
from {{ ref('wh_orders')}}
where status = 'returned'
group by customer_id