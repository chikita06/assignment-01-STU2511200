## Database Recommendation

For a healthcare patient management system, I would recommend using MySQL as the primary database. In Part 1 of this assignment, we designed a relational schema and applied normalization, which reduced redundancy and ensured data consistency. This is critical in healthcare systems where patient records, prescriptions, and billing data must remain accurate. MySQL follows ACID properties, ensuring reliable transactions and maintaining data integrity even in case of system failures.

In Part 2, we implemented MongoDB, where we created JSON documents with nested structures and arrays, and performed operations such as insertMany, find, updateOne, and indexing. This demonstrated MongoDB’s strength in handling flexible and semi-structured data. It follows the BASE model, which prioritizes availability and scalability but allows eventual consistency.

According to the CAP theorem, MySQL prioritizes Consistency and Partition Tolerance (CP), making it suitable for systems requiring strict correctness. MongoDB generally favors Availability and Partition Tolerance (AP), which is useful for applications that require high scalability and fast performance.

If a fraud detection module is added, a hybrid approach would be more effective. MySQL can manage core transactional data, while MongoDB can be used to store and analyze large volumes of logs or behavioral data to detect anomalies efficiently.

In conclusion, based on both theoretical concepts and practical implementation in this assignment, MySQL is best suited for critical healthcare operations, while MongoDB complements it for scalable analytics and advanced features.