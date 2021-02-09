use sqlDB;
go

select	dense_rank() over(partition by addr order by height desc ) as 'Ű ū ����', 
		userName, addr, height
	from userTbl;
--������ �ڿ� Ű������ ������ �Ѵ�. �ι� ° ������ ���� �� ���� �ִ�. �׷��� ���� 2�� �۾��� ���� �����ϴ�.(order ��� partition�� ����.)
--�ּҷ� ������ Ű�� ������ �ű��.(������������)--�κк��� ������ ���� ��Ƽ��, �����ű�� ���� Ű
--����Ʈ���� ���� ���δ�.

--PIVOT
create table pivotTBL
(
	userName nvarchar(10),
	season nvarchar(2),
	amount int
);
go
insert into pivotTBL values('�����','�ܿ�',10),
						   ('������','����',15),
						   ('�����','����',25),
						   ('�����','��',3),
						   ('�����','��',37),
						   ('������','�ܿ�',40),
						   ('�����','����',14),
						   ('�����','�ܿ�',22),
						   ('������','����',64)
insert into pivotTBL values('���ð�','����',30);
select * from pivotTBL

select * from pivotTBL
	pivot(sum(amount)
		for season
		in ([��],[����],[����],[�ܿ�])) as resultPivot;
		--���η� ���� �����͸� ��踦 ���鼭 ���η� ������ �ϴ� ���̴�.

--json
select userID, userName, height, addr
	from userTbl
	where height >=180
	for json auto;