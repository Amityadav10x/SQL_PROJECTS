-- ------------------------------------------------------------------ Amazon Customer Vehaviour ------------------------------------------------------

-- Retrieve all data for a specific age and gender.

select *, age , Gender
from Customer_behaviour

-- Count the number of customers for each purchase frequency.

select Purchase_Frequency, COUNT(*) as total_customers
from Customer_behaviour
group by Purchase_Frequency
order by total_customers

-- Find the most common product search method.

select Product_Search_Method, count(*) as common_product
from Customer_behaviour
group by Product_Search_Method
order by common_product desc

-- Get average rating accuracy for each purchase category.

select Purchase_Categories,avg(Rating_Accuracy) as avg_rating
from Customer_behaviour
group by Purchase_Categories
order by avg_rating desc

-- List customers who abandoned their cart due to finding a better price.

select * 
from Customer_behaviour
where Cart_Abandonment_Factors = 'Found a better price elsewhere'

-- calculate the average shopping satisfaction for customers who left reviews.

select Review_Left,avg(Shopping_Satisfaction) as avg_shoping_satisfaction
from Customer_behaviour
where Review_Left  = 'Yes'
group by Review_Left

-- Determine the frequency of save-for-later actions by gender.

select Gender,Saveforlater_Frequency, count(Saveforlater_Frequency) as freq
from Customer_behaviour
group by Gender, Saveforlater_Frequency
order by freq desc

-- Find improvement areas mentioned by customers who value reviews highly.

select Improvement_Areas, Review_Reliability
from Customer_behaviour
where Review_Reliability = 'Heavily'

-- List personalized recommendation helpfulness and shopping satisfaction.

select Personalized_Recommendation_Frequency,Review_Helpfulness,Shopping_Satisfaction
from Customer_behaviour
group by Personalized_Recommendation_Frequency, Shopping_Satisfaction, Review_Helpfulness

-- Find the customers with the highest cart completion frequency.

select * 
from Customer_behaviour
where Cart_Completion_Frequency = 'Always'

-- Count of reviews left by gender.

select Gender,count(Review_Left) as total_reviews_left
from Customer_behaviour
group by gender 

-- review helpfulness by purchase category.

select  Purchase_Categories, Review_Helpfulness 
from Customer_behaviour
group by Purchase_Categories, Review_Helpfulness

-- Frequency of different cart abandonment factors.

select Cart_Abandonment_Factors, COUNT(*) as Cart_Abandonment_Factors
from Customer_behaviour
group by Cart_Abandonment_Factors

-- Total number of customers who browse multiple pages in search results.

select COUNt(*) as total_customers
from Customer_behaviour
where Search_Result_Exploration = 'Multiple pages'

-- number of reviews left by customers who find customer reviews important.

select count(Review_Left) as average_reviews, Customer_Reviews_Importance
from Customer_behaviour
group by Customer_Reviews_Importance 
order by average_reviews

-- Most frequent browsing frequency.

select Browsing_Frequency, count(Browsing_Frequency) as browsing_frequencys
from Customer_behaviour
group by Browsing_Frequency
order by browsing_frequencys desc

-- Calculate average personalized recommendation frequency for each gender.

select Gender,avg(Personalized_Recommendation_Frequency2) as avg_personalized_Recommendation_Frequency
from Customer_behaviour
group by Gender
order by avg_personalized_Recommendation_Frequency

-- Distribution of shopping satisfaction scores.

select Shopping_Satisfaction, count(Shopping_Satisfaction) as distribution_of_shopping_satisfaction
from Customer_behaviour
group by Shopping_Satisfaction
order by distribution_of_shopping_satisfaction

-- Find the average rating accuracy by product search method.

select Product_Search_Method,avg(Rating_Accuracy) as avg_rating
from Customer_behaviour
group by Product_Search_Method
order by avg_rating

-- Number of customers who's value customer reviews is 5 and they leave reviews.

SELECT COUNT(*) AS NumberOfCustomers
FROM Customer_behaviour
where Customer_Reviews_Importance = 5
AND Review_Left = 'Yes';

-- List cart abandonment factors for customers with high shopping satisfaction.

select Cart_Abandonment_Factors, max(Shopping_Satisfaction) as highest_shopping_satisfaction
from Customer_behaviour
group by Cart_Abandonment_Factors

-- Average rating accuracy for each browsing frequency.

select Browsing_Frequency,avg(Rating_Accuracy) as avg_rating_frequency
from Customer_behaviour
group by Browsing_Frequency

-- Frequency of add-to-cart browsing actions by gender.

select Gender,count(Add_to_Cart_Browsing) as freq
from Customer_behaviour
group by Gender

-- Calculate number of review reliability by purchase category.

select Purchase_Categories,Review_Reliability,count(Review_Reliability) as review_reliablity
from Customer_behaviour
group by Purchase_Categories, Review_Reliability
order by review_reliablity desc

-- Identify customers with the highest save-for-later frequency.

select count(*) as customers,
max(Saveforlater_Frequency) as highest_save_for_later_frequency
from Customer_behaviour

-- Count the number of customers who are satisfied with shopping and find recommendations helpful.

select count(Shopping_Satisfaction) as customers
from Customer_behaviour
where Recommendation_Helpfulness = 'Yes'

-- Find the most common cart abandonment factors among customers who saved items for later.

select Cart_Abandonment_Factors,Add_to_Cart_Browsing, count(Cart_Abandonment_Factors) as common_Cart_Abandonment_Factors
from Customer_behaviour
where Add_to_Cart_Browsing = 'Yes'
group by Cart_Abandonment_Factors, Add_to_Cart_Browsing
order by common_Cart_Abandonment_Factors desc

-- Determine the average personalized recommendation frequency based on cart completion frequency.

select Cart_Completion_Frequency,count(Cart_Completion_Frequency) as freq_cart_complication ,avg(Personalized_Recommendation_Frequency2) as avg_personlized_recommendation
from Customer_behaviour
group by Cart_Completion_Frequency
order by freq_cart_complication, avg_personlized_recommendation

-- Frequency of personalized recommendation usage by browsing frequency.

select Browsing_Frequency,Personalized_Recommendation_Frequency, count(Personalized_Recommendation_Frequency) as freq
from Customer_behaviour
group by Browsing_Frequency, Personalized_Recommendation_Frequency
