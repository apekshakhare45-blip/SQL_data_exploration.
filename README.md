# SQL_data_exploration.
- Zepto dataset cleaned, standardized & analyse data with SQL.
This project focuses on cleaning, standardizing, and exploring a dataset from the 'zepto app'.
The dataset contains informationsuch as category, name, mrp, discounted selling prize, out of stock etc of products.

The main objective is to make the data consistent, remove errors, and extract meaningfull insights thatcould help in **bussiness analytics and descision-making**.

## STEPS PERFORMED
1. **Data cleaning**
-We did not had duplicates.
-Handled and deleted data we did not wanted.

2. **Data standardizing**
-Standardised the currency from paise to Indian rupees.

3. **Data exploration**
-Worked on insights.
-Summary statistics.
-Found products with high mrp.

## REPOSITORY STRUCTURES
- sql-scripts -> SQL queries used for cleaning, standardizing and exploring.
- dataset     -> Sample raw and cleaned datasets.
- reports     -> Insights and summary

## SQL FUNCTIONS USED
- 'count','group by','case when','order by','having',
'delete', 'update'.

## SOME EXAMPLE QUERIES
select distinct category from zepto_v2
order by category;

select outofstock, count(*)
from zepto_v2
group by outofstock;

select name, count(*) as no_of_times from zepto_v2
group by name
having count(*) > 1
order by count(*) desc;

## HOW TO USE
- Import data into Mysql workbench.
- Run queries from 'sql_scripts' folder.
- view cleaned and standardized dataset.

## RESULTS
- Reduced dataset size by 10% after cleaning
- Standardized currency.
- Found out top 5 category with top revenue.
