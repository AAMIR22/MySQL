#Creating a database called “Sales” 
create database Sales;
use Sales;

#creating a new table named “Orders” in the Sales database with columns: (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No). Use constraints: Primary Key Unique Not Null 
Create table Orders (Order_Id int primary key,
Customer_Name varchar(50) not null,
Product_Category varchar(20) not null,
Ordered_Item varchar(50) not null,
Contact_No varchar(20) unique not null ) ;

#Adding a new column named “order_quantity” to the orders table.
Alter table Orders
Add column Order_Quantity int;

#Renaming the orders table to the sales_orders table.
alter table Orders
rename to Sales_Orders;

#Inserting 10 rows into the sales_orders table. 
insert into Sales_Orders (Order_Id,Customer_Name,Product_Category,Ordered_Item,Contact_No,Order_Quantity) values 
(1,"Sehwag","Entertainment","Music Speaker","9123456789",1),
(2,"Sachin","Grocery","Boost","9891054321",3),
(3,"Dravid","Construction","Cement","9865234112",10),
(4,"Ganguly","Appliances","Washing Machine","9912345678",1),
(5,"Yuvi","Sports","Cricket Ball","9812341234",6),
(6,"Sreesanth","Sports","Stumps","9876543210",169),
(7,"Samson","Sports","Bowling Machine","9991234123",1),
(8,"Dhoni","Fitness","Yoga Mat","9543216789",19),
(9,"Raina","Stationery","Super Glue","9876098765",310),
(10,"Jadeja","Accessories","Sword","9988776655",1);

#Retrieving customer_name and Ordered_Item from the sales_orders table.
select Customer_name, Ordered_Item from Sales_Orders;

#Using the update command to change the name of the product for any row.
update Sales_Orders set Ordered_Item='Cups' WHERE Order_Id=8;

Select * from Sales_Orders;

#Deleting the sales_orders table from the database.
drop table Sales_Orders;