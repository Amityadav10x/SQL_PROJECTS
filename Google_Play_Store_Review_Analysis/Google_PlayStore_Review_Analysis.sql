-------------------------------------------------  ----------------  Google PlayStore User Reviews --------------------------------
-- ------------------------------------------------------------------    BY AMIT   ------------------------------------------------

-- Retrieve the app name, category, and translated review for apps that have both reviews and user reviews.

select gpss.App as Apps_name,gpss.Category,gpsr.Translated_Review,gpss.Reviews,gpsr.Sentiment
from Google_Play_Store_Second_File as gpss
join Google_PlayStore_Reviews as gpsr
on gpss.App = gpsr.App
order by Reviews desc;

--Count the number of apps in each category that have user reviews.

select gpsr.Category,gpsr.Reviews,count(gpr.App) as totAl_apps
from Google_PlayStore_Reviews as gpr
join Google_Play_Store_Second_File gpsr
on gpr.App = gpsr.App
group by gpsr.Category,gpsr.Reviews
order by totAl_apps desc

-- Find the categories where the average rating of apps is above 4.0, and count the number of apps in those categories.

select gpsr.Category,count(gpr.App) as total_apps, round(avg(gpsr.Rating),2) as avg_rating
from Google_PlayStore_Reviews as gpr
join Google_Play_Store_Second_File as gpsr
on gpr.App = gpsr.App
where gpsr.Rating > 4.0
group by gpsr.Category
order by avg_rating desc

-- Find the app with the highest number of reviews and retrieve its translated review.

select gpr.App,gpr.Translated_Review,round(max(gpsr.Reviews),2) as highest_reviews
from Google_Play_Store_Second_File as gpsr
join Google_PlayStore_Reviews as gpr
on gpr.App = gpsr.App
group by gpr.Translated_Review,gpr.App

-- Retrieve the apps where the sentiment polarity is above the average sentiment polarity of all apps.

select App,round(avg(gpr.Sentiment_Polarity),2) as avg_sentiment_polarity
from Google_PlayStore_Reviews as gpr
where Sentiment_Polarity  > (select round(avg(gpr.Sentiment_Polarity),2) as avg_sentiment_polarity
from Google_PlayStore_Reviews as gpr)
group by App

-- Retrieve all apps with their ratings, ordering them by the number of installs and ratings in descending order.

select gpsr.App, round(gpsr.Rating,0) as ratings,gpsr.Installs
from Google_Play_Store_Second_File as gpsr
join Google_PlayStore_Reviews as gpr
on gpsr.App = gpr.App
order by gpsr.Installs desc, gpsr.Rating desc


-- List all apps filtered by category Family, and then by average rating in descending order.

select gpsr.Category,gpr.App, avg(round(gpsr.Rating,0)) as Ratings
from Google_Play_Store_Second_File as gpsr
join Google_PlayStore_Reviews as gpr
on gpsr.App = gpr.App
where gpsr.Category = 'FAMILY'
group by gpr.App , gpsr.Category
order by Ratings desc

-- Combine the app names from both datasets into a single list without duplicates.

select gpsr.App
from Google_Play_Store_Second_File as gpsr
join Google_PlayStore_Reviews as gpr
on gpsr.App = gpr.App
UNION
select gpr.App
from Google_Play_Store_Second_File as gpsr
join Google_PlayStore_Reviews as gpr
on gpsr.App = gpr.App

-- Combine the app names from both datasets, including duplicates, and count how many times each app appears.

select gpr.App, count(gpr.App) as total_time_appeared
from Google_Play_Store_Second_File  as gpsr
join Google_PlayStore_Reviews as gpr
on gpsr.App = gpr.App
group by gpr.App
UNION ALL 
select gpsr.App, count(gpr.App) as total_time_appeared
from Google_Play_Store_Second_File  as gpsr
join Google_PlayStore_Reviews as gpr
on gpsr.App = gpr.App
group by gpsr.App
order by total_time_appeared desc

-- Find the total number of installs per category.

select gpsr.Category, count(gpsr.Installs) as total_install
from Google_Play_Store_Second_File as gpsr
join Google_PlayStore_Reviews as gpr
on gpsr.App = gpr.App
group by gpsr.Category
order by total_install desc

-- Group apps by category and type, and count the number of apps in each group.

select gpsr.App,gpsr.Type as catogory_type, count(gpsr.App) as number_of_apps
from Google_Play_Store_Second_File as gpsr
join Google_PlayStore_Reviews as gpr
on gpsr.App = gpr.App
group by gpsr.App,gpsr.Type
order by number_of_apps desc


-- Find the app with the highest number of reviews and retrieve its translated review.

select gpsr.App, max(gpsr.Reviews) as highest_reviews, gpr.Translated_Review
from Google_Play_Store_Second_File as gpsr
join Google_PlayStore_Reviews as gpr
on gpsr.App = gpr.App
group by gpsr.App, gpr.Translated_Review
order by highest_reviews desc


-- Find the average rating of apps in each category.

select gpsr.App,gpsr.Category,round(avg(gpsr.Rating),0) as average_rating
from Google_PlayStore_Reviews as gpr
join Google_Play_Store_Second_File as gpsr
on gpr.App = gpsr.App
group by gpsr.App, gpsr.Category
order by average_rating desc

-- Find the smallest app size (in MB) within each category.

select gpsr.App,gpsr.Category, min(gpsr.Size) as minimum_size_in_MB
from Google_PlayStore_Reviews as gpr
join Google_Play_Store_Second_File as gpsr
on gpr.App = gpsr.App
group by gpsr.App,gpsr.Category
order by minimum_size_in_MB asc

--List the top 5 apps with the most reviews.

select top 5 gpsr.App, max(gpsr.Reviews) as maximum_reviews
from Google_Play_Store_Second_File as gpsr
join Google_PlayStore_Reviews as gpr
on gpr.App = gpsr.App
group by gpsr.App
order by maximum_reviews desc

-- Sum the total number of installs for apps categorized as ‘Free’.

select gpsr.Type,sum(gpsr.Installs) as total_installs
from Google_Play_Store_Second_File as gpsr
join Google_PlayStore_Reviews as gpr
on gpsr.App = gpr.App
where Type = 'Paid' 
group by gpsr.type

-- 