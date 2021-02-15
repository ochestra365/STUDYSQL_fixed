use sqlDB;
go

create or alter procedure plusNew--프로시저를 생성한다.
	@p1 int,
	@p2 int,
	@pout int output--매개변수 속성 정의
as
	select @pout = @p1+@p2;--식을 만들어 준다.
go--프로시저가 완성되었다.

declare @newResult int;--변수 속성 선언
set @newResult = 0;--변수 디폴트값 설정
exec plusNew 3, 4, @newResult output--프로시저 실행 및 변수 값 계산
print @newResult;--변수 값 출력