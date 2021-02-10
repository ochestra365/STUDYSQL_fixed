--use sqlDB;
--go

--create table testTBL(num int);
--drop table testTBL --최대한 drop하는 테이블을 하면 안된다. 아무 생각 없이 요걸 하면 사유서를 써야 한다.
--웹사이트 보안이 약하면 모든 sql을 쿼리문과 주석을 잘 쓰면 보안적으로 뚫린 모든 테이블을 다 지울 수 있다. DB서버에 있는 모든 데이터를 다 날릴 수 있다.
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
	userID		char(8),		--아이디
	userName	nvarchar(10),	--이름
	birthYear	int,			--출생년도
	addr		nchar(2),		--지역
	mobile1		char(3),		--휴대폰국번
	mobile2		char(8),		--휴대폰번호
	height		smallint,		--키
	mDate		date			--날짜
);
go
create table buyTBL
(

);
go