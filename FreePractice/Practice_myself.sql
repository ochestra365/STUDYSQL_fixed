use tempdb;
go
create database sqldb1;
go
create table usertbl
(userid char(8) not null primary key,
name nvarchar(10) not null,
birthyear int not null,
addr nchar(2) not null,
mobile1 char(3),
mobile2 char(8),
height smallint,
mdate date);
go
create table buytbl
(num int identity not null primary key,
userid char(8) not null
foreign key references usertbl(userid),
prodname nchar(6) not null,
groupname nchar(4),
price int not null,
amount smallint not null);
go
insert into usertbl values('LSG','이승기',1987,'서울','011','1111111',182,'2008-8-8');
insert into usertbl values('KBS','김범수',1979,'경남','011','2222222',173,'2012-4-4');
insert into usertbl values('KKH','김경호',1971,'전남','019','3333333',177,'2007-7-7');
insert into usertbl values('JYP','조용필',1950,'경기','011','4444444',166,'2009-4-4');
insert into usertbl values('SSK','성시경',1979,'서울',null,null,186,'2013-12-12');
insert into usertbl values('LJB','임재범',1963,'서울','016','6666666',182,'2009-9-9');
insert into usertbl values('YJS','윤종신',1969,'경남',null,null,170,'2005-5-5');
insert into usertbl values('EJW','은지원',1972,'경북','011','8888888',174,'2014-3-3');