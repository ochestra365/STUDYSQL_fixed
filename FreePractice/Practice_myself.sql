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
insert into usertbl values('LSG','�̽±�',1987,'����','011','1111111',182,'2008-8-8');
insert into usertbl values('KBS','�����',1979,'�泲','011','2222222',173,'2012-4-4');
insert into usertbl values('KKH','���ȣ',1971,'����','019','3333333',177,'2007-7-7');
insert into usertbl values('JYP','������',1950,'���','011','4444444',166,'2009-4-4');
insert into usertbl values('SSK','���ð�',1979,'����',null,null,186,'2013-12-12');
insert into usertbl values('LJB','�����',1963,'����','016','6666666',182,'2009-9-9');
insert into usertbl values('YJS','������',1969,'�泲',null,null,170,'2005-5-5');
insert into usertbl values('EJW','������',1972,'���','011','8888888',174,'2014-3-3');
insert into usertbl values('JKW','������',1965,'���','018','9999999',172,'2010-10-10');
insert into usertbl values('BBK','�ٺ�Ŵ',1973,'����','010','0000000',176,'2013-5-5');
go
insert into buytbl values('KBS','�ȭ',null,30,2);
insert into buytbl values('KBS','��Ʈ��','����',1000,1);
insert into buytbl values('JYP','�����','����',200,1);
insert into buytbl values('BBK','�����','����',200,5);
insert into buytbl values('KBS','û����','�Ƿ�',50,5);
insert into buytbl values('BBK','�޸�','����',80,10);
insert into buytbl values('SSK','å','����',15,5);
insert into buytbl values('EJW','å','����',15,2);
insert into buytbl values('EJW','û����','�Ƿ�',50,1);
insert into buytbl values('BBK','�ȭ',null,30,2);
insert into buytbl values('EJW','å','����',15,1);
insert into buytbl values('BBK','�ȭ',null,30,2);
go