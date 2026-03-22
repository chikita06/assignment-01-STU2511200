-- Q1: List all customers along with total number of orders

SELECT 
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders
FROM read_csv_auto('customers.csv') c
LEFT JOIN read_json_auto('orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_orders DESC;


-- Q2: Find top 3 customers by total order value

SELECT 
    c.customer_id,
    c.name,
    SUM(o.total_amount) AS total_value
FROM read_csv_auto('customers.csv') c
JOIN read_json_auto('orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_value DESC
LIMIT 3;


-- Q3: List all orders placed by customers from Bangalore

SELECT 
    c.name,
    o.order_id,
    o.total_amount
FROM read_csv_auto('customers.csv') c
JOIN read_json_auto('orders.json') o
ON c.customer_id = o.customer_id
WHERE c.city = 'Bangalore';


-- Q4: Join all three files (using CROSS JOIN due to missing product_id)

SELECT 
    c.name,
    o.order_date,
    p.product_name,
    o.num_items
FROM read_csv_auto('customers.csv') c
JOIN read_json_auto('orders.json') o
ON c.customer_id = o.customer_id
CROSS JOIN read_parquet('products.parquet') p
LIMIT 20;