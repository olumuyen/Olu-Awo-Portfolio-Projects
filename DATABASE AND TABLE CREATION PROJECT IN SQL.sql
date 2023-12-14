-- # DATABASE AND TABLE CREATION PROJECT IN SQL

-- # TABLE ONE :


create database spetacular;
use spetacular;
create table special_order
(OrderID int primary key, CustomerName varchar(25), City varchar(25), OrderDate date, OrderAmount int);


insert into special_order
values
(1001,'David Jeremiah','Dallas','2017-4-2',20000),(1002,'Andrew Santos','Austin','2017-4-10',15000),
(1003,'David Bell','Houston','2017-4-11',2000),(1004,'Michael Strayer','New York','2017-4-1',10000),
(1005,'Mattew Long','Washington','2017-4-5',25000),
(1006,'Donald White','San Antonio','2017-4-25',15000),
(1007,'James Peter','Okhlahoma','2017-4-3',5000),
(1008,'Ronald King','Colorado','2017-4-9',3000);

select * from special_order;


-- # TABLE TWO :

Create Table EmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
);

Insert into EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male');

select * from EmployeeDemographics;


-- # TABLE THREE :

Create Table EmployeeSalary 
(EmployeeID int, 
JobTitle varchar(50), 
Salary int
);


Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000);

select * from EmployeeSalary ;























