{{

    config(
        MATERIALIZED = 'table'
    )
}}

with users as (
    select * from {{ ref('stg_postgres_users') }}
)

, final as (
    select 
        user_id,
        first_name,
        last_name,
        email as email_address,
        phone_number
        from users
)

select * from final