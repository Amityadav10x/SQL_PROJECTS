--                                       Bank Customer Churn Data Analysis by Amit

-- Retrieve all records where the customer's balance is greater than 100,000.

select * from Churn_Bank
where balance > 100000

-- Find the average estimated salary for customers who are active members.

select round(AVG(estimated_salary),2) as estimated_salary, active_member
from Churn_Bank
where active_member = 'Yes'
group by active_member

-- Count the number of customers from each country.

select count(customer_id) as total_customers, country
from Churn_Bank
group by country
order by total_customers desc

-- Calculate the total balance of all customers who have more than 2 products.

select  customer_id, round(sum(balance),2) as total_balance , products_number
from Churn_Bank
where products_number > 2
group by customer_id ,  products_number

-- List the top 5 customers with the highest credit scores.

select top 5 customer_id , credit_score
from Churn_Bank


-- Find the minimum age of customers who have churned.

select min(age) as minimum_age
from Churn_Bank
where churn = 'Churned'

-- Retrieve the details of customers who have a credit card and are active members.

select customer_id, credit_card, active_member
from Churn_Bank
where credit_card = 'Yes' and active_member = 'Yes'
group by credit_card, active_member , customer_id

-- List the customers who have been with the bank (tenure) for more than 5 years and have an estimated salary above 100,000.

select customer_id, tenure, round(estimated_salary ,3) as estimated_salary
from Churn_Bank
where tenure > 5 and estimated_salary > 100000
group by customer_id, tenure, estimated_salary

-- Find the number of female customers who have churned.

select count(customer_id) as total_females , gender, churn
from Churn_Bank
where gender = 'Female' and churn = 'Churned'
group by gender, churn

-- or

select customer_id , gender, churn
from Churn_Bank
where gender = 'Female' and churn = 'Churned'
group by customer_id, gender, churn


-- Retrieve the customer ID, age, and balance for customers from France

select customer_id, age, balance, country
from Churn_Bank
where country = 'France'


--                                             Advance Questions


-- Retrieve the customer details where the estimated salary is within one standard deviation of the average estimated salary.

WITH stats AS (
    SELECT 
        AVG(estimated_salary) AS avg_salary,
        STDEV(estimated_salary) AS stddev_salary
    FROM Churn_Bank
)
SELECT 
    *
FROM 
    Churn_Bank, stats
WHERE 
    estimated_salary BETWEEN (avg_salary - stddev_salary) AND (avg_salary + stddev_salary);



-- Find the correlation between age and credit score for customers from France.

SELECT 
    Correlat(age, credit_score) AS age_credit_score_correlation
FROM 
    Churn_Bank
WHERE 
    country = 'France';



--List the customers who are not active members but have a balance greater than the average balance of all customers.

select customer_id
from Churn_Bank
where active_member = 'No'  and balance > (select avg(balance) as avg_balance from Churn_Bank)

-- Find the top countries with the highest average credit score.

select country, avg(credit_score) as highest_avg_credit_score
from Churn_Bank
group by country
order by highest_avg_credit_score desc

-- Retrieve the details of customers who have more than 2 products and have not churned.

select customer_id 
from Churn_Bank
where products_number > 2 and churn = 'Unchurned'

--  or

select customer_id , products_number, churn
from Churn_Bank
where products_number > 2 and churn = 'Unchurned'

-- Calculate the total estimated salary of customers who are active members and have a credit card.

select round(sum(estimated_salary),0) as total_estimated_salary
from Churn_Bank
where active_member = 'Yes'

-- Find the average tenure of customers who have churned, grouped by gender.

select avg(tenure) as avg_churned_tenure, gender
from Churn_Bank
where churn = 'Churned'
group by gender

-- Retrieve the customer ID and balance of the top 10 customers with the highest balance.

select top 10 customer_id , round(max(balance),2) as highest_salary
from Churn_Bank
group by customer_id
order by highest_salary desc

-- List the customers who are older than 40 years and have a credit score below 600.

select customer_id , age, credit_score
from Churn_Bank
where age > 40 and credit_score < 600

-- Calculate the average number of products for customers who are active members.

select avg(products_number) as avg_prooducts
from Churn_Bank
where active_member  = 'Yes'

-- Find the total number of customers who are active members, grouped by the number of products they hold.

select count(customer_id) as total_customers,active_member ,products_number
from Churn_Bank
where active_member = 'Yes'
group by products_number, active_member
order by total_customers

-- List the customers who have churned and have an estimated salary above the average estimated salary of customers who have not churned.

select customer_id
from Churn_Bank
where churn = 'Churned' and estimated_salary > (select avg(estimated_salary) as avg_estimated_salary
from Churn_Bank
where churn = 'Unchurned')

-- Calculate the average balance of customers from Spain who have a credit score above 600 group by gender.

select country, gender,  round(avg(balance),0) as avg_balance
from Churn_Bank
where country = 'Spain' and credit_score > 600 
group by gender , country

-- Find the top 3 customers with the highest balance who are not active members.

select top 3 customer_id , round(max(balance),0) as highest_salary
from Churn_Bank
where active_member = 'No'
group by customer_id
order by highest_salary desc

-- Calculate the churn rate for customers with more than 2 products.

select avg(tenure) as avg_churned_rate
from Churn_Bank
where products_number > 2 and churn = 'Churned'

-- Find the average estimated salary for each country, ordered by the average salary in descending order.

select round(avg(estimated_salary),0) as avg_estimated_salary, country
from Churn_Bank
group by country
order by avg_estimated_salary desc










