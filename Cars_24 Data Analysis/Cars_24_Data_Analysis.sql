-- --------------------------------  CAR'S 24 DATA ANALYSIS  -------------------

--  Basic Queries

-- List all the cars available in Hyderabad, Telangana.

select cars_name
from cars24
where city = 'Hyderabad' and state = 'Telangana'

-- Find the total number of cars that are of diesel type.

select count(cars_name)as total_cars
from cars24
where gasoliene_type = 'Diesel'

-- Display the car names and their prices sorted by price in descending order.

select cars_name, price
from cars24
order by price desc

-- Retrieve all car details where the car type is 'Manual'.

select * from cars24
where car_type = 'Manual'

-- Show the details of cars manufactured in or after the year 2013.

select  cars_name,cars_brand,model
from cars24
where model_year >= '2013'

-------------------------------------------------Aggregations and Grouping ------------------------

-- Calculate the average price of cars by brand.

select cars_brand,avg(price) as avg_price
from cars24
group by cars_brand
order by avg_price desc

-- Find the total number of kilometers driven by cars from each brand.

select cars_brand,sum(kms) as total_kilometer_driven
from cars24
group by cars_brand
order by total_kilometer_driven desc

-- Determine the average EMI per month for cars with zero down payment.

select cars_name,avg(emi_per_month) as emi_per_month
from cars24
where zero_downpayment = 'Zero downpayment'
group by cars_name
order by emi_per_month desc

-- Count the number of cars for each model year.

select model_year,count(cars_name) as total_cars
from cars24
group by model_year
order by total_cars desc

-- Find the total number of cars owned by first-time owners.

select count(cars_name) as total_cars
from cars24
where owner = 1

--  ------------------------------------------------  Joins and Subqueries ------------------------

-- Find the details of cars that have been driven more than the average kilometers driven by all cars.

select cars_name, avg(kms) as avg_driven
from cars24
where kms > (select  avg(kms) as avg_kilometer_driven
from cars24)
group by cars_name
order by avg_driven desc

-- List the cars whose price is greater than the average price of all cars in the dataset.

select cars_name,avg(price) as avg_price
from cars24
where price > (select avg(price) as avg_price
from cars24)
group by cars_name
order by avg_price desc

-- Identify the car brands that have models with zero down payment EMI options in Hyderabad.

select cars_brand, model
from cars24
where zero_downpayment = 'Zero downpayment' and city = 'Hyderabad'

-- Retrieve the details of the most expensive car for each brand.

select cars_brand,cars_name ,max(price) as car_prices
from cars24
group by cars_name, cars_brand
order by car_prices desc

-- List all cars that have been driven less than the least driven car in the dataset.

select cars_name,MIN(kms) as min_driven
from cars24
where kms <= (select MIN(kms) as min_driven
from cars24) 
group by cars_name


-- --------------------------------------------- Advanced Functions and Analysis -----------------------

-- Determine the percentage of cars that are manual transmission.

select
count( case when car_type = 'Manual' THEN 1 END) * 100 / count(cars_name) as percent_of_cars
from cars24

-- Find the car with the maximum price and the minimum price, and display their details.

select  top 50 cars_brand,cars_name,model, max(price) as maximum_price, min(price) as minimum_price
from cars24
group by cars_brand,cars_name,model
order by maximum_price desc, minimum_price desc

-- Calculate the difference in price between the most expensive and least expensive car for each brand.

select cars_brand,max(price)as max_price , min(price) as min_price,
max(price) - min(price) as price_difference
from cars24
group by cars_brand

-- Write a query to rank the cars based on their price within each brand.

select cars_name,cars_brand,price,
RANK() over(order by  price desc) as 'Rank'
from cars24

-- -----------------------------------------Window Functions----------------------------------------

-- Find the lag and lead values of car prices within each brand.

select cars_brand,
LEAD(price) over(order by price) as 'Lead', 
LAG(price) over(order by price) as 'Lag'
from cars24

-- Calculate the running total of kilometers driven for each car type.

select car_type, sum(kms) as kilometer_driven
from cars24
group by car_type;

-- or

with amit_cte as (
select car_type, SUM(kms) as kilometer_driven
from cars24
group by car_type
)

select car_type, kilometer_driven
from amit_cte;

-- Identify the top 3 most expensive cars within each brand using window functions.

WITH ranked_cars AS (
  SELECT cars_brand, model, price,
         ROW_NUMBER() OVER (PARTITION BY cars_brand ORDER BY price DESC) AS rank
  FROM cars24
)
SELECT top 3 cars_brand, model, price
FROM cars24
ORDER BY cars_brand, price DESC;

--  Find the moving average price of the cars over model years.

WITH amit_cte AS (
  SELECT 
    model_year, 
    AVG(price) AS avg_price,
    ROW_NUMBER() OVER (ORDER BY model_year) AS row_num
  FROM 
    cars24
  GROUP BY 
    model_year
)
SELECT 
  model_year, 
  avg_price,
  AVG(avg_price) OVER (ORDER BY row_num ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) AS moving_avg_price
FROM 
  amit_cte
ORDER BY 
  model_year;


-- Complex Conditions and Case Statements

-- Find the number of cars for each owner type (e.g., first owner, second owner) and categorize them by their price range.

SELECT 
owner, 
CASE 
WHEN price < 200000 THEN 'Under 200000'
WHEN price BETWEEN 200000 AND 500000 THEN '200000-500000'
WHEN price BETWEEN 500000 AND 1000000 THEN '500000-1000000'
ELSE 'Over 1000000'
END AS price_range,
COUNT(cars_name) AS number_of_cars
FROM 
cars24
GROUP BY 
owner, price

