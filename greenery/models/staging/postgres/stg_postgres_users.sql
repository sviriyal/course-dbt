with source as(
    select * from {{source ('postgres', 'users')}}
)

select * from source