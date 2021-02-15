use sqlDB;
go

create or alter procedure usp_users4
	@txtValue nvarchar(20),
	@outValue int output--리턴받은 매개변수(파라미터)
as
	insert into testTBL values (@txtValue);
	select @outValue=IDENT_CURRENT('testTBL');--testTBL의 현재 identity값 리턴
go

