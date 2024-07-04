--                                              Resturent_Customer_satisfaction_analysis

-- Retrieve all data from the customers table.

select * from cust_r;

-- Select CustomerID, Age, Gender, and Income columns from the customers table.

select CustomerID, Age, Gender, Income
from cust_r;

-- Filter customers by Gender 'Male'.

select CustomerID, Gender 
from cust_r
where Gender = 'Male';

-- Filter customers with Income greater than 50,000.

select CustomerID , income
from cust_r
where Income > 50000;

-- Count the number of customers by Gender.

select Gender,  count(CustomerID) as total_customers
from cust_r
group by Gender 
order by total_customers

-- Calculate the average Income of customers.

select  avg(Income) as avg_income_of_customers
from cust_r

-- Filter customers by Age greater than 30.

select CustomerID, age
from cust_r
where age > 30


-- Count the total number of customers by Visit Frequency.

select count(customerID) as total_customers , VisitFrequency
from cust_r
group by VisitFrequency
order by total_customers desc

-- Count the average number of customers by Visit Frequency. 

select avg(customerID) as total_customers , VisitFrequency
from cust_r
group by VisitFrequency
order by total_customers desc

-- Find customers who prefer Chinese cuisine.

select CustomerID, PreferredCuisine
from cust_r
where PreferredCuisine = 'Chinese'

-- Select customers who made an online reservation.

select CustomerID , OnlineReservation
from cust_r
where OnlineReservation = 1

-- Select number of customers who made an online reservation.

select count(CustomerID) as total_customers , OnlineReservation
from cust_r
where OnlineReservation = 1
group by OnlineReservation
order by total_customers

-- Find customers who prefer dinner.

select CustomerID , TimeOfVisit
from cust_r
where TimeOfVisit = 'Dinner'

-- Find total customers who prefer dinner.

select count(CustomerID) as total_customers , TimeOfVisit
from cust_r
where TimeOfVisit = 'Dinner'
group by TimeOfVisit
order by total_customers

-- Retrieve customers by dining occasion 'Business'.

select CustomerID , DiningOccasion
from cust_r
where DiningOccasion = 'Business'

-- Retrieve avg customers by dining occasion 'Business'.

select Avg(CustomerID) as avg_customers , DiningOccasion
from cust_r
where DiningOccasion = 'Business'
group by DiningOccasion
order by avg_customers

-- -- Retrieve total customers by dining occasion 'Business' and visit frequency.

select avg(CustomerID) as avg_customers , DiningOccasion, VisitFrequency
from cust_r
where DiningOccasion = 'Business'
group by DiningOccasion, VisitFrequency
order by avg_customers

-- Count the number of customers who are Loyalty Program Members.

select count(CustomerID) as total_customers, LoyaltyProgramMember
from cust_r
where LoyaltyProgramMember = 1
group by LoyaltyProgramMember
order by total_customers

-- Select customers who prefer takeaway.

select CustomerID , MealType
from cust_r
where MealType = 'takeaway'

-- Select total customers who prefer takeaway.

select count(CustomerID) as total_customer , MealType
from cust_r
where MealType  = 'takeaway'
group by MealType
order by total_customer desc

-- Select customers who prefer dine-in.

select CustomerID , MealType
from cust_r
where MealType = 'Dine-in'

-- Select total customers who prefer dine-in.

select count(CustomerID) as total_customer , MealType
from cust_r
where MealType  = 'Dine-in'
group by MealType
order by total_customer desc

-- Filter customers by Service Rating greater than 4.

select CustomerID, ServiceRating
from cust_r
where ServiceRating > 4

-- Filter number of customers who give service rating > 4 and also calculate total customers.

select count(CustomerID) as total_customers, ServiceRating
from cust_r
where ServiceRating > 4
group by ServiceRating


--                                                    INTERMEDIATE LEVEL QUESTIONS


-- Find customers with high satisfaction.

select CustomerID , HighSatisfaction
from cust_r
where HighSatisfaction = 1

-- Find total customers with high satisfaction.

select count(CustomerID) as total_customer , HighSatisfaction
from cust_r
where HighSatisfaction = 1
group by HighSatisfaction
order by total_customer

-- Find the average spend per visit frequency.

select round(avg(AverageSpend),2) as avg_spend, VisitFrequency
from cust_r
group by VisitFrequency

-- Get customers who are loyalty program members and order by delivery.

select CustomerID, LoyaltyProgramMember
from cust_r
where DeliveryOrder = 1


-- Get total customers who are loyalty program members and order by delivery.

select count(CustomerID) as total_customer, LoyaltyProgramMember
from cust_r
where DeliveryOrder = 1 and LoyaltyProgramMember = 1
group by LoyaltyProgramMember
order by total_customer desc

-- Calculate average ratings for service, food, and ambiance.

select avg(ServiceRating) as service_rating,
avg(FoodRating) as food_rating,
avg(AmbianceRating) as Ambinece_rating
from cust_r

-- Find the maximum and minimum wait time.

select round(max(WaitTime),2) as maximum_waiting_time,
  min(WaitTime) * 100  as minimum_waiting_time
from cust_r

-- List all customers who visit weekly and spend more than $50.

select CustomerID , VisitFrequency,AverageSpend
from cust_r
where VisitFrequency = 'Weekly' and (AverageSpend > 50)

-- count total customers who visit weekly and spend more than $50.

select sum(CustomerID) as total_customers , VisitFrequency,AverageSpend
from cust_r
where VisitFrequency = 'Weekly' and AverageSpend > 50
group by VisitFrequency, AverageSpend
order by total_customers

-- Find customers who's prefer American cuisine is 'American' and meal type is 'dine-in'.

select customerID ,PreferredCuisine, MealType
from cust_r
where PreferredCuisine  = 'American' and MealType = 'Dine-in'

 -- Find total customers who's prefer American cuisine is 'American' and meal type is 'dine-in'.

select count(customerID) as total_customers ,PreferredCuisine, MealType
from cust_r
where PreferredCuisine  = 'American' and MealType = 'Dine-in'
group by PreferredCuisine, MealType
order by total_customers

-- Get the count of customers by meal type.

select count(CustomerID) as total_customers,MealType
from cust_r
group by MealType
order by total_customers

-- Find customers with a service rating of 5.

select CustomerID, ServiceRating
from cust_r
where ServiceRating  = 5

-- Find total customers with a service rating of 5.

select count(CustomerID) as total_customers , ServiceRating
from cust_r
where ServiceRating  = 5
group by ServiceRating
order by total_customers

-- Count customers by dining occasion.

select count(customerID) as total_customers, DiningOccasion
from cust_r
group by DiningOccasion
order by total_customers desc

-- Find the total income of all customers.

select sum(Income) as total_income, count(CustomerID) as total_customers
from cust_r

-- Find the total income of all customers who are loyaltyProgramMember.

select sum(Income) as total_income, count(CustomerID) as total_customers
from cust_r
where LoyaltyProgramMember = 1


-- Retrieve customers who visit more than once a month.

select CustomerID , VisitFrequency
from cust_r
where VisitFrequency  = 'Monthly'


-- Get average spend for customers who prefer breakfast.

select round(avg(AverageSpend),2) as avg_spend, TimeOfVisit
from cust_r
where TimeOfVisit = 'Breakfast'
group by TimeOfVisit
order by avg_spend
