SELECT pro.product_code,pro.product ,cost.manufacturing_cost 
FROM fact_manufacturing_cost as cost
join dim_product as pro 
on cost.product_code=pro.product_code
where manufacturing_cost=(select max(manufacturing_cost) from fact_manufacturing_cost)
or manufacturing_cost=(select min(manufacturing_cost) from fact_manufacturing_cost)
order by manufacturing_cost desc