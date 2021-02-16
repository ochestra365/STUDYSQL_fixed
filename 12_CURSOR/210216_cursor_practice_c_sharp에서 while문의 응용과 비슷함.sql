USE sqlDB;
GO

DECLARE cur_userTbl CURSOR GLOBAL
	FOR SELECT userName, height FROM userTbl;

OPEN CUR_userTbl;

DECLARE @userName nchar(8)
DECLARE @height SMALLINT;--회원의 키를 담는 변수
DECLARE @cnt INT = 0;--회원수(읽은 행의 개수)
DECLARE @totalHeight INT = 0;-- 회원 키의 합계 변수

FETCH NEXT FROM cur_userTbl INTO @userName, @height;--커서 값을 읽어서 @height 변수에 할당., 2개를 선언하면 2개를 채택

--반복문 시작
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @cnt += 1;
	SET @totalHeight+= @height;
	PRINT concat('회원: ',@userName, '키: ',@height);
	FETCH NEXT FROM cur_userTbl INTO @userName ,@height;
END

PRINT concat('회원 키 평균=>', @totalHeight/@cnt);

CLOSE cur_userTbl;
DEALLOCATE cur_userTbl;