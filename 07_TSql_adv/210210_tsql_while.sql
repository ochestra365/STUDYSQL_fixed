declare @i smallint, @hap bigint = 0;--1~100
set @i=0;--���� ���� ������ null�� �ȴ�. ����Ʈ���� �־����� ������ while���� ���ư��� �ʴ´�.
while(@i<=100)
begin
	if(@i%7=0)--7�� ���
	begin
		print concat('7�� ��� : ',@i);
		set @i +=1;--���ڴ�
		continue;
	end--begin, end�� �ʹ� ���Ƽ� ����������.

	set @hap +=@i;
	if(@hap>1000) break;
	set @i+=1;
end

print @hap;