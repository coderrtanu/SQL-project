SELECT * FROM gdb023.fact_sales_monthly;

with cte1 as (
select p.segment as A,count(distinct(f.product_code)) as B from 
fact_sales_monthly f 
join dim_product p 
on f.product_code=p.product_code
where f.fiscal_year=2020
group by p.segment
),
cte2 as (
select p.segment as C,count(distinct(f.product_code)) as D from 
fact_sales_monthly f 
join dim_product p 
on f.product_code=p.product_code
where f.fiscal_year=2021
group by p.segment
)
select cte1.A as segment,cte1.B as product_count_2020,
cte2.D as product_count_2021,round((cte2.D-cte1.B)/cte1.B*100 )as pct_chg 
from cte1,cte2
where cte1.A=cte2.C