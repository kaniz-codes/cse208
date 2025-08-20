#  MySQL  
Here's a list of general SQL queries we've used in our lab so far.

To navigate, open your browser (Google Chrome or Firefox) and go to -->

```
http://localhost/phpmyadmin/
```
## Table of Contents

### 1. Database Operations
- [Create Database](#create-database)  
- [Delete Database](#delete-database)

### 2. Table Operations
- [Create Table](#create-table)  
- [Insert Data Into Table](#inserting-data-into-table)  
- [Rename Column Name](#rename-column-name)  
- [Delete Column Data](#deleting-column-data)  
- [Delete Row Data](#deleting-row-data)

### 3. Keys
#### Primary Key
- [When creating table](#when-table-creation)  
- [After table creation](#after-table-creation)  

#### Composite Primary Key (Multiple Columns)
- [When creating table](#when-table-creation-1)  
- [After table creation](#after-table-creation-1)  
- [Drop a Primary Key](#drop-a-primary-key)

### 4. String Functions
- [Find String Length](#find-string-length)  
- [Get First 3 Characters of a Name](#get-first-3-characters-of-a-name)  
- [Pattern Matching](#pattern-matching)  
- [LENGTH Function](#length-function)  
- [SUBSTR for Substring](#substr-for-substring)

### 5. Filter Data
- [Filtering Using IN](#filtering-using-in)  
- [Filtering Using NOT IN](#filtering-using-not-in)  
- [Filtering with WHERE Clause](#filtering-with-where-clause)

### 6. COUNT Function
- [Count Rows or Columns](#count-function)

## 1. Create Database
```sql
CREATE DATABASE DB_name;
```
## Delete Database
```sql
DROP DATABASE DB_name;
```

## Create Table

```sql
CREATE TABLE table_name (
    col1 datatype,
    col2 datatype,
    ...
);
```
> **Note: Data Types**
> 
> - `INT(n)`: Whole numbers (up to 11 digits)
> - `CHAR(n)`: Fixed-length text (up to 255 characters)
> - `VARCHAR(n)`: Variable-length text (up to 65,535 bytes)
> - `FLOAT(n.m)`: Decimal numbers (approximate precision).  
>   Here, **n** = total digits, **m** = digits after the decimal point.

## Inserting Data Into Table
```sql
INSERT INTO tbl_name VALUES (value1, value2, ...);
```

## Rename Column Name

```sql
ALTER TABLE tbl_name CHANGE old_col_name new_col_name new_data_type;
```

> This changes the column `c_street` to `customer_street` with a new data type of `VARCHAR(50)`.

## Deleting Column Data

```sql
DELETE FROM tbl_name WHERE condition;
```
## Primary Key 
### When table creation:
Here, `customer_name` is declared as the primary key during table creation.

```sql
CREATE TABLE tbl_name 
(
    col1_name VARCHAR(30) PRIMARY KEY,
    col2_name VARCHAR(20),
    col3_name VARCHAR(30)
);

```
###  After table creation:
```sql
ALTER TABLE tbl_name ADD PRIMARY KEY(col_name);
```

## Composite Primary Key (Multiple Columns) 
### When table creation:
```sql
ALTER TABLE tbl_name ADD PRIMARY KEY (col_name, col_number);
```
> This ensures that each combination of `customer_name` and `account_number` is unique.

###  After table creation:
```sql
ALTER TABLE tbl_name ADD PRIMARY KEY (column1, column2);
```
## Drop a Primary Key
To remove a primary key from a table:
```sql
ALTER TABLE table_name DROP PRIMARY KEY;
```
## String Functions
###  Find String Length
```sql
SELECT col_name, LENGTH(col_name) FROM tbl_name;
```
###  Get First 3 Characters of a Name
```sql
SELECT col_name, SUBSTR(col_name, 1, 3) FROM tbl_name;
```
### Pattern Matching
***Starts with:***
```sql
WHERE col_name LIKE 'A%'
```
***Ends with:***
```sql
WHERE col_name LIKE '%s'
```
***Specific position:***
```sql
WHERE col_name LIKE '_o%'
```
### LENGTH Function

```sql
SELECT col_name, LENGTH(col_name) FROM tbl_name;
```
### SUBSTR for Substring

```sql
SELECT col_name, SUBSTR(col_name, start, length) FROM tbl_name;
```
## Filter Data
###  Filtering Using IN
```sql
SELECT col_name FROM tbl_name WHERE col_name IN (value1, value2, ...);
```
###  Filtering with WHERE Clause
```sql
SELECT col_name FROM tbl_name WHERE condition;
```
### Filtering Using NOT IN
```sql
SELECT col_name FROM tbl_name WHERE col_name NOT IN (value1, value2, ...);
```
## COUNT Function

```sql
SELECT COUNT(col_name) FROM tbl_name;
```