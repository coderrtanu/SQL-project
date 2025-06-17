SELECT * FROM gdb023.fact_sales_monthly;

select month(date) as month,f.fiscal_year as year,sum(sold_quantity*gross_price)
from fact_sales_monthly f
join fact_gross_price g
on f.product_code=g.product_code and f.fiscal_year=g.fiscal_year
join dim_customer c
on f.customer_code=c.customer_code
where c.customer="Atliq Exclusive"
group by month,year
order by month
