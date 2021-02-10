declare @curDate date;
declare @curYear varchar(4); declare @curMonth varchar(2); declare @curDay varchar(2);
declare @sql varchar(2000);

set @curDate = getdate();
set @curYear= year(@curDate);
set @curMonth=month(@curDate);
set @curDay=day(@curDate);

print @curYear;
print replicate('0',2-len(@curMonth))+@curMonth;
print right(('00'+@curMonth),2);
print @curDay;
print format(@curDate,'yyyy-mm-dd');--제일 쉬운 방법
--시스템 함수를 많이 알수록 효율적(코딩량을줄이면서)으로 일할 수 있다.

set @sql='create table backup_'+ FORMAT(@curDate,'yyyy_mm_dd'); set @sql +='(id int not null primary key, bNam nvarchar(100) not null);';
--공백이 있으면 안돼고 _언더바가 있어야 한다. 오류가 어디에 났는 지 잘 보이지 않는다.
print @sql;
exec(@sql);
--쿼리를 매일 매일 기록할 수 없기 때문에 이름을 바꿔야 한다면 동적으로 내용을 적어야 한다.