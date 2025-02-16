#1. Create a table named teachers with fields id, name, subject, experience and salary and insert 8 rows. 
Create database highschooldb;
use highschooldb;

CREATE TABLE teachers (id INT PRIMARY KEY,name varchar(50),subject varchar(50),experience int,salary decimal(10, 2)
);

INSERT INTO teachers (id, name, subject, experience, salary) VALUES
(1, 'Alice', 'Math', 11, 5000.00),
(2, 'Bob', 'Science', 8, 5500.00),
(3, 'Charlie', 'History', 12, 6000.00),
(4, 'David', 'Geography', 7, 5200.00),
(5, 'Eva', 'English', 6, 5100.00),
(6, 'Frank', 'Physics', 3, 4700.00),
(7, 'Grace', 'Chemistry', 9, 5700.00),
(8, 'Hannah', 'Biology', 12, 5800.00);


#2. Create a before insert trigger named before_insert_teacher 
#that will raise an error “salary cannot be negative” if the salary inserted to the table is less than zero. 
delimiter //
create trigger before_insert_teacher
before insert on teachers
for each row
begin
if new.salary<0 then
signal sqlstate '45000'
set message_text='salary cannot be negative';
end if;
end //
delimiter ;

-- Test
INSERT INTO teachers (id,name, subject, experience, salary) VALUES
(9,'Alice', 'Math', 5, -5000.00);

#3. Create an after insert trigger named after_insert_teacher
#that inserts a row with teacher_id,action, timestamp to a table called teacher_log 
#when a new entry gets inserted to the teacher table.
# tecaher_id -> column of teacher table, action -> the trigger action, timestamp -> time at which the new row has got inserted.
CREATE TABLE teacher_log (
teacher_id INT,
action VARCHAR(50),
Actiontime timestamp default current_timestamp);

delimiter //
create trigger after_insert_teacher
after insert on teachers
for each row
begin
insert into teacher_log (teacher_id,action)
values (new.id,'INSERT');
end //
delimiter ;

-- Test
INSERT INTO teachers (id,name, subject, experience, salary) VALUES
(9,'Sneha', 'Math', 5, 15000.00);
Select * from teachers;
Select * from teacher_log;

# 4. Create a before delete trigger that will raise an error 
#when you try to delete a row that has experience greater than 10 years. 
delimiter $$
create trigger before_delete_experience_10
before delete on teachers
for each row
begin
if old.experience>10 then
signal sqlstate '45000'
set message_text='Cannot delete teacher who have experience more than 10 years';
end if ;
end $$
delimiter ;

-- Test
delete from teachers where id = 8;

#5. Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.

delimiter ##
create trigger delete_teacher_log
after delete on teachers
for each row
begin
insert into teacher_log (teacher_id,action)
values (old.id,'DELETE');
end ##
delimiter ;

-- Test
delete from teachers where id = 9;

select * from teacher_log;