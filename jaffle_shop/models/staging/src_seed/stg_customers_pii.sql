with source as (

    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ ref('raw_customers') }}

),

renamed as (

    select
        CAST(id AS BIGINT) as customer_id,
        NULLIF(first_name,"") as first_name,
        NULLIF(last_name,"") as last_name

    from source

)

select * from renamed
