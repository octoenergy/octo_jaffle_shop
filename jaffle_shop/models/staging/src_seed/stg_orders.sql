WITH source_ AS (
  SELECT *
  FROM {{ ref('raw_orders') }}
)

, renamed_ AS (
  SELECT
    id AS order_id,
    user_id AS customer_id,
    order_date,
    status
  FROM source_
)


SELECT *
FROM renamed_
