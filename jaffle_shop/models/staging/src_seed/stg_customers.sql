SELECT
    {{hash_sensitive_columns('stg_customers_pii')}}
from {{ref('stg_customers_pii')}}
