# MySQL
This repository contains SQL scripts

# 01-DDL Commands SchoolDatabase

This project demonstrates various Data Definition Language (DDL) commands such as CREATE, ALTER, DROP, RENAME, and TRUNCATE on a database named `School`. The operations are performed on a table named `STUDENT` with the following fields:
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

2. **Create Table**:
   ```CREATE TABLE STUDENT (
    Roll_No INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT,
    Grade CHAR(1));
   
## Project Setup
**Create Table**: 
Initially, create the table STUDENT with the columns Roll_No, Name, Marks, and Grade

**Select Command**:
Insert data into the STUDENT table and display the table using the SELECT command:

  sql
  INSERT INTO STUDENT (Roll_No, Name, Marks, Grade) VALUES (1, 'John Doe', 85, 'A'), (2, 'Jane Smith', 90, 'A'), (3, 'Alice Johnson', 78, 'B');
  SELECT * FROM STUDENT;

**Add Column**
To add a column named Contact to the STUDENT table:

sql
ALTER TABLE STUDENT ADD Contact VARCHAR(15);

**Remove Column**
To remove the Grade column from the STUDENT table:

sql
ALTER TABLE STUDENT DROP COLUMN Grade;

**Rename Table**
To rename the STUDENT table to CLASSTEN:

sql
ALTER TABLE STUDENT RENAME TO CLASSTEN;

**Delete Rows**
To delete all rows from the CLASSTEN table:

sql
TRUNCATE TABLE CLASSTEN;

**Drop Table**
To remove the CLASSTEN table from the database:

sql
DROP TABLE CLASSTEN;

## Conclusion
This project provides a basic understanding of how to create and manipulate tables using DDL commands in SQL. By executing these commands, we learned how to create a table, alter its structure, and remove it from the database. This provides a solid foundation for further database management and operations.

