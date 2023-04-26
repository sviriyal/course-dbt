{{

    config(
        MATERIALIZED = 'table'
    )
}}

with user_events as (
    select * from {{ ref('int_user_events') }}
)

, final as (
    select 
        user_id,
        first_name,
        last_name,
        email,
        phone_number,
        session_id,
        product_id,
        product_name,
        page_view,
        checkout,
        package_shipped,
        add_to_cart,
        datediff('minutes',first_created_at,last_created_at) as session_length_minutes
        from user_events
)

select * from final