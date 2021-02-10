--use sqlDB;
--go

--create table testTBL(num int);
--drop table testTBL --최대한 drop하는 테이블을 하면 안된다. 아무 생각 없이 요걸 하면 사유서를 써야 한다.
--웹사이트 보안이 약하면 모든 sql을 쿼리문과 주석을 잘 쓰면 보안적으로 뚫린 모든 테이블을 다 지울 수 있다. DB서버에 있는 모든 데이터를 다 날릴 수 있다.
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
--기존에 있던 테이블을 지우고 새로운 테이블을 만들어 줘야 한다. 부모 자식 관계가 있으면 자식 지우고 부모 지워야 한다.(순서대로)
go
create table userTBL--부모
(
	userID		char(8)			not null		primary key,		--아이디
	userName	nvarchar(10)	not null,		--이름
	birthYear	int				not null,		--출생년도
	addr		nchar(2)		not null,		--지역
	mobile1		char(3)			null,			--휴대폰국번
	mobile2		char(8)			null,			--휴대폰번호
	height		smallint		null,			--키
	email		varchar(150)	not null	unique,	--이메일추가	210210 14:25(Revision)
	mDate		date			null			--날짜
);
--, 사이에 모든 작업을 해야 한다. 이는 작업이 끝났다는 것을 의미한다.
go
create table buyTBL--자식
(
	num			int			not null	identity(1,1)	primary key,	--순번(pk)--자동으로 증가되는 값을 의미한다.
	userID		char(8)		not null					
		foreign key references userTBL(userID),--아이디 buytable에 있는 것과 매칭시킨다.
	prodName	nchar(6)	not null,					--품명
	groupName	nchar(4)	null,						--분류
	price		int			not null,					--단가
	amount		smallint	not null,					--수량
);
go
--데이터 속성을 알아야 한다. 특히 부모 자식간의 관계를 잘 알 수 있어야 한다.
--그리고 그거 쿼리 실행할 때, 블락쳐서 해당 쿼리만 실행시키고 드랍은 한번쓰면 @@@@@@@반드시 주석처리 해야한다.@@@@@@@@@
--항상 테이블을 만들 때, 컴마(,)를 빼먹는다. 