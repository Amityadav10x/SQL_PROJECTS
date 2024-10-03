-- -------------------------------------------------------------------------------------------- Road Accident Analysis -------------------------------------------------------------------------

-- What is the total number of accidents recorded in the dataset?

select count(Number_of_Casualties) as total_accidents
from [accident_data]

-- District areas with the highest number of accidents.

select District_Area,sum(Number_of_Casualties) as highest_number_of_accidents
from [accident_data]
group by District_Area
order by highest_number_of_accidents desc

-- Most common weather conditions during accidents.

select Weather_Conditions as common_weather_conditions, sum(Number_of_Casualties) as total_accidents
from [accident_data]
group by Weather_Conditions
order by total_accidents desc

-- Analysis of the road types with the highest accident frequency.

select Road_Type, sum(Number_of_Casualties) as total_accidents
from [accident_data]
group by Road_Type
order by total_accidents desc

-- Severity of accidents by light conditions.

select Light_Conditions, Accident_Severity, sum(Number_of_Casualties) as total_accidents
from [accident_data]
group by Light_Conditions,Accident_Severity
order by total_accidents desc

-- Number of casualties in accidents with more than two vehicles.

select Vehicle_Type,sum(Number_of_Casualties) as total_casualties
from [accident_data]
where Vehicle_Type = 'Motorcycle over 500cc' 
group by Vehicle_Type
order by total_casualties desc

-- Accidents involving wet or damp road surfaces.

select Road_Surface_Conditions, sum(Number_of_Casualties) as total_accidents
from [accident_data]
where Road_Surface_Conditions = 'Wet or damp'
group by Road_Surface_Conditions
order by total_accidents desc

-- Weather conditions causing the highest number of severe accidents.

select Weather_Conditions, sum(Number_of_Casualties) as accidents
from [accident_data]
where Accident_Severity = 'Serious'
group by Weather_Conditions
order by accidents desc

-- Vehicle types most commonly involved in accidents.

select Vehicle_Type, sum(Number_of_Casualties) as accidents
from [accident_data]
group by Vehicle_Type
order by accidents desc

--  Number of vehicles involved in accidents by road type.

select Road_Type,count(Vehicle_Type) as number_of_vehicle
from [accident_data]
group by Road_Type
order by number_of_vehicle desc

-- Average number of casualties per accident based on road surface conditions.

select Road_Surface_Conditions,sum(Number_of_Casualties) as total,avg(Number_of_Casualties) as avg_casualties
from [accident_data]
group by Road_Surface_Conditions
order by avg_casualties desc

-- Accidents with the highest number of vehicles by district area.

select District_Area,max(Number_of_Vehicles) as highest_number_of_vehicle
from [accident_data]
group by District_Area
order by highest_number_of_vehicle desc

-- Severity of accidents by urban and rural areas.

select Accident_Severity, Urban_or_Rural_Area, sum(Number_of_Casualties) as accidents
from [accident_data]
group by Accident_Severity, Urban_or_Rural_Area
order by accidents desc

-- top 5 Casualties based on weather and light conditions.

select top 5 Weather_Conditions, Light_Conditions, sum(Number_of_Casualties) as accidents
from [accident_data]
group by Weather_Conditions, Light_Conditions
order by accidents desc

-- Fatal accidents based on weather conditions.

select Accident_Severity,Weather_Conditions, sum(Number_of_Casualties) as accidents
from [accident_data]
where Accident_Severity = 'Fatal'
group by Accident_Severity, Weather_Conditions
order by accidents desc

-- Top five locations with the most accidents.

select top 5 District_Area, sum(Number_of_Casualties) as accidents
from [accident_data]
group by District_Area
order by accidents desc 

-- Number of vehicles in accidents with Snowing + high winds weather.

select Weather_Conditions,sum(Number_of_Casualties) as total_accidents
from [accident_data]
where Weather_Conditions = 'Snowing + high winds'
group by Weather_Conditions
order by total_accidents desc

-- Total accidents by road type.

select Road_Type,count(*) as accidents
from accident_data
group by Road_Type
order by accidents desc

