with base as (
        select * from {{ ref('stg_city_zori_uc_sfrcondomfr_sm_month') }}
  ),
  sample as (
      select 
          size_rank
        , region_name
      from base
      where size_rank = 0
  )
  select * from sample
    