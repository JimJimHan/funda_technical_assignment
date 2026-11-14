WITH staging AS (
    SELECT * FROM {{ ref('stg_city_zori_uc_sfrcondomfr_sm_month') }}
)
, flattened AS (
    SELECT 
        *
    FROM 
        staging
    UNPIVOT INCLUDE NULLS (
        value FOR date IN (
            COLUMNS(* EXCLUDE (
                region_id
                , size_rank
                , region_name
                , region_type
                , state_name
                , metro_name
                , county_name
            ))
        )
    )
)

, int_flattened AS (
    SELECT
      region_id
      , size_rank
      , region_name
      , region_type
      , state_name
      , metro_name
      , county_name
      , CAST(date AS DATE) AS month_end_date
      , CAST(value AS DOUBLE) AS zori_value
FROM 
    flattened
)

SELECT * FROM int_flattened
