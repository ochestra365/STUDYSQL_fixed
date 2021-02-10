use sqlDB;
go

select b.userID, 
		u.userName,
		iif(sum(price*amount) is null,0,sum(price*amount))as '�� ���űݾ�',--���� �� ���űݾ��� null�̸� 0���� ǥ���ϰ� �ƴϸ� �ѱ��űݾ����� ǥ��
		case
		 when(sum(price*amount)>=1500)then 'vvip'
		 when(sum(price*amount)>=1000)then 'vip'
		 when(sum(price*amount)>=1)then 'normal'
		 else 'ghost'
		end as 'ȸ������'--���̺� �����ϴ� �ʵ尡 �ƴϱ� ������ �̸��� ���� ��������� �Ѵ�.
	from buyTbl as b--������ buyTbl�̴�. left outer join�� from�� �������� ���, right outer join�� �� �̿��� ���� �������� ��´�.
	right outer join userTbl as u--�ǹ������� �����Ͱ� �� ���� ���� �ʰ� ���ϴ� ��, ���̵����͸� ���� ���ϴ� ���� ���������̳� �����ͼӼ��� �� �ľ��� �� ����. �׷� Ű�� �Ǵ� ���� �߷��ؼ� ��� �Ѵ�.
	on b.userID=u.userID
group by b.userid, u.userName--�׷���̴� �����Լ� �̿��� ���� �����ִ� ���̴�. �ֳ��ϸ� ������ �� ��ġ�� ���ؼ� �̴�. userid�� buytbl�� usertbl�ΰ� �� �ִ�.
order by sum(price*amount) desc;

select*
	from userTbl;