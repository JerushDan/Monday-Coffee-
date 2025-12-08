create database monday_coffee;

-- DATA ANALYSIS



SELECT 
	city_name,
    ROUND((population * 0.25)/1000000 , 2) as coffee_consumers_in_millions,
    city_rank
    -- 1]Coffee Consumers Count
-- How many people in each city are estimated to consume coffee, given that 25% of the population does?
 FROM city
 ORDER BY 2 DESC;   
    
 
 -- Total Revenue from Coffee Sales
-- What is the total revenue generated from coffee sales across all cities in the last quarter of 2023?


select *,
	extract(year from sale_date) as year,
	EXTRACT(QUARTER FROM sale_date) as qtr
FROM sales
where
	EXTRACT(QUARTER FROM sale_date) =4;
    
    
select
	ci.city_name,
	sum(s.total) as total_revenue
from sales as s
join customers as c
on s.customer_id = c.customer_id
join city as ci
on ci.city_id = c.city_id
where
	EXTRACT(QUARTER FROM sale_date) =4
group by 1
order by 2 desc;

-- 3 Sales Count for Each Product
-- How many units of each coffee product have been sold?

select 
	p.product_name,
    count(s.sale_id) as total_orders
from products as p
left join
sales as s
on s.product_id = p.product_id
group by 1
order by 2 desc;

-- 4 Average Sales Amount per City
-- What is the average sales amount per customer in each city?(total sales in city/no.of people)

select
	ci.city_name,
	sum(s.total) as total_revenue,
    count(distinct s.customer_id) as total_customers,
    sum(s.total)/count(distinct s.customer_id)  as per_cityy_per_customer
from sales as s
join customers as c
on s.customer_id = c.customer_id
join city as ci
on ci.city_id = c.city_id
where
	EXTRACT(QUARTER FROM sale_date) =4
group by 1
order by 2 desc;


-- 5City Population and Coffee Consumers
 -- Provide a list of cities along with their populations and estimated coffee consumers.
 select 
	city_name,
    round((population*0.25)/1000000 , 2) as coffee_consumers
 from city;
    
 
 
 



    






 
