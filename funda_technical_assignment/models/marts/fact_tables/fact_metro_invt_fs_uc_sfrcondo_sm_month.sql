WITH fact_metro_invt AS (
    SELECT
        region_id
        , month_end_date
        , inventory_count
    FROM {{ ref('int_metro_invt_fs_uc_sfrcondo_sm_month') }}
)

SELECT * FROM fact_metro_invt