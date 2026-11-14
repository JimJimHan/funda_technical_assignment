### Funda Technical Assignment

For building the dbt models use:

- dbt run
- dbt test

Hi Funda team,

I'm just going to put some thoughts here

Key decisions:

- removed state from tables in the staging layer. This data was already represened as state_name so was duplicated data
- recast everything to ensure correct typing
- ranamed all columns for consistency
- flattened the wide tables so instead there is a date column and a value column, meaning much less wide tables. (better for long term management of the table)
- created a dim table for the date information
- created a dim table for the location information
- created fact tables for each of the different source tables.

Other Considerations:

- I considered making 4 fact tables as the end product, one for each region_type (national, metro, city, neighborhood)
With this the only real thing to consider is if joining all the metro tables together is a good idea. 
As there is some variation in the date ranges they cover and some of the data is smoothed, some is raw, some are counts, I decided the meaning of each key value was different enough that a separate table for each is the best approach.
(
Date ranges for each metro table: 
metro_invt_fs_uc_sfrcondo_sm_month              - 2018-03-31 - 2026-09-30
metro_market_temp_index_uc_sfrcondo_month       - 2019-01-31 - 2026-09-30
metro_mean_doz_pending_uc_sfrcondo_sm_month     - 2018-03-31 - 2026-09-30
metro_new_con_sales_count_raw_uc_sfrcondo_month - 2018-01-31 - 2026-08-31
metro_new_homeowner_income_needed_downpayment   - 2012-01-31 - 2026-09-30
int_metro_sales_count_now_uc_sfrcondo_month     - 2008-02-29 - 2026-09-30
)
There is the potential to join some of the metro tables together based on the logic behind them. (For example put all the smoothed data sets together)
However for this assignment I decided not to.

- I considered doing a hierarchical dim_location table with country all the way down to neighbourhood, In the end I did not due to 2 reasons:
1) the metro_name's did not line up with region_name's with a region_type of msa.
2) the size_rank data would be incompatible as the size_rank is done by region_type, and a full hierarchical dim_location would remove the region_type
