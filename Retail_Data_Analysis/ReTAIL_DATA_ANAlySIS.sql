select * from retail_data

-- ---------------------------------------------------------------  Analysing Retail data ------------------------------------------------------------

-- Basic Analysis:

-- What is the total number of transactions?

select count(Transaction_ID) as total_customers
from retail_data

-- What is the average transaction amount?

select round(avg(Total_Amount),0) as average_transaction_amount
from retail_data

-- What is the distribution of customer ages?
select age , count(*) as customer_count
from retail_data
group by age 
order by age desc

-- What is the most common product category?

select distinct Product_Category 
from retail_data

-- Which product brand has the highest sales?

select Product_Type, sum(Total_Purchases) as highest_purchase
from retail_data
group by Product_Type 
order by highest_purchase desc

-- What is the average rating given by customers?

select avg(Ratings) as avg_ratings
from retail_data

-- How many customers fall into each income category (Low, Medium, High)?

select Income ,count(Customer_ID) as total_customers
from retail_data
group by Income
order by total_customers desc

-- What is the total revenue generated from each product category?

select Product_Category, round(sum(Total_Amount),0) as total_revenue
from retail_data
group by Product_Category
order by total_revenue desc

-- What is the average purchase amount per customer segment (Regular, Premium, etc.)?

select Customer_Segment, round(avg(Amount),2) as avg_purchase_amount
from retail_data
group by Customer_Segment
order by avg_purchase_amount desc

-- What is the most common payment method?

select Payment_Method ,count(Payment_Method) as common_payment_method
from retail_data
group by Payment_Method
order by common_payment_method desc

-- or 

select Payment_Method 
from retail_data
group by Payment_Method
order by Payment_Method desc

--                                                                    NEXT LEVEL  

-- -------------------------------------------------------------- Customer Demographics: ---------------------------------------------------------------------

-- What is the distribution of customers by income level?

select Income , count(Customer_ID) as total_customers
from retail_data
group by Income
order by total_customers desc

-- How does gender distribution vary across different product categories?

select Product_Category,count(Product_Category) as distributions, Gender
from retail_data
group by Product_Category, Gender

-- What is the geographic distribution of customers?

select State, City, count(Customer_ID) as total_customers
from retail_data
group by state, city

-- ------------------------------------------------------------ Purchase Behavior: --------------------------------------------------------------------

-- What is the average number of purchases by each customer?

select Customer_ID, avg(Total_Purchases) as avg_purchase
from retail_data
group by Customer_ID

--  What are the peak hours for transactions?

select top 20 time as peak_hours, max(Transaction_ID) as max_transactions
from retail_data
group by time 
order by max_transactions desc

-- How does purchase frequency vary by customer segment?

select Customer_Segment,sum(Total_Purchases) as purchase
from retail_data
group by Customer_Segment
order by purchase desc

-- ------------------------------------------------------------- Feedback and Satisfaction ---------------------------------------------------------

-- -- What is the average rating given by customers for each product category?

select Product_Category, avg(Ratings) as avg_ratings
from retail_data
group by Product_Category
order by avg_ratings

-- How does customer feedback vary by product category?

select Feedback, count(Feedback) as total_feedback, Product_Category
from retail_data 
group by Product_Category, Feedback

-- How do shipping methods impact customer satisfaction?

select Shipping_Method, Ratings, count(Ratings) as rating
from retail_data
group by Shipping_Method,Ratings
order by rating desc 

-- -------------------------------------------------------------------- Payment and Shipping ------------------------------------------------------
-- What is the most popular payment method?

select Payment_Method,count(Payment_Method) as payments
from retail_data
group by Payment_Method 
order by payments desc


-- How many transactions were shipped using each shipping method in 2023?

select Shipping_Method,count(Transaction_ID) as total_transactions
from retail_data
where Order_Status = 'Shipped' and Year = '2023'
group by Shipping_Method
order by total_transactions desc

-- What is the distribution of feedback ratings (Excellent, Good, Average, etc.)?

select Feedback,count(Feedback) as distribution_of_feedback
from retail_data
group by Feedback
order by distribution_of_feedback desc

-- How many transactions were made by top 20  customer?

select top 20 Customer_ID,count(Transaction_ID) as total_transactions
from retail_data
group by Customer_ID
order by total_transactions desc

-- Which city has the highest number of customers?

select City, count(Customer_ID) as total_customers
from retail_data
group by City
order by total_customers desc

-- What is the gender distribution of customers?

select Gender,count(Gender) as distribution_of_gender
from retail_data
group by Gender
order by distribution_of_gender desc

-- How does the average purchase amount vary by month?

select round(avg(Amount),2) as avg_purchase_amount, Month
from retail_data
group by Month
order by avg_purchase_amount desc

--  What is the average shipping time for each shipping method?
-- What percentage of transactions were made with each payment method?


-- What is the average total amount spent by customers in different age groups?

select Age, avg(Total_Amount) avg_total_amount
from retail_data
group by Age
order by age,avg_total_amount 

-- NOTE :- or we can create conditional columns of ages to find average age group easily

-- How many customers are from each country?

select Country, count(Customer_ID) as total_customers
from retail_data
group by Country 
order by total_customers desc

-- What is the total number of products sold by each brand?

select Product_Brand, count(products) as total_products
from retail_data
group by Product_Brand
order by total_products desc

-- How does customer feedback vary by product category?

select  Product_Category, count(Feedback) as total_feedback
from retail_data
group by Product_Category
order by total_feedback desc

-- How many transactions have been made by customers in each state?

select State,count(Transaction_ID) as total_transactions
from retail_data
group by state
order by total_transactions desc












