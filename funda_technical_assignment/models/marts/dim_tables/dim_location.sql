WITH dim_location AS (
	SELECT DISTINCT
		region_id
		, size_rank
		, region_name
		, region_type
		, state_name
		, CAST(NULL AS VARCHAR) AS city_name
		, metro_name
		, county_name
	FROM {{ ref('int_city_zori_uc_sfrcondomfr_sm_month') }}

	UNION

	SELECT DISTINCT
		region_id
		, size_rank
		, region_name
		, region_type
		, state_name
		, CAST(NULL AS VARCHAR) AS city_name
		, CAST(NULL AS VARCHAR) AS metro_name
		, CAST(NULL AS VARCHAR) AS county_name
	FROM {{ ref('int_metro_invt_fs_uc_sfrcondo_sm_month') }}

	UNION

	SELECT DISTINCT
		region_id
		, size_rank
		, region_name
		, region_type
		, state_name
		, CAST(NULL AS VARCHAR) AS city_name
		, CAST(NULL AS VARCHAR) AS metro_name
		, CAST(NULL AS VARCHAR) AS county_name
	FROM {{ ref('int_metro_market_temp_index_uc_sfrcondo_month') }}

	UNION

	SELECT DISTINCT
		region_id
		, size_rank
		, region_name
		, region_type
		, state_name
		, CAST(NULL AS VARCHAR) AS city_name
		, CAST(NULL AS VARCHAR) AS metro_name
		, CAST(NULL AS VARCHAR) AS county_name
	FROM {{ ref('int_metro_mean_doz_pending_uc_sfrcondo_sm_month') }}

	UNION

	SELECT DISTINCT
		region_id
		, size_rank
		, region_name
		, region_type
		, state_name
		, CAST(NULL AS VARCHAR) AS city_name
		, CAST(NULL AS VARCHAR) AS metro_name
		, CAST(NULL AS VARCHAR) AS county_name
	FROM {{ ref('int_metro_new_con_sales_count_raw_uc_sfrcondo_month') }}

	UNION

	SELECT DISTINCT
		region_id
		, size_rank
		, region_name
		, region_type
		, state_name
		, CAST(NULL AS VARCHAR) AS city_name
		, CAST(NULL AS VARCHAR) AS metro_name
		, CAST(NULL AS VARCHAR) AS county_name
	FROM {{ ref('int_metro_new_homeowner_income_needed_downpayment') }}

	UNION

	SELECT DISTINCT
		region_id
		, size_rank
		, region_name
		, region_type
		, state_name
		, CAST(NULL AS VARCHAR) AS city_name
		, CAST(NULL AS VARCHAR) AS metro_name
		, CAST(NULL AS VARCHAR) AS county_name
	FROM {{ ref('int_metro_sales_count_now_uc_sfrcondo_month') }}

	UNION

	SELECT DISTINCT
		region_id
		, size_rank
		, region_name
		, region_type
		, CAST(NULL AS VARCHAR) AS state_name
		, CAST(NULL AS VARCHAR) AS city_name
		, CAST(NULL AS VARCHAR) AS metro_name
		, CAST(NULL AS VARCHAR) AS county_name
	FROM {{ ref('int_national_zorf_growth_uc_sfr_sm_month') }}

	UNION

	SELECT DISTINCT
		region_id
		, size_rank
		, region_name
		, region_type
		, state_name
		, city_name
		, metro_name
		, county_name
	FROM {{ ref('int_neighborhood_zhvi_uc_sfrcondo_tier') }}
)

SELECT * FROM dim_location
