--exec sp_helpdb;--데이터서버내에 데이터베이스가 몇 개 있는 지 알 수 있다.

use sqlDB;
go
declare @sql varchar(100);--사이즈를 넣어줘야 한다.
set @sql ='select*from userTbl where userID=''EJW'';';
exec (@sql);--괄호를 써줘야 한다. 동적 시행을 하는 것이다. 쿼리문을 만들어서 동적으로 바꿔야 할 경우가 있다. 복잡한 작업들이 필요하다.ㅇㅅㅇ