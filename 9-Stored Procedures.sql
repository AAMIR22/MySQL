#Consider the Worker table with following fields: 
#Worker_Id INT FirstName CHAR(25), LastName CHAR(25), Salary INT(15), JoiningDate DATETIME, Department CHAR(25)) 

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

#1. Create a stored procedure that takes in IN parameters for all the columns in the Worker table and adds a new record to the table and
# then invokes the procedure call. 

delimiter //
create procedure addemployee (in nworker_id int,in nFirstName CHAR(25),in nLastName CHAR(25),in nSalary INT(15),in nJoiningDate DATETIME,
in nDepartment CHAR(25))
begin
insert into worker(worker_id,FirstName,LastName,Salary,JoiningDate,Department) values
(nworker_id,nFirstName,nLastName,nSalary,nJoiningDate,nDepartment);
end //
delimiter ;

call addemployee(1,'WILL','SMITH','50000','2023-06-07','HR');
call addemployee(2,'JADEN','SMITH','40000','2024-03-07','ACCOUNTS');
call addemployee(3,'ROBERT','DOWNEY JR','90000','2012-05-03','ADMIN');

SELECT * FROM WORKER;

#2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY.
#It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. Then make the procedure call.
#drop procedure getsalary;
delimiter //
CREATE PROCEDURE GETSALARY(in n_workerid int,out p_salary int)
begin
select salary into p_salary from worker where worker_id=n_workerid;
end //
delimiter ;



set @p_salary=0;
call getsalary(1,@p_salary);
select @p_salary as Salary_of_the_employee;

drop procedure getsalary;
 
#3. Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. 
#It should update the department of the worker with the given ID. Then make a procedure call. 
delimiter //
create procedure update_dept(in n_workerid int, in n_dept varchar(25))
begin
update worker
set department=n_dept
where worker_id = n_workerid;
end //
delimiter ;

call update_dept(1,'ADMIN');
call update_dept(2,'SALES');
SELECT * FROM WORKER;

#4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. 
#It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter. Make procedure call. 
delimiter //
CREATE PROCEDURE workercount(in dept varchar(25),out p_workercount int)
begin
select count(*) into p_workercount from worker where department=dept;
end //
delimiter ;

call workercount('admin',@p_workercount);
select @p_workercount as Number_of_workers;


#5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. 
#It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary parameter and call the procedure.
delimiter //
CREATE PROCEDURE avgsalary(in dept varchar(25),out p_avgsalary int)
begin
select avg(salary) into p_avgsalary from worker where department = dept;
end //
delimiter ;

call avgsalary("admin",@p_avgsalary);
select @p_avgsalary as Average_Salary;
SELECT * FROM WORKER;
