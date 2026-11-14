WITH
source AS (
    SELECT * FROM {{ source('assignment', 'metro_new_con_sales_count_raw_uc_sfrcondo_month') }}
)
, transformed AS (
    SELECT
        CAST(RegionID AS BIGINT) AS region_id
        , CAST(SizeRank AS BIGINT) AS size_rank
        , CAST(RegionName AS NVARCHAR) AS region_name
        , CAST(RegionType AS NVARCHAR) AS region_type
        , CAST(StateName AS NVARCHAR) AS state_name
        , * EXCLUDE (RegionID, SizeRank, RegionName, RegionType, StateName)
    FROM 
        source
)
SELECT * FROM transformed