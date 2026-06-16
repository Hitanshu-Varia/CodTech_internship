-- 4. Verify Data Integrity (Row Counts)
SELECT 'Source DB (sakila)' AS Database_Name, COUNT(*) AS Total_Customers FROM sakila.customer
UNION
SELECT 'Target DB (sakila_archive)' AS Database_Name, COUNT(*) AS Total_Customers FROM sakila_archive.customer_archive;