# Task 2: Advanced Data Analysis Report

## Objective
The objective of this analysis was to identify revenue trends within the Sakila DVD rental database by isolating top-performing films and categorizing them by genre. 

## Technical Methodology
To extract this data, a complex SQL query was constructed utilizing three advanced techniques:
1. **CTEs (Common Table Expressions):** Implemented a CTE named `FilmRevenue` to cleanly aggregate raw transactional data across six different tables, calculating the total revenue grouped by film and category.
2. **Window Functions:** Utilized `RANK() OVER (PARTITION BY category_name ORDER BY total_revenue DESC)` to sequentially rank films within their respective categories without losing individual row data.
3. **Subqueries:** Integrated a subquery within the `WHERE` clause (`SELECT AVG(total_revenue) FROM FilmRevenue`) to dynamically calculate the global average revenue and filter the final dataset to only include above-average performers.

## Key Trends & Patterns Identified
* **Top Performers Dominate:** The query results indicate that a select few titles consistently out-earn the overall average, proving that revenue is heavily top-heavy in specific categories like Sports and Sci-Fi.
* **Category Rankings:** The Window Function successfully isolated the #1 and #2 revenue drivers per category, providing clear targets for future inventory purchasing decisions.