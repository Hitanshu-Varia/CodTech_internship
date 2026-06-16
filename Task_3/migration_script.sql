-- 3. Migrate the data from sakila to sakila_archive
INSERT INTO sakila_archive.customer_archive (
    customer_id, store_id, first_name, last_name, email, 
    address_id, active, create_date, last_update
)
SELECT 
    customer_id, store_id, first_name, last_name, email, 
    address_id, active, create_date, last_update
FROM sakila.customer;