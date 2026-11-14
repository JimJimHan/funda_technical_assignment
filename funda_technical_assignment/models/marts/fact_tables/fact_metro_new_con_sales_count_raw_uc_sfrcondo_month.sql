WITH fact_metro_new_con_sales AS (
    SELECT
        region_id
        , month_end_date
        , new_cons_sales_count
    FROM {{ ref('int_metro_new_con_sales_count_raw_uc_sfrcondo_month') }}
)

SELECT * FROM fact_metro_new_con_sales