{{
  config(
    materialized = 'view'
    )
}}

with src_listing as (
    select * from {{ ref('src_listings') }}
)
select
    listing_id,
    listing_name,
    room_type,
    case
        when minimum_nights = 0 then 1 -- some rows has a wrong data and shows 0 for min nights.
        else minimum_nights
    end as minimum_nights,
    host_id,
    replace(price_str,'$'):: number(10,2) as price, -- price converted as a number
    created_at,
    updated_at
from src_listing