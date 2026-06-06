# Pizza-Sales-Dashboard-Analysis
## Project Overview
This Project Analyzes pizza sales data using **MySQL** and **Power BI** to gain business insights into sales perofrmance, customer ordering behavior, product trends, and time-based sales patterns.

The project includes:
- Data cleaning and preprocessing in MySQL
- KPI calculations using SQL
- Interactive dashboard creation in Power BI
- DAX calculations and custom analysis
- Business insights and trend analysis

---

# Problem Statement
The objective of this project is to analyze pizza sales data and identify key business insights such as:
- Total Revenue
- Average Order Value
- Total Orders
- Total Pizzas Sold
- Average Pizzas Per Order
- Daily and Monthly order Trends
- Sales Distribution by Pizza Category and Size
- Top & Bottom Performing Pizzas
- Customer ordering Behavior by Time Period

---

# Tools & Technologies Used
- MySQL
- Power BI
- DAX
- SQL
- Data Cleaning
- Data Visualization

---

# Data Cleaning & Preprocessing
Peformed multiple data cleaning and preprocessing steps in MySQL:
- Standardized mixed date formats using `STR_TO_DATE()`
- Converted `order_date` column into DATE datatype
- Coverted `order_time` column into TIME datatype
- Modified price columns to `DECIMAL(10,2)`
- Changed text columns into appropriate `VARCHAR` sizes
- Validated day-first date formats using SQL inspection queries

---

# KPI Requirements
The following KPIs were calculated:
1. Total Revenue
2. Average Order Value
3. Total Pizzas Sold
4. Total Orders
5. Average Pizzas Per Order

---

# Dashboard Pages

## 1. Home Dashboard
Includes:
- KPI cards
- Daily Trend for Total Orders
- Montly Trend for Total Orders
- Sales Percentage by Pizza Category
- Sales Percentage by Pizza Size
- Total Pizzas Sold by Category
- Business insights panel

---
## 2. Best/Worst Sellers Analysis
Includes:
- Top 5 Pizzas by Revenue
- Top 5 Pizzas by Quantity
- Bottom 5 Pizzas by Revenue
- Bottom 5 Pizzas by Quantity
- Bottom 5 Pizzas by Total Orders

---
## 3. Time Period Analysis
Analysis page focused on customer ordering behavior across different time periods.
Includes:
- Day-wise filtering using slicers
- Total Orders by Time Period
- Selected Day orders analysis
- Customer ordering behavior analysis across Day, Evening, and Night periods

---

# Key Insights
- Classic Category generated the highest sales and pizza sales volume.
- Large-size pizzas generated the highest sales.
- Orders were highest during daytime, while evening orders also contributed significantly.
- Friday and Saturday recorded higher ordering activity.
- Maximum orders were recorded during July and January
- The Classic Deluxe Pizza recorded the highest quantity sold and total orders.
- The Brie Caree Pizza generated the lowest revenue and lowest order volume.

# Dashboard Features
- Developed interactive multi-page Power BI dashboards for sales and customer behavior analysis
- Added Time Period Analysis to evalute cusomter ordering trends across different periods of the day
- Developed custom DAX calculation to support time-based sales analysis
- Implemented interactive slicers, navigation buttons, and custom dashboard navigation
- Created business insight panels for trend interpretation and performance analysis
