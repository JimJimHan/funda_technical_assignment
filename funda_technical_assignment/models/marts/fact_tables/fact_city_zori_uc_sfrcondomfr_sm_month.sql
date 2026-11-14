WITH fact_city_zori AS (
    SELECT
        region_id
        , month_end_date
        , zori_value
    FROM {{ ref('int_city_zori_uc_sfrcondomfr_sm_month') }}
)

SELECT * FROM fact_city_zori
