select
    date_format(first_order, '%Y-%m') as first_order_year_month
    ,count(customer_id) as new_customers_count
from {{ ref('wh_customers') }}
group by first_order_year_month