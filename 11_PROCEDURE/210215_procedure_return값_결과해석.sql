use sqlDB;
go

create or alter procedure usp_return
	@userName nvarchar(10)
as
	declare @userID char(8);
	select @userID = userID
		from userTbl
	where userName=@userName;

	if(@userID<>'')return 1;--inline if
	else return 0;
go

declare @retVal int;
exec @retVal = usp_return '은자원';
print @retVal;
--조건에 따라서 출력이 달라지는 것이기 때문에 프로그래밍에 해당한다.