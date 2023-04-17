with source as (
  select * from {{source ('postgres', 'order_items')}}
)

select * from source