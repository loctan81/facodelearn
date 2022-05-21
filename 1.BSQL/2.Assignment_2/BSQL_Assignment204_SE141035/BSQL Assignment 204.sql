create database [Movie_Collection]
go
use [Movie_Collection]
go

--1
create table Movie(
	Mid int identity(1,1) primary key,
	Name nvarchar(100) not null,
	Duration int not null check(duration >= 60),
	Genre tinyint not null check(genre between 1 and 8),
	Director nvarchar(50),
	MoneyAtBoxOffice decimal(18,2),
	Comments nvarchar(500)
)

create table Actor(
	Aid int identity(1,1) primary key,
	Name nvarchar(50) not null,
	Age tinyint not null,
	Salary decimal(18,2) not null,
	Nationality nvarchar(50) not null
)

create table Actedln(
	Mid int foreign key references Movie(Mid) not null,
	Aid int foreign key references Actor(Aid) not null,
	primary key(Mid,Aid)
)

go

--2
alter table Movie
	add ImageLink varchar(100) not null unique

insert into Movie values(N'Sipder Man',120,1,N'Jon Watts 1',3000000000,N'Phim hay','https://hinhanhmangtinhchatminhhoa/anh.jpg')
insert into Movie values(N'Spider Man: Homecoming',150,1,N'Jon Watts 2',3000000000,N'Phim Khá','https://hinhanhmangtinhchatminhhoa/anh1.jpg')
insert into Movie values(N'Spider-Man: No Way Home',180,1,N'Jon Watts 3',8000000000,N'Phim hay','https://hinhanhmangtinhchatminhhoa/anh2.jpg')
insert into Movie values(N'Spider-Man: Far From Home',120,1,N'Jon Watts 4',13000000000,N'Phim hay','https://hinhanhmangtinhchatminhhoa/anh3.jpg')
insert into Movie values(N'The Amazing Spider Man',120,1,N'Marc Webb',23000000000,N'Phim Khá','https://hinhanhmangtinhchatminhhoa/anh4.jpg')

insert into Actor values(N'Jon Watts 1',23,5000000,N'Mỹ')
insert into Actor values(N'Jon Watts 2',32,6000000,N'Mỹ')
insert into Actor values(N'Jon Watts 3',52,5000000,N'Mỹ')
insert into Actor values(N'Jon Watts 4',22,2000000,N'Mỹ')
insert into Actor values(N'Marc Webb',18,1000000,N'Mỹ')

insert into Actedln values(1,1)
insert into Actedln values(1,2)
insert into Actedln values(2,1)
insert into Actedln values(2,2)
insert into Actedln values(2,3)

update Actor set Name = N'Jon Watts 2' where Aid = 2

go

--3
select * 
from Actor
where Age > 50

select Name, Salary
from Actor
order by Salary

select m.Name as 'Name Movie'
from Actor ac join Actedln a on ac.Aid = a.Aid
				join Movie m on a.Mid = m.Mid
where ac.Name like N'Jon Watts 2'

select Name
from Movie m join Actedln a on m.Mid = a.Mid
where Genre = 1
group by Name
having count(*) > 3
