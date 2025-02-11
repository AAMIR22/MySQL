-- Consider the Country table and Persons table that you created earlier and perform the following: 
use worldpopulation;

#1. Add a new column called DOB in Persons table with data type as Date. 
Alter table persons
add DOB date;



#2. Write a user-defined function to calculate age using DOB. 
delimiter $$
create function calculate_age(dob date)
returns int
deterministic
no sql
begin
	declare age int;
	if month(dob) > month(current_date()) then
		set age= year(current_date())-year(dob)-1;
	elseif month(dob) = month(current_date()) and date(dob) > date(current_date()) then
		set age= year(current_date())-year(dob)-1;
	else 
		set age= year(current_date())-year(dob);
	end if;
return age;
end $$
delimiter ;

select fname,calculate_age(dob) from persons;

UPDATE Persons
SET DOB = CASE 
WHEN Id = 1 THEN '1985-05-15'
WHEN Id = 2 THEN '1990-11-22'
WHEN Id = 3 THEN '1982-07-19'
WHEN Id = 4 THEN '1978-03-14'
WHEN Id = 5 THEN '2001-08-30'
WHEN Id = 6 THEN '1999-12-10'
WHEN Id = 7 THEN '1995-10-21'
WHEN Id = 8 THEN '1987-04-02'
WHEN Id = 9 THEN '1992-06-18'
WHEN Id = 10 THEN '2000-09-27'
WHEN Id = 11 THEN '1980-01-31'
WHEN Id = 12 THEN '1997-02-05'
end;

#3. Write a select query to fetch the Age of all persons using the function that has been created. 
select fname,lname,calculate_age(dob) as Age from persons;

#4. Find the length of each country name in the Country table.
SELECT country_name,length(country_name) as Country_name_length from country;

#5. Extract the first three characters of each country's name in the Country table. 
SELECT country_name,left(country_name,3) as Country_name_first3 from country;

#6. Convert all country names to uppercase and lowercase in the Country table.
SELECT country_name,upper(country_name) as Country_Upper, lower(country_name) as Country_Lower from country;