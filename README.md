# MySQL
This repository contains SQL scripts

# PROJECTS
1. [01-DDL Commands SchoolDatabase](#01-DDL-Commands-SchoolDatabase)
2. [02-DDL Constraints SalesDatabase](#2-DDL-Constraints-SalesDatabase)

# 01-DDL Commands SchoolDatabase

This project demonstrates various Data Definition Language (DDL) commands such as CREATE, ALTER, DROP, RENAME, and TRUNCATE on a database named `School`. The operations are performed on a table named `STUDENTS` with the following fields:
- `Roll_No`
- `Name`
- `Marks`
- `Grade`

## Contents
1. [Project Setup](#project-setup)
2. [Executing Commands](#executing-commands)
    - [Create Table](#create-table)
    - [Select Command](#select-command)
    - [Add Column](#add-column)
    - [Remove Column](#remove-column)
    - [Rename Table](#rename-table)
    - [Delete Rows](#delete-rows)
    - [Drop Table](#drop-table)
3. [Conclusion](#conclusion)

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

## Conclusion
This project provides a basic understanding of how to create and manipulate tables using DDL commands in SQL. By executing these commands, we learned how to create a table, alter its structure, and remove it from the database. This provides a solid foundation for further database management and operations.



# 2-DDL Constraints SalesDatabase

## **Step 1: Create the Database**
```sql
CREATE DATABASE Sales;
USE Sales;
```

## **Step 2: Create the "Orders" Table**
```sql
CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,
    Customer_Name VARCHAR(50) NOT NULL,
    Product_Category VARCHAR(20) NOT NULL,
    Ordered_Item VARCHAR(50) NOT NULL,
    Contact_No VARCHAR(20) UNIQUE NOT NULL
);
```

## **Step 3: Add New Column to "Orders" Table**
```sql
ALTER TABLE Orders
ADD COLUMN Order_Quantity INT;
```

## **Step 4: Rename the "Orders" Table to "Sales_Orders"**
```sql
ALTER TABLE Orders
RENAME TO Sales_Orders;
```

## **Step 5: Insert Rows into "Sales_Orders" Table**
```sql
INSERT INTO Sales_Orders 
(Order_Id, Customer_Name, Product_Category, Ordered_Item, Contact_No, Order_Quantity) VALUES 
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

## **Step 6: Retrieve Customer Name and Ordered Item**
```sql
SELECT Customer_Name, Ordered_Item 
FROM Sales_Orders;
```

## **Step 7: Update Ordered Item for a Specific Row**
```sql
UPDATE Sales_Orders 
SET Ordered_Item = 'Cups' 
WHERE Order_Id = 8;
```

## **Step 8: Delete the "Sales_Orders" Table**
```sql
DROP TABLE Sales_Orders;
```

