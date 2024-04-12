# MY PORTFOLIO PROJECTS

### Table of Content


- [Project 1](Project-1)

## Project 1 
Pizza Sales Analysis and Report using PostgresSQL and PowerBI

### Project Overview

This project provides insight into the sales performance of a Pizza brand company for the calendar year 2015. By analyzing various parts of the sales data, we seek to identify trends,
make data-inspired recommendations and understand the company's sales performance.


![image](https://github.com/baeyuu/Portfolio/assets/64594215/2e8ed06e-6d45-413c-9031-4cfa8536a01f)


### Data Sources 

Sales Data: The Primary dataset used for this analysis is the "pizza_sales.csv" which contains detailed sales information on all the company's products.

### Tools
- PostgreSQL - For overview and Analysis
- PowerBI - For dashboard and data cleaning

### Data Cleaning and Preparation

- The basic cleaning done on the dataset is Column renaming and data renaming
- Date column wrangling was also done to extract days of the week and months in the dataset.
- Formatting of the Datatypes


### Exploratory Data Analysis

The EDA involved exploring the dataset to answer key questions such as:
- The KPI's telling the financial and business hallmarks
- Trend analysis by Day and month
- product performance for best and worst sellers

### Data Analysis

Includes some interesting code features

``` PostgresSQL
Copy pizza from 'C:\Users\USER\Desktop\pizasales.csv' with csv header;

SELECT pizza_size, 
Cast (SUM(total_price)as decimal(10,2)) AS Total_Revenue,
Cast (sum(total_price)*100/(SELECT SUM(total_price) From PIZZA)as decimal(10,2)) AS PCT
FROM PIZZA
GROUP BY pizza_size
ORDER BY PCT DESC;

SELECT pizza_name, 
       SUM(total_price) AS Total_Revenue, 
       SUM(quantity) AS Total_Quantity, 
       COUNT(DISTINCT order_id) AS Total_Pizza_Sold
FROM PIZZA
GROUP BY pizza_name
HAVING SUM(total_price) <= 16000 
   AND SUM(quantity) <= 1000 
   AND COUNT(DISTINCT order_id) <= 1000
ORDER BY Total_Revenue ASC 
LIMIT 5;
```
### Result and Findings

The Analysis results are summarized thus:
- Orders are Highest on Friday/Saturday evenings
- There are Maximum Orders from July May and January
- Classic Pizza Category Contributes to maximum sales and Total order
- Large-size pizza contributes to Maximum Sales

### Recommendation
Based on the analysis the following recommendations should be considered by the company
- The organization needs to ensure operations are maximised on friday and saturday
- Work on promoting Large sized and classic Pizza.
- Create a customer segmentations to target returning, and quantity order customers.

### Refrences

1. [Data Tutorials](https://www.youtube.com/watch?v=V-s8c6jMRN0&t=43s)
2. [Chatgpt](https://chat.openai.com/)


