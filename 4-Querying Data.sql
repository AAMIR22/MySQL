Create database WorldPopulation;
use worldpopulation;
-- Insert 10 rows into both tables, as given below. 
-- Create a table named Country with fields: Id Country_name Population Area 
CREATE TABLE COUNTRY (
Id int primary key auto_increment,
Country_name varchar(30),
Population int,
Area decimal(10,2));

-- Create another table named Persons with fields: Id Fname Lname Population Rating Country_Id Country_name 
CREATE TABLE PERSONS (
Id int primary key auto_increment,
Fname varchar(50),
Lname varchar(50),
Population int,
Rating FLOAT,
Country_Id int,
Country_name varchar(50),
foreign key (Country_id) references COUNTRY(Id));

Desc country;
Desc persons;

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

SELECT * FROM PERSONS;

#(1)List the distinct country names from the Persons table 
select distinct country_name from persons;

#(2)Select first names and last names from the Persons table with aliases.
select Fname as First_Name, Lname as Last_Name, concat(Fname,' ',Lname) as Full_Name from persons;
 
#(3)Find all persons with a rating greater than 4.0. 
Select * from persons where rating >4.0;

#(4)Find countries with a population greater than 10 lakhs. 
select country_name, population from COUNTRY where population > 1000000;

#(5)Find persons who are from 'USA' or have a rating greater than 4.5. 
select * from persons where country_name = 'USA' or rating >4.5;

#(6)Find all persons where the country name is NULL. 
Select * from persons where country_name is null;

#(7)Find all persons from the countries 'USA', 'Canada', and 'UK'. 
Select * from persons where country_name in('USA','CANADA','UK');

#(8)Find all persons not from the countries 'India' and 'Australia'. 
Select * from persons where not country_name in('INDIA','AUSTRALIA');

#(9)Find all countries with a population between 5 lakhs and 20 lakhs. 
select * from country where population between 500000 and 2000000;

#(10)Find all countries whose names do not start with 'C'.
Select * from country where country_name not like 'C%';