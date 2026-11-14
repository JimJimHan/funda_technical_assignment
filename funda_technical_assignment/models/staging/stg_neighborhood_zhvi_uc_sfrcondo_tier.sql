WITH
source AS (
    SELECT * FROM {{ source('assignment', 'neighborhood_zhvi_uc_sfrcondo_tier') }}
)
, transformed AS (
    SELECT
        CAST(RegionID AS BIGINT)       AS region_id
        , CAST(SizeRank AS BIGINT)     AS size_rank
        , CAST(RegionName AS NVARCHAR) AS region_name
        , CAST(RegionType AS NVARCHAR) AS region_type
        , CAST(StateName AS NVARCHAR)  AS state_name
        --, CAST(State AS NVARCHAR)      AS state
        , CAST(City AS NVARCHAR)       AS city_name
        , CAST(Metro AS NVARCHAR)      AS metro_name
        , CAST(CountyName AS NVARCHAR) AS county_name
        , * EXCLUDE (RegionID, SizeRank, RegionName, RegionType, StateName, State, City, Metro, CountyName)
    FROM 
        source
)
SELECT * FROM transformed