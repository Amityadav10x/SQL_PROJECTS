
-- --------------------------------------------------- Relience Store Sales Analysis ----------------------------

--                                                Products and Stores

-- Retrieve all product names and their corresponding store names.

select p.product_name, s.store_name
from Products P
join Stores S
on p.product_id  = s.store_id

--  List the retail prices of products along with their respective store addresses.

select round(p.product_retail_price, 0) AS price, s.store_street_address
from Products p
join 
Stores s ON p.product_id = s.store_id;

-- Find all products available in stores located in Mexico.

select p.product_name , s.store_country
from Products p
join Stores s
on p.product_id = s.store_id
where s.store_country = 'Mexico'

-- Retrieve the product names and their brands for all products sold in supermarkets.

select p.product_name,p.product_brand, s.store_type
from Products p
join stores s 
on p.product_id = s.store_id
where s.store_type = 'Supermarket'

-- Get the list of products and their weights along with the store names where they are sold.

select p.product_name, round(p.product_weight, 0) as weight, s.store_name
from Products p 
join Stores s
on p.product_id = s.store_id 

-- Products and Customers

-- List all customers along with the products they have purchased 

select cu.first_name, p.product_name
from Customers cu
join Products p
on cu.customer_id = p.product_id

-- Retrieve customer details for those who purchased a specific product Washington Berry Juice

select cu.first_name, cu.last_name, cu.marital_status
from Customers cu
join Products p
on cu.customer_id  = p.product_id
where p.product_name   = 'Washington Berry Juice'

-- Find the average yearly income of customers who purchased each product.

select round(avg(cu.yearly_income),0) as avg_income, p.product_name
from Customers cu
join Products p
on cu.customer_id = p.product_id

-- List products purchased by customers who are homeowners.

select p.product_name,cu.first_name, cu.homeowner
from Customers cu
join Products p
on cu.customer_id = p.product_id
where cu.homeowner = 1


-- Get a count of how many different products each customer has purchased.

select count(p.product_id) as total_products, cu.first_name
from Customers cu
join Products p
on cu.customer_id = p.product_id
group by cu.first_name
order by total_products desc

--                                                    Stores and Regions

-- Retrieve all stores along with their corresponding region names.

select s.store_name, r.sales_district
from Stores s
join Regions r
on s.store_id = r.region_id

--  List the total number of stores in each region.

select r.sales_region,count(s.store_id) as total_stores
from Stores s
join Regions r
on s.store_id = r.region_id 
group by r.sales_region
order by total_stores desc

-- Find the average store size (total_sqft) for each region.

select r.sales_region,avg(s.grocery_sqft) as avg_sqft
from Stores s
join Regions r
on s.store_id = r.sales_region
group by r.sales_region
order by avg_sqft desc

-- Retrieve store names and their types for all stores located in the "Central West" region.

select s.store_name, s.store_type
from Stores s 
join Regions r
on s.store_id = r.region_id
where r.sales_region = 'Central West'

-- Get a list of regions with the highest number of stores.

select r.sales_region, count(s.store_id) as stores_numbers
from Regions r
join Stores s
on r.region_id = s.store_id
group by r.sales_region
order by stores_numbers desc

-- Customers and Regions

-- List all customers along with their corresponding region names based on their store location.

select cu.first_name, r.sales_region, s.store_street_address
from Customers cu
join Regions r
on cu.customer_id = r.region_id
join Stores s
on s.store_id = r.region_id

-- Retrieve customer details for those living in regions with stores 5.

select cu.first_name, r.sales_region,count(s.store_name) as stores
from Customers cu
join Regions r
on cu.customer_id = region_id
join Stores s
on r.region_id = s.store_id
group by cu.first_name,  r.sales_region
having count(s.store_name) > 5

-- Get a count of customers who are homeowners in each region.


select r.sales_region,count(cu.customer_id) as total_customers
from Customers cu
join Regions r
on cu.customer_id = r.region_id
group by  r.sales_region
order by total_customers desc

--                                              Combining Products, Stores, and Customers

---  Find the total number of purchases made by customers in each store.

select cu.first_name,s.store_name,count(r.quantity) as total_purchases
from Customers cu 
join Stores s
on cu.customer_id = s.store_id
join Returns r
on s.region_id = r.store_id
group by s.store_name, cu.first_name
order by total_purchases desc

-- List all products sold in each store along with the names of customers who bought them.

select cu.first_name,r.product_id,s.store_name
from Customers cu
join Stores s 
on cu.customer_id = s.store_id
join Returns r
on s.store_id  = r.store_id

-- Retrieve the average retail price of products purchased by customers from each region.

select r.sales_region,p.product_name,round(avg(p.product_retail_price),2) as avg_retail_price
from Products p
join Regions r
on p.product_id = r.region_id
group by r.sales_region, p.product_name
order by avg_retail_price desc

--                                                Identifying Trends


-- List the top 5 products sold in each region based on customer purchases.

select top 5 p.product_name, r1.quantity, r.sales_region
from Products p 
join Regions r
on p.product_id = r.region_id
join Returns r1
on r.region_id = r1.product_id

-- 