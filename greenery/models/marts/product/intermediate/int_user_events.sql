{{
  config(
    materialized = 'table'
  )
}}

with user_events as (
    select * from {{ ref('stg_postgres_events') }}
)

, products as (
    select * from {{ ref('stg_postgres_products') }}
)

, final as (
    SELECT
        u.user_id,
        u.session_id,
        u.product_id,
        products.name as product_name,
        sum(case when event_type = 'page_view' then 1 else 0 end) as page_view,
        sum(case when event_type = 'checkout' then 1 else 0 end) as checkout,
        sum(case when event_type = 'package_shipped' then 1 else 0 end) as package_shipped,
        sum(case when event_type = 'add_to_cart' then 1 else 0 end) as add_to_cart,
        min(u.created_at) as first_created_at,
        max(u.created_at) as last_created_at
    from user_events as u
    left join products
    on u.product_id = products.product_id
    group by 1,2,3,4
)

select * from final