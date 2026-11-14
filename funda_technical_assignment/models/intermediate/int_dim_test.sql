with base as (
        select * from {{ ref('stg_city_zori_uc_sfrcondomfr_sm_month') }}
  ),
  sample as (
      select 
          SizeRank
        , RegionName
      from base
      where SizeRank = 0
  )
  select * from sample
    