--����� ���� �Լ��� ��� ���� ��.
select
       *,
	   (year(getdate())-birthYear)+1 as ����
	from userTbl;

--����� ���� �Լ� ���
select*,
	dbo.ufn_getAge(birthYear) as ����,--�׻� �ĸ� �� �� ����ֳ�?
	dbo.ufn_getZodiac(birthYear) as ��
  from userTbl;