select
  date(date_trunc('month', first_order)) as order_month
  , count(customer_id) as new_customer_count
from {{ ref('wh_customers') }}
where first_order is not null
group by date(date_trunc('month', first_order))