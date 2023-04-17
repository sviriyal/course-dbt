with source as (
  select * from {{source ('postgres', 'promos')}}
)

select * from source