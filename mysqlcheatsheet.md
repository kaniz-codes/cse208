#  MySQL Cheetsheet by Kaniz Fatema
Here's a list of general SQL queries we've used in our lab so far.

## SQL Quries & Relational Algebra

### 1. Database Operations 

| Operation        | SQL Command                   |
|------------------|-------------------------------|
| Create Database  | `CREATE DATABASE DB_name;`    |
| Delete Database  | `DROP DATABASE DB_name;`      |

### 2. Table Operations

| Operation               | SQL Command                                                                  |
|-------------------------|------------------------------------------------------------------------------|
| Create Table            | `CREATE TABLE table_name (...);`                                             |
| Insert Data Into Table  | `INSERT INTO tbl_name VALUES (...);`                                         |
| Rename Column Name      | `ALTER TABLE tbl_name CHANGE old_col_name new_col_name new_data_type;`       |
| Delete Column Data      | `DELETE FROM tbl_name WHERE condition;`                                      |
| Delete Row Data         | `DELETE FROM tbl_name WHERE condition;`                                      |


### 3. Keys

| Operation                     | SQL Command                                                                           |
|-------------------------------|---------------------------------------------------------------------------------------|
| Define Primary Key (create)   | `CREATE TABLE table_name (col_name data_type, PRIMARY KEY(col_name));`                |
| Add Primary Key (after)       | `ALTER TABLE table_name ADD PRIMARY KEY (col_name);`                                  |
| Define Composite Primary Key  | `CREATE TABLE table_name (col1 data_type, col2 data_type, PRIMARY KEY (col1, col2));` |
| Add Composite Primary Key     | `ALTER TABLE table_name ADD PRIMARY KEY (col1, col2);`                                |
| Drop Primary Key              | `ALTER TABLE table_name DROP PRIMARY KEY;`                                            |

### 4. String Functions

| Operation                           | SQL Command                                       | Relational Algebra                       |
|-----------------------------------|----------------------------------------------------------|--------------------------------------------------|
| Find string length                  | `SELECT LENGTH('Kaniz');`                                | Not typically represented in relational algebra  |
| Get first 3 characters of a string  | `SELECT SUBSTR('Kaniz', 1, 3);`                          | Not typically represented in relational algebra  |
| Starts with (LIKE)                  | `SELECT * FROM table_name WHERE column_name LIKE 'A%';`  | σ_{column_name LIKE 'A%'} (table_name)           |
| Ends with (LIKE)                    | `SELECT * FROM table_name WHERE column_name LIKE '%Z';`  | σ_{column_name LIKE '%Z'} (table_name)           |
| Contains (LIKE)                     | `SELECT * FROM table_name WHERE column_name LIKE '%AI%';`| σ_{column_name LIKE '%AI%'} (table_name)          |


### 5. Filter Data

| Operation                    | SQL Command                                                     | Relational Algebra                                     |
|-----------------------------|------------------------------------------------------------------|--------------------------------------------------------|
| Filter using WHERE           | `SELECT * FROM table_name WHERE column_name = 'value';`          | σ_{column_name = 'value'} (table_name)                  |
| Filter with IN               | `SELECT * FROM table_name WHERE column_name IN ('A', 'B', 'C');` | σ_{column_name ∈ {'A', 'B', 'C'}} (table_name)          |
| Filter with NOT IN           | `SELECT * FROM table_name WHERE column_name NOT IN ('X', 'Y');`  | σ_{column_name ∉ {'X', 'Y'}} (table_name)                |
| Filter with >, <, >=, <=     | `SELECT * FROM table_name WHERE column_name > 100;`              | σ_{column_name > 100} (table_name)                        |
| Filter with AND, OR          | `SELECT * FROM table_name WHERE age > 18 AND city = 'Dhaka';`    | σ_{age > 18 ∧ city = 'Dhaka'} (table_name)               |
| Filter with BETWEEN          | `SELECT * FROM table_name WHERE age BETWEEN 18 AND 30;`          | σ_{age ≥ 18 ∧ age ≤ 30} (table_name)                     |
| Filter with LIKE             | `SELECT * FROM table_name WHERE name LIKE 'A%';`                 | σ_{name LIKE 'A%'} (table_name) (expressed as selection) |


### 6. COUNT Function

| Operation                         | SQL Command                                         | Relational Algebra                                 |
|----------------------------------|------------------------------------------------------|----------------------------------------------------|
| Count all rows in a table         | `SELECT COUNT(*) FROM table_name;`                   | `G_{COUNT(*)}(table_name)`                          |
| Count non-null values in a column | `SELECT COUNT(column_name) FROM table_name;`         | `G_{COUNT(column_name)}(table_name))`               |
| Count with condition              | `SELECT COUNT(*) FROM table_name WHERE age > 18;`    | `G_{COUNT(*)}(σ_{age > 18}(table_name))`           |



### 7. Union and Intersection Operations

| Operation                   | SQL Command Example                                                              | Relational Algebra Example                      |
|-----------------------------|---------------------------------------------------------------------------------|------------------------------------------------|
| Union of tables             | `SELECT * FROM table1 UNION SELECT * FROM table2;`                              | `table1 ∪ table2`                               |
| Union with condition        | `SELECT * FROM table1 WHERE age > 18 UNION SELECT * FROM table2 WHERE age > 18;` | `σ_{age > 18}(table1) ∪ σ_{age > 18}(table2)` |
| Intersection of tables      | `SELECT * FROM table1 INTERSECT SELECT * FROM table2;`                          | `table1 ∩ table2`                               |
| Intersection with condition | `SELECT * FROM table1 WHERE age > 18 INTERSECT SELECT * FROM table2 WHERE age > 18;` | `σ_{age > 18}(table1) ∩ σ_{age > 18}(table2)` |



### Join Operations

| Operation              | SQL Command Example                                                       | Relational Algebra Example                        |
|------------------------|---------------------------------------------------------------------------|--------------------------------------------------|
| Natural Join           | `SELECT * FROM table1 NATURAL JOIN table2;`                              | `π_column1, column2 (table1 ⨝ table2)`    |
| Inner Join             | `SELECT * FROM table1 INNER JOIN table2 ;`       | `π_column1, column2 (table1 ⟗ table2)`         |
| Left Outer Join        | `SELECT * FROM table1 LEFT OUTER JOIN table2;`  | `π_column1, column2 (table1 ⟕ table2)`         |
| Right Outer Join       | `SELECT * FROM table1 RIGHT OUTER JOIN table2 ;` | `π_column1, column2 (table1 ⟖ table2)`         |
| Cartesian Product      | `SELECT * FROM table1, table2 WHERE table1.id = table2.id;`              | `π_{table1.id = table2.id}(table1 × table2)`      |

### Projection Operation

| Operation            | SQL Command Example                                | Relational Algebra Example               |
|----------------------|---------------------------------------------------|-----------------------------------------|
| Project specific columns | `SELECT column1, column2 FROM table_name;`        | `π_{column1, column2}(table_name)`      |


