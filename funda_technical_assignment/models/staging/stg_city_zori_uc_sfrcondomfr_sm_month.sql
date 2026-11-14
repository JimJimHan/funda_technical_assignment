WITH
source AS (
        SELECT * FROM {{ source('assignment', 'city_zori_uc_sfrcondomfr_sm_month') }}
  )
  , transformed as (
      SELECT 
          RegionID   AS region_id
        , SizeRank   AS size_rank
        , RegionName AS region_name
        , RegionType AS region_type
        , StateName  AS state_name
        --, State      AS state
        , Metro      AS metro_name
        , CountyName AS county_name
        , *
      FROM
          source
  )

  SELECT * FROM transformed
    