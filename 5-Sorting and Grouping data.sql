Create database WorldPopulation;
use worldpopulation;
-- Insert 10 rows into both tables, as given below.
-- Create a table named Country with fields: Id Country_name Population Area
create table country (
Id int primary key,
Country_name varchar(50),
Population int,
Area int);

-- Create another table named Persons with fields: Id Fname Lname Population Rating Country_Id Country_name 
create table persons (
Id int primary key,
Fname varchar(50),
Lname varchar(50),
Population int,
Rating int,
Country_Id int,
Country_name varchar(50),
foreign key (country_id) references country(id));

-- Insert rows into the Country table
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

truncate table persons;

#1. Write an SQL query to print the first three characters of Country_name from the Country table. 
select substring(country_name,1,3) as country_code from country;

#2. Write an SQL query to concatenate first name and last name from Persons table. 
Select Fname,Lname,concat(Fname,' ',Lname) as Full_name from persons;

#3. Write an SQL query to count the number of unique country names from Persons table. 
Select count(Distinct country_name) as unique_count from persons;

#4. Write a query to print the maximum population from the Country table. 
select max(population) as Maximum_population from country;

#5. Write a query to print the minimum population from Persons table. 
select min(population) as Minimum_population from persons;

#6. Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table.
insert into persons (Id, Fname, Lname, Population, Rating, Country_Id) values
(11, 'Tom', NULL, 11000, 5, 1),
(12, 'Lucy', NULL, 12000, 4, 2);

select count(Lname) as Lname_count from persons;
 
#7. Write a query to find the number of rows in the Persons table. 
SELECT COUNT(*) AS Total_count FROM Persons;


#8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT) 
select population from country limit 3;

#9. Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT) 
select * from country order by rand() limit 3;

#10. List all persons ordered by their rating in descending order. 
Select * from persons order by rating desc;

#11. Find the total population for each country in the Persons table. 
select Country_name,sum(population) as Total_population from persons group by country_name;

#12. Find countries in the Persons table with a total population greater than 50,000 
select Country_name,sum(population) as Total_population from persons group by country_name having Total_population > 50000;

#13. List the total number of persons and average rating for each country, 
--   but only for countries with more than 2 persons, ordered by the average rating in ascending order.
select country_name,count(*) as Persons_count, avg(rating) as average from persons group by country_name having persons_count>2 order by average asc; 
