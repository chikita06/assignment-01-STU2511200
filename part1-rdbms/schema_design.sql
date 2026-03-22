-- Name: Chikita
-- Assignment: RDBMS Assignment 02
-- ===========================
-- PART 1.2: 3NF SCHEMA DESIGN
-- ===========================
-- Create Database
CREATE DATABASE assignment02_3nf;
USE assignment02_3nf;
-- Table CUSTOMERS
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name TEXT NOT NULL,
    customer_email TEXT NOT NULL,
    customer_city TEXT NOT NULL
);
-- Table PRODUCTS
CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name TEXT NOT NULL,
    category TEXT NOT NULL,
    unit_price DOUBLE NOT NULL
);
-- Table SALES REPRESENTATIVES
CREATE TABLE sales_reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name TEXT NOT NULL,
    sales_rep_email TEXT NOT NULL,
    office_address TEXT NOT NULL
);
-- Table ORDERS
CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    sales_rep_id VARCHAR(10),
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);
-- Table ORDER ITEMS
CREATE TABLE order_items (
    order_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
-- INSERT SAMPLE DATA
-- CUSTOMERS
INSERT INTO customers VALUES
('C001','Rohan Mehta','rohan@gmail.com','Mumbai'),
('C002','Priya Sharma','priya@gmail.com','Delhi'),
('C003','Amit Verma','amit@gmail.com','Bangalore'),
('C004','Sneha Iyer','sneha@gmail.com','Chennai'),
('C005','Vikram Singh','vikram@gmail.com','Mumbai');
-- PRODUCTS
INSERT INTO products VALUES
('P001','Laptop','Electronics',55000),
('P002','Mouse','Electronics',800),
('P003','Desk Chair','Furniture',8500),
('P004','Notebook','Stationery',120),
('P005','Headphones','Electronics',3200);
-- SALES REPRESENTATIVES
INSERT INTO sales_reps VALUES
('SR01','Deepak Joshi','deepak@corp.com','Mumbai HQ'),
('SR02','Anita Desai','anita@corp.com','Delhi Office'),
('SR03','Ravi Kumar','ravi@corp.com','Bangalore Office'),
('SR04','Karan Shah','karan@corp.com','Chennai Office'),
('SR05','Neha Kapoor','neha@corp.com','Hyderabad Office');
-- ORDERS
INSERT INTO orders VALUES
('ORD1001','C001','SR01','2023-07-24'),
('ORD1002','C002','SR02','2023-01-17'),
('ORD1003','C003','SR03','2023-03-07'),
('ORD1004','C004','SR04','2023-05-16'),
('ORD1005','C005','SR05','2023-04-18');
-- ORDER ITEMS
INSERT INTO order_items VALUES
('ORD1001','P001',1),
('ORD1002','P005',2),
('ORD1003','P003',1),
('ORD1004','P002',3),
('ORD1005','P004',5);
-- ALL CREATED TABLES
SHOW TABLES;
-- SHOW TABLE 
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM order_items;
SELECT * FROM products;
SELECT * FROM sales_reps;
-- ALL TABLES INSERTED ROW COUNT
SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'sales_reps', COUNT(*) FROM sales_reps
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items;