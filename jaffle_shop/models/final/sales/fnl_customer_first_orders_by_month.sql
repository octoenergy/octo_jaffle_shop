with customers as (

    select * from {{ ref('customers') }}

),

final as (

    select 
        extract(year from first_order) as year,
        extract(month from first_order) as month,
        count(customer_id) as customers_with_first_order

    from customers

    where first_order is not null

    group by 
        extract(year from first_order), 
        extract(month from first_order)

    order by year desc, month desc
)

select * from final
