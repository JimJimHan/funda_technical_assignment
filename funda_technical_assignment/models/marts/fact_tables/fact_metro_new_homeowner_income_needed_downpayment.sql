WITH fact_metro_new_homeowner_income AS (
    SELECT
        region_id
        , month_end_date
        , downpayment_value
    FROM {{ ref('int_metro_new_homeowner_income_needed_downpayment') }}
)

SELECT * FROM fact_metro_new_homeowner_income