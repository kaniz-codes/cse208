#  MySQL  
Here's a list of general SQL queries we've used in our lab so far.

To navigate, open your browser (Google Chrome or Firefox) and go to -->
```
http://localhost/phpmyadmin/
```

## Table of Contents

## 📑 Table of Contents

1. [Create Database](#1-create-database)  
2. [Create Table](#2-create-table)  
3. [Inserting Data Into Table](#3-inserting-data-into-table)  
4. [Change Column Name](#4-change-column-name)  
5. [Deleting Row Data](#5-deleting-column-data)  
6. [Primary Key](#6-primary-key)  
   - [When creating table](#when-table-creation)  
   - [After table creation](#after-table-creation)  
7. [Composite Primary Key (Multiple Columns)](#7-composite-primary-key-multiple-columns)  
   - [When creating table](#when-table-creation-1)  
   - [After table creation](#after-table-creation-1)  
8. [Drop a Primary Key](#8-drop-a-primary-key)  
9. [String Functions](#9-string-functions)  
   - [Find String Length](#find-string-length)  
   - [Get First 3 Characters of a Name](#get-first-3-characters-of-a-name)  
   - [Pattern Matching](#pattern-matching)  
   - [LENGTH Function](#length-function)  
   - [SUBSTR for Substring](#substr-for-substring)  
10. [Filter Data](#10-filter-data)  
    - [Filtering Using IN](#filtering-using-in)  
    - [Filtering with WHERE Clause](#filtering-with-where-clause)  
    - [Filtering Using NOT IN](#filtering-using-not-in)  
11. [COUNT Function](#11-count-function)

## 1. Create Database
```sql
CREATE DATABASE database_name;
```
**Example:**
```sql
CREATE DATABASE Kaniz_154;
```
## 2. Create Table
```sql
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    ...
);

```
**Example:**
```sql
CREATE TABLE customer (
    customer_name VARCHAR(30),
    customer_street VARCHAR(50),
    customer_city VARCHAR(30)
);
```
## 3. Inserting Data Into Table
```sql
INSERT INTO table_name VALUES (value1, value2, ...);
```
**Example:**
```sql
INSERT INTO customer VALUES("Kaniz", "Fatema", "Baymax");
```
## 4. Change Column Name
To rename a column in a table:

```sql
ALTER TABLE table_name CHANGE old_column_name new_column_name new_data_type;
```
**Example:**
```sql
ALTER TABLE customer CHANGE c_street customer_street VARCHAR(50);
```
This changes the column `c_street` to `customer_street` with a new data type of `VARCHAR(50)`.

## 5. Deleting Column Data

```sql
DELETE FROM table_name WHERE condition;
```
**Example:**
```sql
DELETE FROM customer WHERE customer_name = 'Kaniz';
```

## 6. Primary Key 
### When table creation:
Here, `customer_name` is declared as the primary key during table creation.
```sql
CREATE TABLE customer 
(
    customer_name VARCHAR(30) PRIMARY KEY,
    c_street VARCHAR(20),
    c_city VARCHAR(30)
);

```
###  After table creation:
```sql
ALTER TABLE customer ADD PRIMARY KEY(customer_name);
```

## 7. Composite Primary Key (Multiple Columns) 
### When table creation:
```sql
ALTER TABLE depositor ADD PRIMARY KEY (customer_name, account_number);
```
This ensures that each combination of `customer_name` and `account_number` is unique.

###  After table creation:
```sql
ALTER TABLE table_name
ADD PRIMARY KEY (column1, column2);
```
**Example:**
```sql
ALTER TABLE depositor
ADD PRIMARY KEY (customer_name, account_number);
```
## 8. Drop a Primary Key
To remove a primary key from a table:
```sql
ALTER TABLE table_name 
DROP PRIMARY KEY;
```
**Example:**
```sql
ALTER TABLE customer 
DROP PRIMARY KEY;
```
## 9. String Functions
###  Find String Length
```sql
SELECT column_name, LENGTH(column_name) FROM table_name;
```
**Example:**
```sql
SELECT customer_name, LENGTH(customer_name) FROM customer;
```
###  Get First 3 Characters of a Name
```sql
SELECT column_name, SUBSTR(column_name, 1, 3) FROM table_name;
```
**Example:**
```sql
SELECT customer_name, SUBSTR(customer_name, 1, 3) FROM customer;
```
### Pattern Matching
***Starts with:***
```sql
WHERE column_name LIKE 'A%'
```
**Example:**
```sql
SELECT customer_name FROM customer WHERE customer_name LIKE 'A%';
```
***Ends with:***
```sql
WHERE column_name LIKE '%s'
```
**Example:**
```sql
SELECT customer_name FROM customer WHERE customer_name LIKE '%s';
```
***Specific position:***
```sql
WHERE column_name LIKE '_o%'
```
**Example:**
```sql
SELECT customer_name FROM customer WHERE customer_name LIKE '_o%';
```
### LENGTH Function

```sql
SELECT column_name, LENGTH(column_name) FROM table_name;
```
**Example:**
```sql
SELECT customer_name, LENGTH(customer_name) FROM customer;
```
### SUBSTR for Substring

```sql
SELECT column_name, SUBSTR(column_name, start, length) FROM table_name;
```
**Example:**
```sql
SELECT customer_name, SUBSTR(customer_name, 1, 3) FROM customer;
```

## 10. Filter Data
###  Filtering Using IN
```sql
SELECT column_name FROM table_name WHERE column_name IN (value1, value2, ...);
```
**Example:**
```sql
SELECT loan_number FROM loan WHERE branch_name IN ('Perryridge', 'Downtown');
```
###  Filtering with WHERE Clause
```sql
SELECT column_name FROM table_name WHERE condition;
```
**Example:**
```sql
SELECT loan_number FROM loan WHERE branch_name = 'Perryridge' AND amount > 300;
```
### Filtering Using NOT IN
```sql
SELECT column_name FROM table_name WHERE column_name NOT IN (value1, value2, ...);
```
**Example:**
```sql
SELECT customer_name FROM customer WHERE customer_city NOT IN ('Stamford', 'Princeton', 'Harrison');
```

## 11. COUNT Function

```sql
SELECT COUNT(column_name) FROM table_name;
```
**Example:**
```sql
SELECT COUNT(customer_name) FROM customer;
```