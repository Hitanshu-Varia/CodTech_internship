-- 1. INNER JOIN (Matches customers to their addresses)

SQL
SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    a.address 
FROM customer c
INNER JOIN address a 
    ON c.address_id = a.address_id;

-- 2. LEFT JOIN (All customers, plus their addresses if they exist)

SQL
SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    a.address 
FROM customer c
LEFT JOIN address a 
    ON c.address_id = a.address_id;


-- 3. RIGHT JOIN (All addresses in the system, plus customers if they are linked)

SQL
SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    a.address 
FROM customer c
RIGHT JOIN address a 
    ON c.address_id = a.address_id;


-- 4. FULL JOIN (MySQL doesn't support FULL JOIN natively, so we use a UNION to combine LEFT and RIGHT joins)

SQL
SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    a.address 
FROM customer c
LEFT JOIN address a 
    ON c.address_id = a.address_id
UNION
SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    a.address 
FROM customer c
RIGHT JOIN address a 
    ON c.address_id = a.address_id;