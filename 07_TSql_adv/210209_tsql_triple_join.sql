/*select*from stdTBL;
select*from clubTBL;
select*from clubRegTBL;
*/

--inner join ���
select s.id, s.stdName, c.clubName, c.buildingNumber
	from stdTBl as s,
inner join clubRegTBL as r
	on s.id=r.std_id
inner join clubTbl as c
	on r.club_id=c.id
	;--inner table�̱� ������ ���θ� ����� �ϸ� ����� ���̺� ��ġ ������� �� ������ �ȴ�.