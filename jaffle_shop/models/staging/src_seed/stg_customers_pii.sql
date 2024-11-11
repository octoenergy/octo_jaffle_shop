WITH source_ AS (
  SELECT *
  FROM {{ ref('raw_customers') }}
)

, renamed_ AS (
  SELECT
    id AS customer_id
    , first_name
    , last_name
  FROM source_
)


SELECT *
FROM renamed_
