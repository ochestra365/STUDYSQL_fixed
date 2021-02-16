USE sqlDB;
GO

CREATE or ALTER TRIGGER trg_testTBL--수정과 창조를 동시에 하는 건데, 조심히 써야함. 미리 있는 트리거를 다 지워 버릴 수도 있음.
on testTBL
AFTER INSERT, DELETE, UPDATE--삭제, 수정할 때 트리거가 발생한다.
AS
 PRINT '새트리거 발생';--트리거 발생하는 조건을 적는 절이다.

 INSERT INTO testTBL VALUES('BTS');
 SELECT *FROM testTBL WHERE txt='마마무';
 UPDATE testTBL set TXT = '마마무뉴!' WHERE id=4;
 DELETE testTBL WHERE id=3;