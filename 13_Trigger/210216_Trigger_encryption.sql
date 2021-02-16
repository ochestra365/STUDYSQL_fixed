use sqlDB;
go

alter trigger trg_backupUsertbl
on dbo.userTbl
--with encryption--��ȣȭ�ϴ� ���.
after update, delete 
as
	declare @modType nchar(2);

	if (COLUMNS_UPDATED()>0)--������Ʈ
	begin
		set @modType='����';
	end
	else--����
	begin
		set @modType='����';
	end

	insert into backup_userTbl	
		select [userID] ,[userName] ,[birthYear] ,[addr] ,[mobile1] 
			  ,[mobile2] ,[height] ,[mDate] ,@modType ,getdate(),user_name() from deleted;
go