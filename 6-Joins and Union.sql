-- Consider the Country table and Persons table that you created earlier and perform the following: 
use worldpopulation;

desc country;
#Id,Country_name,Population,Area
desc persons;
#Id,Fname,Lname,Population,Rating,Country_Id,Country_Name

#(1)Perform inner join, Left join, and Right join on the tables. 
Select c.country_name,c.population,p.Id,concat(p.Fname,' ',p.Lname) as Full_name 
from country c 
inner join 
persons p 
on c.country_name = p.country_name order by p.id;

Select c.country_name,c.population,p.Id,concat(p.Fname,' ',p.Lname) as Full_name 
from country c 
left join 
persons p 
on c.country_name = p.country_name order by p.id;

Select c.country_name,c.population,p.Id,concat(p.Fname,' ',p.Lname) as Full_name 
from country c 
right join 
persons p 
on c.country_name = p.country_name order by p.id;

#(2)List all distinct country names from both the Country and Persons tables. 
select distinct country_name from country
union
select distinct country_name from persons;

#(3)List all country names from both the Country and Persons tables, including duplicates. 
select country_name from country
union all
select country_name from persons;

#(4)Round the ratings of all persons to the nearest integer in the Persons table.
Select Fname,Lname,Rating, round(rating) as Rounded_rating from persons;