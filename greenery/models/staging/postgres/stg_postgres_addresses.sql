with source as (
    select * from {{source ('postgres', 'addresses')}}
)

, renamed_recast as (
    select 
      address_id,
      state,
      lpad(zipcode, 5, 0) as zip_code,
      country
    from source
)

select * from renamed_recast