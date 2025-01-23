#Creating database named school
Create database School;

use school;

#Creating table student
Create table Students (
RollNo int primary key,
Name varchar(50),
Marks int,
Grade char(1));

#Inserting data in to table
insert into Students (RollNo,Name,Marks,Grade) values
(1,'Sanju Samson',75,'B'),
(2,'Yuvraj Singh',78,'B'),
(3,'M S Dhoni',85,'A'),
(4,'Suresh Raina',62,'C'),
(5,'Sachin Tendulkar',95,'A');

#1)Using the select command to display the table
select * from Students;

#2)Adding a column named Contact to the STUDENT table
Alter table Students
Add column Contact varchar(15);

#3)Removing the Grade column from the Student table
Alter table students
Drop column grade;

#4) Renaming the table to CLASSTEN
Alter table Students
rename to CLASSTEN;

#5) Deleting all rows from the table.
Truncate table CLASSTEN;

#6)Remove the table from the database.
Drop table CLASSTEN;