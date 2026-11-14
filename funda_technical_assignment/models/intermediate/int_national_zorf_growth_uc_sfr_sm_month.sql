WITH staging AS (
    SELECT * FROM {{ ref('stg_national_zorf_growth_uc_sfr_sm_month') }}
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
                , base_date
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
        , base_date
        , CAST(date AS DATE) AS month_end_date
        , CAST(value AS DOUBLE) AS zorf_growth_value
    FROM
        flattened
)
SELECT * FROM int_flattened