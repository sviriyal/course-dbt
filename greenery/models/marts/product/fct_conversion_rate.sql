{{
    config(
        materialized='table'
        , post_hook=["grant select on {{ this }} to role reporting"]
    )
}}

with product_conversion as (

{{ conversion_rate(ref('int_user_events'),'PRODUCT_ID','CHECKOUT','PAGE_VIEW') }}


)
select 
product_id
, numerator as purchases
, denom as views
, conversion as product_conversion 
from product_conversion