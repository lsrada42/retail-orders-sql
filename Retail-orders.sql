USE Orders;
DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
		order_id int primary key,
        order_date date, 
        ship_mode varchar(20), 
        segment varchar(20),
        country varchar(20),
        city varchar(20),
        state varchar(20),
        postal_code varchar(20),
        region varchar(20),
        category varchar(20),
        sub_category varchar(20),
        product_id varchar(50),
        quantity int,
        discount decimal(7,2),
        sale_price decimal(10,2),
        profit decimal(7,2)
      );
      
      
      
-- Find top 10 highest revenue generationg product sub categories: 

SELECT sub_category as 'product_category', SUM(sale_price) as 'total_revenue'
FROM orders
GROUP BY sub_category
ORDER BY total_revenue DESC
LIMIT 10; 

-- Find top 5 highest selling products in each region 

#Method 1
SELECT region, product_id, revenue
FROM (
	SELECT region, product_id, 
    SUM(sale_price) as revenue, 
    RANK() OVER(PARTITION BY region ORDER BY SUM(sale_price) DESC) as ranks
    FROM orders
    GROUP BY region, product_id
    ) AS ranked 
WHERE ranks <= 5; 

#Cte method
WITH cte AS (
	SELECT region, product_id, SUM(sale_price) as revenue
    FROM orders
    GROUP BY region, product_id
    )
SELECT region, product_id,revenue FROM (
	SELECT *,
	RANK() OVER(PARTITION BY region ORDER BY revenue DESC)  AS rn
	FROM cte) as ranked
    WHERE rn <= 5; 

-- Find month over month growth comparison for 2022 and 2023 sales eg: jan 2022 vs jan 2023

WITH cte AS (
SELECT YEAR(order_date) as year, MONTH(order_date) AS month, SUM(sale_price) as total_sales
	FROM orders
	GROUP BY YEAR(order_date), MONTH(order_date)
	ORDER BY month, year
    )
SELECT month, SUM(growth) as growth_rate
	FROM (
		SELECT month, year, 
		COALESCE((total_sales - LAG(total_sales) OVER(PARTITION BY month ORDER BY year))/ LAG(total_sales) 
		OVER (PARTITION BY month ORDER BY year),0) AS growth
		FROM cte
		) t
    GROUP BY month; 
	
-- For each category which month had the highest sales 

SELECT category, year, month, total_revenue
FROM (
	SELECT category, YEAR(order_date) as year, 
    MONTH(order_date) as month, SUM(sale_price) as total_revenue, 
    RANK() OVER(PARTITION BY category ORDER BY SUM(sale_price) DESC) as ranks
	FROM orders
	GROUP BY category, MONTH(order_date),YEAR(order_date)
    ) t
WHERE ranks = 1; 
    
-- Which sub category had the highest growth by profit in 2023 compared to 2022

SELECT sub_category, year, 
(total_profit - LAG(total_profit) OVER(PARTITION BY sub_category)) / 
LAG(total_profit) OVER(PARTITION BY sub_category)*100  AS growth
FROM (
	SELECT sub_category,YEAR(order_date) as year, SUM(profit) as total_profit
	FROM orders
	GROUP BY sub_category, YEAR(order_date)
	ORDER BY sub_category, year
    ) t
ORDER BY growth DESC
LIMIT 1;
    








