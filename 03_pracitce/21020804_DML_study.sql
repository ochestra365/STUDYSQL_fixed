--testTBL insert
use sqlDB;
go

--select among DML
select*from testTBL1;

--Insert among DML(SQL for modificating data)
insert into testTBL1 values(1, 'ȫ�浿', 25);--���� �ִ� ��.
insert into testTBL1(id, userName) values(2, '�ڼ�ö')--��� ���� �ִ� ��.
insert into testTBL1(age, id) values(30,4);
--�����̸Ӹ�Ű�� ���� �ʰ�� �����ų �� ����. pk���� ���̴� DML insert�� ������ �� ����.

use tempdb;--�����ͺ��̽��� ����� ���� �ӽ÷� ����Ͽ� ����� ��� ���̴�.
create table testtb12
(id int identity,--int�� �ڵ������� �����ϰڴ�.
userName nchar(3),
age int,
nation nchar(4) default '���ѹα�');
go
insert into testtb12 values('����',25,default);

exec sp_help 'testtb12';--�ۼ��� ���̺��� ��� ������ �� �� �ִ� ���̴�.
select @@IDENTITY;
select ident_current('testtb12');--���� ���̺��� ��� ����.

select*from BikeStores.sales.order_items;--sql db���� �˻��� �� �ִ�. ������ �ٸ� ������ ������ �����͸�  �� �ҷ� �ü� �ִ�.( �����ͺ��̽�, ��Ű����)

select*from ShopDB.dbo.memberTBl--�� �����ͺ��̽��� �ƴϴ��� ������ �ٸ� ���� �ִ� �����ͺ��̽��� �������� �ҷ� �� �� �ִ�.
--sales.order_items ���̺� ����
CREATE TABLE [sales_order_items](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[order_status] [tinyint] NOT NULL,
	[order_date] [date] NOT NULL,
	[required_date] [date] NOT NULL,
	[shipped_date] [date] NULL,
	[store_id] [int] NOT NULL,
	[staff_id] [int] NOT NULL
	);

	insert into sales_order_items
	select*from BikeStores.sales.order_items;


	select*from sales_order_items;
	--update
select*from testTbl1

update testTbl1
set userName='����',
	age=30,
where id=6;--�̰� �ּ�ó���ϰ� ������ ��� �����Ͱ� ���ŵǴ� ���̴�.

rollback;--�������� ġ�� �ӽ����� ��ġ�� ����� ���̴�.

use tempdb;
delete testtb12 where id='ȫ�浿';
--delete�������� �ݵ�� where�� ����Ѵ�. �� �츱 �� ������ �������� ���ƶ�.