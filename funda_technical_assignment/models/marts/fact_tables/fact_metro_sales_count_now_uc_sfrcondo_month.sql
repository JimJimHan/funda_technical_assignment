WITH fact_metro_sales_count_now AS (
    SELECT
        region_id
        , month_end_date
        , sales_count_now
    FROM {{ ref('int_metro_sales_count_now_uc_sfrcondo_month') }}
)

SELECT * FROM fact_metro_sales_count_now