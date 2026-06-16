# Task 3: Database Migration Report

## Objective
To safely migrate the `customer` dataset from the primary operational database (`sakila`) to a newly provisioned secondary storage database (`sakila_archive`) while guaranteeing zero data loss.

## Technical Methodology
1. **Schema Initialization:** Created a new destination database (`sakila_archive`) and replicated the exact table schema of the original `customer` table.
2. **Data Extraction & Loading (ETL):** Utilized an `INSERT INTO ... SELECT` query structure to execute a direct, server-side data transfer between the two distinct databases. 
3. **Integrity Verification:** Executed a UNION-based aggregate query to compare the total row counts of both the source and target tables post-migration.

## Integrity Results
* **Source Table Count:** 599 records
* **Target Table Count:** 599 records
* **Status:** SUCCESS. 100% data integrity maintained during the database migration process.