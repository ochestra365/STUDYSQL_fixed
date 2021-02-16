use sqlDB;
go

alter trigger trg_backupUsertbl
on dbo.userTbl
--with encryption--암호화하는 기능.
after update, delete 
as
	declare @modType nchar(2);

	if (COLUMNS_UPDATED()>0)--업데이트
	begin
		set @modType='수정';
	end
	else--삭제
	begin
		set @modType='삭제';
	end

	insert into backup_userTbl	
		select [userID] ,[userName] ,[birthYear] ,[addr] ,[mobile1] 
			  ,[mobile2] ,[height] ,[mDate] ,@modType ,getdate(),user_name() from deleted;
go