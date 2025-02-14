# MySQL
This repository contains SQL scripts

# CONTENTS
1. [01-DDL Commands: SchoolDatabase](#01-DDL-Commands-SchoolDatabase)
2. [02-DDL Constraints: SalesDatabase](#02-DDL-Constraints-SalesDatabase)
3. [03-DML Commands: Company Database](#03-DML-Commands-Company-Database)
4. [04-SQL Querying Data: WorldPopulation Database](#04-WorldPopulation-Database)
5. [05-Sorting and Grouping data: WorldPopulation Database](#05-Sorting-and-Grouping-data-WorldPopulation-Database)
6. [06-Joins and Union : WorldPopulation Database](#06-joins-and-union--worldpopulation-database)
7. [07-Functions : WorldPopulation Database](#07-Functions--WorldPopulation-Database)
8. [08-Subqueries and Views : WorldPopulation and Product Database](#08-Subqueries-and-Views--WorldPopulation-and-Product-Database)
9. [09-Stored Procedures : Company database Worker](#09-Stored-Procedures--Company-database-Worker)
   
   [Conclusion](#conclusion)

# 01-DDL Commands SchoolDatabase

This project demonstrates various Data Definition Language (DDL) commands such as CREATE, ALTER, DROP, RENAME, and TRUNCATE on a database named `School`. The operations are performed on a table named `STUDENTS` with the following fields:
- `Roll_No`
- `Name`
- `Marks`
- `Grade`


## Project Setup

1. **Create Database**: 
   ```sql
   CREATE DATABASE School;
   USE School;
   ```

2. **Create Table**:
   ```sql
   CREATE TABLE STUDENTS (
       Roll_No INT PRIMARY KEY,
       Name VARCHAR(50),
       Marks INT,
       Grade CHAR(1)
   );
   ```

## Executing Commands

### Create Table
Initially, create the table `STUDENTS` with the columns `Roll_No`, `Name`, `Marks`, and `Grade`.

### Select Command
Insert data into the `STUDENTS` table and display the table using the SELECT command:
   ```sql
   INSERT INTO STUDENTS (Roll_No, Name, Marks, Grade) VALUES (1,'Sanju Samson',75,'B'),(2,'Yuvraj Singh',78,'B'),(3,'M S Dhoni',85,'A'),(4,'Suresh Raina',62,'C'),(5,'Sachin Tendulkar',95,'A');

   SELECT * FROM STUDENTS;
   ```

### Add Column
To add a column named `Contact` to the `STUDENTS` table:
   ```sql
   ALTER TABLE STUDENTS ADD Contact VARCHAR(15);
   ```

### Remove Column
To remove the `Grade` column from the `STUDENTS` table:
   ```sql
   ALTER TABLE STUDENTS DROP COLUMN Grade;
   ```

### Rename Table
To rename the `STUDENTS` table to `CLASSTEN`:
   ```sql
   ALTER TABLE STUDENTS RENAME TO CLASSTEN;
   ```

### Delete Rows
To delete all rows from the `CLASSTEN` table:
   ```sql
   TRUNCATE TABLE CLASSTEN;
   ```

### Drop Table
To remove the `CLASSTEN` table from the database:
   ```sql
   DROP TABLE CLASSTEN;
   ```


# 02-DDL Constraints SalesDatabase

[👆Go back to Contents](#contents)


This project demonstrates various Data Definition Language (DDL) constraints. DDL constraints are rules enforced on data columns to ensure the integrity and accuracy of the data in the database. Some common DDL constraints include: PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL and CHECK. Here database named `Sales`. The operations are performed on a table named `Orders` with the following fields:
- `Order_Id`
- `Customer_Name`
- `Product_Category`
- `Ordered_Item`
- `Contact_No`


## Project Setup

1. **Create Database**:
   ```sql
   CREATE DATABASE Sales;
   USE Sales;
   ```

2. **Create Table**:
   ```sql
   CREATE TABLE Orders (
       Order_Id INT PRIMARY KEY,
       Customer_Name VARCHAR(50) NOT NULL,
       Product_Category VARCHAR(20) NOT NULL,
       Ordered_Item VARCHAR(50) NOT NULL,
       Contact_No VARCHAR(20) UNIQUE NOT NULL
   );
   ```

## Executing Commands

### Create Table
Initially, create the table `Orders` with the columns `Order_Id`, `Customer_Name`, `Product_Category`, `Ordered_Item`, and `Contact_No`.

### Add Column
To add a column named `Order_Quantity` to the `Orders` table:
   ```sql
   ALTER TABLE Orders ADD COLUMN Order_Quantity INT;
   ```

### Rename Table
To rename the `Orders` table to `Sales_Orders`:
   ```sql
   ALTER TABLE Orders RENAME TO Sales_Orders;
   ```

### Insert Rows
Insert data into the `Sales_Orders` table:
   ```sql
   INSERT INTO Sales_Orders (Order_Id, Customer_Name, Product_Category, Ordered_Item, Contact_No, Order_Quantity) VALUES
   (1, "Sehwag", "Electronics", "Music Speaker", "9123456789", 1),
   (2, "Sachin", "Beverage", "Boost", "9891054321", 3),
   (3, "Dravid", "Construction", "Cement", "9865234112", 10),
   (4, "Ganguly", "Home Appliances", "Washing Machine", "9912345678", 1),
   (5, "Yuvi", "Sports", "Cricket Ball", "9812341234", 6),
   (6, "Sreesanth", "Sports", "Stumps", "9876543210", 169),
   (7, "Samson", "Sports", "Bowling Machine", "9991234123", 1),
   (8, "Dhoni", "Fitness", "Yoga Mat", "9543216789", 19),
   (9, "Raina", "Stationery", "Super Glue", "9876098765", 310),
   (10, "Jadeja", "Accessories", "Sword", "9988776655", 1);
   ```

### Select Command
Retrieve customer names and ordered items from the `Sales_Orders` table:
   ```sql
   SELECT Customer_Name, Ordered_Item FROM Sales_Orders;
   ```

### Update Command
Update the ordered item for a specific row:
   ```sql
   UPDATE Sales_Orders SET Ordered_Item = 'Cups' WHERE Order_Id = 8;
   ```

### Drop Table
Delete the `Sales_Orders` table from the database:
   ```sql
   DROP TABLE Sales_Orders;
   ```


# 03-DML Commands Company Database

[👆Go back to Contents](#contents)

This project demonstrates various DML commands such as INSERT, UPDATE and DELETE on a database named `Company`. The operations are performed on a table named `Managers`. Below is a detailed breakdown of the commands utilized and their purposes:

## Project Setup

1. **Create Database**: 
   ```sql
   CREATE DATABASE Company;
   USE Company;
   ```

2. **Create Table**:
   ```sql
   CREATE TABLE Managers (
       Manager_Id INT AUTO_INCREMENT PRIMARY KEY,
       First_name VARCHAR(50),
       Last_Name VARCHAR(50),
       DOB DATE,
       Age INT CHECK (Age > 18), 
       Last_update TIMESTAMP,
       Gender CHAR(1) CHECK (Gender IN ('M','F','O')),
       Department VARCHAR(30),
       Salary DECIMAL(10,2) NOT NULL
   );
   ```

## Executing Commands

### Create Table
Create the `Managers` table with columns that include `Manager_Id`, `First_name`, `Last_Name`, `DOB`, `Age`, `Last_update`, `Gender`, `Department`, and `Salary`.

### Insert Data
Insert multiple rows into the `Managers` table:
   ```sql
   INSERT INTO Managers (First_name, Last_Name, DOB, Age, Last_update, Gender, Department, Salary) VALUES
   ('Tovino', 'Thomas', '1989-01-21', 34, CURRENT_TIMESTAMP, 'M', 'Marketing', 30000.00),
   ('Basil', 'Joseph', '1990-04-28', 32, CURRENT_TIMESTAMP, 'M', 'Marketing', 28000.00),
   ('Naslen', 'Gafoor', '2000-06-11', 24, CURRENT_TIMESTAMP, 'M', 'IT', 32000.00),
   ('Fahadh', 'Faasil', '1982-08-08', 42, CURRENT_TIMESTAMP, 'M', 'Sales', 50000.00),
   ('Aishwarya', 'Lekshmi', '1990-09-06', 34, CURRENT_TIMESTAMP, 'F', 'HR', 35000.00),
   ('Anna', 'Ben', '1997-08-07', 27, CURRENT_TIMESTAMP, 'F', 'IT', 34000.00),
   ('Prithviraj', 'Sukumaran', '1982-10-16', 42, CURRENT_TIMESTAMP, 'M', 'Finance', 35000.00),
   ('Asif', 'Ali', '1986-02-04', 39, CURRENT_TIMESTAMP, 'M', 'Sales', 31000.00),
   ('Soubin', 'Shahir', '1983-10-12', 41, CURRENT_TIMESTAMP, 'M', 'IT', 34000.00),
   ('Neeraj', 'Madhav', '1990-03-26', 33, CURRENT_TIMESTAMP, 'M', 'Marketing', 26000.00),
   ('Indrajith', 'Sukumaran', '1980-12-17', 44, CURRENT_TIMESTAMP, 'M', 'HR', 29000.00),
   ('Sreenath', 'Bhasi', '1988-05-29', 35, CURRENT_TIMESTAMP, 'M', 'Finance', 24000.00),
   ('Aaliya', 'Bhatt', '1993-03-15', 34, CURRENT_TIMESTAMP, 'F', 'Finance', 24000.00);
   ```

### Select Queries
To retrieve data based on specific conditions:
1. **View table by age order**:
   ```sql
   SELECT * FROM Managers ORDER BY Age;
   ```

2. **Retrieve the name and date of birth of the manager with Manager_Id 1**:
   ```sql
   SELECT First_name, Last_name, DOB FROM Managers WHERE Manager_Id = 1;
   ```

3. **Display the annual income of all managers**:
   ```sql
   SELECT Manager_Id, First_name, Last_name, Salary * 12 AS Annual_Income FROM Managers;
   ```

4. **Display records of all managers except 'Aaliya'**:
   ```sql
   SELECT * FROM Managers WHERE First_name <> 'Aaliya';
   ```

5. **Display details of managers whose department is IT and earn more than 25000 per month**:
   ```sql
   SELECT * FROM Managers WHERE Department = 'IT' AND Salary > 25000;
   ```

6. **Display details of managers whose salary is between 10000 and 35000**:
   ```sql
   SELECT * FROM Managers WHERE Salary BETWEEN 10000 AND 35000;
   ```

### View Ordered Data
List all managers ordered by their age:
```sql
SELECT * FROM Managers ORDER BY Age;
```

# 04-WorldPopulation Database

[👆Go back to Contents](#contents)

This project demonstrates the creation and manipulation of a database named `WorldPopulation`. The operations are performed on two tables: `Country` and `Persons`.

## Project Setup

1. **Create Database**:
   ```sql
   CREATE DATABASE WorldPopulation;
   USE WorldPopulation;
   ```

2. **Create Tables**:

   **Country Table**:
   ```sql
   CREATE TABLE Country (
       Id INT PRIMARY KEY AUTO_INCREMENT,
       Country_name VARCHAR(30),
       Population INT,
       Area DECIMAL(10,2)
   );
   ```

   **Persons Table**:
   ```sql
   CREATE TABLE Persons (
       Id INT PRIMARY KEY AUTO_INCREMENT,
       Fname VARCHAR(50),
       Lname VARCHAR(50),
       Population INT,
       Rating FLOAT,
       Country_Id INT,
       Country_name VARCHAR(50),
       FOREIGN KEY (Country_Id) REFERENCES Country(Id)
   );
   ```

3. **Insert Data**:

   **Inserting into `Country` Table**:
   ```sql
   INSERT INTO Country (Id, Country_name, Population, Area)
   VALUES 
   (1, 'USA', 331000000, 9834000),
   (2, 'India', 1393409038, 3287000),
   (3, 'China', 1444216107, 9597000),
   (4, 'Canada', 38000000, 9985000),
   (5, 'UK', 67886011, 243610),
   (6, 'Australia', 25687041, 7692000),
   (7, 'Germany', 83200000, 357022),
   (8, 'France', 67081000, 551695),
   (9, 'Japan', 126300000, 377975),
   (10, 'South Korea', 51780579, 100210),
   (11, 'Estonia', 1326000, 45227),
   (12, 'Trinidad and Tobago', 1400000, 5130),
   (13, 'Botswana', 2338851, 581730),
   (14, 'Gambia', 2347706, 11295),
   (15, 'Mauritius', 1265740, 2040),
   (16, 'Suriname', 618040, 163820),
   (17, 'Montenegro', 620000, 13812);
   ```

   **Inserting into `Persons` Table**:
   ```sql
   INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
   VALUES 
   (1, 'Jaden', 'Smith', 1000, 4.5, 1, 'USA'),
   (2, 'Tovino', 'Thomas', 2000, 4.7, 1, 'USA'),
   (3, 'Naslen', 'Gafoor', 1500, 3.9, 2, 'India'),
   (4, 'Jacky', 'Chan', 1700, 4.2, 3, 'China'),
   (5, 'Bruce', 'Lee', 1300, 4.1, 4, 'Canada'),
   (6, 'John', 'Cena', 1400, 4.6, 5, 'UK'),
   (7, 'Will', 'Smith', 1800, 3.8, 6, 'Australia'),
   (8, 'Emma', 'Watson', 1600, 4.8, 7, 'Germany'),
   (9, 'Rihana', 'Safiya', 1900, 4.3, 8, 'France'),
   (10, 'David', 'Miller', 1100, 4.0, NULL, NULL);
   ```

## SQL Queries

1. **List the distinct country names from the `Persons` table**:
   ```sql
   SELECT DISTINCT Country_name FROM Persons;
   ```

2. **Select first names and last names from the `Persons` table with aliases**:
   ```sql
   SELECT Fname AS First_Name, Lname AS Last_Name, CONCAT(Fname, ' ', Lname) AS Full_Name FROM Persons;
   ```

3. **Find all persons with a rating greater than 4.0**:
   ```sql
   SELECT * FROM Persons WHERE Rating > 4.0;
   ```

4. **Find countries with a population greater than 10 lakhs**:
   ```sql
   SELECT Country_name, Population FROM Country WHERE Population > 1000000;
   ```

5. **Find persons who are from 'USA' or have a rating greater than 4.5**:
   ```sql
   SELECT * FROM Persons WHERE Country_name = 'USA' OR Rating > 4.5;
   ```

6. **Find all persons where the country name is NULL**:
   ```sql
   SELECT * FROM Persons WHERE Country_name IS NULL;
   ```

7. **Find all persons from the countries 'USA', 'Canada', and 'UK'**:
   ```sql
   SELECT * FROM Persons WHERE Country_name IN ('USA', 'Canada', 'UK');
   ```

8. **Find all persons not from the countries 'India' and 'Australia'**:
   ```sql
   SELECT * FROM Persons WHERE Country_name NOT IN ('India', 'Australia');
   ```

9. **Find all countries with a population between 5 lakhs and 20 lakhs**:
   ```sql
   SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;
   ```

10. **Find all countries whose names do not start with 'C'**:
    ```sql
    SELECT * FROM Country WHERE Country_name NOT LIKE 'C%';
    ```

    
# 05-Sorting and Grouping data: WorldPopulation Database

[👆Go back to Contents](#contents)

This project involves creating and populating two tables (`Country` and `Persons`) within a database named `WorldPopulation`. Below are the steps to set up the database, create the tables, insert data, and execute various SQL queries.

## Project Setup

**1. Create Database**
```sql
CREATE DATABASE WorldPopulation;
USE WorldPopulation;
```

**2. Create Tables**

**Create the `Country` table:**
```sql
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area INT
);
```

**Create the `Persons` table:**
```sql
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating INT,
    Country_Id INT,
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);
```

**3. Insert Data into Tables**

**Insert rows into the `Country` table:**
```sql
INSERT INTO Country (Id, Country_name, Population, Area)
VALUES 
(1, 'USA', 331000000, 9834000),
(2, 'India', 1393409038, 3287000),
(3, 'China', 1444216107, 9597000),
(4, 'Canada', 38000000, 9985000),
(5, 'UK', 67886011, 243610),
(6, 'Australia', 25687041, 7692000),
(7, 'Germany', 83200000, 357022),
(8, 'France', 67081000, 551695),
(9, 'Japan', 126300000, 377975),
(10, 'South Korea', 51780579, 100210),
(11, 'Estonia', 1326000, 45227),
(12, 'Trinidad and Tobago', 1400000, 5130),
(13, 'Botswana', 2338851, 581730),
(14, 'Gambia', 2347706, 11295),
(15, 'Mauritius', 1265740, 2040),
(16, 'Suriname', 618040, 163820),
(17, 'Montenegro', 620000, 13812);
```

**Insert rows into the `Persons` table:**
```sql
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES 
(1, 'Jaden', 'Smith', 10000, 4.5, 1, 'USA'),
(2, 'Tovino', 'Thomas', 45000, 4.7, 1, 'USA'),
(3, 'Naslen', 'Gafoor', 70000, 3.9, 2, 'India'),
(4, 'Jacky', 'Chan', 60000, 4.2, 3, 'China'),
(5, 'Bruce', 'Lee', 1300, 4.1, 4, 'Canada'),
(6, 'John', 'Cena', 1400, 4.6, 5, 'USA'),
(7, 'Will', 'Smith', 1800, 3.8, 6, 'Australia'),
(8, 'Emma', 'Watson', 1600, 4.8, 7, 'Germany'),
(9, 'Rihana', 'Safiya', 1900, 4.3, 8, 'France'),
(10, 'David', 'Miller', 1100, 4.0, NULL, NULL),
(11, 'Kevin', 'Pieterson', 1100, 4.0, NULL, 'India'),
(12, 'Great', 'Khali', 1100, 4.0, NULL, 'India');
```


## Executing Commands

**1. Print the first three characters of `Country_name` from the `Country` table:**
```sql
SELECT SUBSTRING(Country_name, 1, 3) AS country_code FROM Country;
```

**2. Concatenate first name and last name from `Persons` table:**
```sql
SELECT Fname, Lname, CONCAT(Fname, ' ', Lname) AS Full_name FROM Persons;
```

**3. Count the number of unique country names from `Persons` table:**
```sql
SELECT COUNT(DISTINCT Country_name) AS unique_count FROM Persons;
```

**4. Print the maximum population from the `Country` table:**
```sql
SELECT MAX(Population) AS Maximum_population FROM Country;
```

**5. Print the minimum population from `Persons` table:**
```sql
SELECT MIN(Population) AS Minimum_population FROM Persons;
```

**6. Insert 2 new rows to the `Persons` table with `Lname` as NULL, then count `Lname`:**
```sql
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id) VALUES
(11, 'Tom', NULL, 11000, 5, 1),
(12, 'Lucy', NULL, 12000, 4, 2);

SELECT COUNT(Lname) AS Lname_count FROM Persons;
```

**7. Find the number of rows in the `Persons` table:**
```sql
SELECT COUNT(*) AS Total_count FROM Persons;
```

**8. Show the population of the `Country` table for the first 3 rows (Hint: Use LIMIT):**
```sql
SELECT Population FROM Country LIMIT 3;
```

**9. Print 3 random rows of countries (Hint: Use RAND() function and LIMIT):**
```sql
SELECT * FROM Country ORDER BY RAND() LIMIT 3;
```

**10. List all persons ordered by their rating in descending order:**
```sql
SELECT * FROM Persons ORDER BY Rating DESC;
```

**11. Find the total population for each country in the `Persons` table:**
```sql
SELECT Country_name, SUM(Population) AS Total_population FROM Persons GROUP BY Country_name;
```

**12. Find countries in the `Persons` table with a total population greater than 50,000:**
```sql
SELECT Country_name, SUM(Population) AS Total_population FROM Persons GROUP BY Country_name HAVING Total_population > 50000;
```

**13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order:**
```sql
SELECT Country_name, COUNT(*) AS Persons_count, AVG(Rating) AS average FROM Persons GROUP BY Country_name HAVING Persons_count > 2 ORDER BY average ASC;
```



# 06-Joins and Union : WorldPopulation Database

[👆Go back to Contents](#contents)

This project involves working with two tables `Country` and `Persons` within a database named `worldpopulation`. Below are the steps to perform various SQL queries on these tables.

## Project Setup

**1. Use Database**

```sql
USE worldpopulation;
```

**2. Describe Tables**

```sql
DESC country;
-- Id, Country_name, Population, Area

DESC persons;
-- Id, Fname, Lname, Population, Rating, Country_Id, Country_Name
```

## SQL Queries

**1. Perform Inner Join, Left Join, and Right Join on the tables**

- **Inner Join**
    ```sql
    SELECT c.country_name, c.population, p.Id, CONCAT(p.Fname, ' ', p.Lname) AS Full_name 
    FROM country c 
    INNER JOIN persons p ON c.country_name = p.country_name 
    ORDER BY p.id;
    ```

- **Left Join**
    ```sql
    SELECT c.country_name, c.population, p.Id, CONCAT(p.Fname, ' ', p.Lname) AS Full_name 
    FROM country c 
    LEFT JOIN persons p ON c.country_name = p.country_name 
    ORDER BY p.id;
    ```

- **Right Join**
    ```sql
    SELECT c.country_name, c.population, p.Id, CONCAT(p.Fname, ' ', p.Lname) AS Full_name 
    FROM country c 
    RIGHT JOIN persons p ON c.country_name = p.country_name 
    ORDER BY p.id;
    ```

**2. List all distinct country names from both the Country and Persons tables**

```sql
SELECT DISTINCT country_name FROM country
UNION
SELECT DISTINCT country_name FROM persons;
```

**3. List all country names from both the Country and Persons tables, including duplicates**

```sql
SELECT country_name FROM country
UNION ALL
SELECT country_name FROM persons;
```

**4. Round the ratings of all persons to the nearest integer in the Persons table**

```sql
SELECT Fname, Lname, Rating, ROUND(Rating) AS Rounded_rating FROM persons;
```

# 07-Functions : WorldPopulation Database

[👆Go back to Contents](#contents)

This repository contains SQL scripts to perform various tasks on `Persons` and `Country` tables. The tasks include adding a new column, creating a user-defined function, and performing various SQL queries to manipulate and extract data.

## Project Setup

**1. Add a new column called DOB in Persons table with data type as Date**

```sql
ALTER TABLE Persons
ADD DOB DATE;
```

**2. Write a user-defined function to calculate age using DOB**

```sql
DELIMITER $$

CREATE FUNCTION calculate_age(dob DATE)
RETURNS INT
DETERMINISTIC
NO SQL
BEGIN
    DECLARE age INT;
    IF MONTH(dob) > MONTH(CURDATE()) THEN
        SET age = YEAR(CURDATE()) - YEAR(dob) - 1;
    ELSEIF MONTH(dob) = MONTH(CURDATE()) AND DAY(dob) > DAY(CURDATE()) THEN
        SET age = YEAR(CURDATE()) - YEAR(dob) - 1;
    ELSE 
        SET age = YEAR(CURDATE()) - YEAR(dob);
    END IF;
    RETURN age;
END $$

DELIMITER ;
```

**3. Write a select query to fetch the Age of all persons using the function that has been created**

```sql
SELECT Name, calculate_age(DOB) AS Age
FROM Persons;
```

## Country Table Queries

**4. Find the length of each country name in the Country table**

```sql
SELECT CountryName, LENGTH(CountryName) AS NameLength
FROM Country;
```

**5. Extract the first three characters of each country's name in the Country table**

```sql
SELECT CountryName, LEFT(CountryName, 3) AS FirstThreeChars
FROM Country;
```

**6. Convert all country names to uppercase and lowercase in the Country table**

```sql
SELECT CountryName, UPPER(CountryName) AS UpperCaseName, LOWER(CountryName) AS LowerCaseName
FROM Country;
```


# 08-Subqueries and Views : WorldPopulation and Product Database

[👆Go back to Contents](#contents)

Below SQL queries and tasks related to subqueries and views. The tasks are performed on a `Country` table and a `Persons` table, as well as on a `Customer` table in the `Product` database. The following sections provide details and SQL queries for each task.

## Part 1: Subqueries

**1. Find the number of persons in each country**
```sql
SELECT country_name, COUNT(*) AS number_of_persons
FROM persons
GROUP BY country_name;
```

**2. Find the number of persons in each country sorted from high to low**
```sql
SELECT country_name, COUNT(*) AS number_of_persons
FROM persons
GROUP BY country_name
ORDER BY number_of_persons DESC;
```

**3. Find out the average rating for Persons in respective countries if the average is greater than 3.0**
```sql
SELECT country_name, AVG(rating) AS average_rating
FROM persons
GROUP BY country_name
HAVING AVG(rating) > 3.0;
```

**4. Find the countries with the same rating as the USA (Use Subqueries)**
```sql
SELECT DISTINCT country_name
FROM persons
WHERE rating = (SELECT rating FROM persons WHERE country_name = 'USA');
```

**5. Select all countries whose population is greater than the average population of all nations**
```sql
SELECT country_name
FROM country
WHERE population > (SELECT AVG(population) FROM country);
```

## Part 2: Views

**Create the `Customer` Table**
First, create the `Product` database and `Customer` table:
```sql
CREATE DATABASE Product;

USE Product;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(20),
    Address VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(20),
    Country VARCHAR(50)
);
```

**Insert Data into `Customer` Table**
Populate the `Customer` table with sample data:
```sql
INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Elm Street', 'Springfield', 'Illinois', '62701', 'USA'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '234-567-8901', '456 Oak Avenue', 'Los Angeles', 'California', '90001', 'USA'),
(3, 'Michael', 'Brown', 'michael.brown@example.com', '345-678-9012', '789 Pine Road', 'San Francisco', 'California', '94101', 'USA'),
(4, 'Emily', 'Davis', 'emily.davis@example.com', '456-789-0123', '101 Maple Street', 'Seattle', 'Washington', '98101', 'USA'),
(5, 'David', 'Wilson', 'david.wilson@example.com', '567-890-1234', '202 Birch Lane', 'New York', 'New York', '10001', 'USA'),
(6, 'Sophia', 'Taylor', 'sophia.taylor@example.com', '678-901-2345', '303 Cedar Street', 'Austin', 'Texas', '73301', 'USA'),
(7, 'William', 'Martinez', 'william.martinez@example.com', '789-012-3456', '404 Spruce Avenue', 'Chicago', 'Illinois', '60601', 'USA'),
(8, 'Olivia', 'Anderson', 'olivia.anderson@example.com', '890-123-4567', '505 Willow Road', 'Houston', 'Texas', '77001', 'USA'),
(9, 'James', 'Thomas', 'james.thomas@example.com', '901-234-5678', '606 Ash Street', 'Denver', 'Colorado', '80201', 'USA'),
(10, 'Ava', 'Jackson', 'ava.jackson@example.com', '012-345-6789', '707 Chestnut Street', 'Boston', 'Massachusetts', '02101', 'USA');
```

**1. Create a view named `customer_info` for the `Customer` table that displays Customer’s Full name and email address. Then perform the SELECT operation for the `customer_info` view.**
```sql
CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_name, Email
FROM Customer;

-- SELECT operation for the customer_info view
SELECT * FROM customer_info;
```

**2. Create a view named `US_Customers` that displays customers located in the US.**
```sql
CREATE VIEW US_Customers AS
SELECT * FROM Customer
WHERE Country = 'USA';
```

**3. Create another view named `Customer_details` with columns full name (Combine first_name and last_name), email, phone_no, and state.**
```sql
CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_name, Email, Phone_no, State
FROM Customer;
```

**4. Update phone numbers of customers who live in California for `Customer_details` view.
```sql
UPDATE Customer
SET Phone_no = 'New_Phone_Number' 
WHERE State = 'California';
```

**5. Count the number of customers in each state and show only states with more than 5 customers.**
```sql
SELECT State, COUNT(*) AS number_of_customers
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;
```

**6. Write a query that will return the number of customers in each state, based on the "state" column in the `Customer_details` view.**
```sql
SELECT State, COUNT(*) AS number_of_customers
FROM Customer_details
GROUP BY State;
```

**7. Write a query that returns all the columns from the `Customer_details` view, sorted by the "state" column in ascending order.**
```sql
SELECT * FROM Customer_details
ORDER BY State ASC;
```


# 09 Stored Procedures : Company database Worker

[👆Go back to Contents](#contents)

## Table Description
Consider the Worker table with the following fields:
- Worker_Id INT
- FirstName CHAR(25)
- LastName CHAR(25)
- Salary INT(15)
- JoiningDate DATETIME
- Department CHAR(25)

## SQL Scripts

**1. Creating Database and Table**

```sql
CREATE DATABASE Companydb;

-- Use the created database
USE Companydb;

-- Create Worker table
CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT(15),
    JoiningDate DATETIME,
    Department CHAR(25)
);
```

**2. Adding a New Record to the Worker Table**

Create a stored procedure that takes in IN parameters for all the columns in the Worker table and adds a new record to the table.

```sql
DELIMITER //
CREATE PROCEDURE addemployee (
    IN nworker_id INT,
    IN nFirstName CHAR(25),
    IN nLastName CHAR(25),
    IN nSalary INT(15),
    IN nJoiningDate DATETIME,
    IN nDepartment CHAR(25)
)
BEGIN
    INSERT INTO worker (worker_id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (nworker_id, nFirstName, nLastName, nSalary, nJoiningDate, nDepartment);
END //
DELIMITER ;

-- Procedure Calls
CALL addemployee(1, 'WILL', 'SMITH', 50000, '2023-06-07', 'HR');
CALL addemployee(2, 'JADEN', 'SMITH', 40000, '2024-03-07', 'ACCOUNTS');
CALL addemployee(3, 'ROBERT', 'DOWNEY JR', 90000, '2012-05-03', 'ADMIN');

-- Verify Records
SELECT * FROM WORKER;
```

**3. Retrieve Salary of Worker by Worker ID**

Write a stored procedure that takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. It should retrieve the salary of the worker with the given ID and return it in the p_salary parameter.

```sql
DELIMITER //
CREATE PROCEDURE GETSALARY (
    IN n_workerid INT,
    OUT p_salary INT
)
BEGIN
    SELECT salary INTO p_salary
    FROM worker
    WHERE worker_id = n_workerid;
END //
DELIMITER ;

-- Procedure Call
SET @p_salary = 0;
CALL GETSALARY(1, @p_salary);
SELECT @p_salary AS Salary_of_the_employee;

-- Drop Procedure (if needed)
DROP PROCEDURE GETSALARY;
```

**4. Update Department of Worker by Worker ID**

Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. It should update the department of the worker with the given ID.

```sql
DELIMITER //
CREATE PROCEDURE update_dept (
    IN n_workerid INT,
    IN n_dept VARCHAR(25)
)
BEGIN
    UPDATE worker
    SET department = n_dept
    WHERE worker_id = n_workerid;
END //
DELIMITER ;

-- Procedure Calls
CALL update_dept(1, 'ADMIN');
CALL update_dept(2, 'SALES');

-- Verify Records
SELECT * FROM WORKER;
```

**5. Retrieve Worker Count by Department**

Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. It should retrieve the number of workers in the given department and return it in the p_workerCount parameter.

```sql
DELIMITER //
CREATE PROCEDURE workercount (
    IN dept VARCHAR(25),
    OUT p_workercount INT
)
BEGIN
    SELECT COUNT(*) INTO p_workercount
    FROM worker
    WHERE department = dept;
END //
DELIMITER ;

-- Procedure Call
CALL workercount('admin', @p_workercount);
SELECT @p_workercount AS Number_of_workers;
```

**6. Retrieve Average Salary by Department**

Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. It should retrieve the average salary of all workers in the given department and return it in the p_avgSalary parameter.

```sql
DELIMITER //
CREATE PROCEDURE avgsalary (
    IN dept VARCHAR(25),
    OUT p_avgsalary INT
)
BEGIN
    SELECT AVG(salary) INTO p_avgsalary
    FROM worker
    WHERE department = dept;
END //
DELIMITER ;

-- Procedure Call
CALL avgsalary("admin", @p_avgsalary);
SELECT @p_avgsalary AS Average_Salary;

-- Verify Records
SELECT * FROM WORKER;
```


## Conclusion

We've journeyed through the essentials of SQL, uncovering the fundamental commands that shape and maintain databases. Our exploration began with Data Definition Language (DDL) commands, where we learned how to create, alter, and remove database structures. Ensuring these structures are reliable, we delved into DDL constraints—such as primary keys, foreign keys, unique constraints, not null constraints, and check constraints.

Transitioning to Data Manipulation Language (DML) commands, we discovered how to insert new records, update existing data, and retrieve and delete information. These commands empower us to manage and manipulate the data within the tables defined by our DDL commands. By combining DDL, its constraints, and DML, we have a comprehensive toolkit for building and maintaining a robust and efficient database system.

Further, we explored the practical use of joins and unions to combine data from multiple tables, enhancing our ability to perform complex queries. We demonstrated how to perform inner join, left join, and right join on the `Country` and `Persons` tables. We also listed all distinct and non-distinct country names from both tables and rounded the ratings of all persons to the nearest integer. Another section provides SQL queries and steps for various tasks related to subqueries and views.

In essence, this project provides a practical example of creating and managing a relational database with essential SQL operations. It offers valuable insights for anyone looking to build and maintain robust database systems, making it an essential resource for both beginners and seasoned practitioners.

