--use sqlDB;
--go

--create table testTBL(num int);
--drop table testTBL --�ִ��� drop�ϴ� ���̺��� �ϸ� �ȵȴ�. �ƹ� ���� ���� ��� �ϸ� �������� ��� �Ѵ�.
--������Ʈ ������ ���ϸ� ��� sql�� �������� �ּ��� �� ���� ���������� �ո� ��� ���̺��� �� ���� �� �ִ�. DB������ �ִ� ��� �����͸� �� ���� �� �ִ�.
use tempdb;
go
/*
drop database tableDB;
go
create database tableDB;*/
use tableDB;
go
create table userTBL
(
	userID		char(8),		--���̵�
	userName	nvarchar(10),	--�̸�
	birthYear	int,			--����⵵
	addr		nchar(2),		--����
	mobile1		char(3),		--�޴�������
	mobile2		char(8),		--�޴�����ȣ
	height		smallint,		--Ű
	mDate		date			--��¥
);
go
create table buyTBL
(

);
go