with sales_amount as 
(SELECT cust.channel,
round(sum(gross_price*sold_quantity)/1000000,2) as gross_sales_amount
 FROM fact_gross_price as price 
join  fact_sales_monthly as sales
on price.product_code=sales.product_code 
join dim_customer as cust
on sales.customer_code=cust.customer_code
where sales.fiscal_year = 2021
group by channel
order by gross_sales_amount desc)

select channel , gross_sales_amount,
round(gross_sales_amount/(sum(gross_sales_amount) over())*100,2) as percentage 
from sales_amount
