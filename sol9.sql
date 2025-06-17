SELECT * FROM gdb023.fact_gross_price;

with cte1 as (
select c.channel,(sum(s.sold_quantity*g.gross_price)/1000000) as gross
from fact_gross_price g
join fact_sales_monthly s
on g.product_code=s.product_code
join dim_customer c
on s.customer_code=c.customer_code
where g.fiscal_year=2021
group by c.channel
)
select channel,gross,100*gross/sum(gross) over() from cte1