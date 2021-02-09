/*select*from stdTBL;
select*from clubTBL;
select*from clubRegTBL;
*/

--inner join ���
select s.id, s.stdName, c.clubName, c.buildingNumber
	from stdTBl as s
inner join clubRegTBL as r
	on s.id=r.std_id
inner join clubTbl as c
	on r.club_id=c.id
	;--inner table�̱� ������ ���θ� ����� �ϸ� ����� ���̺� ��ġ ������� �� ������ �ȴ�.

--outer join ���
select s.id, s.stdName, c.clubName, c.buildingNumber
	from stdTBl as s
left outer join clubRegTBL as r
	on s.id=r.std_id
left outer join clubTbl as c
	on r.club_id=c.id
	;

--userTBL/buyTBL
select u.userName, u.addr, b.prodName, b.price
	from userTbl as u
right outer join buyTbl as b
	on u.userID=b.userID;
--���� ���̺��� �������� �������̺��� �����Ѵ�. �� ������ �������̺��� ����ID�� �������̺��� ���� ID�� ���� ��Ī�ǰ� �ؾ� �Ѵ�.3
--�̳� ������ ������ ��ġ�ϴ� ��.
--right�� ���������ϸ� �������� ����, left�� �������� �ϸ� ������ ����. ������ ������ ���� ���� left, right, full
--������ ��ȯ�� ������� �����ϸ鼭 ������ �������� ������ �̰��� ������ �� �ֵ�.

select*from buyTbl