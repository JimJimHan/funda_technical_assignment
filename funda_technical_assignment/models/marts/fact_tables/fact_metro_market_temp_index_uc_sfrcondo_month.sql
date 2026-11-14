WITH fact_metro_market_temp_index AS (
    SELECT
        region_id
        , month_end_date
        , index_value
    FROM {{ ref('int_metro_market_temp_index_uc_sfrcondo_month') }}
)

SELECT * FROM fact_metro_market_temp_index