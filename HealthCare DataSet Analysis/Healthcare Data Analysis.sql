-- --------------------------------------------------------------------------- Healthcare Data Analysis ----------------------------------------------------------------------------

-- Write a query to display all columns for all patients.

select *
from [hospital data]

-- Write a query to display the patient name, age, and gender.

select Name,Age,Gender
from [hospital data]

-- Write a query to find all male patients.

select Name
from [hospital data]
where Gender = 'Male'

-- Write a query to find patients diagnosed with "Cancer."

select Medical_Condition,name
from [hospital data]
where Medical_Condition	 = 'Cancer'

-- Write a query to find patients admitted under the "Urgent" admission type.

select Admission_Type,Name
from [hospital data]
where Admission_Type = 'Urgent'

-- Write a query to list patients sorted by their admission date in descending order.

select Name,Date_of_Admission
from [hospital data]
order by Date_of_Admission desc

-- Write a query to find patients who are older than 50.

select age,name
from [hospital data]
where Age > 50
order by Age desc

-- Write a query to find patients with blood type "A+."

select name, Blood_Type
from [hospital data]
where Blood_Type = 'A+'

-- Write a query to list all patients admitted to "Sons and Miller" hospital.

select Name, Hospital
from [hospital data]
where Hospital = 'Sons and Miller'

-- Write a query to find all patients who were prescribed "Ibuprofen."

select Name, Medication
from [hospital data]
where Medication = 'Ibuprofen'

-- Write a query to display the patient name and their discharge date.

select Name, Discharge_Date
from [hospital data]

-- Write a query to find all patients covered by "Medicare."

select name, Insurance_Provider
from [hospital data]
where Insurance_Provider = 'Medicare'

-- Write a query to find the patient in room number 328.

select Name, Room_Number
from [hospital data]
where Room_Number = 328

-- Write a query to find all patients with "Normal" test results.

select name, Test_Results
from [hospital data]
where Test_Results = 'Normal'

-- Write a query to find patients admitted in the year 2024.

select name, year(Date_of_Admission) as Addmission_year
from [hospital data]
where year(Date_of_Admission) = 2024

-- ---------------------------------------------------------- Intermediate Level -------------------------------------------------

-- Write a query to count the number of patients by admission type.

select Admission_Type,count(Name) as total_patients
from [hospital data]
group by Admission_Type
order by total_patients desc

-- Write a query to calculate the total billing amount for all patients.

select name,round(sum(Billing_Amount),0) as total_billing_amount
from [hospital data]
group by Name
order by total_billing_amount desc

-- Write a query to find the average billing amount across all patients.
select name,round(avg(Billing_Amount),0) as avg_billing_amount
from [hospital data]
group by Name
order by avg_billing_amount desc

-- Write a query to find the maximum and minimum billing amounts.

select round(max(Billing_Amount),0) as maximum_billing_amount, 
round(min(Billing_Amount),0) as minimum_amount
from [hospital data]

-- Write a query to count the number of patients treated by each doctor.

select Doctor,count(Name) as total_patients_treated
from [hospital data]
group by  Doctor
order by total_patients_treated desc

-- Write a query to count the number of patients diagnosed with each medical condition.

select Medical_Condition,
count(Name) as total_patients
from [hospital data]
group by Medical_Condition
order by total_patients

-- Write a query to find patients admitted between January 1, 2020, and December 31, 2020.

select Name, Date_of_Admission
from [hospital data]
where Date_of_Admission between 2020-01-31  and  2020-12-01

-- Write a query to find patients whose billing amount is above the average billing amount.

select Name, round(Billing_Amount,0) as billing_amount
from [hospital data]
where Billing_Amount > (select 
round(avg(Billing_Amount),0) as avg_billing_amount
from [hospital data]
)

-- Write a query to count the number of patients admitted each year.

select year(Date_of_Admission) as year,count(name) as total_patients
from [hospital data]
group by year(Date_of_Admission)
order by total_patients desc

--  Write a query to find the most commonly prescribed medication for patients with "Obesity."

select Medication,count(Medication) as most_commonly_prescribed_medicin
from [hospital data]
where Medical_Condition = 'Obesity'
group by Medication
order by most_commonly_prescribed_medicin desc

-- Write a query to list patients who were discharged in the last 30 days.

--  Write a query to find patients with a billing amount between 20,000 and 30,000.

select Name, round(Billing_Amount,0) as Billing_Amount
from [hospital data]
where Billing_Amount between 20000 and 30000

-- Write a query to list all unique medical conditions in the dataset.

select distinct count(Medical_Condition) as unique_medical_conditions, Medical_Condition
from [hospital data]
group by Medical_Condition

-- -------------------------------------------------------  Advanced Level ----------------------------------------------------

-- Write a query to find patients whose billing amount is higher than the highest billing amount recorded in 2020.

select name,round(Billing_Amount,0) as Billing_Amount
from [hospital data]
where Billing_Amount >
(select max(Billing_Amount) as highest_billing_amount
from [hospital data]
where year(Date_of_Admission) = 2020
)

-- Write a query to rank patients by billing amount within each hospital.

select name,Hospital,round(Billing_Amount,0) as billing_amount, RANK() over(partition by Hospital order by billing_amount desc ) as rank
from [hospital data]
group by name,Hospital, Billing_Amount

-- Write a query to find the top 3 most commonly prescribed medications using window function.

select top 3 Medication ,count(Medication) as total_time_prescribed, 
RANK() over(partition by medication
order by Medication desc) as rank
from [hospital data]
group by Medication
order by total_time_prescribed desc

-- Write a query to find all patients number  admitted year wise.

select count(Name) as frequency, 
year(Date_of_Admission) as years
from [hospital data]
group by  year(Date_of_Admission)
order by frequency desc

--Write a query to calculate the total billing amount for each hospital, but only for patients admitted under the "Emergency" type.

select Hospital,round(sum(Billing_Amount),0) as total_billing_amount, Admission_Type
from [hospital data]
where Admission_Type = 'Emergency'
group by Hospital, Admission_Type
order by total_billing_amount desc

-- Write a query to pivot the data to show the count of patients by admission type and gender.

select Admission_Type,Gender,
count(Name) as total_patients
from [hospital data]
group by Admission_Type, Gender
order by total_patients desc

-- Write a query to find all patients whose billing amount is greater than the average billing amount for their medical condition.

SELECT Name,
round(Billing_Amount,0) as billing_amount,
Medical_Condition
FROM 
[hospital data] AS hd1
WHERE 
Billing_Amount > (SELECT AVG(Billing_Amount) 
    FROM [hospital data] AS hd2
    WHERE hd2.Medical_Condition = hd1.Medical_Condition
)
