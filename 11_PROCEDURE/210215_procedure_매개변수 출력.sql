use sqlDB;
go

create or alter procedure usp_users4
	@txtValue nvarchar(20),
	@outValue int output--���Ϲ��� �Ű�����(�Ķ����)
as
	insert into testTBL values (@txtValue);
	select @outValue=IDENT_CURRENT('testTBL');--testTBL�� ���� identity�� ����
go

