with source as (
  select * from {{source ('postgres', 'events')}}
)

select * from source