SELECT * FROM gdb023.fact_sales_monthly;

select A as unique_product_2021,B as unique_product_2020,
round(A-B)/B*100 as pct_chg from
(select count(distinct(product_code)) as A from fact_sales_monthly 
where fiscal_year = 2021) as X,
(select count(distinct(product_code)) as B from fact_sales_monthly 
where fiscal_year = 2020) as Y