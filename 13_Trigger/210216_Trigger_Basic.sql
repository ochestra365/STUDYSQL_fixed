USE sqlDB;
GO

CREATE or ALTER TRIGGER trg_testTBL--������ â���� ���ÿ� �ϴ� �ǵ�, ������ �����. �̸� �ִ� Ʈ���Ÿ� �� ���� ���� ���� ����.
on testTBL
AFTER INSERT, DELETE, UPDATE--����, ������ �� Ʈ���Ű� �߻��Ѵ�.
AS
 PRINT '��Ʈ���� �߻�';--Ʈ���� �߻��ϴ� ������ ���� ���̴�.

 INSERT INTO testTBL VALUES('BTS');
 SELECT *FROM testTBL WHERE txt='������';
 UPDATE testTBL set TXT = '��������!' WHERE id=4;
 DELETE testTBL WHERE id=3;