# Retail Sales Performance Analysis Using SQL
*Constructed a Data Pipeline with Python ETL and Performed SQL-Based Exploration*

### Overview
This project aims to analyze sales performance across different product categories, regions, and time periods using a structured dataset of retail orders. The objective is to uncover data-driven insights to inform strategic decision-making related to product performance, revenue growth, and regional trends.

### Data Acquisition and Processing
A complete ETL (Extract, Transform, Load) process was performed for this project:

Extract: The dataset was sourced using the Kaggle API.

Transform: Data cleaning and transformation tasks were conducted using Python. This included handling missing values, standardizing column formats, and preparing the data for structured analysis.

Load: The transformed dataset was loaded into Microsoft SQL Server, where relational modeling and indexing were applied to optimize query performance.

This pipeline enabled efficient data exploration and business-focused analysis via SQL.

### Tools and Technologies
Data Source: Kaggle Retail Orders Dataset


### Data Source: 
Kaggle – Global Retail Superstore Dataset

### Technologies Used:
- Python (ETL and Data Preprocessing)
- Kaggle API (Data Retrieval)
- MySQL Server (Data Storage and Analysis)
- MySQL Workbench (Queries, Window Functions, CTEs)

### Data Model
The dataset is stored in a single SQL table orders, with the following attributes:

- Order Details: order_id, order_date, ship_mode
- Customer Details: segment, country, city, state, postal_code, region
- Product Details: category, sub_category, product_id
- Financial Metrics: quantity, discount, sale_price, profit

### Analytical Queries Performed
- Top 10 Revenue-Generating Sub-Categories:
Identified product sub-categories contributing the most to overall revenue using GROUP BY and SUM().

- Top 5 Highest-Selling Products in Each Region:
Employed both window functions and Common Table Expressions (CTEs) to rank products based on regional sales performance.

- Month-over-Month Sales Growth (2022 vs 2023):
Calculated growth trends for each month across two consecutive years using LAG() and partitioned window functions.

- Peak Sales Month by Product Category: 
Determined which month yielded the highest sales within each product category using RANK().

- Sub-Category with Highest Profit Growth (2023 vs 2022): 
Analyzed year-over-year profit growth by sub-category using window functions to compare performance across time.

### Key Insights: 
- Chairs and Phones are the most lucrative sub-categories, contributing the highest revenue.
- Product demand varies significantly by region, with certain SKUs showing strong regional loyalty and performance.
- February showed the highest growth at 64.78%, while June and November saw major declines. This suggests opportunities to explore promotions or seasonal factors influencing sales drops.
- Seasonal peaks vary by category, indicating potential for targeted marketing strategies by product type.
- Supplies experienced the highest profit growth from 2022 to 2023, suggesting increased demand or margin optimization.

### Conclusion
This project demonstrates the effective use of SQL for deriving meaningful business insights from retail transaction data. By combining EDA with advanced query techniques, this analysis supports data-driven recommendations for optimizing product strategy and regional marketing efforts.


