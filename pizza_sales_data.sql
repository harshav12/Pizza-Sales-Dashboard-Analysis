-- INSPECTING DATA
SELECT COUNT(*) FROM pizza_sales_data;

SELECT * FROM pizza_sales_data
ORDER BY pizza_id
LIMIT 1000;

SELECT order_date FROM pizza_sales_data
WHERE order_date LIKE '%/13/%';

SELECT order_date FROM pizza_sales_data
WHERE order_date LIKE '%-13-%';

------------------------------------------------
-- DATA CLEANING & DATA TYPE STANDARDIZATION
------------------------------------------------

ALTER TABLE pizza_sales_data
MODIFY COLUMN unit_price DECIMAL(10,2),
MODIFY COLUMN total_price DECIMAL(10,2);

-- STANDARDIZING MIXED DATE FORMATS
UPDATE pizza_sales_data 
SET order_date = 
CASE
	WHEN order_date LIKE '%/%' THEN STR_TO_DATE(order_date, '%d/%m/%Y')
    WHEN order_date LIKE '%-%' THEN STR_TO_DATE(order_date, '%d-%m-%Y')
END;

-- CHANGING order_date to DATE
ALTER TABLE pizza_sales_data
MODIFY COLUMN order_date DATE;

-- MODIFYING REMAINING COLUMN DATA TYPES

ALTER TABLE pizza_sales_data
MODIFY COLUMN pizza_name_id VARCHAR(50),
MODIFY COLUMN pizza_size VARCHAR(10),
MODIFY COLUMN pizza_category VARCHAR(50),
MODIFY COLUMN pizza_ingredients VARCHAR(200), 
MODIFY COLUMN pizza_name VARCHAR(100),
MODIFY COLUMN order_time TIME;

-----------------------
-- KPI REQUIREMENTS

-- TOTAL REVENUE
SELECT SUM(total_price) AS Total_revenue
FROM pizza_sales_data;

-- Average Order Value
SELECT ROUND(SUM(total_price)/COUNT(DISTINCT order_id), 2) AS Average_order_value 
FROM pizza_sales_data;

-- Total pizzas Sold
SELECT SUM(quantity) AS Total_pizzas_sold
FROM pizza_sales_data;

-- Total Number of Orders
SELECT COUNT(DISTINCT order_id) AS total_number_of_orders 
FROM pizza_sales_data;

-- Average Pizzas Per Order
SELECT ROUND(SUM(quantity) / COUNT(DISTINCT order_id), 2) AS Average_pizzas_per_order
FROM pizza_sales_data;


--------------------------
-- CHART REQUIREMENTS

SELECT * FROM pizza_sales_data
ORDER BY pizza_id
LIMIT 10;

-- DAILY TREND FOR TOTAL ORDERS

SELECT DAYNAME(order_date) AS Day_of_the_week, COUNT(DISTINCT order_id) AS Total_orders_per_day
FROM pizza_sales_data
GROUP BY DAYNAME(order_date), WEEKDAY(order_date)
ORDER BY WEEKDAY(order_date);

-- MONTHLY TREND FOR TOTAL ORDERS

SELECT MONTHNAME(order_date) AS Month_of_the_year, COUNT(DISTINCT order_id) AS Total_orders_per_month
FROM pizza_sales_data
GROUP BY MONTHNAME(order_date), MONTH(order_date) 
ORDER BY MONTH(order_date);


-- PERCENTAGE SALES BY PIZZA CATEGORY
SELECT 
	pizza_category, 
    ROUND( (SUM(total_price)*100)/SUM(SUM(total_price)) OVER(), 2) AS Percentage_sales_by_Category
FROM pizza_sales_data
GROUP BY pizza_category;


-- PERCENTAGE SALES BY PIZZA SIZE

SELECT 
	pizza_size, 
    ROUND( (SUM(total_price)*100)/SUM(SUM(total_price)) OVER(), 2) AS Percentage_sales_by_pizza_size
FROM pizza_sales_data
GROUP BY pizza_size
ORDER BY Percentage_sales_by_pizza_size DESC;


-- TOTAL PIZZAS SOLD BY PIZZA CATEGORY
SELECT pizza_category, SUM(quantity) AS Total_pizzas_sold
FROM pizza_sales_data
GROUP BY pizza_category;


---------------------------------------------------------------
-- TOP 5 BEST Sellers by Revenue, Total Quantity and Total Orders
---------------------------------------------------------------
SELECT * FROM pizza_sales_data
LIMIT 10;
-- TOP 5 BEST SELLERS BY REVENUE
SELECT 
	pizza_name, 
    SUM(total_price) AS Total_revenue
FROM pizza_sales_data
GROUP BY pizza_name
ORDER BY Total_revenue DESC
LIMIT 5;

-- TOP 5 BEST SELLERS BY QUANTITY
SELECT 
	pizza_name, 
    SUM(quantity) AS Total_quantity
FROM pizza_sales_data
GROUP BY pizza_name
ORDER BY Total_quantity DESC
LIMIT 5;

-- TOP 5 BEST SELLERS BY TOTAL ORDERS
SELECT 
	pizza_name, 
    COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales_data
GROUP BY pizza_name
ORDER BY Total_orders DESC
LIMIT 5;


------------------------------------------------------------------------
-- BOTTOM 5 WORST SELLERS BY REVENUE, TOTAL QUANTITY AND TOTAL ORDERS
------------------------------------------------------------------------

-- BOTTOM 5 WORST SELLERS BY REVENUE
SELECT 
	pizza_name, 
    SUM(total_price) AS Total_revenue
FROM pizza_sales_data
GROUP BY pizza_name
ORDER BY Total_revenue
LIMIT 5;

-- BOTTOM 5 WORST SELLERS BY QUANTITY
SELECT 
	pizza_name, 
    SUM(quantity) AS Total_quantity
FROM pizza_sales_data
GROUP BY pizza_name
ORDER BY Total_quantity
LIMIT 5;

-- BOTTOM 5 WORST SELLERS BY TOTAL ORDERS
SELECT 
	pizza_name, 
    COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales_data
GROUP BY pizza_name
ORDER BY Total_orders
LIMIT 5;



