use tempdb;
go
create database sqldb_practice
go
create table userTBL_practice
(userID char(8) not null primary key,
Nam nvarchar(10) not null,
birthyear int not null,
addr nchar(2) not null,
mobile char(3),
mobile2 char(8),
height smallint,
mdate date
);
go
create table buyTBL_practice
( num int identity not null primary key,
userid char(8) not null
foreign key references userTBL_practice(userID),
prodName nchar(6) not null,
groupName nchar(4),
price int not null,
amount smallint not null
);
go
insert into userTBL_practice values('LSG', '�̽±�', 1987, '����', '011','1111111',182,'2008-8-8');
insert into userTBL_practice values('KBS', '�����', 1979, '�泲', '011','2222222',173,'2012-4-4');
insert into userTBL_practice values('KKH', '���ȣ', 1971, '����', '019','3333333',177,'2007-7-7');
insert into userTBL_practice values('JYP', '������', 1950, '���', '011','4444444',166,'2009-4-4');
insert into userTBL_practice values('SSK', '���ð�', 1979, '����', NULL,NULL,186,'2013-12-12');
insert into userTBL_practice values('LJB', '�����', 1963, '����', '016','6666666',182,'2009-9-9');
insert into userTBL_practice values('YJS', '������', 1969, '�泲', null,null,170,'2005-5-5');
insert into userTBL_practice values('EJW', '������', 1972, '���', '011','8888888',174,'2014-3-3');
insert into userTBL_practice values('JKW', '������', 1965, '���', '018','9999999',172,'2010-10-10');
insert into userTBL_practice values('BBK', '�ٺ�Ŵ', 1973, '����', '010','0000000',176,'2013-5-5');
go
insert into buyTBL_practice values('KBS','�ȭ',null,30,2);
insert into buyTBL_practice values('KBS','��Ʈ��','����',1000,1);
insert into buyTBL_practice values('JYP','�����','����',200,1);
insert into buyTBL_practice values('BBK','�����','����',30,2);
insert into buyTBL_practice values('KBS','û����','�Ƿ�',50,3);
insert into buyTBL_practice values('BBK','�޸�','����',80,10);
insert into buyTBL_practice values('SSK','å','����',15,5);
insert into buyTBL_practice values('EJW','å','����',15,2);
insert into buyTBL_practice values('EJW','û����','�Ƿ�',50,1);
insert into buyTBL_practice values('BBK','�ȭ',null,30,2);
insert into buyTBL_practice values('EJW','å','����',15,1);
insert into buyTBL_practice values('BBK','�ȭ',null,30,2);
go
select *from userTBL_practice;
select*from buyTBL_practice;