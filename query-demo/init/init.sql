-- Create original DB schema
CREATE DATABASE IF NOT EXISTS testdb;
USE testdb;

-- Define final destination tables
CREATE TABLE CDNOW_CRM (
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    state VARCHAR(100),
    gender CHAR(1),
    birthdate DATE
);

CREATE TABLE Customers (
    id INT,
    zone VARCHAR(100),
    state VARCHAR(100),
    gender CHAR(1),
    age_category VARCHAR(100),
    age INT
);

CREATE TABLE Purchases (
    id INT,
    users_id INT,
    date DATE,
    cds INT,
    amt DECIMAL(10,2)
);

-- === Load limited data via staging ===

-- CDNOW_CRM
CREATE TABLE CDNOW_CRM_staging LIKE CDNOW_CRM;
LOAD DATA INFILE '/data/CDNOW_CRM_table.csv'
INTO TABLE CDNOW_CRM_staging
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
INSERT INTO CDNOW_CRM
SELECT * FROM CDNOW_CRM_staging LIMIT 2500;
DROP TABLE CDNOW_CRM_staging;

-- Customers
CREATE TABLE Customers_staging LIKE Customers;
LOAD DATA INFILE '/data/customers.csv'
INTO TABLE Customers_staging
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
INSERT INTO Customers
SELECT * FROM Customers_staging LIMIT 2500;
DROP TABLE Customers_staging;

-- Purchases
CREATE TABLE Purchases_staging LIKE Purchases;
LOAD DATA INFILE '/data/purchases.csv'
INTO TABLE Purchases_staging
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(users_id, date, cds, amt);
INSERT INTO Purchases (users_id, date, cds, amt)
SELECT users_id, date, cds, amt FROM Purchases_staging LIMIT 2500;
DROP TABLE Purchases_staging;

-- === Create synthetic schema clone ===
CREATE DATABASE IF NOT EXISTS synth_testdb;
USE synth_testdb;

CREATE TABLE CDNOW_CRM LIKE testdb.CDNOW_CRM;
CREATE TABLE Customers LIKE testdb.Customers;
CREATE TABLE Purchases LIKE testdb.Purchases;

-- === Grant permissions ===
GRANT ALL PRIVILEGES ON testdb.* TO 'user'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON synth_testdb.* TO 'user'@'%' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
