SELECT * FROM gdb023.fact_pre_invoice_deductions;

SELECT  p.customer_code,c.customer,avg(p.pre_invoice_discount_pct) as avg_disc_pct
from fact_pre_invoice_deductions p
join dim_customer c
on p.customer_code=c.customer_code
where p.fiscal_year=2021 and c.market="india"
group by p.customer_code,c.customer
order by avg_disc_pct desc limit 5