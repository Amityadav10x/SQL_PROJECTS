create database if not exists salesDataWalmart;

create table if not exists sales(
invoice_id varchar(30) not null primary key,
branch varchar(5) not null,
city varchar(30) not null,
customer_type varchar(30) not null,
gender varchar(30) not null,
product_line varchar(100) not null,
unit_price decimal(10,2) not null,
quantity int not null,
VAT float(6,4) not null,
total decimal(12,4) not null,
data datetime not null,
time time not null,
payment_method varchar(15) not null,
cogs decimal(10,2) not null,
gross_margin_pct float(11,9),
gross_income decimal(12,4) not null,
rating float(2,1) 
);

















                -- feature engennering --
                
                
--   -----------     -time_of_day-     --------------------

SELECT 
    time,
    CASE 
        WHEN `time` BETWEEN '00:00:00' AND '11:59:59' THEN 'morning'
        WHEN `time` BETWEEN '12:00:00' AND '15:59:59' THEN 'afternoon'
        ELSE 'evening'
    END as time_of_day
FROM
    sales;
    
ALTER TABLE sales ADD COLUMN time_of_days VARCHAR(10);


update sales
set time_of_days = (
CASE 
        WHEN `time` BETWEEN '00:00:00' AND '11:59:59' THEN 'morning'
        WHEN `time` BETWEEN '12:00:00' AND '15:59:59' THEN 'afternoon'
        ELSE 'evening'
    END

);

                       -- day_name  --


select 
data,
dayname(data) as day_name
from sales;

alter table sales add column day_name varchar(10);

update sales 
set day_name = dayname(data);

--  -------------------------------------------------------


                          -- month_name -- 

select 
date, monthname(data)
from sales;

alter table sales add column month_name varchar(10);
update sales 
set month_name = monthname(data);




    
-- -----------------------------------------------------------------------


-- ---------------------------------------------------------
 -- -----------------------Generic -------------------------
 
--  How many unique cities does the data have ?

SELECT DISTINCT
    city
FROM
    sales;


-- In which city is each branch ?

SELECT DISTINCT
    branch
FROM
    sales;

SELECT DISTINCT
    city, branch
FROM
    sales;
    

-- ------------------------ Product ---------------------


-- how many unique product lines does the data have ?

SELECT DISTINCT
    count(distinct product_line)
FROM
    sales;

-- what is the most common payment method ?

SELECT 
    payment_method, COUNT(payment_method)
FROM
    sales
GROUP BY payment_method;


-- what is the most selling product line ?

SELECT 
    product_line, COUNT(product_line) as cnt
FROM
    sales
GROUP BY product_line
order by cnt desc;


-- what is total revenue by month ?

SELECT 
    month_name AS month,
    sum(total) as total_revenue
FROM
    sales
group by month_name
order by total_revenue;


-- what month had largest cogs ?

select 
month_name as month,
sum(cogs) as cogs
from sales
group by month_name 
order by cogs desc;

-- which product line had largest revenue ?
SELECT 
    product_line, SUM(total) AS total_revenue
FROM
    sales
GROUP BY product_line
ORDER BY total_revenue desc;


-- which city have largest revenue ?

SELECT 
    branch, city, SUM(total) AS total_revenue
FROM
    sales
GROUP BY city , branch
ORDER BY total_revenue DESC;

-- which product line had the largest vat ?

SELECT 
    product_line, AVG(VAT) AS avg_tax
FROM
    sales
GROUP BY product_line
ORDER BY avg_tax DESC;

-- fetch each product line and add a column to those product line showing "good","bad". good if its greater than average sales.

-- which branch sold more products than average product sold ?

SELECT 
    branch, SUM(quantity) AS qty
FROM
    sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT 
        AVG(quantity)
    FROM
        sales);
        
-- what is the most common product line by gender ?

SELECT 
    gender, product_line, COUNT(gender) AS total_cnt
FROM
    sales
GROUP BY gender , product_line
ORDER BY total_cnt DESC;

-- what is the averge rating of each product line ?

SELECT 
   round(AVG(rating), 2) AS avg_rating, product_line
FROM
    sales
GROUP BY product_line
ORDER BY avg_rating DESC;



-- ----------------     Sales   -----------------------

-- Number of sales made in each time of the day per weekday ?

SELECT 
    time_of_days, 
    COUNT(*) AS total_sales
FROM
    sales
WHERE
    day_name = "Monday"
GROUP BY time_of_days
ORDER BY total_sales DESC;


-- which of the customer types brings the most revenue ?

select customer_type,
sum(total) as total_rev
from sales
group by customer_type
order by total_rev desc;


-- which city has the largest tax percent/VAT ?
select city,
avg(VAT) as VAT
from sales
group by city
order by VAT desc;


-- which customer types pays the most in vat ?
select customer_type,
avg(VAT) as VAT
from sales
group by customer_type
order by VAT desc;

-- ------------------------------------------- customer -----------------------------------------------------------------------------------


-- how many unique customer type does the data have ?
SELECT DISTINCT
    customer_type
FROM
    sales;

-- how many unique payment methods does the data have ?
SELECT DISTINCT
    payment_method
FROM
    sales;

-- what is the most common customer type ?
SELECT DISTINCT
    customer_type
FROM
    sales;

-- which customer type buys the most ?

SELECT 
    customer_type, COUNT(*) AS customer_count
FROM
    sales
GROUP BY customer_type
ORDER BY customer_type DESC;

-- what is the gender of most of the customers ?

SELECT 
    gender, COUNT(*) AS gender_cnt
FROM
    sales
GROUP BY gender
ORDER BY gender_cnt DESC;

-- what is gender distribution of branch ?

SELECT 
    gender, COUNT(*) AS gender_cnt
FROM
    sales
where branch = "C"
group by gender
ORDER BY gender_cnt DESC;

-- what time of the day do customers give most rating ?

SELECT 
    time_of_days, AVG(rating) AS avg_rating
FROM
    sales
GROUP BY time_of_days
ORDER BY avg_rating DESC;

-- what time of the day do customers give most rating per branch ? 

SELECT 
    time_of_days, AVG(rating) AS avg_rating
FROM
    sales
WHERE
    branch = 'A'
GROUP BY time_of_days
ORDER BY avg_rating DESC;


-- which day of the week has the best avg rating ?
SELECT 
    day_name, AVG(rating) AS avg_rating
FROM
    sales
GROUP BY day_name
ORDER BY avg_rating DESC;

-- which day of the week has the best average ratings per branch ?

SELECT 
    day_name, AVG(rating) AS avg_rating
FROM
    sales
GROUP BY day_name
ORDER BY avg_rating DESC;















-- 
















