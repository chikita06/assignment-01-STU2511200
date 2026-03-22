## Anomaly Analysis

### Insert Anomaly

In the 'orders_flat' table, customer, product, sales representative, and order details are stored together in a single table.

Because of this structure, a new customer or product cannot be added independently.
For example, a new product (product_id = P009) cannot be inserted unless an order_id, customer details, and sales representative details are also provided.

This creates an **insert anomaly**, where inserting one type of data depends on unrelated data.
This violates the principle of storing independent entities separately.
---

### Update Anomaly

Columns involved: office_address, product_name

The column 'office_address' contains inconsistent values for the same sales representative.
For example, the same sales representative (SR01 - Deepak Joshi) has addresses recorded as:

* "Mumbai HQ, Nariman Point, Mumbai - 400021"
* "Mumbai HQ, Nariman Pt, Mumbai - 400021"

This inconsistency occurs because the same information is stored in multiple rows and updated partially.

Similarly, the column 'product_name' is repeated across many rows for the same product_id.
For example, products like Notebook and Pen Set appear multiple times.

If a product name or price needs to be updated, all rows must be modified.
If some rows are missed, inconsistent data will occur.

This results in an **update anomaly** due to redundant data storage.

---

### Delete Anomaly

The table stores all information in a single row, including product, customer, and order details.

If a row containing a unique product or customer is deleted, all associated information is also lost.
For example, if a product like P008 (Webcam) appears only once, deleting that row removes the product completely from the database.

This creates a **delete anomaly**, where deleting one record leads to unintended loss of important data.
This happens because all entities are stored in a single table instead of separate related tables.

---

### Final Tables in 3NF
- customers
- products
- sales_reps
- orders
- order_items

---

## Normalization Justification

Keeping all data in a single table may seem simple, but it creates problems in real usage. In the given dataset, customer, product, sales representative, and order details are stored together in one table. This leads to data repetition and inconsistency.

For example, the same sales representative can have slightly different office addresses across rows, and product details are repeated many times. If an update is needed, it must be made in multiple rows, which increases the chance of errors. Similarly, adding a new product or customer is not possible without creating an order, which makes the design inflexible.

Deletion also becomes risky. If a row is removed, important information like product or customer details may be lost if they exist only in that row.

Normalization solves these issues by dividing the data into separate tables such as customers, products, sales representatives, orders, and order_items. Each table stores only related data, reducing duplication and improving consistency.

Overall, normalization is not over-engineering but a necessary approach to ensure accurate, reliable, and maintainable data management.