WITH month_ends AS (
	SELECT 
        CAST(last_day(month_start) AS DATE) AS month_end_date
	FROM 
        generate_series(
            DATE '2000-01-01'
            , DATE '2030-12-01'
            , INTERVAL 1 MONTH
	    ) AS months(month_start)
)

, dim_date AS (
    SELECT
        month_end_date
        , CAST(EXTRACT(YEAR FROM month_end_date) AS INTEGER) AS year
        , CAST(EXTRACT(MONTH FROM month_end_date) AS INTEGER) AS month
        , CAST(EXTRACT(DAY FROM month_end_date) AS INTEGER) AS day
    FROM 
        month_ends
)

SELECT * FROM dim_date
