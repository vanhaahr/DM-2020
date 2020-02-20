-- CREATE EXCESICE DATABASE

CREATE DATABASE Excersice_13022020;

-- CREATE TABLE Customers

CREATE TABLE Customers(
customer_id serial PRIMARY KEY,
Username Varchar(50) UNIQUE NOT NULL,
Password Varchar(50) NOT NULL,
Email Varchar (355)UNIQUE NOT NULL,
Created_on Timestamp NOT NULL,
Last_login Timestamp
);

-- INSERT INTO CUSTOMERS TABLE

INSERT INTO Customers(Username, Password, Email, Created_on)
VALUES ('john', 'myPassWOrd', 'John@acme', now());

insert into Customers(Username, Password, Email, Created_on)
values('anne', 'SomePassword', 'anne@acme.com', now());

-- SEE ENTIRE CUSTOMERS TABLE WITH CONTENT

select * from Customers;

-- CREATE TABLE PRODUCTS

Create Table Products (
product_id serial PRIMARY KEY,
name Varchar(150) NOT NULL,
Price Real
);

-- INSERT INTO Products TABLE

insert into products (name, Price)
values ('Samsung Galaxy s20', 7799.95);

insert into products (name, Price)
values ('Samsung Galaxy s20 - Leather', 799.95);

insert into products (name, Price)
Values ('iPhone 11 Pro', 8899);

insert into products (name, Price)
Values ('iPhone 11 Pro - Leather Cover', 399.5);

insert into products (name, Price)
Values ('Huawei p30 lite', 1664.5);

insert into products (name, Price)
Values ('Huawei p30 lite - Leather Cover', 1664.5);

-- UPDATE TABLE PRODUCTS

ALTER TABLE Products ADD Column Manufacture VARCHAR(250);

-- SEE ENTIRE PRODUCTS TABLE

select * from Products;

-- CREATE ORDERS TABLER

CREATE TABLE ORDERS(

order_id serial PRIMARY KEY, 
order_number VARCHAR (10) NOT NULL,
customer_id integer NOT NULL References Customers (customer_id)
);

-- INSERT INTO ORDERS TABLE

insert into orders (order_number,customer_id)
values ('DA-0001234',1);

insert into orders (order_number,customer_id)
values ('DA-0001235',1);

insert into orders (order_number,customer_id)
values ('DE-0001236',2);

insert into orders (order_number,customer_id)
values ('DE-0001237',2);

-- SE ENTIRE ORDERS TABLE 

select * from Orders;

-- CREATE TABLE ORDER LINES

Create Table Order_lines(
id serial Primary key,
order_id int NOT NULL references Orders(order_id),
product_id int NOT NULL references products (product_id),
amount int NOT NULL
);

ALTER TABLE Order_lines RENAME COLUMN id to Order_Lines_Id;

-- INSERT INTO ORDER LINES TABLE

Insert Into Order_lines(Order_id, product_id, Amount)
Values (1,1,2);
Insert Into Order_lines(Order_id, product_id, Amount)
Values (1,2,2);
Insert Into Order_lines(Order_id, product_id, Amount)
Values (1,5,1);
Insert Into Order_lines(Order_id, product_id, Amount)
Values (3,3,2);
Insert Into Order_lines(Order_id, product_id, Amount)
Values (3,4,1);
Insert Into Order_lines(Order_id, product_id, Amount)
Values (4,1,1);

-- SEE ENTIRE ORDER LINES TABLE

select * from order_lines;

-- QUERIES

SELECT * FROM Orders INNER JOIN Customers Using (Customer_id);

Select * from orders inner join order_lines Using (order_id);

SELECT name, amount, Order_number, customers.email FROM orders JOIN order_lines using (order_id) join products Using (product_id) join customers using (customer_id) ORDER BY name;

-- CREATE VIEW

CREATE VIEW my_view_1 AS
SELECT order_number, name as product_name, username as Buyer, amount as Amount_bought from order_lines, products, customers, orders
where order_lines.product_id=products.product_id and orders.customer_id=customers.customer_id and orders.order_id=order_lines.order_id;

select * from my_view_1 order by order_number;

drop view my_view_1;
