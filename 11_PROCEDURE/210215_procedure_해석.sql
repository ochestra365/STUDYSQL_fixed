use sqlDB;
go

create or alter procedure plusNew--���ν����� �����Ѵ�.
	@p1 int,
	@p2 int,
	@pout int output--�Ű����� �Ӽ� ����
as
	select @pout = @p1+@p2;--���� ����� �ش�.
go--���ν����� �ϼ��Ǿ���.

declare @newResult int;--���� �Ӽ� ����
set @newResult = 0;--���� ����Ʈ�� ����
exec plusNew 3, 4, @newResult output--���ν��� ���� �� ���� �� ���
print @newResult;--���� �� ���