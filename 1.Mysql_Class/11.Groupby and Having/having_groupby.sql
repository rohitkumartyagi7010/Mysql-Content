-- Step 1: Create the database
Drop database if exists having_groupby;
create database having_groupby;
use having_groupby;

CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(50),
    sale_date DATE,
    quantity INT,
    price_per_unit DECIMAL(10, 2)
);

INSERT INTO sales (product_name, sale_date, quantity, price_per_unit) VALUES
('Product A', '2023-09-01', 10, 15.50),
('Product B', '2023-09-01', 5, 22.75),
('Product A', '2023-09-02', 7, 15.50),
('Product C', '2023-09-03', 3, 12.40),
('Product B', '2023-09-03', 8, 22.75),
('Product A', '2023-09-04', 12, 15.50),
('Product C', '2023-09-04', 9, 12.40);

select * from sales;

-- groups the sales by product_name, calculates the total quantity sold for each product,

SELECT product_name, SUM(quantity) AS total_quantity
FROM sales
GROUP BY product_name;


-- groupe by product_name, only for "product A".

SELECT product_name, SUM(quantity) AS total_quantity
FROM sales
WHERE product_name = "product A"
GROUP BY product_name;

SELECT product_name, SUM(quantity) AS total_quantity
FROM sales
WHERE product_name = "product A" or product_name = "product B"
GROUP BY product_name;

-- grouping entire column with specific condition
-- and filters the result using HAVING to show only products where the total quantity sold is greater than 10.

-- GROUP BY product_name: Groups the results by product.
-- SUM(quantity): Calculates the total quantity sold for each product.
-- HAVING total_quantity > 10: Filters the groups where the total quantity exceeds 10.

SELECT product_name, SUM(quantity) AS total_quantity
FROM sales
GROUP BY product_name
HAVING total_quantity > 10;

-- You can perform several operations using GROUP BY and HAVING clauses in MySQL to aggregate data in meaningful ways. Here are some common operations:
-- 1. COUNT

 -- Get the count of sales for each product, showing only products with more than 2 sales.
 
SELECT product_name, COUNT(sale_id) AS sale_count
FROM sales
GROUP BY product_name
HAVING sale_count > 2;

-- 2. AVG (Average)
-- Get the average price per unit for each product and filter products with an average price greater than 15.
SELECT product_name, AVG(price_per_unit) AS avg_price
FROM sales
GROUP BY product_name
HAVING avg_price > 15;

-- 3. MAX (Maximum)
-- Get the maximum quantity sold for each product, and show products that had a sale of more than 10 units in one transaction.

SELECT product_name, MAX(quantity) AS max_quantity
FROM sales
GROUP BY product_name
HAVING max_quantity > 10;


-- 4. MIN (Minimum)
-- Get the minimum quantity sold for each product and show only products where the minimum quantity sold is more than 5 units.


SELECT product_name, MIN(quantity) AS min_quantity
FROM sales
GROUP BY product_name
HAVING min_quantity > 5;

-- 5. SUM with additional conditions
-- You can use SUM with additional WHERE clauses for more complex filters.

-- Example: Get the total revenue (quantity * price_per_unit) for each product and show products where the total revenue exceeds $200.

SELECT product_name, SUM(quantity * price_per_unit) AS total_revenue
FROM sales
GROUP BY product_name
HAVING total_revenue > 200;

-- 6. Combining Multiple Aggregations
-- You can combine multiple aggregate functions like SUM, AVG, COUNT, etc., in the same query.

-- Example: Get the total quantity sold, average price per unit, and total number of sales for each product,
-- and show products with more than 2 sales and an average price over 15.

SELECT product_name, 
       SUM(quantity) AS total_quantity, 
       AVG(price_per_unit) AS avg_price, 
       COUNT(sale_id) AS sale_count
FROM sales
GROUP BY product_name
HAVING sale_count > 2 AND avg_price > 15;


-- 7. Using WHERE with GROUP BY
-- The WHERE clause can be used to filter records before grouping, while HAVING filters after grouping.

-- Example: Get the total quantity sold for each product for sales made after 2023-09-01, and filter products with total sales greater than 10 units.

SELECT product_name, SUM(quantity) AS total_quantity
FROM sales
WHERE sale_date > '2023-09-01'
GROUP BY product_name
HAVING total_quantity > 10;






 









