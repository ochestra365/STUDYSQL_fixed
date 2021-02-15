USE tempdb;
CREATE TABLE bankbook
(
	uName NVARCHAR(10),
	uMoney INT,
			CONSTRAINT CK_money
			CHECK (uMoney>=0)
);
GO
INSERT INTO bankbook VALUES (N'구매자', 1000);
INSERT INTO	bankbook VALUES (N'판매자', 0);
GO
UPDATE bankbook SET uMoney=umoney-500 WHERE uName=N'구매자';
UPDATE bankbook SET uMoney=uMoney+500 WHERE uName=N'판매자';
GO
BEGIN TRAN
	UPDATE bankbook SET uMoney=umoney-500 WHERE uName=N'구매자';
COMMIT TRAN

BEGIN TRAN
	UPDATE bankbook SET uMoney=uMoney+500 WHERE uName=N'판매자';
COMMIT TRAN--아직실행하지 않은 구문
GO
UPDATE bankbook SET uMoney=uMoney-600 WHERE uName=N'구매자';
UPDATE bankbook SET uMoney=uMoney+600 WHERE uName=N'판매자';
SELECT*FROM bankbook;
--오류발생 구매자의 돈이 빠져나가지 않아서 판매자에게도 입금되지 않아야 하는 데 입금이 되어 버림.
BEGIN TRAN--1번 트랜잭션
	UPDATE bankbook SET uMoney=uMoney-600 WHERE uName=N'구매자';
COMMIT TRAN
--오류가 발생되어 수행이 안됨(현재 트랜잭션인 1번 트랜잭션에 롤백이 일어날 것으로 예상)
BEGIN TRAN--2번 트랜잭션
	UPDATE bankbook SET uMoney=uMoney+600 WHERE uName=N'판매자';
COMMIT TRAN-- 정상적으로 수행됨. 아직실행하지 않은 구문
GO--두개의 트랜잭션을 하나로 묶어야 한다.(거래로 만든다. 즉, 구매와 판매를 독립된 사건이지만 하나의 단위로 포괄하여 데이터의 무결성(그 중에서 원자성)을 보존하는 것이다.)
UPDATE bankbook SET uMoney=uMoney-600 WHERE uName=N'판매자';--판매자의 계정을 원 상태로 되돌린다.

BEGIN TRAN
	UPDATE bankbook SET uMoney=uMoney-600 WHERE uName=N'구매자';
	UPDATE bankbook SET uMoney=uMoney+600 WHERE uName=N'판매자';
COMMIT TRAN
SELECT*FROM bankbook;--실행된 구문
--논리적 오류는 롤백이 되지 않기 때문에 제약 조건의 오류가 발생하면 강제로 롤백 시켜줘야 한다.
	UPDATE bankbook SET uMoney=uMoney-600 WHERE uName=N'판매자';
BEGIN TRY
	BEGIN TRAN
		UPDATE bankbook SET uMoney= uMoney-600 WHERE uName=N'구매자';
		UPDATE bankbook SET uMoney= uMoney+600 WHERE uName=N'판매자';
	COMMIT TRAN--커밋해줘야 한다.
END TRY
BEGIN CATCH
	ROLLBACK TRAN--논리적 오류는 롤백이 되지 않기 때문에 제약조건의 오류시 강제로 롤백시켜줘야 한다. 즉, 그 행이 실행만 되지 않은 것이지 롤백이 수행된 것은 아니다.
END CATCH
SELECT * FROM bankbook;
--ROLLBACK은 안전장치이다. UPDATE와 DELETE는 사유서 써야 한다. 거래의 특수성을 혹은 사건의 속성을 이해해야 한다.