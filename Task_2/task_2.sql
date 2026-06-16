USE sakila;

-- Requirement 1: CTE (Common Table Expression) 
-- We use this to gather the raw total revenue for every single film.
WITH FilmRevenue AS (
    SELECT 
        c.name AS category_name,
        f.title AS film_title,
        SUM(p.amount) AS total_revenue
    FROM payment p
    JOIN rental r ON p.rental_id = r.rental_id
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON i.film_id = f.film_id
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    GROUP BY c.name, f.title
)

-- The Main Query
SELECT 
    category_name,
    film_title,
    total_revenue,
    
    -- Requirement 2: Window Function
    -- This ranks the films from #1 downwards within their specific category based on money made.
    RANK() OVER (PARTITION BY category_name ORDER BY total_revenue DESC) AS category_rank
    
FROM FilmRevenue

-- Requirement 3: Subquery
-- We use a subquery in the WHERE clause to filter out underperforming movies.
-- This ensures we only look at films that made MORE than the overall average.
WHERE total_revenue > (
    SELECT AVG(total_revenue) FROM FilmRevenue
)
LIMIT 20;