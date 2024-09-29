--    ------------------------------------------------ ADIDAS SALES ANALYSIS ------------------------------------

-- What is the total number of units sold for each product by Adidas?

select Product,sum(Units_Sold) as total_unit_sold
from [Adidas data]
group by Product
order by total_unit_sold desc

-- What is the total sales for each product category sold by Adidas?

select Product,sum(Total_Sales) as total_sales
from [Adidas data]
group by Product
order by total_sales desc

-- Calculate the average price per unit for each product by Adidas.

select Product,avg(Units_Sold) as average_price_per_unit
from [Adidas data]
group by Product
order by average_price_per_unit desc

-- Which state generated the highest total sales for Adidas products?

select top 3 State,sum(Total_Sales) as total_sales
from [Adidas data]
group by State
order by total_sales desc

-- What is the total operating profit for each product category by Adidas?

select Product,round(sum(Operating_Profit),0) as total_operating_profit
from [Adidas data]
group by Product
order by total_operating_profit desc

-- What is the overall operating profit margin across all products by Adidas?

select Product,round(sum(Operating_Margin),0) as overall_operating_margin
from [Adidas data]
group by Product
order by overall_operating_margin

-- How many units were sold through each sales method by Adidas?

select Sales_Method,sum(Units_Sold) as total_unit_sold
from [Adidas data]
group by Sales_Method
order by total_unit_sold desc

-- Which Adidas product generated the highest operating margin?

select Product,round(max(Operating_Margin),2) as highest_operating_margin
from [Adidas data]
group by Product
order by highest_operating_margin desc

-- What is the total sales for Adidas in each region?

select Region,sum(Total_Sales) as total_sales
from [Adidas data]
group by Region
order by total_sales desc

-- Identify the top 5 cities with the highest total sales for Adidas products.

select top 5 City, max(Total_Sales) as highest_total_sales
from [Adidas data]
group by City
order by highest_total_sales desc

--  -------------------------------------------------- Date/Time Analysis ----------------------------------------

-- What is the monthly sales trend for Adidas products?

select month(Invoice_Date) as months, sum(Total_Sales) as total_sales
from [Adidas data]
group by month(Invoice_Date)
order by months

-- Calculate the total sales for Adidas in 2020.

select year(Invoice_Date) as year, sum(Total_Sales) as total_sales
from [Adidas data]
where year(Invoice_Date) = '2020'
group by year(Invoice_Date)
order by total_sales desc

-- Find the peak sales month for Adidas products in 2020.

select top 5 month(Invoice_Date) as month,year(Invoice_Date) as year,sum(Total_Sales) as total_sales
from [Adidas data]
where year(Invoice_Date) = '2020'
group by month(Invoice_Date), year(Invoice_Date)
order by total_sales desc

-- How many invoices were issued by Adidas each month?

select month(Invoice_Date) as month,count(Invoice_Date) as total_invoices_issues
from [Adidas data]
group by month(Invoice_Date)
order by month

-- Which month had the lowest operating profit for Adidas?

select top 1 month(Invoice_Date) as month ,round(min(Operating_Profit),0) as lowest_operating_profit
from [Adidas data]
group by month(Invoice_Date)
order by lowest_operating_profit asc

-- What is the average sales per retailer id for Adidas?

select Retailer_ID,avg(Total_Sales) as avg_sales
from [Adidas data]
group by Retailer_ID
order by avg_sales desc

-- Calculate the daily sales rate (sales per day) for Adidas.

select distinct day(Invoice_Date) as day, Total_Sales
from [Adidas data]
group by day(Invoice_Date), Total_Sales
order by day

-- How many unique invoice dates exist for Adidas products?

select count(distinct Invoice_Date) as total_unique_invoice, Product
from [Adidas data]
group by Product


-- ---------------------------------------------------------------- Regional/State/City Insights-------------------------------------

-- Find the total sales for Adidas in each city.

select City,sum(Total_Sales) as total_sales
from [Adidas data]
group by city
order by total_sales desc

-- Which region had the highest operating profit for Adidas?

select Region, max(Operating_Profit) as highest_operating_profit
from [Adidas data]
group by Region
order by highest_operating_profit desc

-- What is the average price per unit for Adidas products in each state?

select Product,avg(Price_per_Unit) as avg_price_per_unit
from [Adidas data]
group by Product
order by avg_price_per_unit desc

-- How many Adidas products were sold in New York?

select State,sum(Units_Sold) as total_unit_sold
from [Adidas data]
where State = 'New York'
group by State

-- Which state had the lowest total sales for Adidas?

select top 5 state,min(Total_Sales) as lowest_total_sales
from [Adidas data]
group by State
order by lowest_total_sales asc

-- Find the operating profit margin for Adidas in each region.

select Region,round(sum(Operating_Margin),0) as operating_profit_margin
from [Adidas data]
group by Region
order by operating_profit_margin desc

-- What is the total sales in each city in the Northeast region for Adidas?

select City,Region,sum(Total_Sales) as total_sales
from [Adidas data]
where Region = 'Northeast'
group by Region, City

-- How many Adidas products were sold in California?

select State,Product, sum(Units_Sold) as total_products_sold
from [Adidas data]
where State = 'California'
group by State, Product

-- What is the average operating profit margin by city for Adidas?

select City, round(avg(Operating_Margin),2) as avg_operating_marging
from [Adidas data]
group by City
order by avg_operating_marging desc

-- What is the total operating profit for Adidas in each state?

select State,round(sum(Operating_Profit),0) as total_operating_profit
from [Adidas data]
group by state
order by total_operating_profit desc

-- Product & Pricing Analysis

-- List all Adidas products along with their price per unit and total units sold.

select Product, (Price_per_Unit) as price_per_unit, sum(Units_Sold) as total_unit_sold
from [Adidas data]
group by Product, Price_per_Unit

-- What is the product with the highest average price per unit for Adidas?

select Product,avg(Price_per_Unit) as avg_price_pr_unit
from [Adidas data]
group by Product
order by avg_price_pr_unit

