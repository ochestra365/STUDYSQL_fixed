use tempdb;
select * from userTBL_practice where Nam = '���ȣ';
select * from userTBL_practice;
go
select userID, Nam from userTBL_practice where birthyear>=1970 and height >=182;
--���ϴ� �Ӽ��� ����Ѵ�. , �ش� ���̺���, ������ ��������� Ű
select userID, Nam from userTBL_practice where birthyear>=1970 or height>=182;
--Ÿ���� �Ǽ��� ��� �� ���� ������ �ȴ�.
go
select Nam, height from userTBL_practice where height>=180 and height <=183;
select nam, height from userTBL_practice where height between 180 and 183;
--���� �ܷΰ�
go
select nam, addr from userTBL_practice where addr='�泲' or addr='����' or addr='���';
select nam, addr from userTBL_practice where addr in('�泲','����','���');
select nam, height from userTBL_practice where nam like '��%';
select nam, height from userTBL_practice where nam like '_����';
go
select nam, height from userTBL_practice where height > 177;
select nam, height from userTBL_practice where height > ( select height from userTBL_practice where nam='��ȣ');
select  nam, height from userTBL_practice where height >=(select height from userTBL_practice where addr='�泲');
--where height >=(select height from userTBL_practice where addr='�泲');�ΰ��� ���� ���� ������ �߻���.
select nam, height from userTBL_practice where height >= any(select height from userTBL_practice where addr='�泲');
select nam, height from userTBL_practice where height >= all(select height from userTBL_practice where addr='�泲');
--������ ������ ����, any�� ������, all�� ������--where������ ������� 2���� ����Ǵ� ��, �� ���Ⱚ�� ��� ������ ���̳�? �ƴ� �����ؼ� ������ ���̳� �䷱ ����.
go
select nam, height from userTBL_practice where height =any (select height from userTBL_practice where addr='�泲');
--��Ȯ�� ������� 170, 173�� ����� ��µ�. �̴�=any ���������� in���������� ����.
go
select nam, mdate from userTBL_practice order by mdate;
select nam, mdate from userTBL_practice order by mdate desc;--��������
select nam, mdate from userTBL_practice order by mdate asc;--��������
go
select distinct addr from userTBL_practice;--�ߺ����� �����Ѵ�. 
--��, ����Ʈ �� �ڿ� �ٷ� ���ִ� �͵��� �˻��� ������ �����ϴ� ���̴�. top()�� �˻������ ���°���� ��Ÿ�� ���ΰ��� �巯����.
--top(0.1) percent�� ���� �Ǽ��� 0.1%�� �˻��ϰڴٴ� �ǹ��̴�. ���� top(%) percent with ties�� N%�� �Ѵ��� ����ϴ� ���� ���Ѵ�.
--���ø� �������� �� �ۼ�Ʈ�� ����� ���̳ĸ� �˾ƺ��� �����̴�.
go
