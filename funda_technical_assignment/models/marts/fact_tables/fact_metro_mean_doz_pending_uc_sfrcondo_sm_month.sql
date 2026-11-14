WITH fact_metro_mean_doz_pending AS (
    SELECT
        region_id
        , month_end_date
        , mean_doz_pending
    FROM {{ ref('int_metro_mean_doz_pending_uc_sfrcondo_sm_month') }}
)

SELECT * FROM fact_metro_mean_doz_pending