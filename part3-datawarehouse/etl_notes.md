## ETL Decisions

### Decision 1 – Standardizing Date Formats
**Problem:**  
The raw dataset contained inconsistent date formats such as 'DD/MM/YYYY', 'DD-MM-YYYY', and 'YYYY-MM-DD'. This inconsistency makes it difficult to perform time-based analysis and grouping in SQL queries.

**Resolution:**  
All dates were converted into a standard 'YYYY-MM-DD' format before inserting into the 'dim_date' table. This ensures consistency and allows correct extraction of day, month, and year for analytical queries.

### Decision 2 – Standardizing Category Values
**Problem:**  
The 'category' column had inconsistent values such as 'electronics', 'Electronics', 'Groceries', and 'Grocery'. This leads to incorrect aggregation results when grouping by category.

**Resolution:**  
All category values were standardized into a consistent format:
- 'electronics' → 'Electronics'
- 'Groceries' → 'Grocery'  
This ensured accurate grouping and reporting in analytical queries.

### Decision 3 – Handling Missing Values
**Problem:**  
Some records had missing or NULL values in fields like 'store_city'. Missing values can break joins and reduce data quality in the warehouse.

**Resolution:**  
Missing values were handled by replacing them with a default value such as '"Unknown"' or by inferring the correct value where possible. This ensured that all dimension tables maintain referential integrity and no NULL values affect analysis.