use sqldb;
go

declare @myvar1 int;
declare @myvar2 smallint, @myvar3 decimal(5,2);--5�� ��ü����� �ǹ��ϰ� 2�� �Ҽ��� ���ڸ� ���°���� ǥ���� ���ΰ��� ���ϴ� ���̴�.,���� �ڿ� ���ڰ� 6�̶�� �̴� ���� ���� �ʴ� ���̴�. ��ü ����� ��߳��� �����̴�.
declare @myvar4 nchar(20);

set @myvar1 =5;
set @myvar2=3;
set @myvar3=4.25;
set @myvar4='���� �̸�==>';

select @myvar1;
select '����'+cast(@myvar3 as varchar);--�����ϰ� ���� �� �ְ� �ϴ� ���� ������ ���� �����ϴ�.

select @myvar4, userName from userTbl where height>180;

declare @myvar5 tinyint;
set @myvar5=3;

select top(@myvar5) userName,height from userTbl order by height desc;
