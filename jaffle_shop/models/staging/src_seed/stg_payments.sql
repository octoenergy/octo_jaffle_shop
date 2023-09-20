with source as (
    
    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ ref('raw_payments') }}

),

renamed as (

    select
        CAST(id AS BIGINT) AS payment_id,
        CAST(order_id AS BIGINT) AS order_id,
        NULLIF(payment_method,"") AS payment_method,

        -- `amount` is currently stored in cents, so we convert it to dollars
        amount / 100 as amount

    from source

)

select * from renamed
