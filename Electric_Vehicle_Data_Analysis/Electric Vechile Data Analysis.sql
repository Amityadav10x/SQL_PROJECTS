--  ------------------------------------------------- Electric Vechile Data Analysis -----------------------------

-- Geographic Distribution

-- How many electric vehicles are registered in each `State`?

select State, count(VIN_1_10) as registred_ev
from Vehicle_Data
group by State
order by registred_ev desc

-- Which `County` has the highest number of electric vehicles?

select top 1 County, count(VIN_1_10) as total_ev
from Vehicle_Data
group by County
order by total_ev desc

-- What is the total number of electric vehicles by `City`?

select City, count(VIN_1_10) as total_ev
from Vehicle_Data
group by City
order by total_ev desc

-- What percentage of electric vehicles are registered in each County?

select County, 
count(*) * 100.0 / (SELECT count(*) from Vehicle_Data) AS Percentage
from Vehicle_Data
group by County

-- Which `County` and `City` combinations have the highest number of electric vehicles?

select County, City, count(*) as Total_Vehicle
from Vehicle_Data
group by County, City
order by Total_Vehicle desc

-- How many vehicles are registered per `Postal Code`?

select Postal_Code, count(*) as Total_Vehicle
from Vehicle_Data
group by Postal_Code
order by Total_Vehicle desc

-- What is the number of unique `VIN` values by `County`?

select County,count(distinct VIN_1_10) as unique_vins
from Vehicle_Data
group by County 
order by unique_vins desc

-- Which `City` has the highest concentration of battery electric vehicles (BEVs)?

select city , count(*) as BEV_Counts
from Vehicle_Data
where Electric_Vehicle_Type = 'Battery Electric Vehicle (BEV)'
group by City
order by BEV_Counts desc


--                                                           Vehicle Characteristics


-- What are the unique `Make` values, and how many vehicles does each make have?

select distinct Make, count(*) as How many electric vehicles are available for each `Model Year`?

from Vehicle_Data
group by Make
order by total_vechiles desc

-- How many electric vehicles are available for each `Model Year`?

select Model_Year, count(*) as ev
from Vehicle_Data
group by Model_Year
order by ev desc

-- What is the distribution of `Electric Vehicle Type` (e.g., BEV, PHEV)?

select Electric_Vehicle_Type, count(*) as ev
from Vehicle_Data
group by Electric_Vehicle_Type
order by ev desc

-- What is the most common `Model` for each `Make`?

select make, model, count(*) as model_count
from vehicle_data
group by Make, model
--order by model_count

-- what is the count of different `Electric Vehicle Types` within each `Make`?

select make,Electric_Vehicle_Type, count(*) as vechile_count
from Vehicle_Data 
group by make, Electric_Vehicle_Type

-- What is the average `Electric Range` of vehicles by `Make` and `Model`?

select make,model, avg(Electric_Range) as avg_electric_range
from Vehicle_Data
group by make, model
order by avg_electric_range desc

-- Which vehicles have an `Electric Range` greater than 200 miles?

select model, Electric_Range
from Vehicle_Data
where Electric_Range > 200

-- What is the average and median `Base MSRP` by `Model` and `Model Year`?

SELECT Model, Model_Year, AVG(Base_MSRP) AS AvgBaseMSRP, PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Base_MSRP) AS MedianBaseMSRP
FROM Vehicle_Data
GROUP BY Model, Model_Year;

-- Which vehicle models have the highest and lowest `Base MSRP`?

select model, max(Base_MSRP) as max_msrp, min(Base_MSRP) as min_bsrp
from Vehicle_Data
group by model
order by max_msrp desc

--                                   Clean Alternative Fuel Vehicle (CAFV) Eligibility

-- What is the total number of CAFV eligible vehicles?

select Clean_Alternative_Fuel_Vehicle_CAFV_Eligibility, count(*) vehicle_count
from Vehicle_Data
where Clean_Alternative_Fuel_Vehicle_CAFV_Eligibility = 'Clean Alternative Fuel Vehicle Eligible'
group by Clean_Alternative_Fuel_Vehicle_CAFV_Eligibility

