use sqlDB;
go

create or alter procedure usp_error
	@userID char(8),
	@userName nvarchar(10),
	@birthyear int=1900,
	@addr nchar(2) ='서울',
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
		print '###'+@userName+'을(를) INSERT에 실패했습니다.';
	end

	--return @err;--오류번호 돌려줌
	print concat('에러메시지 : ',@err);--오류번호 돌려줌
go

exec usp_error 'WDT','우당탕',1988,'부산','019','99990024',190,'2021-02-14';

select*from [sqlDB].[dbo].[userTbl]