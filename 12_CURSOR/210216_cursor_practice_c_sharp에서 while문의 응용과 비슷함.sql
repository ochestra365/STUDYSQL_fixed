USE sqlDB;
GO

DECLARE cur_userTbl CURSOR GLOBAL
	FOR SELECT userName, height FROM userTbl;

OPEN CUR_userTbl;

DECLARE @userName nchar(8)
DECLARE @height SMALLINT;--ȸ���� Ű�� ��� ����
DECLARE @cnt INT = 0;--ȸ����(���� ���� ����)
DECLARE @totalHeight INT = 0;-- ȸ�� Ű�� �հ� ����

FETCH NEXT FROM cur_userTbl INTO @userName, @height;--Ŀ�� ���� �о @height ������ �Ҵ�., 2���� �����ϸ� 2���� ä��

--�ݺ��� ����
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @cnt += 1;
	SET @totalHeight+= @height;
	PRINT concat('ȸ��: ',@userName, 'Ű: ',@height);
	FETCH NEXT FROM cur_userTbl INTO @userName ,@height;
END

PRINT concat('ȸ�� Ű ���=>', @totalHeight/@cnt);

CLOSE cur_userTbl;
DEALLOCATE cur_userTbl;