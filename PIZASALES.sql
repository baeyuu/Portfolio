CREATE TABLE PIZZA(pizza_id integer, 
					order_id integer, 
					pizza_name_id VARCHAR (100), 
					quantity INTEGER,
				   order_date DATE, 
					order_time TIME, 
					unit_price DOUBLE PRECISION, 
					total_price DOUBLE PRECISION,
				   pizza_size VARCHAR(50), 
					pizza_category VARCHAR(50), 
					pizza_ingredients VARCHAR (200), 
					pizza_name VARCHAR(100));
					
Copy pizza from 'C:\Users\USER\Desktop\pizasales.csv' with csv header;

SELECT*FROM PIZZA;



----1. Calculating the Total Revenue
SELECT SUM(total_price) AS Total_Revenue
FROM PIZZA;

----2. Average order made
SELECT SUM(total_price)/ Count(distinct order_id) as Avg_Order
FROM PIZZA;

----3. Total pizza sold
SELECT SUM(quantity) AS Total_Pizza_Sold
FROM PIZZA;

----4. Total orders made
SELECT Count(distinct order_id) AS Total_Pizza_Sold
FROM PIZZA;

----5. Average pizza per order
SELECT Cast (Cast (SUM(quantity) as decimal(10,2))/ Cast (Count(distinct order_id) as decimal(10,2)) as Decimal(10,2)) as Avg_pizzaperorder
FROM PIZZA;

---- 6. Daily trend for orders
SELECT TO_CHAR(order_date, 'Day') as Order_days,
COUNT (DISTINCT order_id) as Total_Orders
FROM PIZZA
GROUP BY TO_CHAR(order_date, 'Day');

-----7. Monthly trend for orders
SELECT TO_CHAR(order_date, 'Month') as Month_Name,
COUNT (DISTINCT order_id) as Total_Orders
FROM PIZZA
GROUP BY TO_CHAR(order_date, 'Month')
ORDER BY Total_Orders desc;

----8. Percentage of sales by categories of pizza and Total revenue
SELECT pizza_category, 
Cast (SUM(total_price)as decimal(10,2)) AS Total_Revenue,
Cast (sum(total_price)*100/(SELECT SUM(total_price) From PIZZA)as decimal(10,2)) AS PCT
FROM PIZZA
GROUP BY pizza_category
ORDER BY PCT DESC;

----9. Percentage of sales by size of pizza and Total Revenue
SELECT pizza_size, 
Cast (SUM(total_price)as decimal(10,2)) AS Total_Revenue,
Cast (sum(total_price)*100/(SELECT SUM(total_price) From PIZZA)as decimal(10,2)) AS PCT
FROM PIZZA
GROUP BY pizza_size
ORDER BY PCT DESC;

----10. Percentage of sales by size of pizza for Second Quarter and Total Revenue
SELECT pizza_size, 
Cast (SUM(total_price)as decimal(10,2)) AS Total_Revenue,
Cast (sum(total_price)*100/(SELECT SUM(total_price) From PIZZA WHERE EXTRACT(QUARTER FROM order_date) = 2)as decimal(10,2)) AS PCT
FROM PIZZA
WHERE EXTRACT(QUARTER FROM order_date) = 2
GROUP BY pizza_size
ORDER BY PCT DESC;

----11. Top 5 Best sellers by Revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM PIZZA
GROUP BY pizza_name
ORDER BY Total_Revenue DESC 
LIMIT 5;

----12. Bottom 5 sellers by Revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM PIZZA
GROUP BY pizza_name
ORDER BY Total_Revenue ASC 
LIMIT 5;

----13. Top 5 Best sellers by Total_Quantity
SELECT pizza_name, SUM(quantity) AS Total_Quantity
FROM PIZZA
GROUP BY pizza_name
ORDER BY Total_Quantity DESC 
LIMIT 5;

----14. Bottom 5 sellers by Total_Quantity
SELECT pizza_name, SUM(quantity) AS Total_Quantity
FROM PIZZA
GROUP BY pizza_name
ORDER BY Total_Quantity ASC 
LIMIT 5;

----15. Top 5 Best sellers by Total orders made
SELECT pizza_name, Count(distinct order_id) AS Total_Pizza_Sold
FROM PIZZA
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC 
LIMIT 5;

----16. Bottom 5 sellers by Total orders made
SELECT pizza_name, Count(distinct order_id) AS Total_Pizza_Sold
FROM PIZZA
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC 
LIMIT 5;


---- 17. Top 5 by combined Revenue, Quantity, total orders
SELECT pizza_name, 
       SUM(total_price) AS Total_Revenue, 
       SUM(quantity) AS Total_Quantity, 
       COUNT(DISTINCT order_id) AS Total_Pizza_Sold
FROM PIZZA
GROUP BY pizza_name
HAVING SUM(total_price) >= 30000 
   AND SUM(quantity) >= 2000 
   AND COUNT(DISTINCT order_id) >= 2000
ORDER BY Total_Revenue DESC 
LIMIT 5;

---- 18. Bottom 5 by combined Revenue, Quantity, total orders
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