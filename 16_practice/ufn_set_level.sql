create or alter function dbo.ufn_getLevel(@levels char(1))
returns nvarchar(5)
as
begin
	declare @result nvarchar(5);--���ȸ��, �ǹ�ȸ��, �����ȸ��, öȸ�� �� ����

	 set @result= case @levels 
					when 'A' then '���ȸ��'
					when 'B' then '�ǹ�ȸ��'
					when 'C' then '�����ȸ��'
					when 'D' then 'öȸ��'
					when 'S' then '������'
					else '��ȸ��'
					end;
		return @result;
	end
go--�������� �ϸ� ����� ����ȴ�.