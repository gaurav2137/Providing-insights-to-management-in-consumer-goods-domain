
with top_products as 
(SELECT pro.division, pro.product_code,pro.product,
sum(sales.sold_quantity) as total_sold_quantity
 FROM fact_sales_monthly as sales 
join dim_product as pro
on sales.product_code=pro.product_code
where sales.fiscal_year =2021
group by pro.division, pro.product_code,pro.product
order by total_sold_quantity desc)

select division,product_code,product,total_sold_quantity,rank_order from
(select division,product_code,product,total_sold_quantity,
dense_rank () over(partition by division order by total_sold_quantity ) as rank_order
from top_products) test
where rank_order<=3

