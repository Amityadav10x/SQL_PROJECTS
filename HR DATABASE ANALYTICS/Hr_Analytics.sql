----------------------------------------------------------------  HR DATA ANALYTICS ------------------------------------------------

-- How many employees have left the company, grouped by age group?

select Age,count(EmployeeCount) as total_employees_left
from HR_Analytics
where Attrition = '1'
group by Age

-- What is the average monthly income of employees who have not left the company?

select avg(MonthlyIncome) as avg_monthly_income
from HR_Analytics
where Attrition = '0'

-- Which department has the highest number of employees working overtime?

select Department, OverTime as highest_employee_overtime_working
from HR_Analytics
group by Department,OverTime
order by highest_employee_overtime_working desc

-- What is the average daily rate for each job role?

select JobRole, avg(DailyRate) as avg_daily_rate
from HR_Analytics
group by JobRole
order by avg_daily_rate desc

-- How many employees are in each salary slab?

select SalarySlab, count(EmployeeCount) as total_employees
from HR_Analytics
group by SalarySlab
order by total_employees desc

-- How many employees are single, married, and divorced, grouped by gender?

select MaritalStatus, count(EmployeeCount) as total_employees
from HR_Analytics
group by MaritalStatus
order by total_employees desc

-- What is the average training time per year for employees who have received a promotion?

select EmpID,avg(TrainingTimesLastYear) as avg_training_time
from HR_Analytics
where YearsSinceLastPromotion = '0'
group by EmpID
order by avg_training_time desc

-- How many employees have a work-life balance rating of 3 or above?

select count(EmployeeCount) as total_employess
from HR_Analytics
where WorkLifeBalance >= 3 

-- What is the total number of employees in each job role who are at risk of attrition?

select JobRole,count(EmployeeCount) as total_employees
from HR_Analytics
where Attrition = '1'
group by JobRole
order by total_employees desc

-- What is the distribution of employees' educational fields across different departments?

select Department, EducationField , count(EmpID) as total_employess
from HR_Analytics
group by Department, EducationField
order by total_employess desc

-- How many employees have worked in more than one company before joining?

select count(EmpID) as employees
from HR_Analytics
where NumCompaniesWorked > 1

-- What is the average performance rating of employees in each department?

select Department, avg(PerformanceRating) as average_performence_rating
from HR_Analytics
group by Department
order by average_performence_rating

-- Which job roles have the highest average number of total working years?

select JobRole,avg(TotalWorkingYears) as avg_total_working_hours	
from HR_Analytics
group by JobRole
order by avg_total_working_hours desc

-- How many employees in the '18-25' age group are in the 'Sales' department?

select count(AgeGroup) as age_group
from HR_Analytics
where Department = 'Sales'

-- What is the average work-life balance rating for employees who have received a salary hike of more than 10%?

select avg(WorkLifeBalance) as avg_work_life_balance
from HR_Analytics
where PercentSalaryHike > 5

-- How many employees have a standard working hour of 80?

select count(EmpID) as total_employess
from HR_Analytics
where StandardHours >= 80

-- What is the average job involvement score for employees who travel frequently for business?

select EmpID,avg(JobInvolvement) as avg_job_involvment
from HR_Analytics
where BusinessTravel  = 'Travel_frequently'
group by EmpID
order by EmpID desc

-- How many employees have stock options and work in the 'Laboratory Technician' role?

select StockOptionLevel,count(EmpID) as number_of_employees
from HR_Analytics
where JobRole = 'Laboratory Technician'
group by StockOptionLevel
order by number_of_employees desc

-- What is the most common marital status among employees in the 'Research & Development' department?

select MaritalStatus, count(EmpID) as total_employees
from HR_Analytics
where Department = 'Research & Development'
group by MaritalStatus
order by total_employees desc

-- How many employees have been with their current manager for more than 3 years?

select count(EmpID) as total_employess
from HR_Analytics
where YearsWithCurrManager > 3

-- What is the average daily rate for employees who work in sales roles?

select EmpID, avg(DailyRate) as avg_daily_rate
from HR_Analytics
where Department = 'Sales'
group by EmpID

-- What is the average distance from home for employees in each department?

select Department,avg(DistanceFromHome) as avg_distence_from_home
from HR_Analytics
group by Department

-- How many employees have completed no training in the last year?

select TrainingTimesLastYear as completed_no_of_trainings,count(EmpID) as total_employees
from HR_Analytics
group by TrainingTimesLastYear
order by completed_no_of_trainings desc


-- ------------------------------------------------------------------- THANK YOU ----------------------------------------------