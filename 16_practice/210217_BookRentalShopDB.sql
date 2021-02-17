-- ���� ȸ�� ���� �ҷ����� ���� �Ųٷ�, �̸���
select memberID, memberName, levels, mobile,email
	from memberTBL
where levels <> 'S'
order by levels asc, memberName asc;

--å����
select cateidx, bookname, author, 
	   interpreter, company, price
	from booksTBL
order by price desc;

select*from cateTBL;

--�ý��� �Լ���� ����
select memberID as 'ȸ�� ���̵�', 
	   concat (right(memberName,2), left(membername,1)) as �̸�,
	   case levels 
			when 'A' then '���ȸ��'
			when 'B' then '�ǹ�ȸ��'
			when 'C' then '�����ȸ��'
			when 'D' then 'öȸ��'
			when 'S' then '������'
			else '��ȸ��'
	   end as 'ȸ������'
	   , 
	   mobile as ��ȭ��ȣ,
	   upper(email) as '�̸���'
	from memberTBL
where levels <> 'S'
order by levels, memberName asc;
--�Ʒ��� �Լ��� ����� ���� �Լ��� ���� ���̴�.



--����� ���� �Լ���� ����

select memberID as 'ȸ�� ���̵�', 
	   concat (right(memberName,2), left(membername,1)) as �̸�,
	   dbo.ufn_getLevel(levels)as 'ȸ������',mobile ,
	   UPPER(email) as '�̸���'
	from memberTBL
where levels <> 'S'
order by levels, memberName asc;

--å ����, �ý��� �Լ�, ���� �Լ� ����
select 
	 bookidx  'å ������ȣ' 
	,cateidx as 'ī�װ�'
	,concat(N'å����>',bookname) as 'å �̸�'  
	,author as �۰�
	,isnull(interpreter,'(���ھ���)')  as '������'
	,company as ȸ��
	,format(releaseDate,'yyyy�� MM�� dd��' ) as '������'
	,format(price,'#,#��') as '����'
from booksTBL;

--å���� ����
select 
	 b.bookidx 
	--,b.cateidx
	,c.cateName
	,b.bookname
	,b.author
	,b.interpreter
	,b.company 
from booksTBL as b
inner join cateTBL as c
	on b.cateidx=c.cateidx;

-- �뿩�� å�� ���� ���� ����
USE  BookRentalShopDB
GO

SELECT r.rentalidx
     -- ,r.memberidx
     -- ,r.bookidx
	 ,m.memberidx
	  ,b.bookname
	  ,b.author
      ,format(r.rentalDt,'yyyy-mm-dd') as '�뿩��'
      ,format(r.returnDt,'yyyy-mm-dd')as '�ݳ���'
      ,r.rentalState
	  ,dbo.ufn_getstate(r.rentalState) as '�뿩����'
  FROM  dbo. rentalTBl as r
  inner join booksTBL as b
	on r.bookidx=b.bookidx
  inner join membertbl as m
  on r.memberidx=m.memberidx;
GO