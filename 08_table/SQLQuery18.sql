use sqlDB;
go

create view uv_userTBL
AS
	select userID, userName, addr from userTBL;
go

select userName from uv_userTBL
 where userID='LSG';

