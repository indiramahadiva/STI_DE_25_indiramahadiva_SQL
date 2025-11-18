/* 
============
DDL - CREATE
============ */
-- Create Schema
CREATE SCHEMA IF NOT EXISTS staging;

-- Create sequence to generate values for employee_id coloumn later
CREATE SEQUENCE IF NOT EXISTS seq_emp_id START 1;

-- Create table
CREATE TABLE
    IF NOT EXISTS staging.employees (
        employee_id INTEGER PRIMARY KEY DEFAULT nextval ('seq_emp_id'),
        department VARCHAR,
        employment_year INTEGER
    );

/*
=============
CRUD - CREATE
============= 
 */
--  Insert 3 rows manually
INSERT INTO
    staging.employees (department, employment_year)
VALUES
    ('Sales', 2001),
    ('Logistics', 2002),
    ('IT', 2002);

-- insert with read_csv() function
-- ref: https/duckdb.org/docs/stable/guides/file_formats/csv_import
INSERT INTO
    staging.employees (department, employment_year)
SELECT
    *
FROM
    read_csv ('data/employees.csv');

/* 
===========
CRUD - READ
=========== 
 */
SELECT
    *
FROM
    staging.employees
LIMIT
    10
SELECT
    *
FROM
    staging.employees
OFFSET
    10
    /* 
    =============
    CRUD - Update
    =============
     */
    --modify existing data
UPDATE staging.employees
SET
    employment_year = 2023
WHERE
    employee_id IN (98, 99);

--WHERE employee_id = 98 or employee_id = 99
/*
===========
DDL - Alter
===========
 */
ALTER TABLE staging.employees
ADD COLUMN pension_plan VARCHAR DEFAULT 'plan 1'
/* 
=============
CRUD - Update
=============
 */
UPDATE staging.employees
SET
    pension_plan = 'plan 2'
WHERE
    employment_year > 2015;

/* 
=============
CRUD - Delete
=============
 */
-- always check the rows you plan to delete first
SELECT
    *
FROM
    staging.employees
WHERE
    employee_id = 1;

DELETE FROM staging.employees
WHERE
    employee_id = 1;