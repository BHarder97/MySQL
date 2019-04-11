/*Brandon Harder
Database and SQL
Final Project
12/2/2015
*/

drop database Realtors;

create database Realtors;

use Realtors;

-- Making the tables
create table Company
(
Company_Name char(25) Primary Key,
Company_ID char(2)
);

create table Realtors
(
Realtor_ID int(2) Primary Key,
First_Name char(50),
Last_Name char(50),
Company_ID char(10),
Phone char(15),
Email char(50)
);

create table Houses
(
House_ID int(2) Primary Key,
Realtor_ID int(20),
Price decimal(20,2),
Address char(5),
Street char(40),
City char(25),
State char(2),
Zip char(5)
);

create table Buyers
(
Buyer_ID int(3) Primary Key,
First_Name char(50),
Last_Name char(50),
House_ID int(2)
);

-- Creating the data for the tables
insert into Company
Values
('Realtors', 12),
('Cavers', 24),
('Foundation', 36),
('Housing Co.', 48),
('Wolter Real Estate', 69)
;
-- have to have like 10 values in each table
 
insert into Realtors
Values
(101, 'Bill', 'Nye', 12, '202-555-0134', 'billnye@realtors.com'),
(102, 'Cody', 'Allen', 24, '833-724-4895', 'codyallen@cavers.com'),
(103, 'Elijah', 'Gronewold', 69, '126-942-4895', 'elijahgronewold@wolterestates.com'),
(104, 'Marcus', 'Helmich', 69, '126-942-7693', 'marcushelmich@wolterestates.com'),
(105, 'Brennon', 'Short', 36, '202-485-8945', 'brennonshort@coldwell.com'),
(106, 'John', 'Doe', 48, '126-467-8423', 'johndoe@housingco.com'),
(107, 'Kevin', 'Grems', 24, '833-724-9716', 'kevingrems@cavers.com'),
(108, 'Jane', 'Doe', 36, '202-485-2134', 'janedoe@coldwell.com'),
(109, 'Old', 'Yeller', 48, '126-467-3478', 'oldyeller@housingco.com'),
(110, 'Huck', 'Finn', 12, '202-555-0123', 'huckfinn@realtors.com')
;
-- have to have like 10 values in each table

insert into Houses
Values
(1, 101, 802944.00, '666', 'Elm Street', 'Nightmare', 'IA', '66666'),
(2, 102, 309329.00, '2222', 'Fake Street', 'Byers', 'IA', '72519'),
(3, 103, 2659222.00, '3333', 'Goodbye Avenue', 'Westbury', 'IA', '21644'),
(4, 104, 2084704.00, '4444', 'Example Avenue', 'Greyfield', 'IA', '89134'),
(5, 105, 134383.00, '5555', 'Hello Drive', 'Boron', 'IA', '85427'),
(6, 106, 464050.00, '6666', 'Oak Beach Drive', 'Iona', 'IA', '35762'),
(7, 107, 326013.00, '7777', 'First Street', 'Westbury', 'IA', '21644'),
(8, 108, 530412.00, '8888', 'Second Street', 'Nightmare', 'IA', '66666'),
(9, 109, 782719.00, '9999', 'Third Street', 'Iona', 'IA', '35762'),
(10, 110, 609544.00, '123', 'Elm Street', 'Nightmare', 'IA', '66666'),
(11, 110, 484276.00, '456', 'Example Avenue', 'Greyfield', 'IA', '89134'),
(12, 106, 889532.00, '789', 'Hello Drive', 'Boron', 'IA', '85427'),
(13, 102, 2180101.00, '147', 'Fifth Avenue', 'Byers', 'IA', '72519'),
(14, 104, 1218782.00, '258', 'Tenth Drive', 'Snowville', 'IA', '64582'),
(15, 103, 2633265.00, '369', 'Thirteenth Court', 'Snowville', 'IA', '64582')
;
-- have to have like 10 values in each table

insert into Buyers
Values
(111, 'Fred', 'Smith', 1),
(222, 'James', 'Hardin', 2),
(333, 'Joshua', 'Harris', 3),
(444, 'Ken', 'Doll', 13),
(555, 'David', 'DeVary', 15),
(666, 'William', 'Shakespeare', 11),
(777, 'Brad', 'Pitt', 7),
(888, 'Justin', 'Time', 5),
(999, 'Woody', 'Tree', 12),
(815, 'I AM', 'GROOT', 3)
;
-- have to have like 10 values in each table


-- The update statements about the created database
update company
set company_name = 'Coldwell Banker'
where company_id = 36
;

update houses
set price = price + (price * 0.02)
;

-- set more than one attribute
update  realtors
set first_name = 'Carl', last_name = 'Sagan'
where realtor_id = 106
;

-- update multiple rows
update houses
set state = 'MN'
where city = 'Nightmare'
;

update Buyers
set buyer_id = 048
where last_name = 'GROOT'
;

-- Queries for information about the tables
-- Distinct
select distinct realtor_id, house_id, price, address, street, city, state, zip
from houses
where  price > 700000
;

-- Order By
select buyer_id, first_name, last_name
from buyers
order by house_id
;

-- Group By
select realtor_id, first_name, last_name, company_name
from realtors, company
where realtors.company_id = company.company_id
group by company_name
;

-- 4 queries that join 2 tables
select buyer_id, houses.house_id, price
from buyers, houses
where buyers.house_id = houses.house_id
;

select company_name, realtor_id, first_name, last_name
from company, realtors
where company.company_id = realtors.company_id
;

select house_id, realtors.realtor_id, price
from houses, realtors
where houses.realtor_id = realtors.realtor_id
;

select buyer_id, houses.house_id, price
from buyers, houses
where buyers.house_id = houses.house_id
;

-- 1 that joins 3 or more tables
select buyers.first_name, buyers.last_name, company_name
from buyers, houses, realtors, company
where buyers.house_id = houses.house_id and
	  houses.realtor_id = realtors.realtor_id and
	  realtors.company_id = company.company_id
;

-- 2 other queries (not select * from tablename)
select house_id, address, city, state, zip, price, company_name
from houses, realtors, company
where houses.realtor_id = realtors.realtor_id and
	  realtors.company_id = company.company_id
;

select realtors.first_name, realtors.last_name, realtors.realtor_id, buyer_id, buyers.first_name, buyers.last_name
from realtors, houses, buyers
where realtors.realtor_id = houses.realtor_id and
	  houses.house_id = buyers.house_id
;