-- Simulate catastrophic failure by dropping the database
DROP DATABASE sakila_archive;

-- Create an empty shell database to receive the restored data
CREATE DATABASE sakila_archive;