WITH source_ AS (
  SELECT *
  FROM {{ ref('raw_payments') }}
)

, renamed_ AS (
  select
      id AS payment_id
      , order_id
      , payment_method
      -- `amount` is currently stored in cents, so we convert it to dollars
      , amount / 100 AS amount_aud
  FROM source_
)


SELECT *
FROM renamed_
