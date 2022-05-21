create database [Fresher Training Management]
go
use [Fresher Training Management]
go

--1
create table TRAINEE(
	TraineeID int identity(1,1),
	Full_Name nvarchar(30) not null,
	Birth_Date Date not null,
	gender bit not null,
	ET_IQ int not null check(ET_IQ between 0 and 20),
	ET_Gmath int not null check(ET_Gmath between 0 and 20),
	ET_English int not null check(ET_English between 0 and 50),
	Training_Class varchar(10) not null,
	Evaluation_Notes nvarchar(max)
)

insert into TRAINEE values('Pham Hong Thang', '2/12/1993', 1, 15, 18, 35, 'Fresher-1', 'Creative, Quite')
insert into TRAINEE values('Chu Dieu Hoa', '1/1/1996', 0, 19, 15, 44, 'Fresher-2', 'Polite, Hard-working')
insert into TRAINEE values('Nguyen Chi Hoa', '9/4/1990', 1, 5, 10, 21, 'Fresher-3', 'Hardest, Bad-tempered')
insert into TRAINEE values('Dang Van Bi', '2/12/1993', 1, 15, 18, 35, 'Fresher-1', 'Creative, Quite')
insert into TRAINEE values('Hoang Cam Hong', '2/25/1999', 0, 12, 14, 40, 'Fresher-2', 'Crazy, Shy, Talkative')
insert into TRAINEE values('Lieu Thu Nguyen', '9/11/1983', 0, 10, 10, 20, 'Fresher-3', 'Friendly, Cheerful')
insert into TRAINEE values('Hoang Dai Thu', '2/12/1993', 1, 15, 18, 35, 'Fresher-1', 'Creative, Quite')
insert into TRAINEE values('Hoang Cong Thanh', '11/22/1993', 1, 2, 10, 20, 'Fresher-2', 'Naughty, Boast')
insert into TRAINEE values('Pham Bat Hai', '12/31/1996', 1, 20, 19, 49, 'Fresher-1', 'Smart, Talented')
insert into TRAINEE values('Dang Nhu Cat', '1/30/2000', 1, 16, 15, 40, 'Fresher-2', 'Dependable, Enthusiastic')
go

--2
alter table TRAINEE 
	add Fsoft_Account varchar(30) not null unique
go

--3
create view ET_PASSED
as select *
	from TRAINEE
	where ET_IQ >= 8 and ET_Gmath >= 8 and ET_English >= 18 AND (ET_IQ + ET_Gmath) >= 20
go

--4
select *
from ET_PASSED
order by month(Birth_Date)
go

--5
select TraineeID, Full_Name,Birth_Date, year(getdate() - year(Birth_Date)) as Age, gender
from TRAINEE
where len(Full_Name) = (select max(len(Full_Name)) from TRAINEE)