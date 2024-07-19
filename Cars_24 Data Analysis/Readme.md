## Car24 SQL Practice Project

### Project Overview

This project contains a dataset from Car24 company and a set of SQL practice questions. The goal is to improve your SQL skills by solving various intermediate and advanced level questions based on the dataset.

### Dataset Description

The dataset contains information about various cars. Below are the columns included in the dataset:

- `cars_name`: The name of the car.
- `cars_brand`: The brand of the car.
- `model`: The model of the car.
- `model_year`: The year the car model was manufactured.
- `car_type`: The type of car (e.g., Manual).
- `kms`: The number of kilometers driven by the car.
- `owner`: The number of previous owners.
- `gasoliene_type`: The type of fuel used by the car (e.g., Diesel).
- `price`: The price of the car.
- `emi_per_month`: The EMI per month for the car.
- `zero_downpayment`: Whether the car has a zero down payment option.
- `city`: The city where the car is located.
- `state`: The state where the car is located.

### SQL Questions

Here are 30 SQL practice questions categorized by difficulty and type of query:

#### Basic Queries

1. List all the cars available in Hyderabad, Telangana.
2. Find the total number of cars that are of diesel type.
3. Display the car names and their prices sorted by price in descending order.
4. Retrieve all car details where the car type is 'Manual'.
5. Show the details of cars manufactured in or after the year 2013.

#### Aggregations and Grouping

6. Calculate the average price of cars by brand.
7. Find the total number of kilometers driven by cars from each brand.
8. Determine the average EMI per month for cars with zero down payment.
9. Count the number of cars for each model year.
10. Find the total number of cars owned by first-time owners.

#### Joins and Subqueries

11. Find the details of cars that have been driven more than the average kilometers driven by all cars.
12. List the cars whose price is greater than the average price of all cars in the dataset.
13. Identify the car brands that have models with zero down payment EMI options in Hyderabad.
14. Retrieve the details of the most expensive car for each brand.
15. List all cars that have been driven less than the least driven car in the dataset.

#### Advanced Functions and Analysis

16. Write a query to rank the cars based on their price within each brand.
17. Determine the percentage of cars that are manual transmission.
18. Find the car with the maximum price and the minimum price, and display their details.
19. Calculate the difference in price between the most expensive and least expensive car for each brand.
20. Determine the variance and standard deviation of car prices.

#### Window Functions

21. Use window functions to calculate the cumulative sum of car prices ordered by model year.
22. Find the moving average price of the cars over model years.
23. Identify the top 3 most expensive cars within each brand using window functions.
24. Calculate the running total of kilometers driven for each car type.
25. Find the lag and lead values of car prices within each brand.

#### Complex Conditions and Case Statements

26. Create a query to classify cars into different price ranges (e.g., low, medium, high) using CASE statements.
27. Find the number of cars for each owner type (e.g., first owner, second owner) and categorize them by their price range.
28. List all cars that have a price between 300,000 and 600,000 and have zero down payment.
29. Create a query to display cars with more than 100,000 kilometers driven and have EMI per month less than 12,000.
30. Find the car models that have been driven for more than the average kilometers for their model year.

### How to Use

1. **Set Up the Database:**
   - Import the dataset into your preferred SQL database system.
   - Ensure all columns are correctly formatted and data types are set appropriately.

2. **Practice SQL Queries:**
   - Start with the basic queries to get familiar with the dataset.
   - Progress to more complex queries, including aggregations, joins, and subqueries.
   - Attempt advanced functions and window functions to analyze data trends.
   - Use complex conditions and case statements for detailed data classification.

3. **Optimize and Enhance:**
   - Experiment with indexing and query optimization techniques.
   - Create stored procedures and functions for reusable and efficient SQL code.
   - Modify the schema if necessary to better suit your analysis needs.

### Conclusion

This project aims to provide hands-on practice with a real-world dataset to enhance MY SQL skills. By working through these questions, you'll gain experience in various SQL techniques and be better prepared for data analysis tasks in professional settings.
