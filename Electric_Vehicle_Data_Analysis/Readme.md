# Electric Vehicle Data Analysis Project

## Project Overview

This project aims to analyze a dataset of electric vehicles (EVs) to provide insights on their geographic distribution, vehicle characteristics, eligibility for clean fuel incentives, and trends in the electric vehicle market. The analysis can be valuable to government agencies, automobile manufacturers, utility providers, and researchers interested in understanding the adoption and impact of electric vehicles.

## Objectives

The primary objectives of this project are to:
1. Understand the geographic distribution of electric vehicles across different states, counties, cities, and census tracts.
2. Analyze vehicle characteristics such as make, model, electric range, and base MSRP (Manufacturer's Suggested Retail Price).
3. Explore eligibility for Clean Alternative Fuel Vehicle (CAFV) benefits and determine which regions and vehicle types qualify.
4. Identify trends in electric vehicle adoption over time, including changes in electric range, vehicle costs, and model popularity.
5. Provide insights that can inform stakeholders about electric vehicle adoption patterns, infrastructure needs, and potential areas for promoting EV usage.

## Dataset Structure

The dataset contains the following columns:

| Column Name                                  | Data Type           | Description |
|----------------------------------------------|----------------------|-------------|
| `VIN_1_10`                                   | `varchar(50)`       | Partial Vehicle Identification Number |
| `County`                                     | `varchar(50)`       | County where the vehicle is registered |
| `City`                                       | `varchar(50)`       | City where the vehicle is registered |
| `State`                                      | `varchar(50)`       | State where the vehicle is registered |
| `Postal_Code`                                | `int`               | Postal code of the registration area |
| `Model_Year`                                 | `smallint`          | Year the vehicle model was manufactured |
| `Make`                                       | `varchar(50)`       | Manufacturer of the vehicle (e.g., Tesla, Nissan) |
| `Model`                                      | `varchar(50)`       | Model of the vehicle |
| `Electric_Vehicle_Type`                      | `varchar(50)`       | Type of electric vehicle (e.g., Battery Electric Vehicle, Plug-in Hybrid) |
| `Clean_Alternative_Fuel_Vehicle_CAFV_Eligibility` | `nvarchar(100)`   | Indicates if the vehicle is eligible for clean fuel incentives |
| `Electric_Range`                             | `smallint`          | Electric range of the vehicle in miles |
| `Base_MSRP`                                  | `int`               | Manufacturer's suggested retail price |
| `Legislative_District`                       | `tinyint`           | Legislative district for the vehicle’s location |
| `DOL_Vehicle_ID`                             | `int`               | Unique identifier for the vehicle |
| `Vehicle_Location`                           | `varchar(50)`       | Location coordinates (latitude, longitude) |
| `Electric_Utility`                           | `varchar(50)`       | Electric utility provider for the vehicle’s area |
| `_2020_Census_Tract`                         | `bigint`            | Census tract based on 2020 Census |

## Analysis Questions

The project involves answering a series of questions based on the dataset. These questions aim to cover different aspects of electric vehicle adoption, CAFV eligibility, vehicle characteristics, and geographic distribution.

### 1. Geographic Distribution
   - How many electric vehicles are registered in each state, county, city, and postal code?
   - What is the distribution of electric vehicles across different census tracts?
   - Which regions have the highest and lowest concentrations of electric vehicles?

### 2. Vehicle Characteristics
   - What are the most popular makes and models in the dataset?
   - What is the average electric range and base MSRP by make and model?
   - How does electric range vary across different types of electric vehicles?

### 3. Clean Alternative Fuel Vehicle (CAFV) Eligibility
   - What is the total number of CAFV eligible vehicles?
   - Which counties and legislative districts have the highest concentration of CAFV eligible vehicles?

### 4. Electric Range and Cost Analysis
   - What is the distribution of electric range among vehicles?
   - What are the trends in base MSRP across different model years and electric vehicle types?

### 5. Utility Provider Analysis
   - What is the count of vehicles served by each electric utility provider?
   - What is the average electric range of vehicles by electric utility?

## Tools and Technologies

- **SQL Server**: The primary database management system used to store and query the dataset.
- **SQL Server Management Studio (SSMS)**: Used for executing SQL queries and managing the database.
- **Power BI / Tableau (Optional)**: For visualizing trends, geographic distribution, and other insights.
- **Excel**: To preprocess and clean the data if necessary.

## SQL Queries

The analysis involves writing SQL queries for each question listed in the Analysis Questions section. These queries are designed to:
- Aggregate data by different geographic regions.
- Calculate averages, medians, and distribution statistics for numeric fields like `Electric_Range` and `Base_MSRP`.
- Filter data based on specific conditions (e.g., CAFV eligibility, electric vehicle type).
- Join with external datasets (optional) for more context, such as population data by census tract.

## Potential Insights

By analyzing this dataset, the following insights can be obtained:
- **Regional Trends**: Understanding which areas have higher EV adoption can help target regions for infrastructure development, such as charging stations.
- **CAFV Eligibility Impact**: Identifying areas with high CAFV eligibility helps to assess the effectiveness of clean fuel incentive programs.
- **Range and Cost Trends**: Observing trends in electric range and vehicle costs over time can provide insights into advancements in EV technology and affordability.
- **Utility Provider Analysis**: Analyzing electric range by utility provider can help utility companies prepare for the demand impact of electric vehicles.

## Future Enhancements

Potential extensions to this project include:
1. **Time-Series Analysis**: Analyze changes in EV adoption over time using more granular model year data.
2. **Comparative Analysis with Gasoline Vehicles**: If data is available, compare EV adoption trends with traditional gasoline vehicles.
3. **Integration with External Datasets**: Add layers of data, such as income levels or population density by census tract, for more contextual insights.
4. **Machine Learning**: Predict future adoption rates or model popular EV attributes using machine learning algorithms.

## Conclusion

This project provides a comprehensive analysis of electric vehicles, focusing on geographic distribution, vehicle characteristics, CAFV eligibility, and market trends. The findings from this analysis can support government policy decisions, guide infrastructure planning, and inform manufacturers and utility companies about emerging EV trends.
