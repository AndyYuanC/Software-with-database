create table address
( unit_no 		integer,
street_name 	varchar2(30),
city 			varchar2(20),
province 		varchar2(20),
postal_code 	char(6) not null,
country			varchar2(20),
PRIMARY KEY 	(unit_no, street_name, city) );

create table lives
( unit_no 		integer,
street_name 	varchar2(30),
city 			varchar2(20),
customer_id 	integer,
PRIMARY KEY 	(unit_no, street_name, city, customer_id),
foreign key 	(unit_no, street_name, city) references address(unit_no, street_name, city) ON DELETE CASACADE ON UPDATE CASACADE,
foreign key 	(customer_id) references customer(customer_id) ON DELETE CASCADE ON UPDATE CASCADE );

create table customer
( customer_id 	integer not null PRIMARY KEY,
customer_name 	varchar2(20),
customer_phone 	char(12) not null,
customer_gender varchar2(6)),
customer_birthdate date );

create table parcel_owns
( weight 		double,
volume 			integer,
description 	varchar2(32),
customer_id 	integer not null,
PRIMARY KEY 	(description, customer_id),
foreign key 	(customer_id) references customer(customer_id) ON DELETE CASCADE ON UPDATE CASCADE );

create table contains
( description 	varchar2(32),
customer_id 	integer,
order_no 		integer,
PRIMARY KEY 	(description, customer_id, order_no),
foreign key 	(description, customer_id) references parcel_owns(description, customer_id) ON DELETE CASCADE ON UPDATE CASCADE,
foreign key 	(order_no) REFERENCES order(order_no) ON DELETE CASCADE ON UPDATE CASCADE );

create table order_delivers
( order_no 		integer PRIMARY KEY,
delivery_method varchar2(20),
receiver 		varchar2(20),
signature 		boolean,
due_date 		date,
address 		varchar2(30),
employee_id 	integer not null,
foreign key 	(employee_id) references employee_works(employee_id) ON DELETE CASCADE ON UPDATE CASCADE );

create table payment_requires
( receipt_no 	integer PRIMARY KEY,
price 			double,
due_date 		date,
payment_method 	varchar2(10),
order_no 		integer not null unique,
foreign key 	(order_no) references order(order_no) ON DELETE CASCADE ON UPDATE CASCADE );

create table employee_works
( employee_id 	integer PRIMARY KEY,
employee_name 	varchar2(20),
employee_birthdate date,
employee_gender varchar2(6),
employee_sin 	varchar2(12),
employee_address varchar2(30),
branch_id 		integer not null,
foreign key 	(branch_id) references branch(branch_id) ON DELETE NO ACTION ON UPDATE CASCADE );

create table branch
( branch_id 	integer PRIMARY KEY,
address 		varchar2(30),
phone_no 		varchar2(14) );

commit;