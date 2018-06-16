create table address
( unit_no 		integer,
street_name 	varchar2(30),
city 			varchar2(20),
province 		varchar2(20),
postal_code 	varchar2(6),
country			varchar2(20),
PRIMARY KEY (unit_no, street_name, city));

create table customer
( customer_id 	integer PRIMARY KEY,
customer_name 	varchar2(20),
customer_phone 	varchar2(14),
customer_gender varchar2(6) CHECK (customer_gender IN ('MALE','FEMALE','Male','Female','male','female')),
customer_birthdate date );

create table lives
( unit_no 		integer,
street_name 	varchar2(30),
city 			varchar2(20),
customer_id 	integer,
PRIMARY KEY (unit_no, street_name, city, customer_id),
foreign key (unit_no, street_name, city) references address (unit_no, street_name, city) ON DELETE CASCADE,
foreign key (customer_id) references customer (customer_id) ON DELETE CASCADE);

create table parcel_owns
( weight 		float(3),
volume 			integer,
description 	varchar2(50),
customer_id 	integer not null,
PRIMARY KEY 	(description, customer_id),
foreign key 	(customer_id) references customer (customer_id) ON DELETE CASCADE );

create table branch
( branch_id 	integer PRIMARY KEY,
address 		varchar2(30),
phone_no 		varchar2(14) );

create table employee_works
( employee_id 	integer PRIMARY KEY,
employee_name 	varchar2(20),
employee_birthdate date,
employee_gender varchar2(6),
employee_sin 	varchar2(12),
employee_address varchar2(30),
branch_id 		integer not null,
foreign key 	(branch_id) references branch (branch_id) );

create table order_delivers
( order_no 		integer PRIMARY KEY,
delivery_method varchar2(20),
receiver 		varchar2(20),
start_date		date,
delivery_days 	integer,
address 		varchar2(30),
employee_id 	integer not null,
foreign key 	(employee_id) references employee_works (employee_id) ON DELETE CASCADE );

create table contains
( description 	varchar2(50),
customer_id 	integer,
order_no 		integer,
PRIMARY KEY 	(description, customer_id, order_no),
foreign key 	(description, customer_id) references parcel_owns (description, customer_id) ON DELETE CASCADE,
foreign key 	(order_no) REFERENCES order_delivers (order_no) ON DELETE CASCADE);

create table payment_requires
( receipt_no 	integer PRIMARY KEY,
price 			float(2),
payment_date 	date,
payment_method 	varchar2(10),
order_no 		integer not null unique,
foreign key 	(order_no) references order_delivers (order_no) ON DELETE CASCADE);



commit;