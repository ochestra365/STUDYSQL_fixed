USE tempdb;
CREATE TABLE bankbook
(
	uName NVARCHAR(10),
	uMoney INT,
			CONSTRAINT CK_money
			CHECK (uMoney>=0)
);
GO
INSERT INTO bankbook VALUES (N'������', 1000);
INSERT INTO	bankbook VALUES (N'�Ǹ���', 0);
GO
UPDATE bankbook SET uMoney=umoney-500 WHERE uName=N'������';
UPDATE bankbook SET uMoney=uMoney+500 WHERE uName=N'�Ǹ���';
GO
BEGIN TRAN
	UPDATE bankbook SET uMoney=umoney-500 WHERE uName=N'������';
COMMIT TRAN

BEGIN TRAN
	UPDATE bankbook SET uMoney=uMoney+500 WHERE uName=N'�Ǹ���';
COMMIT TRAN--������������ ���� ����
GO
UPDATE bankbook SET uMoney=uMoney-600 WHERE uName=N'������';
UPDATE bankbook SET uMoney=uMoney+600 WHERE uName=N'�Ǹ���';
SELECT*FROM bankbook;
--�����߻� �������� ���� ���������� �ʾƼ� �Ǹ��ڿ��Ե� �Աݵ��� �ʾƾ� �ϴ� �� �Ա��� �Ǿ� ����.
BEGIN TRAN--1�� Ʈ�����
	UPDATE bankbook SET uMoney=uMoney-600 WHERE uName=N'������';
COMMIT TRAN
--������ �߻��Ǿ� ������ �ȵ�(���� Ʈ������� 1�� Ʈ����ǿ� �ѹ��� �Ͼ ������ ����)
BEGIN TRAN--2�� Ʈ�����
	UPDATE bankbook SET uMoney=uMoney+600 WHERE uName=N'�Ǹ���';
COMMIT TRAN-- ���������� �����. ������������ ���� ����
GO--�ΰ��� Ʈ������� �ϳ��� ����� �Ѵ�.(�ŷ��� �����. ��, ���ſ� �ǸŸ� ������ ��������� �ϳ��� ������ �����Ͽ� �������� ���Ἲ(�� �߿��� ���ڼ�)�� �����ϴ� ���̴�.)
UPDATE bankbook SET uMoney=uMoney-600 WHERE uName=N'�Ǹ���';--�Ǹ����� ������ �� ���·� �ǵ�����.

BEGIN TRAN
	UPDATE bankbook SET uMoney=uMoney-600 WHERE uName=N'������';
	UPDATE bankbook SET uMoney=uMoney+600 WHERE uName=N'�Ǹ���';
COMMIT TRAN
SELECT*FROM bankbook;--����� ����
--���� ������ �ѹ��� ���� �ʱ� ������ ���� ������ ������ �߻��ϸ� ������ �ѹ� ������� �Ѵ�.
	UPDATE bankbook SET uMoney=uMoney-600 WHERE uName=N'�Ǹ���';
BEGIN TRY
	BEGIN TRAN
		UPDATE bankbook SET uMoney= uMoney-600 WHERE uName=N'������';
		UPDATE bankbook SET uMoney= uMoney+600 WHERE uName=N'�Ǹ���';
	COMMIT TRAN--Ŀ������� �Ѵ�.
END TRY
BEGIN CATCH
	ROLLBACK TRAN--���� ������ �ѹ��� ���� �ʱ� ������ ���������� ������ ������ �ѹ������� �Ѵ�. ��, �� ���� ���ุ ���� ���� ������ �ѹ��� ����� ���� �ƴϴ�.
END CATCH
SELECT * FROM bankbook;
--ROLLBACK�� ������ġ�̴�. UPDATE�� DELETE�� ������ ��� �Ѵ�. �ŷ��� Ư������ Ȥ�� ����� �Ӽ��� �����ؾ� �Ѵ�.