#Consider the Country table and Persons table that you created earlier and perform the following: 
use worldpopulation;
select * from country;
select * from persons;

#1. Find the number of persons in each country. 
select country_name, count(*) as Number_of_persons from persons group by country_name;

#2. Find the number of persons in each country sorted from high to low. 
select country_name, count(*) as Number_of_persons from persons group by country_name order by Number_of_persons desc;

#3. Find out an average rating for Persons in respective countries if the average is greater than 3.0 
select country_name, avg(rating) as average_rating from persons Group by country_name having avg(rating)>3.0;

#4. Find the countries with the same rating as the USA. (Use Subqueries) 
select distinct country_name from persons where rating=(select avg(rating) from persons where country_name='USA');

#5. Select all countries whose population is greater than the average population of all nations. 
select country_name, population from country where population > (select avg(population) from country);

#Create a database named Product and create a table called Customer with the following fields in the Product database: 
#Customer_Id - Make PRIMARY KEY First_name Last_name Email Phone_no Address City State Zip_code Country 
CREATE DATABASE Product;

USE Product;

CREATE TABLE Customer (
Customer_Id INT PRIMARY KEY,
First_name VARCHAR(50),
Last_name VARCHAR(50),
Email VARCHAR(150),
Phone_no VARCHAR(15),
Address VARCHAR(100),
City VARCHAR(50),
State VARCHAR(50),
Zip_code VARCHAR(20),
Country VARCHAR(50));

USE Product;

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

#1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. 
#Then perform the SELECT operation for the customer_info view. 
create view customer_info as
select concat(first_name,' ',last_name) as Full_name ,email from customer;

select * from customer_info;
select * from customer;


#2. Create a view named US_Customers that displays customers located in the US. 
create view US_Customers as
Select * from customer where country='USA';
select * from US_Customers;

#3. Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state. 
create view Customer_details as
select concat(first_name,' ' ,last_name) as Full_Name, email, phone_no,state from customer;
select * from Customer_details;

#4. Update phone numbers of customers who live in California for Customer_details view. 
update customer_details
set phone_no='146-225-3369'
where state='California';


#5. Count the number of customers in each state and show only states with more than 5 customers. 
Select state, count(*) as number_of_customers from customer group by state having count(*) > 5; 

#6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view. 
select state, count(*) as number_of_customers from customer_details group by state;

#7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
select * from customer_details order by state asc;