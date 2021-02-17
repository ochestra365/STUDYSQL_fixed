create or alter function dbo.ufn_getLevel(@levels char(1))
returns nvarchar(5)
as
begin
	declare @result nvarchar(5);--골드회원, 실버회원, 브론즈회원, 철회원 등 변수

	 set @result= case @levels 
					when 'A' then '골드회원'
					when 'B' then '실버회원'
					when 'C' then '브론즈회원'
					when 'D' then '철회원'
					when 'S' then '관리자'
					else '비회원'
					end;
		return @result;
	end
go--새쿼리로 하면 명령이 실행된다.