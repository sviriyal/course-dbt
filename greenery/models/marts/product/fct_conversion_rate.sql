{{

    config(
        MATERIALIZED = 'table'
    )
}}

with page_views as (
    select * from {{ ref('fct_page_views') }}
)

, final as (
    select 
        product_name,
        count(distinct session_id) as total_sessions,
        sum(checkout) as total_orders,
        div0(total_orders,total_sessions)
    FROM page_views
    GROUP BY product_name
)

select * from final