-- Number of vehicles involved in fatal accidents.

select Accident_Severity, Vehicle_Type, count(Vehicle_Type) as number_of_vehicle
from accident_data
where Accident_Severity = 'Fatal'
group by Accident_Severity, Vehicle_Type
order by number_of_vehicle desc

-- Top five accident-prone district areas.

select District_Area as accident_prone_areas , count(*) as total_accidents
from accident_data
group by District_Area
order by total_accidents desc

-- Average casualties in serious accidents.

select Accident_Severity,avg(Number_of_Casualties) as avg_casualties
from accident_data
where Accident_Severity = 'Fatal'
group by Accident_Severity
order by avg_casualties desc

-- Severity of accidents in urban vs rural areas.

select Accident_Severity, Urban_or_Rural_Area, count(*) as accidents
from accident_data
group by Accident_Severity, Urban_or_Rural_Area
order by accidents desc

-- Average number of casualties in urban and rural areas.

select Urban_or_Rural_Area,avg(Number_of_Casualties) as avg_casualties
from accident_data
group by Urban_or_Rural_Area
order by avg_casualties desc

-- Road type and number of vehicles in fatal accidents.

select Road_Type, Accident_Severity,count(Vehicle_Type) as total_vehicles, sum(Number_of_Casualties) as accidents
from accident_data
where Accident_Severity = 'Fatal'
group by Road_Type, Accident_Severity
order by accidents desc

-- Accidents involving more than 3 vehicles

select * from accident_data
where Number_of_Vehicles > 3;

-- Percentage of accidents with only 1 casualty

SELECT COUNT(*) * 100.0 / (SELECT COUNT(*) FROM accident_data) AS Percentage_One_Casualty 
FROM accident_data
WHERE Number_of_Casualties = 1;

-- Number of accidents during rainy weather
select count(*) AS Rainy_Accidents 
from accident_data
where Weather_Conditions like '%Rain%';


-- Distribution of accidents based on the number of lanes on the road

select Road_Type, count(*) as accidents
from accident_data
where Road_Type in ('Single carriageway', 'Dual carriageway', 'One way street', 'Roundabout', 'Slip road')
group by Road_Type
order by accidents desc

-- Number of accidents on weekends vs. weekdays

select case
when extract(dow from accident_date) in (1,7) then 'Weekend'
else 'Weekday'
end as Day_type, count(*) as accident_number
from accident_data
group by extract(dow from accident_date)
order by accident_number desc


-- Top factors (light condition, weather, road type) contributing to accidents involving more than 5 vehicles:

select Weather_Conditions, Road_Type, Light_Conditions, count(*) as accident_numbers
from accident_data
where Number_of_Vehicles > 5
group by Weather_Conditions, Road_Type, Light_Conditions
order by accident_numbers desc

-- Top 3 vehicle types involved in serious accidents

select top 3 Vehicle_Type, count(*) as serious_accidents
from accident_data
group by Vehicle_Type
order by serious_accidents desc

-- Monthly accident trend analysis

select month(Accident_Date) as months, count(*) as total_accidents
from accident_data
group by month(Accident_Date)
order by months asc

-- Which month records the highest number of accidents

select top 1 month(Accident_Date) as months, count(*) as total_accidents
from accident_data
group by month(Accident_Date) 
order by total_accidents desc

-- Based on the conditions (weather, light, road surface), what percentage of accidents are likely to result in serious or fatal injuries

select Weather_Conditions, Light_Conditions, Road_Surface_Conditions,
count(case when Accident_Severity IN ('Serious', 'Fatal') then 1 end) * 100 / count(*) as Serious_or_Fatal_Percentage
from accident_data
group by Weather_Conditions, Light_Conditions, Road_Surface_Conditions;

-- How do accidents vary by time of day (Daylight vs Darkness)

select Light_Conditions, count(*) as accidents_occured
from accident_data
where Light_Conditions in ('Daylight', 'Darkness - lights lit', 'Darkness - no lighting','Darkness - lighting unknown')
group by Light_Conditions
order by accidents_occured desc
