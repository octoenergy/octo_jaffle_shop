with orders as (

    select * from {{ ref('orders') }}

),

final as (
    select
        orders.customer_id,
        count(orders.order_id) as orders_count,
        sum(orders.amount) as total_amount

    from orders

    where orders.status = 'returned'

    group by orders.customer_id
)

select * from final