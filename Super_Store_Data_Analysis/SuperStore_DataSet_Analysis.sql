--------------------------------------------------- Super Store Data Analysis (by AMIT) ----------------------------------



---------------------------------------------------  Basic Data Retrieval ------------------------------------------------

-- Retrieve all records from the dataset.

select *
from [Sample - Superstore_Data]

-- Select distinct customer names from the dataset.

select distinct Customer_Name as customer_names
from [Sample - Superstore_Data]

-- Retrieve records where the sales amount is greater than $100.

select *
from [Sample - Superstore_Data]
where Sales > 100

-- Find all orders shipped via "Second Class".

select Order_ID, Ship_Mode
from [Sample - Superstore_Data]
where Ship_Mode = 'Second Class'

-- Get all records for customers located in Kentucky.

select * from [Sample - Superstore_Data]
where State = 'Kentucky'

-- -------------------------------------------------------- Aggregation and Grouping ---------------------------------

-- Calculate the total sales for each customer.

select Customer_Name,round(sum(Sales),0)  as total_sales
from [Sample - Superstore_Data]
group by Customer_Name 
order by total_sales desc

-- Find the average profit per order.

select Order_ID,round(avg(Profit),0) as average_profit
from [Sample - Superstore_Data]
group by Order_ID
order by average_profit desc

-- Count the number of orders per shipping mode.

select Ship_Mode,count(Order_ID) as total_orders
from [Sample - Superstore_Data]
group by Ship_Mode
order by total_orders desc

-- Determine the total quantity of products sold in each category.

select Category,sum(Quantity) as total_quantity
from [Sample - Superstore_Data]
group by Category
order by total_quantity desc

-- Find the total sales and profit by region.

select Region, round(sum(Sales),0) as total_sales, 
round(sum(Profit),0) as total_profit
from [Sample - Superstore_Data]
group by Region
order by total_profit desc, total_sales desc

-- ---------------------------------------------------------- Filtering and Sorting ----------------------------------

-- Retrieve records with a discount greater than 10%.

select *
from [Sample - Superstore_Data]
where Discount > 10

-- Get the top 5 orders by sales amount.

select top 5 Order_ID, Sales
from [Sample - Superstore_Data]
order by Sales desc

-- Find orders where the profit is less than zero.

select Order_ID, Profit
from [Sample - Superstore_Data]
where Profit < 0

-- List all products sold in the "Furniture" category.

select Product_Name, Category, Sub_Category
from [Sample - Superstore_Data]
where Category = 'Furniture'

-- Find the order with the highest sales amount.

select Order_ID, round(max(Sales),0) as highest_sales_amount
from [Sample - Superstore_Data]
group by Order_ID
order by highest_sales_amount desc

-- --------------------------------------------------------- Complex Queries -----------------------------------------

-- Find the most profitable product sub-category in each region.

select  Sub_Category,Region, round(max(Profit),2) as most_profitable
from [Sample - Superstore_Data]
group by  Sub_Category,Region 
order by most_profitable desc

-- Calculate the average sales per customer segmented by region.

select Customer_Name,Region,Segment, round(avg(Sales),0) as average_sales
from [Sample - Superstore_Data]
group by Customer_Name,Region, Segment
order by average_sales desc

-- Retrieve the top 5 products by sales amount within each category.

SELECT 
    Category,
    Product_Name,
    Sales
FROM (
    SELECT 
        Category,
        Product_Name,
        Sales,
        ROW_NUMBER() OVER (PARTITION BY Category ORDER BY Sales DESC) AS Row_Num
    FROM 
        [Sample - Superstore_Data]
) AS RankedProducts
WHERE 
    Row_Num <= 5
ORDER BY 
    Category,
    Sales DESC;

------------------------------------------------------------------ Advanced Filtering -------------------------------------------

-- List orders where the quantity is between 1 and 5.

select Order_ID, Quantity
from [Sample - Superstore_Data]
where Quantity  between 1 and 5 

-- Retrieve records where the customer's state starts with 'K'.

select Customer_Name,State
from [Sample - Superstore_Data]
where State like 'K%'

-- Get all orders with a profit margin (profit/sales) greater than 20%.

select Order_ID, (Profit/Sales) as margin
from [Sample - Superstore_Data]
where Profit/Sales > 0.2
order by margin desc

-- Find orders where the product name contains the word "Bookcase".

select Order_ID, Product_Name, round(Sales,0) as sales, round(Quantity,0) as quantity , round(Profit,0) as profit
from [Sample - Superstore_Data]
where Product_Name like '%Bookcase'



-- -----------------------------------------------------Subqueries --------------------------------------------------------------

-- List orders with a quantity higher than the average quantity ordered.

select Order_ID,Quantity
from [Sample - Superstore_Data]
where Quantity > (select round(avg(Quantity),0) as avg_quantity  
from [Sample - Superstore_Data])

-- Get the top 3 states by total sales using a subquery.

select top 3 State, round(sum(Sales),0) as total_sales
from [Sample - Superstore_Data]
group by State
order by total_sales desc

-- Find orders where the profit is higher than the average profit per order.

select Order_ID,Profit
from [Sample - Superstore_Data]
where Profit > (select round(avg(Profit),0) as avg_profit 
from [Sample - Superstore_Data])
order by Profit desc


--  -------------------------------------------------------Date and Time Functions  -----------------------------------------
-- Find all orders placed in the year 2016.

select count(Order_ID) as total_orders
from [Sample - Superstore_Data]
where year(Order_Date) = 2016

--  Calculate the number of days between the order date and ship date for each order with order id.

select Order_ID, Order_Date,Ship_Date,
DATEDIFF(DAY, Order_Date,Ship_Date) as days_between
from [Sample - Superstore_Data]


--  Retrieve orders placed in the last quarter of 2016.

select Order_ID, Customer_Name, round(Sales,0) as sales
from [Sample - Superstore_Data]
where Order_Date between '2016-10-01' AND '2016-12-31'

--  Find the earliest and latest order dates in the dataset.

select 
min(Order_Date) as earliest_days, 
max(Order_Date) as latest_days
from [Sample - Superstore_Data]

-- Get the month-wise sales totals.

select MONTH(Order_Date) as month_names, 
round(sum(Sales),0) as total_sales
from [Sample - Superstore_Data]
group by Order_Date
order by total_sales desc

-- -------------------------------------------------- Joining and Relationships  -------------------------------------------------------


-- List orders details along with the state they were shipped to.

select Order_ID,Customer_ID,Product_ID,State as State_shipped_to
from [Sample - Superstore_Data]

-- Find orders where the product sub-category is "Bookcases" and the sales amount is greater than $200.

select Order_ID, Sub_Category, round(Sales,0) as sales
from [Sample - Superstore_Data]
where Sub_Category  = 'Bookcases' and Sales > 200
order by sales desc

--  Retrieve orders along with customer information who has done shoping in 11th month 2016

select Order_ID,
Customer_ID,
Customer_Name,
State,
Country, 
Postal_Code
from [Sample - Superstore_Data]
where MONTH(Order_Date) = 11 and YEAR(Order_Date) = 2016

--   ------------------------------------------------------  THANK YOU  -----------------------------------------------------------