-- Which `Counties` have the highest percentage of CAFV eligible vehicles?

select *
from Vehicle_Data

-- What is the distribution of CAFV eligible vehicles across different `Cities`?

select City, count(*) as vehicle_count
from Vehicle_Data
where Clean_Alternative_Fuel_Vehicle_CAFV_Eligibility = 'Clean Alternative Fuel Vehicle Eligible'
group by City
order by vehicle_count desc 

--  How many CAFV eligible vehicles are there by `Model Year`?

select Model_Year,count(*) as vehicle_count
from Vehicle_Data
where Clean_Alternative_Fuel_Vehicle_CAFV_Eligibility = 'Clean Alternative Fuel Vehicle Eligible'
group by Model_Year
order by vehicle_count desc

-- top 5 `Legislative Districts`which have the highest concentration of CAFV eligible vehicles?

select top 5 Legislative_District, count(*) as vehicle_count
from Vehicle_Data
where Clean_Alternative_Fuel_Vehicle_CAFV_Eligibility = 'Clean Alternative Fuel Vehicle Eligible'
group by Legislative_District
order by vehicle_count desc

-- What percentage of each `Make` is CAFV eligible?


--                                                       Electric Range Analysis

-- What is the maximum `Electric Range` of vehicles by `Make`?

select make,max(Electric_Range) as maximum_electric_range
from Vehicle_Data
group by Make
order by maximum_electric_range desc

-- Which `Model` has the longest and shortest `Electric Range`?

select model,max(Electric_Range) as longest_range,
min(Electric_Range) as shortest_range
from Vehicle_Data
group by model
order by longest_range desc

-- What is the average `Electric Range` of vehicles in each `State`?

select State,avg(Electric_Range) as avg_electric_range
from Vehicle_Data
group by State
order by avg_electric_range desc

-- What is the distribution of vehicles with an `Electric Range` over 300 miles?

select count(*) as vehicle_distribution
from Vehicle_Data
where Electric_Range > 300

-- How many vehicles have an `Electric Range` below 100 miles?

select count(*) as vehicle_distribution
from Vehicle_Data
where Electric_Range < 100


----                                           Base MSRP Analysis
        
-- What is the average `Base MSRP` across all vehicles?

select avg(Base_MSRP) as avg_base_MSRP
from Vehicle_Data

-- Which `Make` has the highest average `Base MSRP`?

select make, avg(Base_MSRP) as avg_Base_MSRP
from Vehicle_Data
group by make
order by avg_Base_MSRP desc

-- Which `City` has the most high-cost vehicles based on `Base MSRP`?

select city, max(Base_MSRP) as max_cost
from Vehicle_Data
group by city
order by max_cost desc

-- How does `Base MSRP` vary by `Electric Vehicle Type`?

select Electric_Vehicle_Type, count(Base_MSRP) as mrp
from Vehicle_Data
group by Electric_Vehicle_Type
order by mrp desc

-- What is the trend in `Base MSRP` over different `Model Years`?

select Model_Year,count(Base_MSRP) as count
from Vehicle_Data
group by Model_Year
order by count desc


--                                    Legislative District Analysis

-- What is the number of CAFV eligible vehicles in each `Legislative District`?

select Legislative_District,count(*) as vehicle_count
from Vehicle_Data
where Clean_Alternative_Fuel_Vehicle_CAFV_Eligibility = 'Clean Alternative Fuel Vehicle Eligible'
group by Legislative_District
order by vehicle_count desc

-- What is the average `Electric Range` of vehicles by `Legislative District`?

select Legislative_District,avg(Electric_Range) as avg_electric_range
from Vehicle_Data
group by Legislative_District
order by avg_electric_range desc

--                                                               Utility Provider Analysis

-- What is the distribution of electric vehicles by `Electric Utility`?

select Electric_Utility,count(*) as vehicle_count
from Vehicle_Data
group by Electric_Utility
order by vehicle_count desc

-- What is the average `Electric Range` of vehicles served by each `Electric Utility`?

select Electric_Utility,avg(Electric_Range) as avg_electric_range
from Vehicle_Data
group by Electric_Utility
order by avg_electric_range desc