create database [Employee Management System]
go
use [Employee Management System]
go

--1
create table EMPLOYEE(
	EmpNo int primary key,
	EmpName nvarchar(20) not null,
	BirthDay date not null,
	DeptNo int not null, 
	MgrNo int not null,
	StartDate date not null,
	Salary money not null,
	Level tinyint not null check(Level between 1 and 7),
	Status tinyint not null check(Status between 0 and 2),
	Note nvarchar(max)
)

create table SKILL(
	SkillNo int identity(1,1) primary key,
	SkillName varchar(30) not null,
	Note nvarchar(max)
)

create table DEPARTMENT(
	DeptNo int identity(1,1) primary key,
	DeptName varchar(50) not null,
	Note nvarchar(max)
)

create table EMP_SKILL(
	SkillNo int foreign key references SKILL(SkillNo) not null,
	EmpNo int foreign key references EMPLOYEE(EmpNo) not null,
	SkillLevel tinyint not null,
	check( SkillLevel in(1,2,3)),
	RegDate date not null,
	Description nvarchar(max) not null,
	primary key(SkillNo, SkillLevel)
)

--2
go
alter table EMPLOYEE 
	add Email varchar(50) not null unique

alter table EMPLOYEE
	add constraint df_MgrNo default 0 for MgrNo

alter table EMPLOYEE
	add constraint df_Status default 0 for Status

--3
alter table EMPLOYEE
	add constraint FK_DeptNo_DEPARTMENT foreign key (DeptNo) references DEPARTMENT(DeptNo)
alter table EMP_SKILL
	drop column Description
--4
go
insert into DEPARTMENT(DeptName) values('Deparment A')
insert into DEPARTMENT(DeptName) values('Deparment B')
insert into DEPARTMENT(DeptName) values('Deparment C')
insert into DEPARTMENT(DeptName) values('Deparment D')
insert into DEPARTMENT(DeptName) values('Deparment E')

go
insert into SKILL(SkillName) values('Java')
insert into SKILL(SkillName) values('Dot NET')
insert into SKILL(SkillName) values('C#')
insert into SKILL(SkillName) values('DepOps')
insert into SKILL(SkillName) values('Reactjs')

go
insert into EMPLOYEE(EmpNo,EmpName,BirthDay,DeptNo,MgrNo,StartDate,Salary,Level,Status,Email) values(1,'Banh Duc Hieu','1999-08-11',1,1,'2021-09-16',3000000,5,0,'hieubdse140896@fpt.edu.vn')
insert into EMPLOYEE(EmpNo,EmpName,BirthDay,DeptNo,MgrNo,StartDate,Salary,Level,Status,Email) values(2,'Trieu Ngoc Huy','2000-08-11',1,1,'2021-09-16',3000000,4,0,'trieungochuy@fpt.edu.vn')
insert into EMPLOYEE(EmpNo,EmpName,BirthDay,DeptNo,MgrNo,StartDate,Salary,Level,Status,Email) values(3,'Pham Minh Thai','2001-08-11',1,1,'2021-09-16',3000000,3,0,'phamminhthai@fpt.edu.vn')
insert into EMPLOYEE(EmpNo,EmpName,BirthDay,DeptNo,MgrNo,StartDate,Salary,Level,Status,Email) values(4,'Thieu Quoc Tuan','1989-08-11',1,1,'2021-09-16',3000000,2,0,'thieuquoctuan@fpt.edu.vn')
insert into EMPLOYEE(EmpNo,EmpName,BirthDay,DeptNo,MgrNo,StartDate,Salary,Level,Status,Email) values(5,'Hoang Ngoc Long','1995-08-11',1,5,'2021-09-16',30000000,7,0,'hoangngoclong@fpt.edu.vn')

go
insert into EMP_SKILL(SkillNo,EmpNo,SkillLevel,RegDate) values(1,1,3,'2021-05-1')
insert into EMP_SKILL(SkillNo,EmpNo,SkillLevel,RegDate) values(4,1,3,'2021-05-1')
insert into EMP_SKILL(SkillNo,EmpNo,SkillLevel,RegDate) values(1,2,3,'2021-05-1')
insert into EMP_SKILL(SkillNo,EmpNo,SkillLevel,RegDate) values(1,3,3,'2021-05-1')
insert into EMP_SKILL(SkillNo,EmpNo,SkillLevel,RegDate) values(1,4,3,'2021-05-1')

go
create view EMPLOYEE_TRACKING 
as select EmpNo,EmpName,Level
	from EMPLOYEE 
	where Level >= 3 and Level <= 5
