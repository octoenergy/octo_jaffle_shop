WITH source AS (

    SELECT * FROM {{ ref('raw_customers') }}

)

SELECT
    id AS customer_id
    , first_name
    , last_name

FROM source
