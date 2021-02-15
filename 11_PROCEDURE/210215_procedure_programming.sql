use sqlDB;
go

create or alter procedure usp_ifelse
	@userName nvarchar(10)--프로시저에 사용할 매개변수 속성값 정의
as
	declare @birthYear int;--출생년도
	select @birthYear = birthYear--속성값 정의.
		from userTbl
	where userName=@userName;--매개변수의 속성값을 필드에서 사용하겠다. 검색조건임.
	if(@birthYear>=1980)
		begin
			print '아직 젊군요';
		end
	else
		begin
			print '나이가 지긋...'
		end
go
--프로그래밍 기능, 데이터에 따라 동작하는 파트가 다르다.

go
exec usp_ifelse '김경호';