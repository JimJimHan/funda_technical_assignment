WITH fact_neighborhood_zhvi AS (
    SELECT
        region_id
        , month_end_date
        , zhvi_value
    FROM {{ ref('int_neighborhood_zhvi_uc_sfrcondo_tier') }}
)

SELECT * FROM fact_neighborhood_zhvi