with source as (
  select * from {{source ('postgres', 'orders')}}
)

select * from source