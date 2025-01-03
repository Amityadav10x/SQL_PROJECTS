-- ------------------------------------------------------------------------------  GLOBAL HEALTH STATICCS ANALYSIS ----------------------------------------------------------------------------

--	                                                              Basic Queries

-- Retrieve all records where the `Urbanization Rate (%)` is above 80%.

select round(Urbanization_Rate,0) as urbanization_rate
from Global_Health_Statistics
where Urbanization_Rate > 80

-- List all diseases in the dataset and their corresponding categories.

select Disease_Name,Disease_Category
from Global_Health_Statistics

-- Display all rows where the `Treatment Type` is "Medication."

select *
from Global_Health_Statistics
where Treatment_Type = 'Medication'

-- Find the country and year where the `Average Treatment Cost (USD)` exceeds 20,000 USD.

select 
Country,
YEAR,
avg(Average_Treatment_Cost_USD) as avg_treatment_cost
from Global_Health_Statistics
where Average_Treatment_Cost_USD > 20000
group by Country,Year
order by avg_treatment_cost desc

-- Show records where the `Doctors per 1000` is less than the global average.

select avg(Doctors_per_1000) as global_average
from Global_Health_Statistics
where Doctors_per_1000< (select avg(Doctors_per_1000) as global_average
from Global_Health_Statistics) 

-- List all records where the `Prevalence Rate (%)` is less than 1%.

select round(Prevalence_Rate,2) as prevelance_rate
from Global_Health_Statistics
where Prevalence_Rate < 1

-- Retrieve all diseases that primarily affect the "0–18" age group.

select Disease_Name,Age_Group
from Global_Health_Statistics
where Age_Group  = '0-18'

-- Find all entries where the `Recovery Rate (%)` is below 90% but `Healthcare Access (%)` is above 50%.

select *
from Global_Health_Statistics
where Recovery_Rate < '90' and Healthcare_Access > '50' 

-- Display the country, year, and `DALYs` for all entries with a `Mortality Rate (%)` above 8%.

select 
Country,
YEAR,
DALYs,
round(Mortality_Rate,2) as morality_rate
from Global_Health_Statistics
where Mortality_Rate > '8'

-- Retrieve records where the `Availability of Vaccines/Treatment` is "No."

select *,Availability_of_Vaccines_Treatment
from Global_Health_Statistics
where Availability_of_Vaccines_Treatment = '1'

--                                                  Aggregation and Grouping

--  Calculate the total population affected by diseases for each gender.

select gender,sum(Population_Affected) as total_population_affected
from Global_Health_Statistics
group by Gender
order by total_population_affected desc

-- Find the average `Recovery Rate (%)` grouped by `Disease Category.`

select Disease_Category,
round(avg(Recovery_Rate),2) as avg_recovery_rate
from Global_Health_Statistics
group by Disease_Category
order by avg_recovery_rate desc

-- Determine the sum of `DALYs` for each country in the dataset.

select Country,sum(DALYs) as dalys
from Global_Health_Statistics
group by Country
order by dalys desc

-- Find the minimum and maximum `Average Treatment Cost (USD)` for each `Treatment Type.`

select Treatment_Type,
max(Average_Treatment_Cost_USD) as max_avg_treatment_cost,
min(Average_Treatment_Cost_USD) as min_avg_treatment_cost
from Global_Health_Statistics
group by Treatment_Type

--  Group by `Age Group` and calculate the average `Mortality Rate (%).`

select Age_Group,
round(avg(Mortality_Rate),1) avg_morality_rate
from Global_Health_Statistics
group by Age_Group
order by avg_morality_rate desc

--  Find the average `Healthcare Access (%)` for countries with `Urbanization Rate (%)` above 85%.

select Country,
round(avg(Healthcare_Access),2) as avg_healthcare_access
from Global_Health_Statistics
where Urbanization_Rate > '85'
group by Country
order by avg_healthcare_access desc

-- Display the total population affected by diseases for each year.

