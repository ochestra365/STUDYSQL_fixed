--use sqlDB;
--go

--create table testTBL(num int);
--drop table testTBL --�ִ��� drop�ϴ� ���̺��� �ϸ� �ȵȴ�. �ƹ� ���� ���� ��� �ϸ� �������� ��� �Ѵ�.
--������Ʈ ������ ���ϸ� ��� sql�� �������� �ּ��� �� ���� ���������� �ո� ��� ���̺��� �� ���� �� �ִ�. DB������ �ִ� ��� �����͸� �� ���� �� �ִ�.
use tempdb;
go
/*
drop database tableDB;*/
go
create database tableDB;
use tableDB;
go
--drop table buyTBL;
--drop table userTBL;
--������ �ִ� ���̺��� ����� ���ο� ���̺��� ����� ��� �Ѵ�. �θ� �ڽ� ���谡 ������ �ڽ� ����� �θ� ������ �Ѵ�.(�������)
go
create table userTBL--�θ�
(
	userID		char(8)			not null		primary key,		--���̵�
	userName	nvarchar(10)	not null,		--�̸�
	birthYear	int				not null,		--����⵵
	addr		nchar(2)		not null,		--����
	mobile1		char(3)			null,			--�޴�������
	mobile2		char(8)			null,			--�޴�����ȣ
	height		smallint		null,			--Ű
	email		varchar(150)	not null	unique,	--�̸����߰�	210210 14:25(Revision)
	mDate		date			null			--��¥
);
--, ���̿� ��� �۾��� �ؾ� �Ѵ�. �̴� �۾��� �����ٴ� ���� �ǹ��Ѵ�.
go
create table buyTBL--�ڽ�
(
	num			int			not null	identity(1,1)	primary key,	--����(pk)--�ڵ����� �����Ǵ� ���� �ǹ��Ѵ�.
	userID		char(8)		not null					
		foreign key references userTBL(userID),--���̵� buytable�� �ִ� �Ͱ� ��Ī��Ų��.
	prodName	nchar(6)	not null,					--ǰ��
	groupName	nchar(4)	null,						--�з�
	price		int			not null,					--�ܰ�
	amount		smallint	not null,					--����
);
go
--������ �Ӽ��� �˾ƾ� �Ѵ�. Ư�� �θ� �ڽİ��� ���踦 �� �� �� �־�� �Ѵ�.
--�׸��� �װ� ���� ������ ��, ����ļ� �ش� ������ �����Ű�� ����� �ѹ����� @@@@@@@�ݵ�� �ּ�ó�� �ؾ��Ѵ�.@@@@@@@@@
--�׻� ���̺��� ���� ��, �ĸ�(,)�� ���Դ´�. 