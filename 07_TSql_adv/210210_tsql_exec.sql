--exec sp_helpdb;--�����ͼ������� �����ͺ��̽��� �� �� �ִ� �� �� �� �ִ�.

use sqlDB;
go
declare @sql varchar(100);--����� �־���� �Ѵ�.
set @sql ='select*from userTbl where userID=''EJW'';';
exec (@sql);--��ȣ�� ����� �Ѵ�. ���� ������ �ϴ� ���̴�. �������� ���� �������� �ٲ�� �� ��찡 �ִ�. ������ �۾����� �ʿ��ϴ�.������