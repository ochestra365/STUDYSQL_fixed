	USE [sqlDB]
	GO

	Begin Try
	begin tran

	INSERT INTO [dbo].[userTbl]
			   ([userID]
			   ,[userName]
			   ,[birthYear]
			   ,[addr]
			   ,[mobile1]
			   ,[mobile2]
			   ,[height]
			   ,[mDate])
		 VALUES
			   ('GJY'
			   ,'������'
			   ,1988
			   ,'����'
			   ,'011'
			   ,'98989898'
			   ,175
			   ,getdate())

	INSERT INTO [dbo].[buyTbl]
			   ([userID]
			   ,[prodName]
			   ,[groupName]
			   ,[price]
			   ,[amount])
		 VALUES
			   ('GGY'
			   ,'��Ʈ��'
			   ,'����'
			   ,8000
			   ,2)

	commit
end try
begin catch
	rollback
end catch
GO