select YEAR,sum(Population_Affected) as total_population_affected
from Global_Health_Statistics
group by Year
order by total_population_affected desc

-- Calculate the average `Per Capita Income (USD)` grouped by `Gender.`

select Gender,
avg(Per_Capita_Income_USD) as avg_per_capita_income
from Global_Health_Statistics
group by Gender
order by avg_per_capita_income desc

-- Identify the disease category with the highest average `Incidence Rate (%).`

select Disease_Category,
round(avg(Incidence_Rate),2) as avg_incident_rate
from Global_Health_Statistics
group by Disease_Category
order by avg_incident_rate desc

-- Group records by `Country` and calculate the average `Education Index.`

select Country,
round(avg(Education_Index),2) as avg_education_index
from Global_Health_Statistics 
group by Country
order by avg_education_index desc


--                                                      SUBQUERIES

-- Retrieve the disease name and country with the highest `Mortality Rate (%)` in the dataset.
	
select Disease_Name,
Country,
Mortality_Rate
from Global_Health_Statistics
where Mortality_Rate = (select max(Mortality_Rate) as highest_morality_rate from Global_Health_Statistics)

-- Identify all diseases that have an `Incidence Rate (%)` higher than the global average.

select Disease_Name,round(AVG(Incidence_Rate),2) as avg_incident_rate
from Global_Health_Statistics
where Incidence_Rate > (select round(AVG(Incidence_Rate),2) as avg_incident_rate
from Global_Health_Statistics)
group by Disease_Name
order by avg_incident_rate desc 

-- Find the country where the `Average Treatment Cost (USD)` is the lowest.

select Country,
Average_Treatment_Cost_USD
from Global_Health_Statistics
where Average_Treatment_Cost_USD = (select min(Average_Treatment_Cost_USD) as min_avg_treatment_cost 
from Global_Health_Statistics)

-- List records where the `Education Index` is higher than the average for countries with urbanization rates above 80%.

select avg(Education_Index) as avg_education_index
from Global_Health_Statistics
where Urbanization_Rate > '80' and Education_Index >(select avg(Education_Index) as avg_education_index
from Global_Health_Statistics) 

-- Identify diseases that have a `Recovery Rate (%)` above the overall avg recovery rate.

select Disease_Name,
round(avg(Recovery_Rate),2) as avg_recovery_rate
from Global_Health_Statistics
where Recovery_Rate > (select avg(Recovery_Rate) as avgg_Recovery_Rate from Global_Health_Statistics)
group by Disease_Name
order by avg_recovery_rate desc

--                                                              Window Fucntion

-- Rank diseases by their `DALYs` within each `Age Group.`

select Disease_Name,DALYs,Age_Group,
rank() over(partition by age_group order by DALYs desc) as rank
from Global_Health_Statistics

-- Create a running total of the `Mortality Rate (%)` for each country.

select country,
sum('Morality_Rate') over(partition by country order by Mortality_Rate asc) as running_total
from Global_Health_Statistics
order by Mortality_Rate


-- Rank records by the `Urbanization Rate (%)` and display the top 5.

select top 5 Country,
round(avg(Urbanization_Rate),2) as avg_urbnization_rate,
rank() over(order by avg(Urbanization_Rate) desc) as urbanization_rank
from Global_Health_Statistics
group by Country
order by avg_urbnization_rate desc

-- Partition by `Country` and find the percentage change in `DALYs` from one year to the next.

SELECT 
    Country,
    Year,
    DALYs,
    LAG(DALYs) OVER (PARTITION BY Country ORDER BY Year) AS Previous_DALYs,
    CASE 
        WHEN LAG(DALYs) OVER (PARTITION BY Country ORDER BY Year) IS NULL THEN NULL
        ELSE ((DALYs - LAG(DALYs) OVER (PARTITION BY Country ORDER BY Year)) 
              / LAG(DALYs) OVER (PARTITION BY Country ORDER BY Year)) * 100
    END AS Percentage_Change
FROM 
    Global_Health_Statistics
ORDER BY 
    Country, Year;



