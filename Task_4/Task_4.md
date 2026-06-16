# Task 4: Database Backup and Recovery Documentation

## Objective
To implement a reliable disaster recovery protocol by creating a full database backup and successfully restoring the data following a simulated catastrophic failure.

## Tools Used
* **Database Engine:** MySQL 8.0
* **CLI Utilities:** `mysqldump` (Logical Backup) and `mysql` (Client Import)

## Phase 1: The Backup Process
A logical backup of the `sakila_archive` database was generated via the command line interface. This extracted the schema structures and row data into a standalone `.sql` dump file.
**Execution Script:**
`mysqldump -u root -p sakila_archive > sakila_archive_backup.sql`

## Phase 2: Failure Simulation
To test the integrity of the backup, a catastrophic failure was manually induced by dropping the live database entirely from the server using the `DROP DATABASE sakila_archive;` command in MySQL Workbench. An empty database shell was then created to act as the recovery target.

## Phase 3: The Recovery Process
The data was successfully restored by piping the `.sql` backup file back into the empty target database via the MySQL client utility. 
**Execution Script:**
`mysql -u root -p sakila_archive < sakila_archive_backup.sql`

## Conclusion
**Status:** SUCCESS. 
Post-recovery verification confirmed that all tables and records were restored to their exact pre-failure state with zero data corruption.