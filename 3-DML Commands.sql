CREATE database Company;
USE Company;

#Create a table named Managers with fields : 
-- Manager_Id First_name Last_Name DOB Age ->Use check constraint Last_update Gender Department Salary -> NOT NULL 
CREATE TABLE Managers (
Manager_Id int auto_increment primary key,
First_name varchar(50),
Last_Name varchar(50),
DOB date,
Age int check (age>18), 
Last_update timestamp,
Gender char(1) check (gender in ('M','F','O')),
Department varchar(30),
Salary decimal(10,2) not null);

#1. Insert 10 rows. 

insert INTO managers (First_name, Last_Name, DOB, Age, Last_update, Gender, Department, Salary) VALUES
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
#View table by age order
Select * from managers order by Age;

#2. Write a query that retrieves the name and date of birth of the manager with Manager_Id 1.
Select First_name,Last_name,DOB from managers where Manager_Id=1;


#3. Write a query to display the annual income of all managers.
select Manager_Id,First_name, Last_name, Salary*12 AS Annual_Income from managers;

#4. Write a query to display records of all managers except ‘Aaliya’. 
Select * from managers where First_name<>'Aaliya';

#5. Write a query to display details of managers whose department is IT and earns more than 25000 per month.
Select * from managers Where department="IT" and Salary > 25000;

#6. Write a query to display details of managers whose salary is between 10000 and 35000.
Select * from managers Where salary between 10000 and 35000;
