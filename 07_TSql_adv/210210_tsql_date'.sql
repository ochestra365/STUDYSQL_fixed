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
print format(@curDate,'yyyy-mm-dd');--���� ���� ���
--�ý��� �Լ��� ���� �˼��� ȿ����(�ڵ��������̸鼭)���� ���� �� �ִ�.

set @sql='create table backup_'+ FORMAT(@curDate,'yyyy_mm_dd'); set @sql +='(id int not null primary key, bNam nvarchar(100) not null);';
--������ ������ �ȵŰ� _����ٰ� �־�� �Ѵ�. ������ ��� ���� �� �� ������ �ʴ´�.
print @sql;
exec(@sql);
--������ ���� ���� ����� �� ���� ������ �̸��� �ٲ�� �Ѵٸ� �������� ������ ����� �Ѵ�.