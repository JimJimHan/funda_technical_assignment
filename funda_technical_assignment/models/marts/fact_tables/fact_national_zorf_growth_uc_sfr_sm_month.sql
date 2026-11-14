WITH fact_national_zorf_growth AS (
    SELECT
        region_id
        , base_date
        , month_end_date
        , zorf_growth_value
    FROM {{ ref('int_national_zorf_growth_uc_sfr_sm_month') }}
)

SELECT * FROM fact_national_zorf_growth