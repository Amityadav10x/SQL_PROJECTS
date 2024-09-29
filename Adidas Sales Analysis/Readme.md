
# Adidas Sales Data Analysis

## Project Overview:
This project involves the analysis of sales data from Foot Locker, focusing on various product types such as Men's and Women's street and athletic footwear. Using SQL queries, we extract insights on total sales, operating profit, and performance across cities, regions, and product categories.

## SQL Questions:
1. **Total sales for each product type sold by Adidas.**
2. **Average price per unit for Adidas products.**
3. **Total units sold for Adidas by city.**
4. **Operating profit by product type for Adidas.**
5. **Top 5 cities with the highest total sales for Adidas.**
6. **Total operating margin for Adidas.**
7. **Sales distribution by region for Adidas.**
8. **Total sales by sales method (in-store/online) for Adidas.**
9. **Identify the product with the highest profit for Adidas.**
10. **Monthly sales trend for Adidas in 2020.**
11. **Product categories contributing the most to total sales for Adidas.**
12. **City-wise average operating profit for Adidas products.**
13. **Top 5 states with the highest sales for Adidas.**
14. **Find the most profitable region for Adidas.**
15. **Total sales of Men's and Women's footwear for Adidas.**
16. **Average operating margin for each product type sold by Adidas.**
17. **Highest revenue day for Adidas in 2020.**
18. **Compare total sales between in-store and online for Adidas.**
19. **Analyze sales performance by state for Adidas products.**
20. **Identify top 3 products by operating margin for Adidas.**

## Data Cleaning Suggestions:
1. **Standardize Date Format**: Ensure the Invoice Date column is in a consistent date format (e.g., YYYY-MM-DD).
2. **Remove Special Characters in Numeric Fields**: Remove commas and dollar signs from numeric fields such as Price per Unit and Total Sales.
3. **Fix Inconsistent Text Formats**: Ensure consistent casing and spellings in the Product, Region, City, and State columns.
4. **Validate Numerical Values**: Check for missing or incorrect values in Units Sold, Total Sales, Operating Profit, and other numerical columns.
5. **Handle Duplicates**: Look for duplicate rows and remove them, especially those with the same Retailer ID, Invoice Date, and Product.
6. **Operating Margin Calculation**: Ensure the Operating Margin field is calculated correctly as (Operating Profit / Total Sales) * 100.
7. **Missing Data**: Identify and handle missing values in critical fields like Invoice Date, Price per Unit, and Units Sold.
8. **Currency Conversion**: If international sales are involved, standardize all sales and prices to a single currency.

## Conclusion:
This README provides an overview of SQL queries for analyzing Adidas sales data, as well as data cleaning steps to ensure the integrity and consistency of the dataset. The analysis focuses on extracting insights across various dimensions such as product type, region, sales method, and performance.
