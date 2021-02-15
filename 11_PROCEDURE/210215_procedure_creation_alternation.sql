USE sqlDB;
GO

CREATE or ALTER PROCEDURE usp_buyproduct1
	@userID char(8)
as
	select num, userID, prodName,(price*amount) as 구매금액
		from buyTbl
	where userID = @userID;
GO

exec usp_buyproduct1'BBK';
GO