-- EXPLORATORY DATA ANALYSIS USING SQL 

-- # Subquery in Select :
Select EmployeeID, Salary, (Select AVG(Salary) From EmployeeSalary) as AllAvgSalary
From EmployeeSalary;

-- How to do it with Partition By :
Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
From EmployeeSalary;

-- Subquery in From :
Select a.EmployeeID, AllAvgSalary
From 
	(Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
	 From EmployeeSalary) a
Order by a.EmployeeID;

-- Subquery in Where
Select EmployeeID, JobTitle, Salary
From EmployeeSalary


where EmployeeID in (
	Select EmployeeID 
	From EmployeeDemographics
	where Age > 30);
    
    -- JOIN/MERGE TABLES : 
    -- table one
    SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM SQLTutorial.EmployeeDemographics emp
JOIN SQLTutorial.EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
group by JobTitle;

-- table two
select * from item
left join sale
on item.ItemID = sale.ItemID
left join vendor
on item.VendorID = vendor.VendorID;

-- # REMOVING DUPLICATES FROM DATASETS : 
select count(distinct ItemDescription)
from item;

select distinct ItemDescription from item;
    
                 
       /* # STRING FUNCTIONS : 

 String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower

*/

-- Using Trim, LTRIM, RTRIM :

Select EmployeeID, TRIM(employeeID) AS IDTRIM
FROM EmployeeErrors ;

Select EmployeeID, RTRIM(employeeID) as IDRTRIM
FROM EmployeeErrors ;

Select EmployeeID, LTRIM(employeeID) as IDLTRIM
FROM EmployeeErrors ;

-- Using Replace :
Select LastName, REPLACE(LastName, '- Fired', '') as LastNameFixed
FROM EmployeeErrors;

-- Using Substring : 
Select Substring(err.FirstName,1,3), Substring(dem.FirstName,1,3), Substring(err.LastName,1,3), Substring(dem.LastName,1,3)
FROM EmployeeErrors err
JOIN EmployeeDemographics dem
	on Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)
	and Substring(err.LastName,1,3) = Substring(dem.LastName,1,3);
    
    -- Using UPPER and lower : 
Select firstname, LOWER(firstname)
from EmployeeErrors;

Select Firstname, UPPER(FirstName)
from EmployeeErrors;

-- SQL CASE EXPRESSION (WITH 'AND','OR') :
select saleID,Tax, Total,
(case
 when Total > 2500 & Tax < 500 then 'super sales'
when Total > 1000 | Tax < 500 then 'good sales'
when Total < 500 then 'poor sales'
else 'normal sales'
end )
from sale;

-- SQL WILDCARDS (_ , % , ? , * ) :
select * from customers where city like 'ber%';

select * from customers where city like '%es%';

select * from customers where city like '-ondon';

-- SQL 'HAVING' CLAUSE :
select count(customerID),country
from customers
group by country
having count(customerID)>5
order by count(customerID)DESC;

-- SQL SUB-QUERIES OPERATORS ( EXISTS,ANY,ALL) :
select supplierName
from suppliers
where exists (select productName from products where products.supplierID=suppliers.supplierID
and price<20);

select productName
from products
where productID=any
(select productID from orderDetails where quantity=10);

select productName
from products
where productID = all
(select productID from orderDetails where quantity =10);

--  SQL FUNDAMENTAL WINDOW FUNCTIONS ( row_number(),rank(),dense_rank(),percent_rank(),ntile())
select first_name , salary,rank()over(order by salary desc) as salary_rank,
dense_rank()over(order by salary desc) as salary_dense_rank,
row_number()over(order by salary desc) as salary_rank
from employees;

select order_id,order_date,customer_name,city,order_amount,sum(order_amount)over(partition by city) as grand_total
from Orders;

select  naming,score,row_number() over (order by score desc) as ranking
from exam_scores;

select naming,score,rank() over ( order by score desc) as ranking
from exam_scores;

select naming,score,dense_rank() over (order by score desc) as percentile_rank
from exam_scores;

select naming,score,percent_rank() over (order by score desc) as percentile_rank
from exam_scores;

select naming,score,ntile(4) over ( order by score desc) as quartile
from exam_scores;

-- # ANALYZING QUERY PERFORMANCE EXAMPLE :
explain select * from employees;



    
    