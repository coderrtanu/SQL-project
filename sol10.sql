SELECT * FROM gdb023.dim_product;

with cte1 as (
select p.division,p.product,p.product_code,sum(f.sold_quantity) as total
from dim_product p
join fact_sales_monthly f
on p.product_code=f.product_code
where f.fiscal_year=2021
group by p.division,p.product,p.product_code
),

cte2 AS (
select division,product,product_code,total,
       RANK() OVER(PARTITION BY division order by total desc) as rank_order
from cte1
order by division,total
)
select cte1.division,cte1.product,cte1.product_code,cte2.total,cte2.rank_order
from cte1 
join cte2
on cte1.product_code=cte2.product_code
where cte2.rank_order in (1,2,3)


