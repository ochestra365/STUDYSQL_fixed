use sqlDB;
go

create or alter procedure usp_ifelse
	@userName nvarchar(10)--���ν����� ����� �Ű����� �Ӽ��� ����
as
	declare @birthYear int;--����⵵
	select @birthYear = birthYear--�Ӽ��� ����.
		from userTbl
	where userName=@userName;--�Ű������� �Ӽ����� �ʵ忡�� ����ϰڴ�. �˻�������.
	if(@birthYear>=1980)
		begin
			print '���� ������';
		end
	else
		begin
			print '���̰� ����...'
		end
go
--���α׷��� ���, �����Ϳ� ���� �����ϴ� ��Ʈ�� �ٸ���.

go
exec usp_ifelse '���ȣ';