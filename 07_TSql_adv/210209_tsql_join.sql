select*from userTbl;
select*from buyTbl;

select*from userTbl where userID='JYP';
select*from buyTbl where userID='JYP';

select*from buyTbl where userID='BBK'

--inner join(å���� �ٸ��� �ǹ���ų�� ��)
select u.userName, u.addr,
		concat(u.mobile1,'-',left(u.mobile2,4),'-',right(u.mobile2,4)) as mobile,
		b.prodName,b.price,b.amount
	from buyTbl as b--���� �ֱ�
	inner join userTbl as u--���� �ֱ�. as�� �ִ� ���� ǥ���̴�.
	on b.userID=u.userID--PKŰ�� FKŰ�� �̿��ϸ� �񱳰� ����.--��������� ���̺��� �����ϴ� ����
where b.userID='JYP';--��������� ������ ���̺��� �˻��ϴ� ��.
--������ �ִ� ���·� �۾��� �ϸ� �ڵ����� �پ��� �ȴ�.