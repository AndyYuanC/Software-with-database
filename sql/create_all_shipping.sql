drop table payment_requires;
drop table contains;
drop table order_delivers;
drop table employee_works;
drop table branch;
drop table parcel_owns;
drop table lives;
drop table customer;
drop table address;

commit;

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

alter session set NLS_DATE_FORMAT='DD-MM-YYYY';
commit;

insert into address (unit_no, street_name, city, province, postal_code, country) values (820, 'Manley', 'Nanaimo', 'British Columbia', 'V6L2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (55, 'West', 'Armstrong', 'British Columbia', 'M9R2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (408, 'Towne', 'Duncan', 'British Columbia', 'V9L2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (8523, '6th', 'Langford', 'British Columbia', 'V9C2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (630, 'Reinke', 'Sicamous', 'British Columbia', 'G2L2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (2914, 'Farmco', 'Logan Lake', 'British Columbia', 'T3S2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (7492, 'Goodland', 'Okanagan', 'British Columbia', 'T0P2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (6982, 'Warrior', 'Lillooet', 'British Columbia', 'H9G2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (0438, 'Sunnyside', 'New Westminster', 'British Columbia', 'V4C2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (12, 'Valley Edge', 'Ladysmith', 'British Columbia', 'V9G2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (6398, 'Surrey', 'Summerland', 'British Columbia', 'H1V2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (95569, 'Golf Course', 'Kimberley', 'British Columbia', 'V1A2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (29148, 'Northridge', 'Lillooet', 'British Columbia', 'H9G2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (387, 'Oriole', 'Maple Ridge', 'British Columbia', 'V2X2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (83, 'East', 'Lumby', 'British Columbia', 'P7L2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (0, 'Scoville', 'Chilliwack', 'British Columbia', 'N5L2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (69, 'Bayside', 'Burns Lake', 'British Columbia', 'M4H2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (4162, 'Mccormick', 'Maple Ridge', 'British Columbia', 'V2X2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (5329, 'Manley', 'Duncan', 'British Columbia', 'V9L2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (43444, 'Arrowood', 'Houston', 'British Columbia', 'T9G2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (465, 'Hansons', 'West End', 'British Columbia', 'V7Y2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (46701, 'Shelley', 'Lions Bay', 'British Columbia', 'K4K2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (0, 'Hoard', 'Logan Lake', 'British Columbia', 'T3S2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (62079, 'Lunder', 'Port Moody', 'British Columbia', 'V3H2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (0528, 'Sutherland', 'Bowen Island', 'British Columbia', 'V7W2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (82793, 'Dovetail', 'Nakusp', 'British Columbia', 'H9A2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (205, 'New Castle', 'Hope', 'British Columbia', 'V7R2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (32, 'Cottonwood', 'Oliver', 'British Columbia', 'E5L2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (96635, 'Sunbrook', 'Abbotsford', 'British Columbia', 'L9T2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (5, 'Dapin', 'West End', 'British Columbia', 'V7Y2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (77817, 'Springview', 'North Saanich', 'British Columbia', 'K6A2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (7, 'Coleman', 'North Cowichan', 'British Columbia', 'V9L2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (869, 'Mandrake', 'Ladysmith', 'British Columbia', 'V9G2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (961, 'Jay', 'Oliver', 'British Columbia', 'E5L2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (4, 'Maywood', 'New Westminster', 'British Columbia', 'V4C2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (822, 'Glendale', 'Lillooet', 'British Columbia', 'H9G2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (6294, 'Scott', 'Victoria', 'British Columbia', 'V9A2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (6045, 'Darwin', 'White Rock', 'British Columbia', 'V4B2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (028, 'La Follette', 'Osoyoos', 'British Columbia', 'N9V2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (986, 'Monica', 'Aldergrove', 'British Columbia', 'V4W2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (90673, 'Pankratz', 'Oliver', 'British Columbia', 'E5L2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (63609, 'Raven', 'Sicamous', 'British Columbia', 'G2L2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (90, 'Burrows', 'Abbotsford', 'British Columbia', 'L9T2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (9213, 'Badeau', 'Richmond', 'British Columbia', 'V6Y2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (35, 'Green Ridge', 'Chase', 'British Columbia', 'H4R2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (0, 'Del Mar', 'Summerland', 'British Columbia', 'H1V2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (7, 'Kinsman', 'Lumby', 'British Columbia', 'P7L2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (44242, 'Twin Pines', 'Duncan', 'British Columbia', 'V9L2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (28964, 'Elmside', 'Parksville', 'British Columbia', 'V9P2A1', 'Canada');
insert into address (unit_no, street_name, city, province, postal_code, country) values (19932, 'Crownhardt', 'Kamloops', 'British Columbia', 'H9P2A1', 'Canada');
commit work;

insert into branch (branch_id, address, phone_no) values (41774, '5 Porter Hill', '361-486-7779');
insert into branch (branch_id, address, phone_no) values (59, '0 Loftsgordon Alley', '368-833-2458');
insert into branch (branch_id, address, phone_no) values (7509, '2573 Elka Junction', '688-154-2714');
insert into branch (branch_id, address, phone_no) values (85784, '182 Eagle Crest Avenue', '225-288-6767');
commit work;

insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (1, 'Katti Sherburn', '791-104-5517', 'Female', '24/06/1966');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (2, 'Andrey Millhill', '786-548-7570', 'Male', '25/02/1997');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (3, 'Emma Weafer', '974-353-8409', 'Female', '17/01/1963');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (4, 'Hersch Fishpond', '131-281-5352', 'Male', '01/09/1983');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (5, 'Brand Lingwood', '423-542-6653', 'Male', '23/07/1971');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (6, 'Skyler Bonicelli', '324-268-6921', 'Male', '14/11/1990');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (7, 'Gianna Robertazzi', '468-976-8139', 'Female', '09/12/1956');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (8, 'Angelo Farrall', '555-586-4413', 'Male', '18/03/1969');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (9, 'Korrie Aspinal', '104-667-4226', 'Female', '13/07/1951');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (10, 'Shir Scamp', '304-237-2661', 'Female', '21/05/1958');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (11, 'Casandra Bilham', '701-996-3428', 'Female', '19/08/1972');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (12, 'Johnna Byllam', '887-319-4734', 'Female', '20/11/1950');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (13, 'Alfy Normanville', '359-954-8850', 'Male', '21/12/1966');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (14, 'Merna Karpeev', '303-874-0132', 'Female', '11/10/1993');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (15, 'Steffi Beenham', '873-597-6026', 'Female', '19/10/1976');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (16, 'Benedick Levens', '205-530-7893', 'Male', '23/05/1996');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (17, 'Ariel Dine-Hart', '476-454-2013', 'Male', '15/12/1967');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (18, 'Jereme Battill', '248-261-2755', 'Male', '18/04/1978');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (19, 'Rube Hackly', '673-827-8395', 'Male', '05/11/1974');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (20, 'Tucker Leopard', '133-690-6933', 'Male', '13/07/1955');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (21, 'Karin Baumaier', '559-305-6905', 'Female', '26/07/1983');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (22, 'Miguela Perris', '540-337-9414', 'Female', '27/12/1955');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (23, 'Karola David', '813-344-6057', 'Female', '30/09/1976');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (24, 'Gustavus Harvie', '346-188-9928', 'Male', '10/07/1977');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (25, 'Horacio Wooder', '444-858-3816', 'Male', '11/10/1970');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (26, 'Veriee Gate', '322-612-6685', 'Female', '25/06/1996');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (27, 'Benjie Vaune', '490-321-9136', 'Male', '23/04/1986');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (28, 'Carlie Bowcock', '621-961-3745', 'Male', '29/03/1989');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (29, 'Mace Libbie', '416-539-7716', 'Male', '22/02/1965');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (30, 'Lindsay Caherny', '408-250-8902', 'Male', '26/06/1965');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (31, 'Iggy Coppard', '717-932-9174', 'Male', '02/07/1966');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (32, 'Corella Lockyer', '886-454-0899', 'Female', '11/03/1965');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (33, 'Jeremias Chesterton', '717-549-7366', 'Male', '08/06/1953');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (34, 'Izabel Glasard', '959-329-3352', 'Female', '22/07/1988');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (35, 'Cole Binder', '167-849-1993', 'Male', '16/06/1952');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (36, 'Nefen Charrisson', '229-306-7305', 'Male', '02/07/1994');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (37, 'Trixy Kelshaw', '770-514-9883', 'Female', '17/05/1989');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (38, 'Ellis Keepence', '509-852-6651', 'Male', '20/04/1959');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (39, 'Genvieve Dreghorn', '962-992-6273', 'Female', '14/02/1957');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (40, 'Mack Barnby', '148-756-5305', 'Male', '14/04/1988');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (41, 'Callie Merner', '793-356-3729', 'Female', '14/05/1954');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (42, 'Rowen Linbohm', '499-482-8108', 'Male', '06/06/1966');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (43, 'Ruthy Rivelon', '386-915-2770', 'Female', '30/07/1968');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (44, 'Nickey Gurry', '787-100-9159', 'Male', '14/10/1950');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (45, 'Ty Webburn', '929-188-3746', 'Male', '11/03/1994');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (46, 'Randolf Malicki', '366-682-9641', 'Male', '03/09/1955');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (47, 'Abbie Swannell', '573-615-7246', 'Male', '22/02/1953');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (48, 'Chandra Beetham', '178-243-6390', 'Female', '30/05/1952');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (49, 'Stanislaw Foucar', '834-373-8267', 'Male', '09/11/1960');
insert into customer (customer_id, customer_name, customer_phone, customer_gender, customer_birthdate) values (50, 'Alvinia Rodgier', '396-140-5349', 'Female', '08/03/1989');

commit work;

insert into lives (unit_no, street_name, city, customer_id) values (820, 'Manley', 'Nanaimo', 1);
insert into lives (unit_no, street_name, city, customer_id) values (55, 'West', 'Armstrong', 2);
insert into lives (unit_no, street_name, city, customer_id) values (408, 'Towne', 'Duncan', 3);
insert into lives (unit_no, street_name, city, customer_id) values (8523, '6th', 'Langford', 4);
insert into lives (unit_no, street_name, city, customer_id) values (630, 'Reinke', 'Sicamous', 5);
insert into lives (unit_no, street_name, city, customer_id) values (2914, 'Farmco', 'Logan Lake', 6);
insert into lives (unit_no, street_name, city, customer_id) values (7492, 'Goodland', 'Okanagan', 7);
insert into lives (unit_no, street_name, city, customer_id) values (6982, 'Warrior', 'Lillooet', 8);
insert into lives (unit_no, street_name, city, customer_id) values (0438, 'Sunnyside', 'New Westminster', 9);
insert into lives (unit_no, street_name, city, customer_id) values (12, 'Valley Edge', 'Ladysmith', 10);
insert into lives (unit_no, street_name, city, customer_id) values (6398, 'Surrey', 'Summerland', 11);
insert into lives (unit_no, street_name, city, customer_id) values (95569, 'Golf Course', 'Kimberley', 12);
insert into lives (unit_no, street_name, city, customer_id) values (29148, 'Northridge', 'Lillooet', 13);
insert into lives (unit_no, street_name, city, customer_id) values (387, 'Oriole', 'Maple Ridge', 14);
insert into lives (unit_no, street_name, city, customer_id) values (83, 'East', 'Lumby', 15);
insert into lives (unit_no, street_name, city, customer_id) values (0, 'Scoville', 'Chilliwack', 16);
insert into lives (unit_no, street_name, city, customer_id) values (69, 'Bayside', 'Burns Lake', 17);
insert into lives (unit_no, street_name, city, customer_id) values (4162, 'Mccormick', 'Maple Ridge', 18);
insert into lives (unit_no, street_name, city, customer_id) values (5329, 'Manley', 'Duncan', 19);
insert into lives (unit_no, street_name, city, customer_id) values (43444, 'Arrowood', 'Houston', 20);
insert into lives (unit_no, street_name, city, customer_id) values (465, 'Hansons', 'West End', 21);
insert into lives (unit_no, street_name, city, customer_id) values (46701, 'Shelley', 'Lions Bay', 22);
insert into lives (unit_no, street_name, city, customer_id) values (0, 'Hoard', 'Logan Lake', 23);
insert into lives (unit_no, street_name, city, customer_id) values (62079, 'Lunder', 'Port Moody', 24);
insert into lives (unit_no, street_name, city, customer_id) values (0528, 'Sutherland', 'Bowen Island', 25);
insert into lives (unit_no, street_name, city, customer_id) values (82793, 'Dovetail', 'Nakusp', 26);
insert into lives (unit_no, street_name, city, customer_id) values (205, 'New Castle', 'Hope', 27);
insert into lives (unit_no, street_name, city, customer_id) values (32, 'Cottonwood', 'Oliver', 28);
insert into lives (unit_no, street_name, city, customer_id) values (96635, 'Sunbrook', 'Abbotsford', 29);
insert into lives (unit_no, street_name, city, customer_id) values (5, 'Dapin', 'West End', 30);
insert into lives (unit_no, street_name, city, customer_id) values (77817, 'Springview', 'North Saanich', 31);
insert into lives (unit_no, street_name, city, customer_id) values (7, 'Coleman', 'North Cowichan', 32);
insert into lives (unit_no, street_name, city, customer_id) values (869, 'Mandrake', 'Ladysmith', 33);
insert into lives (unit_no, street_name, city, customer_id) values (961, 'Jay', 'Oliver', 34);
insert into lives (unit_no, street_name, city, customer_id) values (4, 'Maywood', 'New Westminster', 35);
insert into lives (unit_no, street_name, city, customer_id) values (822, 'Glendale', 'Lillooet', 36);
insert into lives (unit_no, street_name, city, customer_id) values (6294, 'Scott', 'Victoria', 37);
insert into lives (unit_no, street_name, city, customer_id) values (6045, 'Darwin', 'White Rock', 38);
insert into lives (unit_no, street_name, city, customer_id) values (028, 'La Follette', 'Osoyoos', 39);
insert into lives (unit_no, street_name, city, customer_id) values (986, 'Monica', 'Aldergrove', 40);
insert into lives (unit_no, street_name, city, customer_id) values (90673, 'Pankratz', 'Oliver', 41);
insert into lives (unit_no, street_name, city, customer_id) values (63609, 'Raven', 'Sicamous', 42);
insert into lives (unit_no, street_name, city, customer_id) values (90, 'Burrows', 'Abbotsford', 43);
insert into lives (unit_no, street_name, city, customer_id) values (9213, 'Badeau', 'Richmond', 44);
insert into lives (unit_no, street_name, city, customer_id) values (35, 'Green Ridge', 'Chase', 45);
insert into lives (unit_no, street_name, city, customer_id) values (0, 'Del Mar', 'Summerland', 46);
insert into lives (unit_no, street_name, city, customer_id) values (7, 'Kinsman', 'Lumby', 47);
insert into lives (unit_no, street_name, city, customer_id) values (44242, 'Twin Pines', 'Duncan', 48);
insert into lives (unit_no, street_name, city, customer_id) values (28964, 'Elmside', 'Parksville', 49);
insert into lives (unit_no, street_name, city, customer_id) values (19932, 'Crownhardt', 'Kamloops', 50);

insert into lives (unit_no, street_name, city, customer_id) values (55, 'West', 'Armstrong', 1);
insert into lives (unit_no, street_name, city, customer_id) values (408, 'Towne', 'Duncan', 1);
insert into lives (unit_no, street_name, city, customer_id) values (8523, '6th', 'Langford', 1);
insert into lives (unit_no, street_name, city, customer_id) values (630, 'Reinke', 'Sicamous', 1);
insert into lives (unit_no, street_name, city, customer_id) values (2914, 'Farmco', 'Logan Lake', 1);
insert into lives (unit_no, street_name, city, customer_id) values (7492, 'Goodland', 'Okanagan', 1);
insert into lives (unit_no, street_name, city, customer_id) values (6982, 'Warrior', 'Lillooet', 1);
insert into lives (unit_no, street_name, city, customer_id) values (0438, 'Sunnyside', 'New Westminster', 1);
insert into lives (unit_no, street_name, city, customer_id) values (12, 'Valley Edge', 'Ladysmith', 1);
insert into lives (unit_no, street_name, city, customer_id) values (6398, 'Surrey', 'Summerland', 1);
insert into lives (unit_no, street_name, city, customer_id) values (95569, 'Golf Course', 'Kimberley', 1);
insert into lives (unit_no, street_name, city, customer_id) values (29148, 'Northridge', 'Lillooet', 1);
insert into lives (unit_no, street_name, city, customer_id) values (387, 'Oriole', 'Maple Ridge', 1);
insert into lives (unit_no, street_name, city, customer_id) values (83, 'East', 'Lumby', 1);
insert into lives (unit_no, street_name, city, customer_id) values (0, 'Scoville', 'Chilliwack', 1);
insert into lives (unit_no, street_name, city, customer_id) values (69, 'Bayside', 'Burns Lake', 1);
insert into lives (unit_no, street_name, city, customer_id) values (4162, 'Mccormick', 'Maple Ridge', 1);
insert into lives (unit_no, street_name, city, customer_id) values (5329, 'Manley', 'Duncan', 1);
insert into lives (unit_no, street_name, city, customer_id) values (43444, 'Arrowood', 'Houston', 1);
insert into lives (unit_no, street_name, city, customer_id) values (465, 'Hansons', 'West End', 1);
insert into lives (unit_no, street_name, city, customer_id) values (46701, 'Shelley', 'Lions Bay', 1);
insert into lives (unit_no, street_name, city, customer_id) values (0, 'Hoard', 'Logan Lake', 1);
insert into lives (unit_no, street_name, city, customer_id) values (62079, 'Lunder', 'Port Moody', 1);
insert into lives (unit_no, street_name, city, customer_id) values (0528, 'Sutherland', 'Bowen Island', 1);
insert into lives (unit_no, street_name, city, customer_id) values (82793, 'Dovetail', 'Nakusp', 1);
insert into lives (unit_no, street_name, city, customer_id) values (205, 'New Castle', 'Hope', 1);
insert into lives (unit_no, street_name, city, customer_id) values (32, 'Cottonwood', 'Oliver', 1);
insert into lives (unit_no, street_name, city, customer_id) values (96635, 'Sunbrook', 'Abbotsford', 1);
insert into lives (unit_no, street_name, city, customer_id) values (5, 'Dapin', 'West End', 1);
insert into lives (unit_no, street_name, city, customer_id) values (77817, 'Springview', 'North Saanich', 1);
insert into lives (unit_no, street_name, city, customer_id) values (7, 'Coleman', 'North Cowichan', 1);
insert into lives (unit_no, street_name, city, customer_id) values (869, 'Mandrake', 'Ladysmith', 1);
insert into lives (unit_no, street_name, city, customer_id) values (961, 'Jay', 'Oliver', 1);
insert into lives (unit_no, street_name, city, customer_id) values (4, 'Maywood', 'New Westminster', 1);
insert into lives (unit_no, street_name, city, customer_id) values (822, 'Glendale', 'Lillooet', 1);
insert into lives (unit_no, street_name, city, customer_id) values (6294, 'Scott', 'Victoria', 1);
insert into lives (unit_no, street_name, city, customer_id) values (6045, 'Darwin', 'White Rock', 1);
insert into lives (unit_no, street_name, city, customer_id) values (028, 'La Follette', 'Osoyoos', 1);
insert into lives (unit_no, street_name, city, customer_id) values (986, 'Monica', 'Aldergrove', 1);
insert into lives (unit_no, street_name, city, customer_id) values (90673, 'Pankratz', 'Oliver', 1);
insert into lives (unit_no, street_name, city, customer_id) values (63609, 'Raven', 'Sicamous', 1);
insert into lives (unit_no, street_name, city, customer_id) values (90, 'Burrows', 'Abbotsford', 1);
insert into lives (unit_no, street_name, city, customer_id) values (9213, 'Badeau', 'Richmond', 1);
insert into lives (unit_no, street_name, city, customer_id) values (35, 'Green Ridge', 'Chase', 1);
insert into lives (unit_no, street_name, city, customer_id) values (0, 'Del Mar', 'Summerland', 1);
insert into lives (unit_no, street_name, city, customer_id) values (7, 'Kinsman', 'Lumby', 1);
insert into lives (unit_no, street_name, city, customer_id) values (44242, 'Twin Pines', 'Duncan', 1);
insert into lives (unit_no, street_name, city, customer_id) values (28964, 'Elmside', 'Parksville', 1);
insert into lives (unit_no, street_name, city, customer_id) values (19932, 'Crownhardt', 'Kamloops', 1);

insert into lives (unit_no, street_name, city, customer_id) values (820, 'Manley', 'Nanaimo', 2);
insert into lives (unit_no, street_name, city, customer_id) values (408, 'Towne', 'Duncan', 2);
insert into lives (unit_no, street_name, city, customer_id) values (8523, '6th', 'Langford', 2);
insert into lives (unit_no, street_name, city, customer_id) values (630, 'Reinke', 'Sicamous', 2);
insert into lives (unit_no, street_name, city, customer_id) values (2914, 'Farmco', 'Logan Lake', 2);
insert into lives (unit_no, street_name, city, customer_id) values (7492, 'Goodland', 'Okanagan', 2);
insert into lives (unit_no, street_name, city, customer_id) values (6982, 'Warrior', 'Lillooet', 2);
insert into lives (unit_no, street_name, city, customer_id) values (0438, 'Sunnyside', 'New Westminster', 2);
insert into lives (unit_no, street_name, city, customer_id) values (12, 'Valley Edge', 'Ladysmith', 2);
insert into lives (unit_no, street_name, city, customer_id) values (6398, 'Surrey', 'Summerland', 2);
insert into lives (unit_no, street_name, city, customer_id) values (95569, 'Golf Course', 'Kimberley', 2);
insert into lives (unit_no, street_name, city, customer_id) values (29148, 'Northridge', 'Lillooet', 2);
insert into lives (unit_no, street_name, city, customer_id) values (387, 'Oriole', 'Maple Ridge', 2);
insert into lives (unit_no, street_name, city, customer_id) values (83, 'East', 'Lumby', 2);
insert into lives (unit_no, street_name, city, customer_id) values (0, 'Scoville', 'Chilliwack', 2);
insert into lives (unit_no, street_name, city, customer_id) values (69, 'Bayside', 'Burns Lake', 2);
insert into lives (unit_no, street_name, city, customer_id) values (4162, 'Mccormick', 'Maple Ridge', 2);
insert into lives (unit_no, street_name, city, customer_id) values (5329, 'Manley', 'Duncan', 2);
insert into lives (unit_no, street_name, city, customer_id) values (43444, 'Arrowood', 'Houston', 2);
insert into lives (unit_no, street_name, city, customer_id) values (465, 'Hansons', 'West End', 2);
insert into lives (unit_no, street_name, city, customer_id) values (46701, 'Shelley', 'Lions Bay', 2);
insert into lives (unit_no, street_name, city, customer_id) values (0, 'Hoard', 'Logan Lake', 2);
insert into lives (unit_no, street_name, city, customer_id) values (62079, 'Lunder', 'Port Moody', 2);
insert into lives (unit_no, street_name, city, customer_id) values (0528, 'Sutherland', 'Bowen Island', 2);
insert into lives (unit_no, street_name, city, customer_id) values (82793, 'Dovetail', 'Nakusp', 2);
insert into lives (unit_no, street_name, city, customer_id) values (205, 'New Castle', 'Hope', 2);
insert into lives (unit_no, street_name, city, customer_id) values (32, 'Cottonwood', 'Oliver', 2);
insert into lives (unit_no, street_name, city, customer_id) values (96635, 'Sunbrook', 'Abbotsford', 2);
insert into lives (unit_no, street_name, city, customer_id) values (5, 'Dapin', 'West End', 2);
insert into lives (unit_no, street_name, city, customer_id) values (77817, 'Springview', 'North Saanich', 2);
insert into lives (unit_no, street_name, city, customer_id) values (7, 'Coleman', 'North Cowichan', 2);
insert into lives (unit_no, street_name, city, customer_id) values (869, 'Mandrake', 'Ladysmith', 2);
insert into lives (unit_no, street_name, city, customer_id) values (961, 'Jay', 'Oliver', 2);
insert into lives (unit_no, street_name, city, customer_id) values (4, 'Maywood', 'New Westminster', 2);
insert into lives (unit_no, street_name, city, customer_id) values (822, 'Glendale', 'Lillooet', 2);
insert into lives (unit_no, street_name, city, customer_id) values (6294, 'Scott', 'Victoria', 2);
insert into lives (unit_no, street_name, city, customer_id) values (6045, 'Darwin', 'White Rock', 2);
insert into lives (unit_no, street_name, city, customer_id) values (028, 'La Follette', 'Osoyoos', 2);
insert into lives (unit_no, street_name, city, customer_id) values (986, 'Monica', 'Aldergrove', 2);
insert into lives (unit_no, street_name, city, customer_id) values (90673, 'Pankratz', 'Oliver', 2);
insert into lives (unit_no, street_name, city, customer_id) values (63609, 'Raven', 'Sicamous', 2);
insert into lives (unit_no, street_name, city, customer_id) values (90, 'Burrows', 'Abbotsford', 2);
insert into lives (unit_no, street_name, city, customer_id) values (9213, 'Badeau', 'Richmond', 2);
insert into lives (unit_no, street_name, city, customer_id) values (35, 'Green Ridge', 'Chase', 2);
insert into lives (unit_no, street_name, city, customer_id) values (0, 'Del Mar', 'Summerland', 2);
insert into lives (unit_no, street_name, city, customer_id) values (7, 'Kinsman', 'Lumby', 2);
insert into lives (unit_no, street_name, city, customer_id) values (44242, 'Twin Pines', 'Duncan', 2);
insert into lives (unit_no, street_name, city, customer_id) values (28964, 'Elmside', 'Parksville', 2);
insert into lives (unit_no, street_name, city, customer_id) values (19932, 'Crownhardt', 'Kamloops', 2);
commit work;

insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (142, 'Kin Barnett', 'Male', '40-5336357', '6 Warner Way', 41774);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (165, 'Vanessa Longshaw', 'Female', '73-6665934', '42 Hayes Trail', 41774);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (196, 'Evelina Girt', 'Female', '29-9088976', '8 Maywood Place', 7509);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (163, 'Aleen Labin', 'Female', '93-0755254', '66407 Barby Drive', 7509);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (175, 'Carola Proback', 'Female', '81-4994128', '88 Emmet Trail', 7509);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (120, 'Allx Caberas', 'Female', '02-9085312', '672 Dahle Lane', 41774);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (145, 'Annetta Straughan', 'Female', '90-8105587', '13 Hoffman Place', 41774);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (131, 'Jammie Lovekin', 'Female', '50-7475414', '15 Vahlen Avenue', 41774);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (191, 'Bobbee Bythway', 'Female', '97-5126927', '99 Debs Avenue', 41774);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (101, 'Nita Hutchinson', 'Female', '66-2474597', '1 Esker Trail', 59);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (168, 'Cirilo Cready', 'Male', '01-9283205', '36 American Ash Trail', 7509);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (155, 'Hedvig Klimschak', 'Female', '74-9943035', '02 Crownhardt Drive', 41774);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (167, 'Eilis Kesley', 'Female', '99-2873125', '28809 Florence Avenue', 41774);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (184, 'Ricard Gaskamp', 'Male', '71-5634578', '4 Crest Line Lane', 41774);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (164, 'Boris Myner', 'Male', '93-4355010', '8788 Dayton Hill', 7509);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (182, 'Virgie Hargreave', 'Female', '61-1654972', '0 Amoth Point', 41774);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (126, 'Johanna Babber', 'Female', '67-6838680', '80761 Scott Point', 7509);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (137, 'Alric Leckie', 'Male', '49-6052332', '38 Lotheville Junction', 59);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (106, 'Rickie Nunan', 'Male', '04-4113811', '89891 Walton Lane', 59);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (121, 'Tressa Chisholm', 'Female', '07-4475586', '58067 Hollow Ridge Plaza', 7509);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (113, 'Windham Frusher', 'Male', '00-1799534', '40 Iowa Way', 59);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (157, 'Lorne Stourton', 'Female', '53-7397332', '61 Golf View Road', 59);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (158, 'Harman Ferebee', 'Male', '29-9661105', '18975 Bashford Way', 59);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (128, 'Augusto Elsmore', 'Male', '37-9919122', '66 Eagle Crest Hill', 85784);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (140, 'Gerrard Caudrey', 'Male', '35-1120861', '069 Sauthoff Crossing', 85784);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (148, 'Jamey Millery', 'Male', '89-8579426', '2668 La Follette Center', 85784);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (189, 'Frankie Beauman', 'Male', '26-8202065', '281 Hanson Center', 85784);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (169, 'Leroi Dudin', 'Male', '56-8135724', '05 Anthes Center', 85784);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (118, 'Jerrine Maurice', 'Female', '96-8874599', '9 Loomis Circle', 85784);
insert into employee_works (employee_id, employee_name, employee_gender, employee_sin, employee_address, branch_id) values (180, 'Madlen Robel', 'Female', '86-7975621', '29793 Clarendon Avenue', 85784);
commit work;

insert into order_delivers (order_no, delivery_method, receiver, start_date, delivery_days, address, employee_id) values (01, 'Standard', 'Karrah', '06/04/2018', 17, '325 Forest Pass', 142);
insert into order_delivers (order_no, delivery_method, receiver, start_date, delivery_days, address, employee_id) values (02, 'Standard', 'Carita', '09/12/2017', 16, '892 Clyde Gallagher Trail', 165);
insert into order_delivers (order_no, delivery_method, receiver, start_date, delivery_days, address, employee_id) values (03, 'Priority', 'Silvain', '21/07/2017', 17, '13 Talmadge Center', 196);
insert into order_delivers (order_no, delivery_method, receiver, start_date, delivery_days, address, employee_id) values (04, 'Express', 'Bethany', '01/06/2018', 17, '4 Memorial Road', 163);
insert into order_delivers (order_no, delivery_method, receiver, start_date, delivery_days, address, employee_id) values (05, 'Standard', 'Verne', '28/04/2018', 12, '85374 Waubesa Pass', 175);
insert into order_delivers (order_no, delivery_method, receiver, start_date, delivery_days, address, employee_id) values (06, 'Standard', 'Davita', '03/04/2018', 24, '6 Magdeline Drive', 120);
insert into order_delivers (order_no, delivery_method, receiver, start_date, delivery_days, address, employee_id) values (07, 'Priority', 'Dare', '20/03/2018', 27, '84545 Ruskin Hill', 145);
insert into order_delivers (order_no, delivery_method, receiver, start_date, delivery_days, address, employee_id) values (08, 'Standard', 'Normy', '26/07/2017', 22, '97873 Utah Plaza', 131);
insert into order_delivers (order_no, delivery_method, receiver, start_date, delivery_days, address, employee_id) values (09, 'Standard', 'Danell', '25/10/2017', 30, '77039 Sunfield Hill', 180);
insert into order_delivers (order_no, delivery_method, receiver, start_date, delivery_days, address, employee_id) values (010, 'Priority', 'Rakel', '16/05/2018', 13, '0 Paget Avenue', 118);
insert into order_delivers (order_no, delivery_method, receiver, start_date, delivery_days, address, employee_id) values (011, 'Priority', 'Fanchon', '29/12/2017', 6, '4 Kropf Junction', 189);
insert into order_delivers (order_no, delivery_method, receiver, start_date, delivery_days, address, employee_id) values (012, 'Standard', 'Felipe', '26/10/2017', 20, '389 Anzinger Crossing', 169);
insert into order_delivers (order_no, delivery_method, receiver, start_date, delivery_days, address, employee_id) values (013, 'Standard', 'Neron', '02/04/2018', 26, '4 Quincy Park', 158);
insert into order_delivers (order_no, delivery_method, receiver, start_date, delivery_days, address, employee_id) values (014, 'Standard', 'Abel', '27/06/2017', 27, '1451 Butterfield Road', 148);
insert into order_delivers (order_no, delivery_method, receiver, start_date, delivery_days, address, employee_id) values (015, 'Standard', 'Berkie', '28/12/2017', 30, '444 Holmberg Junction', 140);
insert into order_delivers (order_no, delivery_method, receiver, start_date, delivery_days, address, employee_id) values (016, 'Priority', 'Christen', '03/10/2017', 23, '168 Rigney Pass', 128);
insert into order_delivers (order_no, delivery_method, receiver, start_date, delivery_days, address, employee_id) values (017, 'Standard', 'Marleah', '30/08/2017', 14, '2248 Arrowood Park', 157);
insert into order_delivers (order_no, delivery_method, receiver, start_date, delivery_days, address, employee_id) values (018, 'Standard', 'Meade', '24/09/2017', 18, '598 4th Avenue', 113);
insert into order_delivers (order_no, delivery_method, receiver, start_date, delivery_days, address, employee_id) values (019, 'Standard', 'Kimberly', '07/03/2018', 23, '033 Jenna Parkway', 121);
insert into order_delivers (order_no, delivery_method, receiver, start_date, delivery_days, address, employee_id) values (020, 'Standard', 'Natalya', '18/07/2017', 14, '63837 Hoffman Place', 106);
insert into order_delivers (order_no, delivery_method, receiver, start_date, delivery_days, address, employee_id) values (21, 'Express','Graiden','01/09/18',5,'6428 Enim Avenue', 142);
insert into order_delivers (order_no, delivery_method, receiver, start_date, delivery_days, address, employee_id) values (22, 'Express','Kirsten','16/12/17',8,'4611 Fermentum Street', 165);
insert into order_delivers (order_no, delivery_method, receiver, start_date, delivery_days, address, employee_id) values (23, 'Express','Lester','22/10/17',7,'6973 Eros Street', 196);
insert into order_delivers (order_no, delivery_method, receiver, start_date, delivery_days, address, employee_id) values (24, 'Express','Roary','19/12/17',9,'2904 Phasellus Rd.', 163);
insert into order_delivers (order_no, delivery_method, receiver, start_date, delivery_days, address, employee_id) values (25, 'Express','Colin','08/01/17',10,'3098 Porttitor St', 142);

commit work;

insert into payment_requires (receipt_no, price, payment_date, payment_method, order_no) values (5869, '20.87', '07/04/2018', 'Debit', 1);
insert into payment_requires (receipt_no, price, payment_date, payment_method, order_no) values (5565, '29.65', '10/12/2017', 'Credit', 2);
insert into payment_requires (receipt_no, price, payment_date, payment_method, order_no) values (5247, '8.62', '23/07/2017', 'Debit', 3);
insert into payment_requires (receipt_no, price, payment_date, payment_method, order_no) values (5999, '29.22', '03/06/2018', 'Debit', 4);
insert into payment_requires (receipt_no, price, payment_date, payment_method, order_no) values (0038, '21.39', '29/04/2018', 'Debit', 5);
insert into payment_requires (receipt_no, price, payment_date, payment_method, order_no) values (8872, '19.02', '05/04/2018', 'Debit', 6);
insert into payment_requires (receipt_no, price, payment_date, payment_method, order_no) values (1118, '16.25', '21/03/2018', 'Cash', 7);
insert into payment_requires (receipt_no, price, payment_date, payment_method, order_no) values (6882, '7.41', '27/07/2017', 'Credit', 8);
insert into payment_requires (receipt_no, price, payment_date, payment_method, order_no) values (8263, '26.56', '26/10/2017', 'Debit', 9);
insert into payment_requires (receipt_no, price, payment_date, payment_method, order_no) values (9726, '14.76', '18/05/2018', 'Cash', 10);
insert into payment_requires (receipt_no, price, payment_date, payment_method, order_no) values (0296, '16.05', '30/12/2017', 'Credit', 11);
insert into payment_requires (receipt_no, price, payment_date, payment_method, order_no) values (7439, '27.97', '26/10/2017', 'Cash', 12);
insert into payment_requires (receipt_no, price, payment_date, payment_method, order_no) values (3689, '15.53', '05/04/2018', 'Credit', 13);
insert into payment_requires (receipt_no, price, payment_date, payment_method, order_no) values (5540, '7.92', '27/06/2017', 'Debit', 14);
insert into payment_requires (receipt_no, price, payment_date, payment_method, order_no) values (5014, '6.12', '28/12/2017', 'Cash', 15);
insert into payment_requires (receipt_no, price, payment_date, payment_method, order_no) values (6300, '24.92', '07/10/2017', 'Credit', 16);
insert into payment_requires (receipt_no, price, payment_date, payment_method, order_no) values (5402, '14.82', '31/08/2017', 'Cash', 17);
insert into payment_requires (receipt_no, price, payment_date, payment_method, order_no) values (1858, '27.54', '25/09/2017', 'Cash', 18);
insert into payment_requires (receipt_no, price, payment_date, payment_method, order_no) values (5984, '29.98', '08/03/2018', 'Credit', 19);
insert into payment_requires (receipt_no, price, payment_date, payment_method, order_no) values (9363, '11.84', '19/07/2017', 'Debit', 20);
insert into payment_requires (receipt_no, price, payment_date, payment_method, order_no) values (4322, '71.84', '01/09/18', 'Debit', 21);
insert into payment_requires (receipt_no, price, payment_date, payment_method, order_no) values (6786, '32.84', '16/12/17', 'Debit', 22);
insert into payment_requires (receipt_no, price, payment_date, payment_method, order_no) values (3468, '9.84', '22/10/17', 'Debit', 23);
insert into payment_requires (receipt_no, price, payment_date, payment_method, order_no) values (8657, '6.84', '19/12/17', 'Debit', 24);
insert into payment_requires (receipt_no, price, payment_date, payment_method, order_no) values (3463, '8.84', '08/01/17', 'Debit', 25);
commit work;

insert into parcel_owns (weight, volume, description, customer_id) values (85.782, 10, 'Re-engineered well-modulated installation', 1);
insert into parcel_owns (weight, volume, description, customer_id) values (96.168, 68, 'Focused contextually-based open architecture', 2);
insert into parcel_owns (weight, volume, description, customer_id) values (95.957, 81, 'Streamlined client-driven hierarchy', 3);
insert into parcel_owns (weight, volume, description, customer_id) values (47.3, 37, 'Visionary transitional solution', 4);
insert into parcel_owns (weight, volume, description, customer_id) values (89.897, 60, 'Total bandwidth-monitored policy', 5);
insert into parcel_owns (weight, volume, description, customer_id) values (61.57, 31, 'Proactive zero tolerance synergy', 6);
insert into parcel_owns (weight, volume, description, customer_id) values (19.981, 41, 'Cross-group tertiary moratorium', 7);
insert into parcel_owns (weight, volume, description, customer_id) values (30.228, 79, 'Secured demand-driven leverage', 8);
insert into parcel_owns (weight, volume, description, customer_id) values (90.14, 33, 'Re-contextualized zero administration task-force', 9);
insert into parcel_owns (weight, volume, description, customer_id) values (31.361, 61, 'User-friendly multimedia local area network', 10);
insert into parcel_owns (weight, volume, description, customer_id) values (67.775, 8, 'Reverse-engineered 6th generation encoding', 11);
insert into parcel_owns (weight, volume, description, customer_id) values (97.627, 84, 'Open-source bifurcated service-desk', 12);
insert into parcel_owns (weight, volume, description, customer_id) values (94.491, 41, 'Organized eco-centric methodology', 13);
insert into parcel_owns (weight, volume, description, customer_id) values (19.024, 74, 'Sharable non-volatile adapter', 14);
insert into parcel_owns (weight, volume, description, customer_id) values (77.894, 90, 'Advanced fault-tolerant knowledge user', 15);
insert into parcel_owns (weight, volume, description, customer_id) values (30.175, 43, 'Horizontal full-range matrix', 16);
insert into parcel_owns (weight, volume, description, customer_id) values (78.731, 21, 'Programmable bottom-line framework', 17);
insert into parcel_owns (weight, volume, description, customer_id) values (45.193, 54, 'Synergistic interactive initiative', 18);
insert into parcel_owns (weight, volume, description, customer_id) values (37.463, 41, 'Cross-platform tertiary infrastructure', 19);
insert into parcel_owns (weight, volume, description, customer_id) values (67.568, 70, 'Enhanced system-worthy adapter', 20);
insert into parcel_owns (weight, volume, description, customer_id) values (16.733, 21, 'Ergonomic static time-frame', 21);
insert into parcel_owns (weight, volume, description, customer_id) values (80.505, 35, 'Devolved bandwidth-monitored support', 22);
insert into parcel_owns (weight, volume, description, customer_id) values (36.246, 69, 'Monitored asynchronous matrix', 23);
insert into parcel_owns (weight, volume, description, customer_id) values (95.525, 30, 'Virtual bottom-line local area network', 24);
insert into parcel_owns (weight, volume, description, customer_id) values (80.758, 27, 'Advanced zero administration function', 25);
insert into parcel_owns (weight, volume, description, customer_id) values (44.616, 14, 'Profound heuristic database', 26);
insert into parcel_owns (weight, volume, description, customer_id) values (38.847, 87, 'Horizontal incremental moderator', 27);
insert into parcel_owns (weight, volume, description, customer_id) values (11.285, 9, 'Expanded web-enabled structure', 28);
insert into parcel_owns (weight, volume, description, customer_id) values (25.259, 47, 'Multi-channelled maximized Graphic Interface', 29);
insert into parcel_owns (weight, volume, description, customer_id) values (40.502, 87, 'Customizable upward-trending workforce', 30);
insert into parcel_owns (weight, volume, description, customer_id) values (55.949, 2, 'Seamless reciprocal budgetary management', 31);
insert into parcel_owns (weight, volume, description, customer_id) values (30.522, 58, 'Organic explicit ability', 32);
insert into parcel_owns (weight, volume, description, customer_id) values (26.199, 97, 'Triple-buffered homogeneous budgetary management', 33);
insert into parcel_owns (weight, volume, description, customer_id) values (18.488, 4, 'Inverse responsive moderator', 34);
insert into parcel_owns (weight, volume, description, customer_id) values (98.746, 49, 'Decentralized empowering Graphic Interface', 35);
insert into parcel_owns (weight, volume, description, customer_id) values (54.154, 52, 'Implemented secondary adapter', 36);
insert into parcel_owns (weight, volume, description, customer_id) values (81.166, 33, 'Fundamental radical matrix', 37);
insert into parcel_owns (weight, volume, description, customer_id) values (93.022, 13, 'Multi-layered multimedia conglomeration', 38);
insert into parcel_owns (weight, volume, description, customer_id) values (95.337, 3, 'Reduced maximized collaboration', 39);
insert into parcel_owns (weight, volume, description, customer_id) values (30.235, 58, 'Object-based actuating portal', 40);
insert into parcel_owns (weight, volume, description, customer_id) values (73.234, 30, 'Proactive encompassing collaboration', 41);
insert into parcel_owns (weight, volume, description, customer_id) values (57.489, 16, 'Organized disintermediate capability', 42);
insert into parcel_owns (weight, volume, description, customer_id) values (10.803, 79, 'Virtual high-level process improvement', 43);
insert into parcel_owns (weight, volume, description, customer_id) values (86.393, 65, 'Polarised 6th generation initiative', 44);
insert into parcel_owns (weight, volume, description, customer_id) values (61.431, 34, 'Secured stable hierarchy', 45);
insert into parcel_owns (weight, volume, description, customer_id) values (94.2, 27, 'Persistent 5th generation Graphical User Interface', 46);
insert into parcel_owns (weight, volume, description, customer_id) values (58.561, 32, 'Fundamental 5th generation approach', 47);
insert into parcel_owns (weight, volume, description, customer_id) values (74.373, 47, 'Realigned intangible core', 48);
insert into parcel_owns (weight, volume, description, customer_id) values (56.352, 37, 'Mandatory mobile challenge', 49);
insert into parcel_owns (weight, volume, description, customer_id) values (9.57, 34, 'Big Blue TV', 50);
insert into parcel_owns (weight, volume, description, customer_id) values (34.57, 24, 'Big comfy couch', 50);
insert into parcel_owns (weight, volume, description, customer_id) values (5.57, 14, 'Hockey Stick', 50);
insert into parcel_owns (weight, volume, description, customer_id) values (8.57, 64, 'Yellow Dog', 50);
insert into parcel_owns (weight, volume, description, customer_id) values (7.57, 74, 'All toys', 50);
insert into parcel_owns (weight, volume, description, customer_id) values (6.57, 43, 'Green den', 50);
commit work;


insert into contains (description, customer_id, order_no) values ('Re-engineered well-modulated installation', 1, 01);
insert into contains (description, customer_id, order_no) values ('Focused contextually-based open architecture', 2, 02);
insert into contains (description, customer_id, order_no) values ('Streamlined client-driven hierarchy', 3, 03);
insert into contains (description, customer_id, order_no) values ('Visionary transitional solution', 4, 04);
insert into contains (description, customer_id, order_no) values ('Total bandwidth-monitored policy', 5, 05);
insert into contains (description, customer_id, order_no) values ('Proactive zero tolerance synergy', 6, 06);
insert into contains (description, customer_id, order_no) values ('Cross-group tertiary moratorium', 7, 07);
insert into contains (description, customer_id, order_no) values ('Secured demand-driven leverage', 8, 08);
insert into contains (description, customer_id, order_no) values ('Re-contextualized zero administration task-force', 9, 09);
insert into contains (description, customer_id, order_no) values ('User-friendly multimedia local area network', 10, 010);
insert into contains (description, customer_id, order_no) values ('Reverse-engineered 6th generation encoding', 11, 011);
insert into contains (description, customer_id, order_no) values ('Open-source bifurcated service-desk', 12, 012);
insert into contains (description, customer_id, order_no) values ('Organized eco-centric methodology', 13, 013);
insert into contains (description, customer_id, order_no) values ('Sharable non-volatile adapter', 14, 014);
insert into contains (description, customer_id, order_no) values ('Advanced fault-tolerant knowledge user', 15, 015);
insert into contains (description, customer_id, order_no) values ('Horizontal full-range matrix', 16, 016);
insert into contains (description, customer_id, order_no) values ('Programmable bottom-line framework', 17, 017);
insert into contains (description, customer_id, order_no) values ('Synergistic interactive initiative', 18, 018);
insert into contains (description, customer_id, order_no) values ('Cross-platform tertiary infrastructure', 19, 019);
insert into contains (description, customer_id, order_no) values ('Big Blue TV', 50, 020);
insert into contains (description, customer_id, order_no) values ('Big comfy couch', 50, 21);
insert into contains (description, customer_id, order_no) values ('Hockey Stick', 50, 22);
insert into contains (description, customer_id, order_no) values ('Yellow Dog', 50, 23);
insert into contains (description, customer_id, order_no) values ('All toys', 50, 24);
insert into contains (description, customer_id, order_no) values ('Green den', 50, 25);

commit work;


