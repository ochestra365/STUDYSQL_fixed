use bookrentalshop;
go

--1-1�� ����� ����
select lower(email), mobile, names, addr 
from bookrentalshop.dbo.membertbl
order by Names desc;

--1-2�� ����� ����
select names, author, releasedate,price
	from bookrentalshop.dbo.bookstbl
--2-1�� ����� ����
select		concat (right( names,2),', ' ,left(names,1)) as '�����̸�'
			,levels
			,left( addr,2) as '����'
			,email as '�̸���' from membertbl;
--2-2�� ����� ����
use bookrentalshop;
go
select		idx
			,concat ('���� : ', Names) as �̸�
			,concat ('���� > ', Author) as �̸�
			,ReleaseDate as '������'
			,ISBN
			,Price  as '����'
from bookstbl
order by idx desc;
--3-1�� ����� ����
select b.Idx as '��ȣ'
	  ,d.Division as '�帣��ȣ'
	  ,d.Names as '�帣'
	  ,b.Names as 'å����'
	  ,b.Author as '����'
		from bookstbl as b
	inner join divtbl as d
	on b.Division=d.Division
	where d.Division='B002';
--3-2�� ����� ����.
select m.Names
      ,m.Levels
	  ,m.addr
	  ,r.rentalDate
	  from membertbl as m
      left outer join rentaltbl as r
	  on m.Idx=r.memberIdx
	  where r.rentalDate is null
	  order by m.Names asc;
--4-1�� ����� ����
insert into divtbl values ('I002', '�ڱⰳ�߼�');
--4-2�� ����� ����
update membertbl set addr = '�λ�� �ؿ�뱸' where Names = '�����';
update membertbl set Mobile = '010-6683-7732' where Names = '�����';
--5�� ����� ����
select	d.Names
		,sum(b.Price) as '�� �հ�ݾ�'
		from bookstbl as b 
		right outer join divtbl as d
		on b.division=d.division
		group by b.division, d.Names;
--5�� ������ null���� �հ谡 ���� �ʴµ�, ������� ������ Ǯ�� �ʾƼ� ���� ����� �� �Ŵ� ����
--�ƴϸ� ���� ���� ������ �� �� �� ���� �𸣰ڽ��ϴ�.
--�ϴ� �� �Ἥ ����� �Ϸ��� �����ͺ��̽��� �ߺ� ó���ؼ� ���Ἲ�� ħ�ص� ��� �ش������� ���ϴ�
--��������̽��ϴ�.