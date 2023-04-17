{% snapshot snapshot_products %}

{{
  config(
    target_database = "DEV_DB",
    target_schema = "SVIRIYALAHEALTHJOYCOM",
    strategy='check',
    unique_key='product_id',
    check_cols=['inventory'],
   )
}}

WITH base AS(
  SELECT 
    *
  FROM {{ ref('stg_postgres_products') }}
)

SELECT * FROM base

{% endsnapshot %}