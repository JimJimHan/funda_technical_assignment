WITH
source AS (
    SELECT * FROM {{ source('assignment', 'national_zorf_growth_uc_sfr_sm_month') }}
)
, transformed AS (
    SELECT
        CAST(RegionID AS BIGINT) AS region_id
        , CAST(SizeRank AS BIGINT) AS size_rank
        , CAST(RegionName AS NVARCHAR) AS region_name
        , CAST(RegionType AS NVARCHAR) AS region_type
        , CAST(BaseDate AS DATE) AS base_date
        , * EXCLUDE (RegionID, SizeRank, RegionName, RegionType, BaseDate)
    FROM 
        source
)
SELECT * FROM transformed