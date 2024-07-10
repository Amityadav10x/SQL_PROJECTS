--                                       SQL Project     Population Census        By_Amit

-- Retrieve the names of all cities in the dataset.

SELECT DISTINCT
    name_of_city
FROM
    city_data;

-- List the total population of each city.

SELECT 
    name_of_city, SUM(population_total) AS total_population
FROM
    city_data
GROUP BY name_of_city;

-- Find the number of males in each city.

SELECT 
    name_of_city, SUM(population_male) AS total_male
FROM
    city_data
GROUP BY name_of_city;

-- Show the number of females in each city.

SELECT 
    name_of_city, SUM(population_female) AS total_female
FROM
    city_data
GROUP BY name_of_city;

-- Calculate the sex ratio for each city.

SELECT 
    name_of_city, SUM(sex_ratio) AS sex_ratio
FROM
    city_data
GROUP BY name_of_city;

-- Find the total number of literates in each city.

SELECT 
    name_of_city, SUM(literates_total) AS total_litrates
FROM
    city_data
GROUP BY name_of_city;

-- List the total number of male graduates in each city.

SELECT 
    name_of_city, SUM(male_graduates) AS male_graduates
FROM
    city_data
GROUP BY name_of_city;

-- Show the total number of female graduates in each city.

SELECT 
    name_of_city, SUM(female_graduates) AS female_graduates
FROM
    city_data
GROUP BY name_of_city;

-- Retrieve total effective literacy rate in each city.

SELECT 
    name_of_city,
    round(SUM(effective_literacy_rate_total),2) AS effective_literacy_rate_total
FROM
    city_data
GROUP BY name_of_city;

-- Find the effective literacy rate for females in each city.

SELECT 
    name_of_city,
    round(SUM(effective_literacy_rate_female),2) AS effective_literacy_rate_female
FROM
    city_data
GROUP BY name_of_city;

-- Retrieve the effective literacy rate for males in each city.

SELECT 
    name_of_city,
    round(SUM(effective_literacy_rate_male),2) AS effective_literacy_rate_male
FROM
    city_data
GROUP BY name_of_city;


-- --------------------------------------------------- INTERMEDIATE ----------------------------

-- List cities with a total population greater than 120,000.

SELECT 
    name_of_city, population_total
FROM
    city_data
WHERE
    population_total > 120000
GROUP BY name_of_city , population_total;

-- Find cities where the male population is more than 60,000.

SELECT 
    name_of_city, population_male
FROM
    city_data
WHERE
    population_male > 60000;
    
-- Show cities with a female population less than 55,000.

SELECT 
    name_of_city, population_female
FROM
    city_data
WHERE
    population_female < 55000;

-- Retrieve cities where the child sex ratio is less than 900.

SELECT 
    name_of_city, child_sex_ratio
FROM
    city_data
WHERE
    child_sex_ratio < 900;

-- Find cities with an effective literacy rate (total) greater than 80%.

SELECT 
    name_of_city AS city_name, effective_literacy_rate_total
FROM
    city_data
WHERE
    effective_literacy_rate_total > 80;

-- List cities where the total number of graduates is more than 10,000.

SELECT 
    name_of_city, total_graduates
FROM
    city_data
WHERE
    total_graduates > 10000;

-- Show cities with more than 500000 female graduates.

SELECT 
    state_name,name_of_city, population_female
FROM
    city_data
WHERE
    population_female > 500000;
    
-- show total population of all states with states names

SELECT 
    state_name, SUM(population_total) AS total_population
FROM
    city_data
GROUP BY state_name;

-- Retrieve cities where the male literacy rate is higher than 90%.

SELECT 
    name_of_city, effective_literacy_rate_male AS male_litracy
FROM
    city_data
WHERE
    effective_literacy_rate_male > 90;

-- Find cities with a child population (0-6 years) greater than 15,000.

SELECT 
    name_of_city, A__population_male as  total_male_childs
FROM 
    city_data
WHERE
    A__population_male > 15000;

-- List cities where the total population of literates is greater than 90,000.

SELECT 
    name_of_city, literates_total
FROM
    city_data
WHERE
    literates_total > 90000;
    

--  -------------------------------------------------------------  ADVANCE ----------------------------------------------------

-- Find the average total population of all cities.

SELECT 
    name_of_city,  round(AVG(population_total),2) AS avg_population
FROM
    city_data
GROUP BY name_of_city;

-- Calculate the total number of males and females across all cities.

SELECT 
    name_of_city,
    SUM(population_female) AS total_female_population,
    SUM(population_male) AS total_males_population
FROM
    city_data
GROUP BY name_of_city;


-- Retrieve cities with a male-to-female ratio (male population / female population) greater than 1.1 .

SELECT 
    name_of_city,
    population_male,
    population_female,
    (population_male / population_female) AS male_to_female_ratio
FROM
    city_data
WHERE
    (population_male / population_female) > 1.1;

-- Show cities where the literacy rate difference between males and females is more than 10%.

SELECT 
    name_of_city,
    (effective_literacy_rate_male - effective_literacy_rate_female) AS literacy_rate_diffrence
FROM
    city_data
WHERE
    (effective_literacy_rate_male - effective_literacy_rate_female) > 10;
    
-- Find the city with the highest total number of literates.

SELECT 
    name_of_city,
    MAX(literates_total) AS highest_number_of_litrates
FROM
    city_data
group by name_of_city
order by highest_number_of_litrates desc;

-- List cities with a child sex ratio that is below the overall sex ratio.

SELECT 
    name_of_city,
    child_sex_ratio,
    SUM(sex_ratio) AS overall_sex_ratio
FROM
    city_data
WHERE
    child_sex_ratio < sex_ratio
GROUP BY name_of_city , child_sex_ratio; 

-- Calculate the total child population (0-6 years) for all cities combined.

SELECT 
    COUNT(name_of_city) AS total_cities,
    SUM(A__population_male) AS total_child_population
FROM
    city_data;

-- Find the city with the highest effective literacy rate for females.

SELECT 
    name_of_city,
    MAX(effective_literacy_rate_female) AS highest_literacy_rate
FROM
    city_data
GROUP BY name_of_city
ORDER BY highest_literacy_rate DESC;

-- Show cities where the number of literate females is more than the number of literate males.

SELECT 
    name_of_city
FROM
    city_data
WHERE
    literates_female > literates_male; 

-- Retrieve the city with the lowest child sex ratio.

SELECT 
    name_of_city, min(child_sex_ratio) AS lowest_child_sex_ratio
FROM
    city_data
GROUP BY name_of_city

















