use sqlDB;
go

create or alter procedure usp_error
	@userID char(8),
	@userName nvarchar(10),
	@birthyear int=1900,
	@addr nchar(2) ='����',
	@mobile1 char(3)=null,
	@mobile2 char(8)=null,
	@height smallint=170,
	@mDate date='2021-02-15'
as
	declare @err int;
	begin try
		begin tran
			insert into userTbl values
			(@userID
			,@userName
			,@birthyear
			,@addr
			,@mobile1
			,@mobile2
			,@height
			,@mDate);
			commit
		end try
	begin catch
		select @err=ERROR_NUMBER();
		rollback;
	end catch
	insert into userTbl values
	(@userID
	,@userName
	,@birthyear
	,@addr
	,@mobile1
	,@mobile2
	,@height
	,@mDate);
	if @err !=0
	begin
		print '###'+@userName+'��(��) INSERT�� �����߽��ϴ�.';
	end

	--return @err;--������ȣ ������
	print concat('�����޽��� : ',@err);--������ȣ ������
go

exec usp_error 'WDT','�����',1988,'�λ�','019','99990024',190,'2021-02-14';

select*from [sqlDB].[dbo].[userTbl]