--���̺�3�� outer join
select*
	from StdTBl as s
	left outer join ClubRegTbl as r
	on s.id=r.std_id
	left outer join ClubTbl as c
	on r.club_id=c.id;
	--left)���� ���̺� �������� �ʴ� ������� ��� ǥ���� ���̴�.
	--right)������ �ƴ� ���̺� �������� �ʴ� ������� ��� ǥ���� ���̴�.
	--full)���� ���̺�� ������ �ƴ� ���̺� �������� �ʴ� ������� ��� ǥ���� ���̴�.

select*
	from StdTBl as s
	left outer join ClubRegTbl as r
	on s.id=r.std_id

select*
	from StdTBl as s
	right outer join ClubRegTbl as r
	on s.id=r.std_id
	--�����ͺ��̽� ���̾�׷��̶� ���� ���鼭 �����ؾ� ���� ������ �� �ֵ�.