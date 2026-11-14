WITH staging AS (
    SELECT * FROM {{ ref('stg_metro_new_homeowner_income_needed_downpayment') }}
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
        , CAST(date AS DATE) AS month_end_date
        , CAST(value AS DOUBLE) AS annual_income_needed_value
    FROM
        flattened
)
SELECT * FROM int_flattened