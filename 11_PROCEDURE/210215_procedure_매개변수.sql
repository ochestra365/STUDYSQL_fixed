USE [sqlDB]
GO
/****** Object:  StoredProcedure [dbo].[usp_buyproduct1]    Script Date: 2021-02-15 오후 2:12:13 ******/
create or alter procedure usp_users2
	@birYear int,
	@height smallint--매개변수를 넣는 부분
as
	select *
		from userTbl--줄바꿈을 할때, 한 구문인데 자꾸 세미콜론찍어서 강제로 구문 끝내는 버릇이 있음. 고쳐야 함.
	where birthYear>@birYear
		and height>@height;--매개변수보다 큰 컬럼들을 검색하겠다는 조건
go
