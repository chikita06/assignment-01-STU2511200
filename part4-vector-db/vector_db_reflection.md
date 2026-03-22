## Vector DB Use Case

A traditional keyword-based database search would not be sufficient for searching large legal documents such as 500-page contracts. Keyword search relies on exact word matching and cannot understand the meaning or context of a query. For example, if a user searches for “termination clauses,” a keyword-based system may miss relevant sections that use different wording like “contract ending conditions.”

Vector databases solve this problem by using embeddings to capture the semantic meaning of text. In this approach, both the query and the document content are converted into numerical vectors using models like sentence-transformers. These vectors represent the meaning of the text rather than just the words.

When a user asks a question in plain English, the system converts the query into a vector and compares it with vectors of document sections using similarity measures such as cosine similarity. This allows the system to retrieve the most relevant sections even if they do not contain the exact keywords.

A vector database is particularly useful for handling large volumes of unstructured text and enabling semantic search. It improves accuracy, flexibility, and user experience compared to traditional methods.

In conclusion, a keyword-based database alone is not sufficient for this use case. A vector database plays a crucial role by enabling semantic search, making it possible to find relevant information based on meaning rather than exact word matches.