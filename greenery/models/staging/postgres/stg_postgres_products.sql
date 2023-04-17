with source as (
  select * from {{source ('postgres', 'products')}}
)

select * from source