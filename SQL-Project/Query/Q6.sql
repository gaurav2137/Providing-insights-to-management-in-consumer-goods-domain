SELECT cust.customer_code,cust.customer ,
round(avg(pre_invoice_discount_pct),4) as average_discount_percentage
FROM fact_pre_invoice_deductions as invoice 
join dim_customer as cust 
on invoice.customer_code=cust.customer_code 
where market ="India" and fiscal_year = 2021 
group by cust.customer_code , cust.customer 
order by average_discount_percentage desc limit 5
