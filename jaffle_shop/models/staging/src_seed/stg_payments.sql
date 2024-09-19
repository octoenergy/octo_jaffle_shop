SELECT
    id AS payment_id
    , order_id
    , NULLIF(payment_method, '') AS payment_method
    -- `amount` is currently stored in cents, so we convert it to dollars
    , amount / 100 AS amount

    FROM {{ ref('raw_payments') }}
