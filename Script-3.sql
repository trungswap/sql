-- b2
select * 
from offices 
where country  = 'USA'

--b3
select * 
from employees; 

SELECT firstname As FName, lastname As LName 
from employees;

SELECT 
CONCAT(firstname, " " , lastname) As FullName 
FROM employees

-- b4
select * 
from employees; 

select *,offices.state as 'office.state', offices.country as 'office.country'
from offices left join employees  on employees.officeCode  = offices.officeCode;

-- b5
select *
from offices 

--b6
select count(employeeNumber)
from employees 

-- b7
select c.customerNumber, count(p.customerNumber) countPayment 
from customers c 
inner join payments p ON p.customerNumber = c.customerNumber 
group by p.customerNumber 
having count(p.customerNumber) <= 3;

-- b8
select c.customerNumber 
from customers c 
inner join payments p ON p.customerNumber = c.customerNumber 
group by p.customerNumber
order by p.paymentDate  
limit 10;

-- b9
select * 
from customers c 
where c.salesRepEmployeeNumber is null 

-- b10
select c.customerNumber, count(p.customerNumber) countPayment 
from customers c 
inner join payments p ON p.customerNumber = c.customerNumber 
group by p.customerNumber 
order by countPayment desc 
limit 10

-- 11
select *
from orders o 
where o.orderDate between  '2003-11-01' and '2003-11-30'

-- 12,13
insert  into `offices`(`officeCode`,`city`,`phone`,`addressLine1`,`addressLine2`,`state`,`country`,`postalCode`,`territory`) values 

('8','San Francisco','+12 650 219 4782','100 Market Street','Suite 300','CA','TL','94080','NA'),

('9','Boston','+84 215 837 0825','1550 Court Place','Suite 102','MA','VN','02107','NA'),

insert  into `employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`) values 

(1080,'Murphy','Diane','x5800','dmurphy@classicmodelcars.com','1',NULL,'President'),

(1089,'Patterson','Mary','x4611','mpatterso@classicmodelcars.com','1',1002,'VP Sales')

-- 14
update offices 
set addressLine2 = '31 street Red'
where officeCode = '1' 

-- 15
update customers 
set addressLine2 = addressLine1 
where addressLine2 is null 

-- 16
update customers 
set state = concat(upper(left (city, 1)), substring(city, 2, 2))
where state is null 

-- 17
select c.customerNumber, count(o.customerNumber) countOrders from customers c 
inner join orders o  ON o.customerNumber = c.customerNumber 
group by o.customerNumber 
order by countOrders desc 
limit 10

-- 18
select * from orderdetails o 

-- 19
select * from orderdetails o 
where left (productCode, 3) = 'S10' 


-- 20
select p.productCode, count(o.productCode) countDetails from products p left join orderdetails o 
on p.productCode = o.productCode 
group by p.productCode 
order by countDetails asc 
limit 11

-- 21
select p.productCode, p.productLine, o.orderNumber ,o.quantityOrdered , o.priceEach , o.orderLineNumber 
from products p left join orderdetails o 
on p.productCode = o.productCode

-- 22
insert into products (productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP) values
('Z21_1454', 'Lamborghini', 'Classic Cars', '1:18', 'Audi Auto', 'Beautiful Car', 10000, 100.00, 1000),
('D29_6435', 'Lamborghini Huracan', 'Classic Cars', '1:18', 'Audi Auto', 'Beautiful Car', 9999, 100.00, 649),
('S22_1439', 'Lamborghini Aventador', 'Classic Cars', '1:18', 'Audi Auto', 'Beautiful Car', 16594, 100.00, 4849);

-- 23 
delete from customers 
where customerNumber not in (select customerNumber from orders )

-- 24
select * from orders o join orderdetails o2 ON o.orderNumber = o2.orderNumber 
order by customerNumber asc

-- 25
with USA_Customers as (
select * from customers c 
where c.country = 'USA'
)
select p.customerNumber, USA_Customers.customerName, count(p.customerNumber) countPayments
from payments p join USA_Customers 
on p.customerNumber = USA_Customers.customerNumber
group by p.customerNumber 
order by countPayments desc 
limit 1

-- 26
select * 
from payments p 
order by amount 
limit 3

-- 28
select * 
from orders o join payments p 
on o.customerNumber = p.customerNumber 
where (p.paymentDate between '2003-04-01' and '2003-04-30') 
and (p.paymentDate between '2003-12-01' and '2003-12-31')

-- 30
select * 
from customers c 
where creditLimit < 20000 

-- 31
select *
from products p 
order by quantityInStock desc 
limit 2

-- 33
select productCode, status , count(productCode) countProduct  
from orders o 
natural join orderdetails o2 
where status = 'Cancelled'
group by productCode 
order by countProduct desc
limit 5

-- 34
select productCode, shippedDate  from orders o natural join orderdetails o2 
where shippedDate between '2004-01-01' and '2004-12-31'
limit 5

-- 35
select customerNumber , sum(amount) totalAmount from payments p
where paymentDate between '2004-01-01' and '2004-12-31'
group by customerNumber 

-- 36
select *, count(reportsTo) countReport from employees e
group by reportsTo 
order by countReport desc
limit 2

-- 38
select * from orders o 
where datediff(shippedDate, orderDate) < 3 
limit 10

-- 39
select * from orders o 
where shippedDate between '2004-12-01' and '2004-12-31'
limit 10







