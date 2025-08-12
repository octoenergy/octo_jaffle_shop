WITH source AS (

    SELECT * FROM {{ ref('raw_payments') }}

)

    SELECT
    id AS payment_id
    , order_id
    , payment_method
    -- `amount` is currently stored in cents, so we convert it to dollars
    , TRY_DIVIDE(amount, 100) AS amount

FROM source