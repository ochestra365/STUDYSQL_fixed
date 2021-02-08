use sqlDB;
go

--�̸��� ���ȣ�� ��� ��ȸ
select *from userTbl
 where userName='���ȣ';

 --1970�� ���� ����̰� Ű 182 �̻��� ��� ���̵�, �̸��� ��ȸ
 select userID, userName, height
 from userTbl
 where birthYear>=1970
 and height >=182;


 --1970�� ���� ����̰ų� Ű�� 182�̻��̰ų� �� ����� ���
 select userID, userName, height
 from userTbl
 where birthYear>=1970
 or height >=182;

 --Ű�� 180~183�� ����� ��ȸ
 select userID, userName, height
 from userTbl
 where height >=180
 and height<=183;

 --��Ʈ�� ����, between~and
 select userID, userName, height
 from userTbl
 where height between 180 and 183;

 --������ �泲, ����, ���
  select userID, userName, addr
 from userTbl
 where addr='�泲' or addr = '����' or addr='���';


 select userID, userName, addr
 from userTbl
 where addr in ('�泲', '����', '���');

 --like
 select userID, userName, addr
 from userTbl
 where userName like '_����';

  select userID, userName, addr
 from userTbl
 where userName like '��%';

 --subquery
 select userName, height
	from userTbl
where height > 
(
	select height from userTbl where userName='���ȣ'
);
--������������ �÷� ����(2�� �̻�)�� �߸��� ��� ������ �߻��Ѵ�. ���� ���� �� ���� ������ ������ �߻��Ѵ�.

 select userName, height
	from userTbl
where height > 177;

 select userName, height
	from userTbl
where height in
(
	select height from userTbl where addr='�泲'
);

--any�� �� ���� �ϳ��� �����ϸ� �ǰ�, all�� ���� ��θ� �����ؾ� �Ѵ�. some�� any�� ������ �ǹ̷� ���ȴ�.

--order by ����(���θ����� ���� ���� Ȯ���� �� �ִ�.)
select userName, mDate
	from userTbl
	order by mDate desc; --asc��������, desc��������

	select *
	from userTbl
	order by userID desc; --asc��������, desc��������

--distinct
select distinct addr
	from userTbl;

select top(5)*
	from userTbl
order by mDate desc;

--offset �ռ� ������ŭ �پ���� �� ��ȸ
select userID, userName, birthYear
	from userTbl
order by birthYear
offset 4 rows;

--����(���� �����ͼ� �����ϰڴ�.--> buyTbl2�� ���� ������ �ִ� ���� �����ؼ� �ְڴ�. �� PK�� ����. �װ��� Ư¡�̴�.)
select * into buyTbl2 from buyTbl;
select userID, prodName into buyTbl3 from buyTbl;--�ʿ��� �ʵ� 2���� ���� �ְڴ�. into�� ���� ���� ���� �ִ� ���̺� �� �� ����.

--GROUP BY
select * from buyTbl;

select userID, amount
	from buyTbl
order by userID;

select userID as '����� ID', sum(amount) as '�����հ�'
	from buyTbl
group by userID;

--MIN, MAX
select min(height) as '�ּ�Ű'
	from userTbl;

select max(height) as '�ִ�Ű'
	from userTbl;

-- ����Ʈ�� ǥ���� �Ӽ��� �巯���� ��, ������ ���̺�, �� �Ʒ��� ��Ÿ������ �ϴ� ������ �Ӽ����� �����ϴ� ���̴�. as�� ���� ��Ÿ������ �ϴ� �Ӽ� �̸��� ������ �� �ִ�.
select userID, min(height) as '�ּ�Ű',max(height) as '�ִ�Ű'
	from userTbl
	group by userID;

select userID, userName
	from userTbl
	where height = (select min(height) from userTbl)
	or height = (select max(height) from userTbl);

--�� ������ ����
select count(*) as 'ȸ����' from userTbl;
select count(*) as '���ų�����' from buyTbl;