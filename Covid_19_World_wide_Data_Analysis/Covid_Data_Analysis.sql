--                                                    Covid-19 Data Analysis (amit)

--  Select all columns for the country "USA".

select * from Covid_dataset_daily_data
where country  = 'USA'	

-- Find the total number of confirmed cases in the continent "Europe".

select sum(total_confirmed) as total_conformed_cases
from Covid_data_summary
where continent = 'Europe'

-- Select the country and total number of deaths for countries with more than 1000 deaths.

select country , sum(total_deaths) as total_death
from Covid_data_summary
where total_deaths > 1000
group by country

-- Find the total number of recovered cases in the country "India".

select country, sum(total_recovered) as total_recovered
from Covid_data_summary
where country = 'India'
group by country

-- Select all columns for countries with more than 10000 active cases.

select * from Covid_data_summary
where active_cases > 10000

--  Find the total number of confirmed cases in the continent "Asia".

select continent, sum(total_confirmed) as total_confermed_cases
from Covid_data_summary
where continent = 'Asia'
group by continent

-- Select the country and total number of tests for countries with more than 100000 tests.

select country , sum(total_tests) as total_test
from Covid_data_summary
where total_tests > 100000
group by country

-- Find the population count for the country "China".

select  country,sum(population) as total_population
from Covid_data_summary
where country = 'China'
group by country

-- Select countries with more than 500 serious or critical cases.

select country,sum(serious_or_critical) as total_serious_case
from Covid_data_summary
group by country

-- Find the total number of confirmed cases per 1 million population for the country "Brazil".

select country,sum(total_confirmed) as conformed_cases,total_cases_per_1m_population
from Covid_data_summary
where country = 'Brazil' 
group by total_cases_per_1m_population, country


--                                                                     Intermediate:

-- Find the average number of daily new cases for all countries in the continent "Africa".

select  p.country,avg(p.daily_new_cases)as avg_daily_cases
from Covid_dataset_daily_data p 
join 
Covid_data_summary A on p.country = a.country
where continent = 'Africa'
group by p.country

-- Select the country and cumulative total cases for countries with more than 100000 cumulative total cases.

select country, cumulative_total_cases 
from  Covid_dataset_daily_data
where cumulative_total_cases > 100000
group by country, cumulative_total_cases

--  Find the total number of deaths per 1 million population for the continent "Europe".

select continent , sum(total_deaths_per_1m_population) as total_deaths_per_1m_population
from Covid_data_summary
where continent = 'Europe'
group by continent

-- Select top 10 country and active cases for countries with more than 50000 active cases.

select top 10 country, sum(active_cases) as total_active_cases
from Covid_data_summary
where active_cases > 50000
group by country
order by total_active_cases desc

-- Find the total number of tests per 1 million population for the country "Japan".

select country, sum(total_tests_per_1m_population) as total_tests_per_1m_population
from Covid_data_summary
where country = 'Japan'
group by country

-- Select the country and daily new deaths for countries with more than 100 daily new deaths.

select top 200 country, daily_new_deaths
from Covid_dataset_daily_data
where daily_new_deaths > 100
group by country, daily_new_deaths
order by daily_new_deaths 

-- Find the cumulative total deaths for the continent "North America".

select sum(a.cumulative_total_deaths) as cumulative_deaths, p.continent
from Covid_dataset_daily_data A
join 
Covid_data_summary P on a.country = p.country
where continent = 'North America'
group by p.continent


-- Select the country and total cases per 1 million population for countries with more than 5000 total cases per 1 million population.

select country, total_cases_per_1m_population
from Covid_data_summary
where total_cases_per_1m_population > 5000
order by total_cases_per_1m_population desc

-- Find the average number of serious or critical cases for all countries in the continent "South America".

select continent, avg(serious_or_critical) as avg_serious_cases
from Covid_data_summary
where continent = 'South America'
group by continent

-- Select the country and population for countries with more than 10000000 population.

select country, population
from Covid_data_summary
where population > 10000000
order by population desc


--                                           Advance Questions 

SELECT TOP 5
  a.country,
  AVG(b.total_cases_per_1m_population) AS avg_cases
FROM
  Covid_dataset_daily_data A
  JOIN Covid_data_summary B ON a.country = B.country
WHERE
  a.date >= DATEADD(day, -30, '2020-02-25') 
GROUP BY
  a.country
ORDER BY
  avg_cases DESC; 

  -- Select the continent and average number of total tests per 1 million population, grouped by continent, for continents with more than 100000 total tests.

  select continent, avg(total_tests_per_1m_population) as total_tests_per_1m_population
  from Covid_data_summary
  where total_tests > 100000
  group by continent



  SELECT TOP 10
  A.country,
  A.cumulative_total_cases,
  (A.cumulative_total_cases / B.population) * 1000000
FROM
  Covid_dataset_daily_data A
  JOIN Covid_data_summary B ON A.country = B.country
WHERE
  A.date = (SELECT MAX(date) FROM Covid_dataset_daily_data)

-- Select the country and average number of cases per 1 million population, grouped by country, for countries with more than 10000 active cases.

select country, avg(active_cases) as total_cases_per_1m_cases
from Covid_data_summary
where active_cases > 10000
group by country

-- Find the top 5 countries with the highest number of serious or critical in continent 'Asia' .

select top 5 country, max(serious_or_critical) as maximum_serious_cases
from Covid_data_summary
where continent = 'Asia'
group by country
order by maximum_serious_cases desc

-- Select the continent and average number of total deaths per 1 million population, grouped by continent, for continents with more than 1000 total deaths.

select continent, avg(total_deaths_per_1m_population) as total_deaths_per_1m_population
from Covid_data_summary
where total_deaths > 1000
group by continent

-- Find the country with the highest number of daily new deaths per 1 million population, and the corresponding value.

SELECT
  A.country,
  A.date,
  (a.daily_new_deaths / B.population) * 1000000 AS daily_new_deaths_per_1m_population
FROM
  Covid_dataset_daily_data A
  JOIN Covid_data_summary B ON A.country = B.country
WHERE
  A.date = (SELECT MAX(date) FROM Covid_dataset_daily_data)

 -- Select the country and average number of total cases per 1 million population, grouped by country, for countries with more than 5000 total cases per 1 million population.

 select country, avg(total_cases_per_1m_population) as avg_of_total_cases_1m_population
 from Covid_data_summary 
 where total_cases_per_1m_population > 5000
 group by country
 order by avg_of_total_cases_1m_population desc

 -- Find the top 5 countries with the highest number of total tests per 1 million population.

 select top 5 country, max(total_tests_per_1m_population) as total_tests_per_im_population
 from Covid_data_summary 
 group by country

 -- 10. Select the continent and average number of recovered cases, grouped by continent, for continents with more than 1000 recovered cases.

 select continent, avg(total_recovered) as total_recovered
 from Covid_data_summary
 where total_recovered > 1000
 group by continent

 --                                                                            THANK YOU
 

