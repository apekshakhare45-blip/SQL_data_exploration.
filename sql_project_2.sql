create database zepto_raw_data;

-- DATA EXPLORATION --
select * from zepto_v2;
select count(*)from zepto_v2;
select * from zepto_v2
where category is null
or 
name is null 
or
mrp is null
or
DiscountPercent is null
or
availableQuantity is null
or
DiscountedSellingPrice is null
or
weightInGms is null
or
outOfStock is null
or
quantity is null;

select distinct category from zepto_v2
order by category; 

select outofstock, count(*)
from zepto_v2
group by outofstock;

select name, count(*) as no_of_times from zepto_v2
group by name
having count(*) > 1
order by count(*) desc;

select * from zepto_v2 as none
where mrp = 0 
or 
discountedSellingPrice = 0; 

set sql_safe_updates=0;

-- DATA CLEANING AND DATA STANDARDIZING--

delete from zepto_v2
where mrp=0;

select * from zepto_v2;

update zepto_v2 
set mrp= mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

-- BUSSINESS INSIGHTS--

-- Q.1.Find the top 10 best-value products based on the discount percentage.
select distinct name,mrp,discountPercent from zepto_v2
order by discountPercent desc
limit 10;

-- Q.2 What are the Products with High MRP but out of stock?
select  distinct name ,mrp, outOfStock from zepto_v2
where outofstock = "True"and mrp>200
order by mrp desc;

-- Q.3 Calculate Estimated Revenue for each category?
select category,
sum(discountedSellingPrice * availableQuantity) as total_revenue from zepto_v2
group by category
order by total_revenue;

-- Q.4 Find all products where mrp is greater than 500rupees and discount is less than 10%?
select  name, mrp ,discountPercent
from zepto_v2
where mrp>500 and discountPercent<10
order by mrp desc, discountPercent desc;

-- Q.5 Identify the top 5 categories offering the highest average discount percentage.
select distinct category , avg(discountPercent)
from zepto_v2
group by category
order by avg(discountPercent) desc
limit 5;

-- Q.6 Find the price per gram, for products above 100g and sort by best value.
select distinct name, weightInGms, discountedSellingPrice, 
round(discountedSellingPrice/weightINGms,2) as price_per_gram
from zepto_v2
where weightInGms >= 100
order by price_per_gram;

-- Q.7 Group the products into category like low, Medium, Bulk.
select distinct name, weightInGms,
case when weightInGms < 1000 then 'low'
     when weightInGms <5000 then 'Medium'
     else 'bulk'
end as weiht_category
from zepto_v2;

-- Q.8 What is the Total Inventory weight per category?
select category,
sum(weightInGms * availableQuantity) As total_weight
from zepto_v2
group by category
order by total_weight desc;

-- END --














