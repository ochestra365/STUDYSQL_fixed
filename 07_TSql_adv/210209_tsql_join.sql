select*from userTbl;
select*from buyTbl;

select*from userTbl where userID='JYP';
select*from buyTbl where userID='JYP';

select*from buyTbl where userID='BBK'

--inner join
select*
	from buyTbl
	inner join userTbl
	on buyTbl.userID=userTbl.userID--PKŰ�� FKŰ�� �̿��ϸ� �񱳰� ����.
where buyTbl.userID='JYP';