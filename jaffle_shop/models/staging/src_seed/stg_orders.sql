with source as (

    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ ref('raw_orders') }}

),

renamed as (

    select
        CAST(id AS BIGINT) AS order_id,
        CAST(user_id AS BIGINT) AS customer_id,
        CAST(order_date AS DATE) AS order_date,
        NULLIF(status, "") AS order_status

    from source

)

select * from renamed
