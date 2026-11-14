WITH
source AS (
        SELECT * FROM {{ source('assignment', 'city_zori_uc_sfrcondomfr_sm_month') }}
)
, transformed as (
    SELECT 
        CAST(RegionID AS BIGINT) AS region_id
        , CAST(SizeRank AS BIGINT) AS size_rank
        , CAST(RegionName AS NVARCHAR) AS region_name
        , CAST(RegionType AS NVARCHAR) AS region_type
        , CAST(StateName AS NVARCHAR) AS state_name
        --, CAST(State AS NVARCHAR) AS state
        , CAST(Metro AS NVARCHAR) AS metro_name
        , CAST(CountyName AS NVARCHAR) AS county_name
        , * EXCLUDE (RegionID, SizeRank, RegionName, RegionType, StateName, State, Metro, CountyName)
    FROM
        source
)

  SELECT * FROM transformed
    