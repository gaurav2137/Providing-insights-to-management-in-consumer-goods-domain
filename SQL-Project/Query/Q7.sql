SELECT monthname(date) as monthname,year(date) as year_,
round(sum(gross_price*sold_quantity),2) as gross_sales_amount
 FROM fact_gross_price as price 
 join  fact_sales_monthly as sales 
 on price.product_code=sales.product_code 
 join dim_customer as cust 
 on sales.customer_code=cust.customer_code
 where cust.customer="Atliq Exclusive"
 group by monthname , year_
 order by year_
