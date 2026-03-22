-- =========================================
-- ASSIGNMENT 02 - PART 3.1
-- STAR SCHEMA DESIGN
-- =========================================

-- =========================================
-- CREATE DATABASE
-- =========================================
CREATE DATABASE assignment_dw;
USE assignment_dw;

-- =========================================
-- DIMENSION TABLES
-- =========================================

-- Date Dimension
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE,
    day INT,
    month INT,
    year INT
);

-- Store Dimension
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    store_city VARCHAR(100)
);

-- Product Dimension
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);


-- =========================================
-- FACT TABLE
-- =========================================

-- Sales Fact Table
CREATE TABLE fact_sales (
    fact_id INT AUTO_INCREMENT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    units_sold INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(12,2),

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- =========================================
-- INSERT DATA INTO DIMENSION TABLES
-- =========================================

-- Date Data (cleaned)
INSERT INTO dim_date (date_id, full_date, day, month, year) VALUES
(1, '2023-08-29', 29, 8, 2023),
(2, '2023-12-12', 12, 12, 2023),
(3, '2023-02-05', 5, 2, 2023),
(4, '2023-02-20', 20, 2, 2023),
(5, '2023-01-15', 15, 1, 2023),
(6, '2023-08-09', 9, 8, 2023),
(7, '2023-03-31', 31, 3, 2023),
(8, '2023-10-26', 26, 10, 2023),
(9, '2023-12-08', 8, 12, 2023),
(10, '2023-08-15', 15, 8, 2023);

-- Store Data
INSERT INTO dim_store (store_id, store_name, store_city) VALUES
(1, 'Chennai Anna', 'Chennai'),
(2, 'Delhi South', 'Delhi'),
(3, 'Bangalore MG', 'Bangalore'),
(4, 'Pune FC Road', 'Pune');

-- Product Data (cleaned categories)
INSERT INTO dim_product (product_id, product_name, category) VALUES
(1, 'Speaker', 'Electronics'),
(2, 'Tablet', 'Electronics'),
(3, 'Phone', 'Electronics'),
(4, 'Smartwatch', 'Electronics'),
(5, 'Atta 10kg', 'Grocery'),
(6, 'Jeans', 'Clothing'),
(7, 'Biscuits', 'Grocery');

-- =========================================
-- INSERT DATA INTO FACT TABLE
-- =========================================

-- Fact Sales Data (10 cleaned rows)
INSERT INTO fact_sales 
(date_id, store_id, product_id, units_sold, unit_price, total_amount)
VALUES
(1, 1, 1, 3, 49262.78, 147788.34),
(2, 1, 2, 11, 23226.12, 255487.32),
(3, 1, 3, 20, 48703.39, 974067.80),
(4, 2, 2, 14, 23226.12, 325165.68),
(5, 1, 4, 10, 58851.01, 588510.10),
(6, 3, 5, 12, 52464.00, 629568.00),
(7, 4, 4, 6, 58851.01, 353106.06),
(8, 4, 6, 16, 2317.47, 37079.52),
(9, 3, 7, 9, 27469.99, 247229.91),
(10, 3, 4, 3, 58851.01, 176553.03);

-- =========================================
-- END OF PART 3.1
-- =========================================