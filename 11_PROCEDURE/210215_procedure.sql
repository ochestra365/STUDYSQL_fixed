USE sqlDB;
GO

CREATE PROCEDURE usp_users--���ν��� ����, (*�������� ���� ����)
AS
	SELECT userID, userName, birthYear from userTbl;
GO

ALTER PROCEDURE usp_users--���ν��� ������ �ϴ� ���̴�. (������� ����)
AS
	SELECT userID, userName, birthYear FROM userTbl;
GO

CREATE or ALTER PROCEDURE usp_users--���ν��� ���� �Ǵ� ������ ���ÿ� �ϴ� ���̴�.
AS
	SELECT userID, userName, birthYear FROM userTbl;
GO

EXEC usp_users;--(USP_users)�� �����������鶧 ���� ���̰� ��ȣ�� ���� ���� �������ν����� ���� ��, ���� ���̴�.
GO

