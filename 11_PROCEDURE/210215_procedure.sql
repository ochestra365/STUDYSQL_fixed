USE sqlDB;
GO

CREATE PROCEDURE usp_users--프로시저 생성, (*수행하지 않은 구문)
AS
	SELECT userID, userName, birthYear from userTbl;
GO

ALTER PROCEDURE usp_users--프로시저 수정을 하는 것이다. (수행안한 구문)
AS
	SELECT userID, userName, birthYear FROM userTbl;
GO

CREATE or ALTER PROCEDURE usp_users--프로시저 생성 또는 수정을 동시에 하는 것이다.
AS
	SELECT userID, userName, birthYear FROM userTbl;
GO

EXEC usp_users;--(USP_users)는 동적쿼리만들때 쓰는 것이고 괄호가 없는 것은 저장프로시저를 만들 때, 쓰는 것이다.
GO

